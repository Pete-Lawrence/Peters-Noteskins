--If a Command has "NOTESKIN:GetMetricA" in it, that means it gets the command from the metrics.ini, else use cmd(); to define command.

--[[
	InitCommand
	NoneCommand
	PressCommand
	HoldingOnCommand
	HoldingOffCommand
	RollOnCommand
	RollOffCommand
	W5..W1Command
	HeldCommand
	LetGoCommand
	HitMineCommand
]]

local marvelouscolour = color("#b9b9b9")
local perfectcolour = color("#b9b359")
local greatcolour = color("#39bd39")
local goodcolour = color("#37bb9d")

local inneralpha = 0.0

local function brightflash(thecolour)
	return function(self) self:finishtweening()
		self:diffuse(thecolour):zoom(0.8)
		:linear(7/60):zoom(1.2)
		:sleep(0):diffuse(0,0,0,1)
	end
end

local function dimflash(thecolour)
	return function(self)
		self:diffuse(thecolour):diffusealpha(1):zoom(1)
		:linear(10/60):zoom(1.25):diffuse(0,0,0,1)
	end
end

local holdflash = NOTESKIN:LoadActor(Var "Button", "Flash Dim")..{ Name="holdflash",
	InitCommand=function(self) self:blend(Blend.Add):diffuse(0,0,0,0) end,
	FlashCommand=dimflash(perfectcolour)
}

-----------------------------------------------------------

return Def.ActorFrame {

	NOTESKIN:LoadActor(Var "Button", "Flash Dim")..{ 
		JudgmentCommand=function(self) self:finishtweening() end,
		InitCommand=function(self) self:blend(Blend.Add):diffuse(0,0,0,0) end,
		
		W2Command=dimflash(perfectcolour),
		W3Command=dimflash(greatcolour),
		W4Command=dimflash(goodcolour),
	},

	NOTESKIN:LoadActor(Var "Button", "Flash Bright")..{
		JudgmentCommand=function(self) self:finishtweening() end,
		InitCommand=function(self) self:blend(Blend.Add):diffuse(0,0,0,0) end,
		
		W1Command=brightflash(marvelouscolour),
		W2Command=function(self) self:finishtweening()
			self:diffuse(color("#b9b9b9")):zoom(0.5)
			:linear(3/60):zoom(0.75)
			:sleep(3/60):diffuse(0,0,0,1)
		end,
	},
	
	Def.ActorFrame {
		InitCommand=function(self)
			self.emitting = false
			self.emitnumber = 1
			self.emissions = self:GetChild("holdflash")
		end,
		HoldingOnCommand=function(self) self.emitting = true; self:playcommand("Emit") end,
		HoldingOffCommand=function(self) self.emitting = false end,
		RollOnCommand=function(self) self.emitting = true; self:playcommand("Emit") end,
		RollOffCommand=function(self) self.emitting = false end,
		EmitCommand=function(self)
			self.emissions[self.emitnumber]:finishtweening():playcommand("Flash")
			if self.emitnumber == 3 then self.emitnumber = 1 else self.emitnumber = self.emitnumber+1 end
			if self.emitting then
				self:sleep(4/60):queuecommand("Emit")
			end
		end,
		holdflash, holdflash, holdflash,
	},
	
	NOTESKIN:LoadActor(Var "Button", "Flash Bright")..{ 
		JudgmentCommand=function(self) self:finishtweening() end,
		InitCommand=function(self) self:blend(Blend.Add):diffuse(0,0,0,0) end,
		HeldCommand=brightflash(perfectcolour),
	},
	
	--Mine Explosion Commands
	NOTESKIN:LoadActor( Var "Button", "HitMine Explosion" ) .. {
		InitCommand=cmd(blend,"BlendMode_Add";diffusealpha,0);
		HitMineCommand=NOTESKIN:GetMetricA("GhostArrowBright", "HitMineCommand");
	},
}

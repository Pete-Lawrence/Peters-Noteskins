local marvelouscolour = color("#7fffff")
local marvelous2colour = color("#ffffff") --FA+
local perfectcolour = color("#cdce58")
local greatcolour = color("#4bbf4b")
local goodcolour = color("#e55bfc")
local almostcolour = color("#e75b01")

local inneralpha = 0.0


-- Marvelous Flash COMMAND
local function brightflash(thecolour)
	return function(self) self:finishtweening()
		self:diffuse(thecolour):diffusealpha(0.9):zoom(0.7)
		:linear(6/60):zoom(0.925)
		:sleep(0):diffuse(0,0,0,1)
	end
end

-- Perfect Flash COMMAND
local function brightflashsmall(thecolour)
	return function(self) self:finishtweening()
		self:diffuse(thecolour):zoom(0.52)
		:linear(3/60):zoom(0.65)
		:sleep(2/60):diffuse(0,0,0,1)
	end
end

-- Regular Flash COMMAND
local function dimflash(thecolour)
	return function(self)
		self:diffuse(thecolour):diffusealpha(1):zoom(1)
		:linear(9/60):diffuse(0,0,0,1):zoom(1.25)
	end
end

-- Hold Held Emitter COMMAND
local holdflash = NOTESKIN:LoadActor(Var "Button", "Flash Dim")..{ Name="holdflash",
	InitCommand=function(self) self:blend(Blend.Add):diffuse(0,0,0,0) end,
	FlashCommand=dimflash(perfectcolour)
}


------------------------------------------------------

return Def.ActorFrame {
	--Regular Flash
	NOTESKIN:LoadActor(Var "Button", "Flash Dim")..{ 
		JudgmentCommand=function(self) self:finishtweening() end,
		InitCommand=function(self) self:blend(Blend.Add):diffuse(0,0,0,0) end,
		W1Command=dimflash(marvelouscolour),
		BrightCommand=dimflash(marvelous2colour),
		W2Command=dimflash(perfectcolour),
		W3Command=dimflash(greatcolour),
		W4Command=dimflash(goodcolour),
		W5Command=dimflash(almostcolour),
		
		BrightCommand=cmd(visible,false),
		DimCommand=cmd(visible,true),
	};
	NOTESKIN:LoadActor(Var "Button", "Flash Dim")..{ 
		JudgmentCommand=function(self) self:finishtweening() end,
		InitCommand=function(self) self:blend(Blend.Add):diffuse(0,0,0,0) end,
		W1Command=dimflash(marvelous2colour),
		
		BrightCommand=cmd(visible,true),
		DimCommand=cmd(visible,false),
	};

	--Marvelous Flash
	NOTESKIN:LoadActor(Var "Button", "Flash Bright")..{
		JudgmentCommand=function(self) self:finishtweening() end,
		InitCommand=function(self) self:blend(Blend.Add):diffuse(0,0,0,0) end,
		
		W1Command=brightflash(marvelouscolour),
		W2Command=brightflashsmall(marvelouscolour),
		
		BrightCommand=cmd(visible,false),
		DimCommand=cmd(visible,true),
	};
	NOTESKIN:LoadActor(Var "Button", "Flash Bright")..{
		JudgmentCommand=function(self) self:finishtweening() end,
		InitCommand=function(self) self:blend(Blend.Add):diffuse(0,0,0,0) end,
		W1Command=brightflashsmall(marvelous2colour),
		
		BrightCommand=cmd(visible,true),
		DimCommand=cmd(visible,false),
	};
	
	--Hold Held Emitter
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
	--Hold End Flash
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

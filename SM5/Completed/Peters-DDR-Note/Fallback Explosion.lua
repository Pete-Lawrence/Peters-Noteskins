local marvelouscolour = color("#ffffff")
local perfectcolour = color("#fff064")
local greatcolour = color("#3fff3f")
local goodcolour = color("#3effbf")

local inneralpha = 0.0


-- Marvelous Flash COMMAND
local function brightflash(thecolour)
	return function(self) self:finishtweening()
		self:diffuse(thecolour):diffusealpha(0.9):zoom(0.7)
		:linear(6/60):zoom(0.95)
		:sleep(0):diffuse(0,0,0,1)
	end
end

-- Regular Flash COMMAND
local function dimflash(thecolour)
	return function(self)
		self:diffuse(thecolour):diffusealpha(0.9):zoom(1)
		:linear(9/60):diffuse(0,0,0,1):zoom(1.25)
	end
end

-- Hold Held Emitter COMMAND
local holdflash = NOTESKIN:LoadActor(Var "Button", "Flash Dim")..{ Name="holdflash",
	InitCommand=function(self) self:blend(Blend.Add):diffuse(0,0,0,0) end,
	FlashCommand=dimflash(perfectcolour)
}

-- Hit Shock Arrow COMMAND Inner White Circle
local function hitshockarrow()
	return function(self) self:finishtweening()
			self:blend(Blend.Add):diffusealpha(1.0):linear(6/60)
			:sleep(0):diffusealpha(0.0)
	end
end

-- Hit Shock Arrow COMMAND Outer Blue Circle
local function hitshockarrow2()
	return function(self) self:finishtweening()
			self:zoom(0.8):diffusealpha(0.3):sleep(0)
			:linear(5/60):diffusealpha(0.8):zoom(1.2)
			:linear(5/60):diffusealpha(0.0):zoom(1.6)
	end
end


-- Hit Shock Arrow COMMAND Lightning
local function hitshockarrow3()
	return function(self) self:finishtweening()
			self:zoom(0.75):diffusealpha(0.5):rotationz(30)
			:spring(4/60):zoom(1.2):rotationz(50)
			:spring(9/60):zoom(1.0):rotationz(0)
			:sleep(0):diffusealpha(0.0)
	end
end

------------------------------------------------------

return Def.ActorFrame {
	--Regular Flash
	NOTESKIN:LoadActor(Var "Button", "Flash Dim")..{ 
		JudgmentCommand=function(self) self:finishtweening() end,
		InitCommand=function(self) self:blend(Blend.Add):diffuse(0,0,0,0) end,
		
		W2Command=dimflash(perfectcolour),
		W3Command=dimflash(greatcolour),
		W4Command=dimflash(goodcolour),
	},

	--Marvelous Flash
	NOTESKIN:LoadActor(Var "Button", "Flash Bright")..{
		JudgmentCommand=function(self) self:finishtweening() end,
		InitCommand=function(self) self:blend(Blend.Add):diffuse(0,0,0,0) end,
		
		W1Command=brightflash(marvelouscolour),
		
		--Perfect (Inner Marvelous Flash)
		W2Command=function(self) self:finishtweening()
			self:diffuse(color("#ffffff")):zoom(0.54)
			:linear(3/60):zoom(0.7)
			:sleep(2/60):diffuse(0,0,0,1)
		end,
	},
	
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
	--Inner White Circle
	NOTESKIN:LoadActor( Var "Button", "HitMine Explosion" ) .. {
		InitCommand=cmd(diffusealpha,0);
		HitMineCommand=hitshockarrow(),
	},
	
	--Outer Blue Circle
	NOTESKIN:LoadActor( Var "Button", "HitMine2 Explosion" ) .. {
		InitCommand=cmd(diffusealpha,0);
		HitMineCommand=hitshockarrow2(),
	},
		
	--Frame Based Animation
	NOTESKIN:LoadActor( Var "Button", "HitMine3 Explosion" ) .. {
		InitCommand=cmd(diffusealpha,0);
		HitMineCommand=hitshockarrow3(),
	},
}

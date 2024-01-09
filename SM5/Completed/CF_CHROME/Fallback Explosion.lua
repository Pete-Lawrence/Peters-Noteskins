-- Judgement Colours ITG
local W1colour = color("#00C8FF") --Blue Fantastic
local W11colour = color("#DBDBDB") --White Fantastic
local W2colour = color("#FFC917") --Amber Excellent
local W3colour = color("#30ED24") --Green Great
local W4colour = color("#E55BFC") --Purple Decent
local W5colour = color("#E75B01") --Orange WayOff
local Hdcolour = color("#00C8FF") --Initial HOLD/ROLL Colour
local Lastcolour = color("#E55BFC") --HOLD/ROLL Colour from Judgement

--Judgement Colours Waterfall
-- local W1colour = color("#E55BFC") --Purple Masterful
-- local W2colour = color("#FFC917") --Amber Awesome
-- local W3colour = color("#30ED24") --Green Solid
-- local W4colour = color("#00C8FF") --Blue Ok
-- local W5colour = color("#DBDBDB") --White Fault


-- Flash Add COMMAND (Coloured by judgement)
local function flashadd(thecolour,updatelast)
	return function(self)
		if updatelast then
			Lastcolour = thecolour
		end
		self:finishtweening()
		:diffuse(thecolour)
		:blend(Blend.Add)
		:diffusealpha(1.0)
		:linear(1/60)
		:diffusealpha(0.5)
		:linear(3/60)
		:diffusealpha(0.0)
	end
end

-- Flash Normal COMMAND (Coloured by judgement)
local function flashnormal(thecolour,uselast)
	return function(self)
		if uselast then
			self:finishtweening()
			:diffuse(Lastcolour)
			:diffusealpha(1.0)
			:linear(10/60)
			:diffusealpha(0.0)
		else
			self:finishtweening()
			:diffuse(thecolour)
			:diffusealpha(1.0)
			:linear(10/60)
			:diffusealpha(0.0)
		end
	end
end

-- Glow COMMAND (Coloured by judgement)
local function glowover()
	return function(self)
		self:finishtweening()
		:diffusealpha(1.0)
		:blend(Blend.Add)
		:linear(12/60)
		:diffusealpha(0.0)
	end
end

--Mine Explosion Commands
local minesplosion = Def.ActorFrame {
		Name="minesplosion",
	ExplodeCommand=function(self)
		self:y(0):linear(64/60):y(-64)
		self:playcommand("E")
	end;
	Explode2Command=function(self)
		self:y(0):linear(64/60):y(-64)
		self:playcommand("E2")
	end;
	NOTESKIN:LoadActor( Var "Button", "HitMine Explosion" ) .. {
		InitCommand=function(self)
			self:SetStateProperties(Sprite.LinearFrames(64,(64/60)));
			self:diffusealpha(0);
		end;
		ECommand=function(self)
			self:blend("BlendMode_Normal"):diffusealpha(1.0):zoom(0.75):accelerate(64/60):diffusealpha(0.0):zoom(1.0):setstate(0):animate(true)
		end;
		E2Command=function(self)
			self:blend("BlendMode_Add"):diffusealpha(1.0):zoom(0.75):accelerate(64/60):diffusealpha(0.0):zoom(1.0):setstate(0):animate(true)
		end;
	}
}

local t = Def.ActorFrame {

	--HOLD Flash Glow
	NOTESKIN:LoadActor(Var "Button", "Glow")..{ 
		InitCommand=cmd(diffusealpha,0);
		
		HoldingOnCommand=function(self) self:finishtweening():blend("BlendMode_Add"):diffuse(Lastcolour):diffusealpha(1.0):glowshift():effectperiod(0.05):effectcolor1(1,1,1,1,0):effectcolor2(1,1,1,0.5) end,
		HoldingOffCommand=cmd(diffusealpha,0);
	};

	--ROLL Flash Glow
	NOTESKIN:LoadActor(Var "Button", "Glow")..{ 
		InitCommand=cmd(diffusealpha,0);
		
		RollOnCommand=function(self) self:finishtweening():blend("BlendMode_Add"):diffuse(Lastcolour):diffusealpha(1.0):glowshift():effectperiod(0.05):effectcolor1(1,1,1,1,0):effectcolor2(1,1,1,0.5) end,
		RollOffCommand=cmd(diffusealpha,0);
	};

	Def.ActorFrame {
	--TAP+HELD Flash Add
	NOTESKIN:LoadActor(Var "Button", "Flash")..{ 
		JudgmentCommand=function(self) end,
		InitCommand=cmd(diffusealpha,0);

		W1Command=flashadd(W1colour,true),
		W2Command=flashadd(W2colour,true),
		W3Command=flashadd(W3colour,true),
		W4Command=flashadd(W4colour,true),
		W5Command=flashadd(W5colour,true),
		HeldCommand=flashadd(Lastcolour,false),
		
		BrightCommand=flashadd(W11colour,true),
	};

	--TAP+HELD Flash Normal
	NOTESKIN:LoadActor(Var "Button", "Flash")..{ 
		JudgmentCommand=function(self) end,
		InitCommand=cmd(diffusealpha,0);

		W1Command=flashnormal(W1colour,false),
		W2Command=flashnormal(W2colour,false),
		W3Command=flashnormal(W3colour,false),
		W4Command=flashnormal(W4colour,false),
		W5Command=flashnormal(W5colour,false),
		HeldCommand=flashnormal(Hdcolour,true),
		
		BrightCommand=flashnormal(W11colour,false),
	};
	--TAP+HELD Flash Glow
	NOTESKIN:LoadActor(Var "Button", "Glow")..{ 
		JudgmentCommand=function(self) end,
		InitCommand=cmd(diffusealpha,0);		
		W1Command=function (self) self:finishtweening():diffusealpha(1.0):blend(Blend.Add):linear(12/60):diffusealpha(0.0):glowshift():effectperiod(0.05):effectcolor1(1,1,1,0):effectcolor2(1,1,1,0.5) end,
		W2Command=glowover(),
		W3Command=glowover(),
		W4Command=glowover(),
		W5Command=glowover(),
		HeldCommand=glowover(),
		
		BrightCommand=glowover(),
	};

};
	--Mine Explosion Emitter
    Def.ActorFrame {
        InitCommand=function(self)
            self.emitnumber = 1
            self.explosions = self:GetChild("minesplosion")
        end,
        HitMineCommand=function(self)
			--grab a copy and increment
            self.explosions[self.emitnumber]:finishtweening():playcommand("Explode")
            self.emitnumber = (self.emitnumber % #self.explosions) + 1
			
			--grab another copy and increment
            self.explosions[self.emitnumber]:finishtweening():playcommand("Explode2")
            self.emitnumber = (self.emitnumber % #self.explosions) + 1
        end,
		
		--feed 6 copies into the actor
        minesplosion, minesplosion, minesplosion, minesplosion, minesplosion, minesplosion
    },
}
return t;
--If a Command has "NOTESKIN:GetMetricA" in it, that means it gets the command from the metrics.ini, else use cmd(); to define command.
--If you dont know how "NOTESKIN:GetMetricA" works here is an explanation.
--NOTESKIN:GetMetricA("The [Group] in the metrics.ini", "The actual Command to fallback on in the metrics.ini");

--The NOTESKIN:LoadActor() just tells us the name of the image the Actor redirects on.
--Oh and if you wonder about the "Button" in the "NOTESKIN:LoadActor( )" it means that it will check for that direction.
--So you dont have to do "Down" or "Up" or "Left" etc for every direction which will save space ;)

--Mine Explosion Commands
local function hitmineanimation()
	return function(self)
		self:diffusealpha(0.9):zoom(0.75):accelerate(64/60):diffusealpha(0.0):zoom(1.0):setstate(0):animate(true)
	end
end

local minesplosion = NOTESKIN:LoadActor( Var "Button", "HitMine Explosion" ) .. {
	Name="minesplosion",
	InitCommand=function(self)
		self:SetStateProperties(Sprite.LinearFrames(64,(64/60)));
		self:diffusealpha(0);
	end;
	ExplodeCommand=hitmineanimation();
}

local t = Def.ActorFrame {
	--Hold Explosion Commands
	NOTESKIN:LoadActor( Var "Button", "Hold Explosion" ) .. {
		HoldingOnCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "HoldingOnCommand");
		HoldingOffCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "HoldingOffCommand");
		InitCommand=cmd(playcommand,"HoldingOff";finishtweening);
	};
	--Roll Explosion Commands
	NOTESKIN:LoadActor( Var "Button", "Hold Explosion" ) .. {
		RollOnCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "RollOnCommand");
		RollOffCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "RollOffCommand");
		InitCommand=cmd(playcommand,"RollOff";finishtweening);
		BrightCommand=cmd(visible,false);
		DimCommand=cmd(visible,false);		
	};
    --We use this for Seperate Explosions for every Judgement
	Def.ActorFrame {
		--W1 aka Marvelous Dim Explosion Commands
		NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim W1" ) .. {
			InitCommand=cmd(diffusealpha,0);
			W1Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command");
			JudgmentCommand=cmd(finishtweening);
			BrightCommand=cmd(visible,false);
			DimCommand=cmd(visible,true);
		};
		--W1 aka Marvelous Bright Explosion Commands
		NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim W1" ) .. {
			InitCommand=cmd(diffusealpha,0);
			W1Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command");
			JudgmentCommand=cmd(finishtweening);
			BrightCommand=cmd(visible,true);
			DimCommand=cmd(visible,false);
		};
	};
	Def.ActorFrame {
		--W2 aka Perfect Dim Explosion Commands
		NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim W2" ) .. {
			InitCommand=cmd(diffusealpha,0);
			W2Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command");
			HeldCommand=NOTESKIN:GetMetricA("GhostArrowDim", "HeldCommand");
			JudgmentCommand=cmd(finishtweening);
			BrightCommand=cmd(visible,false);
			DimCommand=cmd(visible,true);
		};
		--W2 aka Perfect Bright Explosion Commands
		NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim W2" ) .. {
			InitCommand=cmd(diffusealpha,0);
			W2Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command");
			HeldCommand=NOTESKIN:GetMetricA("GhostArrowBright", "HeldCommand");
			JudgmentCommand=cmd(finishtweening);
			BrightCommand=cmd(visible,true);
			DimCommand=cmd(visible,false);
		};
	};
	Def.ActorFrame {
		--W3 aka Great Dim Explosion Commands
		NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim W3" ) .. {
			InitCommand=cmd(diffusealpha,0);
			W3Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command");
			JudgmentCommand=cmd(finishtweening);
			BrightCommand=cmd(visible,false);
			DimCommand=cmd(visible,true);
		};
		--W3 aka Great Bright Explosion Commands
		NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim W3" ) .. {
			InitCommand=cmd(diffusealpha,0);
			W3Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command");
			JudgmentCommand=cmd(finishtweening);
			BrightCommand=cmd(visible,true);
			DimCommand=cmd(visible,false);
		};
	};
		Def.ActorFrame {
		--W4 aka Good Dim Explosion Commands
		NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim W4" ) .. {
			InitCommand=cmd(diffusealpha,0);
			W4Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command");
			JudgmentCommand=cmd(finishtweening);
			BrightCommand=cmd(visible,false);
			DimCommand=cmd(visible,true);
		};
		--W4 aka Good Bright Explosion Commands
		NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim W4" ) .. {
			InitCommand=cmd(diffusealpha,0);
			W4Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command");
			JudgmentCommand=cmd(finishtweening);
			BrightCommand=cmd(visible,true);
			DimCommand=cmd(visible,false);
		};
	};
		Def.ActorFrame {
		--W5 aka Boo Dim Explosion Commands
		NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim W5" ) .. {
			InitCommand=cmd(diffusealpha,0);
			W5Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command");
			JudgmentCommand=cmd(finishtweening);
			BrightCommand=cmd(visible,false);
			DimCommand=cmd(visible,true);
		};
		--W5 aka Boo Bright Explosion Commands
		NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim W5" ) .. {
			InitCommand=cmd(diffusealpha,0);
			W5Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command");
			JudgmentCommand=cmd(finishtweening);
			BrightCommand=cmd(visible,true);
			DimCommand=cmd(visible,false);
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
            self.explosions[self.emitnumber]:finishtweening():blend("BlendMode_Normal"):playcommand("Explode")
            self.emitnumber = (self.emitnumber % #self.explosions) + 1
			
			--grab another copy and increment (set this one's blend to add)
            self.explosions[self.emitnumber]:finishtweening():blend("BlendMode_Add"):playcommand("Explode")
            self.emitnumber = (self.emitnumber % #self.explosions) + 1
        end,
		
		--feed 6 copies into the actor
        minesplosion, minesplosion, minesplosion, minesplosion, minesplosion, minesplosion
    },
}
return t;
--press receptor animation
local function pressreceptor()
	return function(self) self:finishtweening()
			self:zoom(0.9):sleep(1/60)
			:linear(4/60):zoom(1.0)
	end
end

--go receptor
local t = Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_down', 'Go Receptor' );
		InitCommand=function(self)
			self:effectclock("beat");
			self:SetStateProperties({{Frame= 0, Delay=0.2}, {Frame= 1, Delay=0.8}});
			end;
		NoneCommand=pressreceptor(),
		PressCommand=pressreceptor(),
		W5Command=pressreceptor(),
		W4Command=pressreceptor(),
		W3Command=pressreceptor(),
		W2Command=pressreceptor(),
		W1Command=pressreceptor(),
	};
};
return t;

--[[
--_down Wait Receptor.png
WaitStateImage = "Wait Receptor";

--_down Go Receptor.png
NormalReceptor = "Go Receptor";

--wait time before go receptor appears
WaitLength = 5;

nskinfix = NOTESKIN:GetPath( '_down', NormalReceptor );

local t = Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_down', WaitStateImage );
			InitCommand=function(self)
			self:sleep(WaitLength);
			self:queuecommand("Go");
			end;

			GoCommand=function(self)
			self:Load(nskinfix);
			self:effectclock("beat");
			self:SetStateProperties({{Frame= 0, Delay=0.2}, {Frame= 1, Delay=0.8}});
			end;

		NoneCommand=pressreceptor(),
		W5Command=pressreceptor(),
		W4Command=pressreceptor(),
		W3Command=pressreceptor(),
		W2Command=pressreceptor(),
		W1Command=pressreceptor(),

		--[NOT NEEDED]PressCommand=pressreceptor(),
		--[TEST] PressCommand=function(self) MESSAGEMAN:Broadcast("Lol") end;
		--[DUNNO WHAT THIS IS] LiftCommand=NOTESKIN:GetMetricA("ReceptorArrow", "LiftCommand");
		--[DUNNO IF I NEED THIS] HitMineCommand=cmd(zoom,10);

	};
};
return t;
]]		
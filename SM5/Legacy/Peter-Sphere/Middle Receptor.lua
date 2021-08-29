--If a Command has "NOTESKIN:GetMetricA" in it, that means it gets the command from the metrics.ini, else use cmd(); to define command.
--If you dont know how "NOTESKIN:GetMetricA" works here is an explanation.
--NOTESKIN:GetMetricA("The [Group] in the metrics.ini", "The actual Command to fallback on in the metrics.ini");

local t = Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Middle', 'Go Receptor' );
		Frame0000=0;
		Delay0000=1;
		InitCommand=cmd(effectclock,"beat";diffuseramp;effectcolor1,0.05,0.05,0.05,1;effectcolor2,1,1,1,1;effectperiod,0.5;effecttiming,0.25,0.50,0,0.25;effectoffset,-0.25);
		NoneCommand=NOTESKIN:GetMetricA("ReceptorArrow", "NoneCommand");
		W5Command=NOTESKIN:GetMetricA("ReceptorArrow", "W5Command");
		W4Command=NOTESKIN:GetMetricA("ReceptorArrow", "W4Command");
		W3Command=NOTESKIN:GetMetricA("ReceptorArrow", "W3Command");
		W2Command=NOTESKIN:GetMetricA("ReceptorArrow", "W2Command");
		W1Command=NOTESKIN:GetMetricA("ReceptorArrow", "W1Command");
	};
	Def.Sprite {
		Texture=NOTESKIN:GetPath( "_Middle", "Receptor Press" );
		InitCommand=cmd(diffusealpha,0);
		PressCommand=NOTESKIN:GetMetricA("ReceptorArrow", "PressCommand");
		LiftCommand=NOTESKIN:GetMetricA("ReceptorArrow", "LiftCommand");
	};
};
return t;

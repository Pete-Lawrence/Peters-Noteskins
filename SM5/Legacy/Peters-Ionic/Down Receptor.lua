--If a Command has "NOTESKIN:GetMetricA" in it, that means it gets the command from the metrics.ini, else use cmd(); to define command.
--If you dont know how "NOTESKIN:GetMetricA" works here is an explanation.
--NOTESKIN:GetMetricA("The [Group] in the metrics.ini", "The actual Command to fallback on in the metrics.ini");

local t = Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_down', 'Receptor Go' );
		Frame0000=0;
		Delay0000=0.0625;
		Frame0001=1;
		Delay0001=0.0625;
		Frame0002=2;
		Delay0002=0.0625;
		Frame0003=3;
		Delay0003=0.0625;
		Frame0004=4;
		Delay0004=0.0625;
		Frame0005=5;
		Delay0005=0.0625;
		Frame0006=6;
		Delay0006=0.0625;
		Frame0007=7;
		Delay0007=0.0625;
		Frame0008=8;
		Delay0008=0.0625;
		Frame0009=9;
		Delay0009=0.0625;
		Frame0010=10;
		Delay0010=0.0625;
		Frame0011=11;
		Delay0011=0.0625;
		Frame0012=12;
		Delay0012=0.0625;
		Frame0013=13;
		Delay0013=0.0625;
		Frame0014=14;
		Delay0014=0.0625;
		Frame0015=15;
		Delay0015=0.0625;
		InitCommand=cmd(effectclock,"beat");
		NoneCommand=NOTESKIN:GetMetricA("ReceptorArrow", "NoneCommand");
		PressCommand=NOTESKIN:GetMetricA("ReceptorArrow", "PressCommand");
		LiftCommand=NOTESKIN:GetMetricA("ReceptorArrow", "LiftCommand");
		W5Command=NOTESKIN:GetMetricA("ReceptorArrow", "W5Command");
		W4Command=NOTESKIN:GetMetricA("ReceptorArrow", "W4Command");
		W3Command=NOTESKIN:GetMetricA("ReceptorArrow", "W3Command");
		W2Command=NOTESKIN:GetMetricA("ReceptorArrow", "W2Command");
		W1Command=NOTESKIN:GetMetricA("ReceptorArrow", "W1Command");
	};
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_down', 'Receptor Go' );
		Frame0000=0;
		InitCommand=cmd(blend,'BlendMode_Add';diffusealpha,0);
		NoneCommand=NOTESKIN:GetMetricA("ReceptorArrow", "NoneCommand");
		PressCommand=cmd(diffusealpha,0.5);
		LiftCommand=cmd(diffusealpha,0);
		W5Command=NOTESKIN:GetMetricA("ReceptorArrow", "W5Command");
		W4Command=NOTESKIN:GetMetricA("ReceptorArrow", "W4Command");
		W3Command=NOTESKIN:GetMetricA("ReceptorArrow", "W3Command");
		W2Command=NOTESKIN:GetMetricA("ReceptorArrow", "W2Command");
		W1Command=NOTESKIN:GetMetricA("ReceptorArrow", "W1Command");
	};
};
return t;

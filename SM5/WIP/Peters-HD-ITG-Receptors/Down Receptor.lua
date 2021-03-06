local t = Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_down', 'Receptor Go' );
		Frame0000=0;
		Delay0000=1;
		Frame0001=1;
		Delay0001=1;
		Frame0002=2;
		Delay0002=1;
		Frame0003=3;
		Delay0003=1;
		InitCommand=cmd(effectclock,"beat";diffuseramp;effectcolor1,0.1,0.1,0.1,1;effectcolor2,1,1,1,1;effectperiod,0.5;effecttiming,0.25,0.50,0,0.25;effectoffset,-0.25);
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
		Delay0000=0.25;
		Frame0001=1;
		Delay0001=1;
		Frame0002=2;
		Delay0002=1;
		Frame0003=3;
		Delay0003=1;
		Frame0004=0;
		Delay0004=0,75;
		InitCommand=cmd(blend,'BlendMode_Add';diffusealpha,0);
		NoneCommand=NOTESKIN:GetMetricA("ReceptorArrow", "NoneCommand");
		PressCommand=cmd(diffusealpha,0.2);
		LiftCommand=cmd(diffusealpha,0);
		W5Command=NOTESKIN:GetMetricA("ReceptorArrow", "W5Command");
		W4Command=NOTESKIN:GetMetricA("ReceptorArrow", "W4Command");
		W3Command=NOTESKIN:GetMetricA("ReceptorArrow", "W3Command");
		W2Command=NOTESKIN:GetMetricA("ReceptorArrow", "W2Command");
		W1Command=NOTESKIN:GetMetricA("ReceptorArrow", "W1Command");
	};
};
return t;
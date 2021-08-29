local t = Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath( "_Down", "Receptor Go" );
		InitCommand=function(self)
			self:effectclock("beat")
		end;
		NoneCommand=NOTESKIN:GetMetricA("DownReceptorArrow", "NoneCommand");
		PressCommand=NOTESKIN:GetMetricA("DownReceptorArrow", "PressCommand");
		LiftCommand=NOTESKIN:GetMetricA("DownReceptorArrow", "LiftCommand");
		W5Command=NOTESKIN:GetMetricA("DownReceptorArrow", "W5Command");
		W4Command=NOTESKIN:GetMetricA("DownReceptorArrow", "W4Command");
		W3Command=NOTESKIN:GetMetricA("DownReceptorArrow", "W3Command");
		W2Command=NOTESKIN:GetMetricA("DownReceptorArrow", "W2Command");
		W1Command=NOTESKIN:GetMetricA("DownReceptorArrow", "W1Command");
	};
	Def.Sprite {
		Texture=NOTESKIN:GetPath( "_Left", "Receptor Held" );
		Frame0000=0;
		Delay0000=1;
		InitCommand=NOTESKIN:GetMetricA('ReceptorOverlay', 'InitCommand');
		PressCommand=NOTESKIN:GetMetricA('ReceptorOverlay', 'PressCommand');
		LiftCommand=NOTESKIN:GetMetricA('ReceptorOverlay', 'LiftCommand');
		NoneCommand=NOTESKIN:GetMetricA('ReceptorArrow', 'NoneCommand');
	};
};
return t;

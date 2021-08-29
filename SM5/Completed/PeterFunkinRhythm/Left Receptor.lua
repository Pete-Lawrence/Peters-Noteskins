local t = Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath( "_Left", "Receptor Go" );
		InitCommand=function(self)
			self:effectclock("beat")
		end;
		NoneCommand=NOTESKIN:GetMetricA("LeftReceptorArrow", "NoneCommand");
		PressCommand=NOTESKIN:GetMetricA("LeftReceptorArrow", "PressCommand");
		LiftCommand=NOTESKIN:GetMetricA("LeftReceptorArrow", "LiftCommand");
		W5Command=NOTESKIN:GetMetricA("LeftReceptorArrow", "W5Command");
		W4Command=NOTESKIN:GetMetricA("LeftReceptorArrow", "W4Command");
		W3Command=NOTESKIN:GetMetricA("LeftReceptorArrow", "W3Command");
		W2Command=NOTESKIN:GetMetricA("LeftReceptorArrow", "W2Command");
		W1Command=NOTESKIN:GetMetricA("LeftReceptorArrow", "W1Command");
	};
};
return t;

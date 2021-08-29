local t = Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath( "_Right", "Receptor Go" );
		InitCommand=function(self)
			self:effectclock("beat")
		end;
		NoneCommand=NOTESKIN:GetMetricA("RightReceptorArrow", "NoneCommand");
		PressCommand=NOTESKIN:GetMetricA("RightReceptorArrow", "PressCommand");
		LiftCommand=NOTESKIN:GetMetricA("RightReceptorArrow", "LiftCommand");
		W5Command=NOTESKIN:GetMetricA("RightReceptorArrow", "W5Command");
		W4Command=NOTESKIN:GetMetricA("RightReceptorArrow", "W4Command");
		W3Command=NOTESKIN:GetMetricA("RightReceptorArrow", "W3Command");
		W2Command=NOTESKIN:GetMetricA("RightReceptorArrow", "W2Command");
		W1Command=NOTESKIN:GetMetricA("RightReceptorArrow", "W1Command");
	};
};
return t;

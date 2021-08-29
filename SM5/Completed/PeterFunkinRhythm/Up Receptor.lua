local t = Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath( "_Up", "Receptor Go" );
		InitCommand=function(self)
			self:effectclock("beat")
		end;
		NoneCommand=NOTESKIN:GetMetricA("UpReceptorArrow", "NoneCommand");
		PressCommand=NOTESKIN:GetMetricA("UpReceptorArrow", "PressCommand");
		LiftCommand=NOTESKIN:GetMetricA("UpReceptorArrow", "LiftCommand");
		W5Command=NOTESKIN:GetMetricA("UpReceptorArrow", "W5Command");
		W4Command=NOTESKIN:GetMetricA("UpReceptorArrow", "W4Command");
		W3Command=NOTESKIN:GetMetricA("UpReceptorArrow", "W3Command");
		W2Command=NOTESKIN:GetMetricA("UpReceptorArrow", "W2Command");
		W1Command=NOTESKIN:GetMetricA("UpReceptorArrow", "W1Command");
	};
};
return t;

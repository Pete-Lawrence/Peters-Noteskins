local t = Def.ActorFrame {
	--Receptor
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Center', 'Receptor Go' );
		InitCommand=cmd(effectclock,"beat";diffuseramp;effectcolor1,0,0,0,1;effectcolor2,1,1,1,1;effectperiod,0.5;effecttiming,0.25,0.50,0,0.25;effectoffset,-0.25);
		NoneCommand=function(self) self:finishtweening():zoom(0.75):linear(0.11):zoom(1.0)end,
		PressCommand=cmd();
		LiftCommand=cmd();
		W5Command=function(self)self:finishtweening()end,
		W4Command=function(self)self:finishtweening()end,
		W3Command=function(self)self:finishtweening()end,
		W2Command=function(self)self:finishtweening()end,
		W1Command=function(self)self:finishtweening()end,
	};
	--Held Receptor
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Center', 'Receptor Go' );
		InitCommand=cmd(blend,'BlendMode_Add';diffusealpha,0);
		NoneCommand=function(self) self:finishtweening():zoom(0.75):linear(0.11):zoom(1.0)end,
		PressCommand=function(self) self:diffusealpha(1)end,
		LiftCommand=function(self) self:linear(0.08):diffusealpha(0.0)end,
		W5Command=function(self)self:finishtweening()end,
		W4Command=function(self)self:finishtweening()end,
		W3Command=function(self)self:finishtweening()end,
		W2Command=function(self)self:finishtweening()end,
		W1Command=function(self)self:finishtweening()end,
	};
};
return t;
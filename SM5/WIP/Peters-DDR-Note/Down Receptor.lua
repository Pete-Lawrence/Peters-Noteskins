--If a Command has "NOTESKIN:GetMetricA" in it, that means it gets the command from the metrics.ini, else use cmd(); to define command.
--If you dont know how "NOTESKIN:GetMetricA" works here is an explanation.
--NOTESKIN:GetMetricA("The [Group] in the metrics.ini", "The actual Command to fallback on in the metrics.ini");



local t = Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_down', 'Go Receptor' );
		Frame0000=0;
		Delay0000=0.2;
		Frame0001=1;
		Delay0001=0.8;
		InitCommand=cmd(effectclock,"beat");
		NoneCommand=cmd(stoptweening;stoptweening;glow,color("#000000F0");zoom,0.75;linear,0.06;zoom,1;glow,color("#00000000")),
		--PressCommand = function(self):zoom(0.9):sleep(2/60):linear(4/60):zoom(2.0) <---------- This is how it's supposed to look on every press.
		PressCommand=function(self) MESSAGEMAN:Broadcast("Lol") end;
		--LiftCommand=NOTESKIN:GetMetricA("ReceptorArrow", "LiftCommand");
		W5Command=cmd(stoptweening),
		W4Command=cmd(stoptweening),
		W3Command=cmd(stoptweening),
		W2Command=cmd(stoptweening),
		W1Command=cmd(stoptweening),
		--HitMineCommand=cmd(zoom,10);
	};
};
return t;

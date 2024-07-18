local t = Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Up', 'Tap Mine' );
		Frames = Sprite.LinearFrames( 8, 0.5 );
	};
};
return t;

local t = Def.Model {
	Meshes=NOTESKIN:GetPath('_down','tap lift model');
	Materials=NOTESKIN:GetPath('_down','tap lift model');
	Bones=NOTESKIN:GetPath('_down','tap lift model');
	InitCommand=function(self) if self and self.SetTextureFiltering then self:SetTextureFiltering(false) end end,
};

return t;

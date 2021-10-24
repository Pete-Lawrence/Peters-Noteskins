local ret = ... or {};

--Defining on which direction the other directions should be bassed on
--This will let us use less files which is quite handy to keep the noteskin directory nice
--Do remember this will Redirect all the files of that Direction to the Direction its pointed to
--If you only want some files to be redirected take a look at the "custom hold/roll per direction"
ret.RedirTable =
{
	Up = "Down",
	Down = "Down",
	Left = "Down",
	Right = "Down",
	UpLeft = "Down",
	UpRight = "Down",
};


local OldRedir = ret.Redir;
ret.Redir = function(sButton, sElement)
	sButton, sElement = OldRedir(sButton, sElement);

	--We want to use custom hold/roll per direction, but
	--Keep global hold/roll heads and explosions.	
	if not string.find(sElement, "Head") and
	not string.find(sElement, "Explosion") then
		if string.find(sElement, "Hold") or
		string.find(sElement, "Roll") then
			return sButton, sElement;
		end
	end
	
	sButton = ret.RedirTable[sButton];
	
	if sElement == "Tap Fake"
	then
		sElement = "Tap Note";
	end

	if sElement == "Roll Head Active"
	then
		sElement = "Hold Head Active";
	end
	
	if sElement == "Roll Head Inactive"
	then
		sElement = "Hold Head Inactive";
	end

	return sButton, sElement;
end

local OldFunc = ret.Load;
function ret.Load()
	local t = OldFunc();

	--Explosion should not be rotated; it calls other actors.
	if Var "Element" == "Explosion"	then
		t.BaseRotationZ = nil;
	end
	
	if Var "Button" == "UpLeft" and Var "Element" == "Hold Head Active"	then
		t.BaseRotationZ = 135;
	end
	
	if Var "Button" == "UpLeft" and Var "Element" == "Hold Head Inactive"	then
		t.BaseRotationZ = 135;
	end
	
	if Var "Button" == "UpLeft" and Var "Element" == "Roll Head Active"	then
		t.BaseRotationZ = 135;
	end
	
	if Var "Button" == "UpLeft" and Var "Element" == "Roll Head Inactive"	then
		t.BaseRotationZ = 135;
	end
	
	if Var "Button" == "UpRight" and Var "Element" == "Hold Head Active"	then
		t.BaseRotationZ = 225;
	end
	
	if Var "Button" == "UpRight" and Var "Element" == "Hold Head Inactive"	then
		t.BaseRotationZ = 225;
	end
	
	if Var "Button" == "UpRight" and Var "Element" == "Roll Head Active"	then
		t.BaseRotationZ = 225;
	end
	
	if Var "Button" == "UpRight" and Var "Element" == "Roll Head Inactive"	then
		t.BaseRotationZ = 225;
	end
	
	return t;
end
-- >


-- Parts of noteskins which we want to rotate
ret.PartsToRotate =
{
	["Receptor"] = true,
	["Tap Explosion Bright W1"] = true,
	["Tap Explosion Dim W1"] = true,
	["Tap Explosion Bright W2"] = true,
	["Tap Explosion Dim W2"] = true,
	["Tap Explosion Bright W3"] = true,
	["Tap Explosion Dim W3"] = true,
	["Tap Explosion Bright W4"] = true,
	["Tap Explosion Dim W4"] = true,
	["Tap Explosion Bright W5"] = true,
	["Tap Explosion Dim W5"] = true,
	["Tap Note"] = true,
	["Tap Fake"] = true,
	["Tap Lift"] = true,
	["Tap Addition"] = true,
	["Hold Explosion"] = true,
	["Hold Head Active"] = true,
	["Hold Head Inactive"] = true,
	["Roll Explosion"] = true,
	["Roll Head Active"] = true,
	["Roll Head Inactive"] = true,
};
-- Defined the parts to be rotated at which degree
ret.Rotate =
{
	Up = 180,
	Down = 0,
	Left = 90,
	Right = -90,
	UpLeft = 135,
	UpRight = 225,
};

-- Parts that should be Redirected to _Blank.png
-- you can add/remove stuff if you want
ret.Blank =
{
	["Hold Topcap Active"] = true,
	["Hold Topcap Inactive"] = true,
	["Roll Topcap Active"] = true,
	["Roll Topcap Inactive"] = true,
	["Hold Tail Active"] = true,
	["Hold Tail Inactive"] = true,
	["Roll Tail Active"] = true,
	["Roll Tail Inactive"] = true,
};

-- dont forget to close the ret cuz else it wont work ;>
return ret;

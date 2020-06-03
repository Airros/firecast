﻿require("scene.lua");
require("utils.lua");
require("rrpgScene_TouchNav.lua");
require("rrpgScene_InertialMov.lua");
require("rrpgScene_MovementHistory.lua");
require("rrpgScene_Undo.dlua");
require("gui.lua");

--[[   PLUGIN para fazer user drawings details ]]--	

local function getFrmWorldIncrease(scene, createIfDontExists)
	local frm = scene.__frmTeste;
	
	if frm == nil and createIfDontExists == nil then
		frm = GUI.newForm("frmWorldIncrease");
		scene.__frmTeste = frm;
	end;

	return frm;
end;

function frmWorldIncrease_Show(scene)

	local frm = getFrmWorldIncrease(scene);
	scene.viewport:showForm(frm, {placement="topLeft"});
	return frm;
	
end;

function frmWorldIncrease_Close(scene)
	local frm = getFrmWorldIncrease(scene, false);
	
		scene.viewport:closeForm(frm);

end;
	
	
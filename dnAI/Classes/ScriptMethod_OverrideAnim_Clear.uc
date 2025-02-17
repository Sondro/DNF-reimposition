/*******************************************************************************
 * ScriptMethod_OverrideAnim_Clear generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_OverrideAnim_Clear extends ScriptMethod
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport name AnimName "Anim to clear.";

event string GetMethodString()
{
	return __NFUN_302__(__NFUN_302__("OverrideAnim_Clear (", string(AnimName)), ")");
	return;
}

defaultproperties
{
	AnimName=Anim_Script
}
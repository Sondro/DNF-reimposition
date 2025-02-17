/*******************************************************************************
 * ScriptMethod_TakeOff generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_TakeOff extends ScriptMethod
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport Vector TakeOffVelocity "Optional velocity relative to AIs rotation to use when taking off. If left at <0,0,0> the AI will manually calculate a straight up velocity";

event string GetMethodString()
{
	return "TakeOff ()";
	return;
}

defaultproperties
{
	Latent=true
}
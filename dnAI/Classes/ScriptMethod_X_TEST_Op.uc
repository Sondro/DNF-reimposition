/*******************************************************************************
 * ScriptMethod_X_TEST_Op generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_X_TEST_Op extends ScriptMethod
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport Engine.BaseAI.EAIOp Op "Op to execute.  (NOTE: This is a test method only - do not use for production scripts.)";

event string GetMethodString()
{
	return __NFUN_302__(__NFUN_302__("X_TEST_Op (", string(__NFUN_365__(class'EAIOp', int(Op)))), ")");
	return;
}

defaultproperties
{
	Op=85
	Latent=true
}
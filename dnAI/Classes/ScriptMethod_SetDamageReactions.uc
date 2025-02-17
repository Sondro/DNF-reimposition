/*******************************************************************************
 * ScriptMethod_SetDamageReactions generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_SetDamageReactions extends ScriptMethod
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport Engine.Object.EBitModifier Invulnerable "Ignore damage received?";
var() noexport Engine.Object.EBitModifier ShowPain "Play pain animations when damaged?";

event string GetMethodString()
{
	return __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("SetDamageReactions (", string(__NFUN_365__(class'EBitModifier', int(Invulnerable)))), ", "), string(__NFUN_365__(class'EBitModifier', int(ShowPain)))), ")");
	return;
}

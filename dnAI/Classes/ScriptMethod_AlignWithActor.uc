/*******************************************************************************
 * ScriptMethod_AlignWithActor generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_AlignWithActor extends ScriptMethod
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport deprecated name TargetActorTag "Tag of actor to align with to.";
var() noexport float Offset "Number of degrees to offset the alignment.";

event string GetMethodString()
{
	return __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("AlignWithActor (", string(TargetActorTag)), ", "), string(Offset)), ")");
	return;
}

defaultproperties
{
	Latent=true
}
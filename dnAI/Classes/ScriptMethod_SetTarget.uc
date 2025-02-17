/*******************************************************************************
 * ScriptMethod_SetTarget generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_SetTarget extends ScriptMethod
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport deprecated name TargetActorTag "Tag of the new target actor.";
var() noexport bool bTargetMayNotExist "Set this to true if TargetActorTag might not exist (ie - it can be killed before this gets executed). This will surpress log spam";
var() noexport bool ForceUpdate "If true, forces the target module to update the target info regardless of contact status.";
var() noexport bool AllowClear "If true, allows the target to clear when there has been no contacts for this actors ClearTargetTime.";
var() noexport bool SuspendTargetEval "If true, suspend any further target evaluation as long as this target is alive - ie dont select another target, keep this one. Once target is dead the evaluator will turn back on";

event string GetMethodString()
{
	return __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("SetTarget (", string(TargetActorTag)), ", "), string(ForceUpdate)), ", "), string(AllowClear)), ", "), string(SuspendTargetEval)), ")");
	return;
}

defaultproperties
{
	AllowClear=true
	SuspendTargetEval=true
}
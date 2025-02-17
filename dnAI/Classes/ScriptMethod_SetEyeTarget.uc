/*******************************************************************************
 * ScriptMethod_SetEyeTarget generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
interface ScriptMethod_SetEyeTarget extends ScriptMethod
	native
	parseconfig
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport deprecated name TargetActorTag "The tag of the actor to aim the eyes at.";
var() noexport name TargetBoneName "Name of the target actors bone to aim the eyes at.";
var() noexport Engine.BaseAI.EAITargetStackOp TargetStackOp "Set / ClearAllAndSet / Clear / ClearAll";
var() noexport float TargetLifeTime "Pop this target after locking on to it for this long.  (<0.0f means infinite lifetime.)";
var() noexport float BlendTime "Time to blend aim on / off.";
var() noexport float AngularThresh "We move on to the next script method when this angle from target is obtained.  (<0.0f means move on straight away.)";
var() noexport float TrackRate "Degrees per Second to track the Eye Target.";
var() noexport bool RemoveBeyondConsts "Remove the target when it is beyond the constraints?";
var() noexport string TargetIDString "Optional unique string for this target.  Useful if you want to remove a specific target from the stack.";

event string GetMethodString()
{
	return __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("SetEyeTarget (", string(TargetActorTag)), ", "), string(TargetBoneName)), ", "), string(__NFUN_365__(class'EAITargetStackOp', int(TargetStackOp)))), ", "), string(TargetLifeTime)), ", "), string(BlendTime)), ", "), string(AngularThresh)), ", "), string(TrackRate)), ", "), string(RemoveBeyondConsts)), ", "), TargetIDString), ")");
	return;
}

defaultproperties
{
	TargetBoneName=nose
	TargetLifeTime=-1
	BlendTime=0.5
	AngularThresh=-1
	TrackRate=160
	RemoveBeyondConsts=true
	TargetIDString="ScriptDefault"
}
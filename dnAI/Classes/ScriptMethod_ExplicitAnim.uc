/*******************************************************************************
 * ScriptMethod_ExplicitAnim generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
interface ScriptMethod_ExplicitAnim extends ScriptMethod
	native
	parseconfig
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport Engine.BaseAI.EAIAnimXType AnimType "Type of behaviour for animation.";
var() noexport name SequenceName "Animation sequence to play.";
var() noexport name ChannelName "Channel to play the anim on.";
var() noexport float Rate "Animation rate. (1.0 is normal speed)";
var() noexport float Tween "Tween time.";
var() noexport bool Loop "Should this animation loop?";
var() noexport float AnimEarlyEndTime "Early end time.";
var() noexport float BlendInTime "How long to blend in over.";
var() noexport float BlendOutTime "How long to blend out over.";
var() noexport bool AdjustStart "Adjust start to begin on next frame?";
var() noexport float ExitTime "Duration to play animation for.  Set to <= 0.0 to play one animation cycle.";
var() noexport deprecated name FaceActorTag "Optional actor to face during animation.";
var() noexport Vector FacePos "Optional position to face during animation.";
var() noexport bool bForceRestart "if true, we will force a rstart if this animation is already playing.";

event string GetMethodString()
{
	return __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("ExplicitAnim (", string(__NFUN_365__(class'EAIAnimXType', int(AnimType)))), ", "), string(SequenceName)), ", "), string(ChannelName)), ", "), string(Rate)), ", "), string(Tween)), ", "), string(Loop)), ", "), string(AnimEarlyEndTime)), ", "), string(BlendInTime)), ", "), string(BlendOutTime)), ", "), string(AdjustStart)), ", "), string(ExitTime)), ", "), string(FaceActorTag)), ", ("), string(FacePos)), ")"), ")");
	return;
}

function EnumerateRawAnimationSequences(out array<SAnimationEnumeration> References, Mesh Mesh)
{
	AddAnimationEnumeration(References, SequenceName, Mesh);
	return;
}

defaultproperties
{
	AnimType=1
	SequenceName=aigen_a_normal_idle01
	ChannelName=Bottom
	Rate=1
	AnimEarlyEndTime=0.2
	BlendInTime=0.2
	BlendOutTime=0.2
	bForceRestart=true
	Latent=true
}
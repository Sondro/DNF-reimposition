/*******************************************************************************
 * aFinalDecoration generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class aFinalDecoration extends dnDecoration
	abstract
	collapsecategories;

enum EPoolBall
{
	PoolBall_cue,
	POOLBALL_01,
	POOLBALL_02,
	POOLBALL_03,
	POOLBALL_04,
	POOLBALL_05,
	POOLBALL_06,
	POOLBALL_07,
	POOLBALL_08,
	POOLBALL_09,
	POOLBALL_10,
	POOLBALL_11,
	POOLBALL_12,
	POOLBALL_13,
	POOLBALL_14,
	POOLBALL_15
};

enum ECigPackType
{
	ECIG_One,
	ECIG_Two,
	ECIG_Three,
	ECIG_Four,
	ECIG_Invalid
};

struct SChannelInfo
{
	var() noexport MaterialEx ShowSmack "Actual show to have playing when the player first switches to this channel. If nothing here, it will simply play the ShowOffTex. Doesn't have to be a SmackerTexture anymore, can be any MaterialEx.";
	var() noexport SSoundInfo ShowSound "Soundtrack for the show.";
	var() noexport SAmbientSoundInfo ShowSoundAmbient "Ambient Soundtrack for the show.";
	var() noexport Color ShowColor "Color to apply to the TVLight that is associated with thise TV. If left black, it will use the default color of the light you targetted.";
	var() noexport SSoundInfo ShowOffSound "Sound to play when the show is off.";
	var() noexport SAmbientSoundInfo ShowOffSoundAmbient "Amient Sound to play when the show is off.";
	var() noexport MaterialEx ShowOffTex "Texture to display when the show has gone off the air. DOES NOTHING USEFUL CURRENTLY, WAITING ON SMACKER FUNCTIONALITY FOR THIS TO BE USEFUL.";
	var() noexport Color ShowOffColor "Color to apply to the TVLight when the show is off the air.";
	var() noexport deprecated name StationEvent "Event to fire off whenever this station is activated.";
	var() noexport name StationTag "Call this tag to force the TV to immediately jump to this channel.";
	var int StationSpecialEventID;
	var() noexport deprecated Actor StationCamera "Override CameraActor in Display with this actor instead for displaying a live footage scene using RenderTargets.";
	var() noexport float StationFOV "FOV to apply when the CameraActor is updated. If left as 0, will use the value of the TV's CameraFOV instead.";
	var() noexport RenderTarget RenderTargetTexture "RenderTargetTexture to use for the StationCamera rendering.";
	var() noexport Vector RenderTargetNormal "When RenderTargetTexture isn't None, use this Normal instead of the default. If left as (0,0,0) will use the TV's default instead.";
};

static final function RegisterChannelInfoPrecacheComponents(PrecacheIndex PrecacheIndex, SChannelInfo ChannelInfo)
{
	PrecacheIndex.__NFUN_1269__(ChannelInfo.ShowSmack);
	PrecacheIndex.__NFUN_1269__(ChannelInfo.ShowOffTex);
	PrecacheIndex.__NFUN_1276__(ChannelInfo.ShowSound);
	PrecacheIndex.__NFUN_1276__(ChannelInfo.ShowOffSound);
	PrecacheIndex.__NFUN_1275__(ChannelInfo.ShowSoundAmbient);
	PrecacheIndex.__NFUN_1275__(ChannelInfo.ShowOffSoundAmbient);
	return;
}

defaultproperties
{
	DestroyedActivities(0)=ObjectProperty'DukeHUD.DrawDebugHUD.C'
	DestroyedActivities(1)=none
	DestroyedActivities(2)=DA_Sound_Destroyed_Generic'DecoActivityDeclarations.DA_Sound_Destroyed_Generic'
	DestroyedActivities(3)=ObjectProperty'DukeMultiPlayer.ChangeToWeapon.NewWeapon'
	DestroyedActivities(4)='DukeMultiPlayer'
}
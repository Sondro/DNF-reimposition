/*******************************************************************************
 * dnControl_KickDoor generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_KickDoor extends dnControl;

var DoorMoverEx DoorMover;

simulated function AttachPawnSuccess(Pawn Attachee, optional bool bForced)
{
	local Rotator kickRotation;

	__NFUN_645__(__NFUN_239__(__NFUN_239__(Attachee.Location, __NFUN_232__(0, 0, Attachee.CollisionHeight)), __NFUN_263__(Attachee.PrePivot, Attachee.Rotation)));
	kickRotation = Rotator(__NFUN_239__(DoorMover.GetDoorCenter(), Attachee.Location));
	kickRotation.Pitch = Attachee.Rotation.Pitch;
	__NFUN_652__(kickRotation);
	// End:0xBA
	if(__NFUN_340__(InternalControlRemapper, none))
	{
		InternalControlRemapper.__NFUN_630__();
	}
	super.AttachPawnSuccess(Attachee, bForced);
	return;
}

simulated function int FindBestExitIndex()
{
	return ActiveUsableExit;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'fists_melee');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'DoorKick');
	return;
}

state() idle
{
	simulated function InteractUser(Pawn User)
	{
		// End:0x21
		if(__NFUN_340__(DoorMover, none))
		{
			DoorMover.Kicked(User);
		}
		return;
	}

	simulated function AnimCallback_UserAnimEnd()
	{
		super(dnControl).AnimCallback_UserAnimEnd();
		DetachPawnSuccess(false);
		// End:0x2F
		if(__NFUN_150__(__NFUN_145__(bUseHomePose), __NFUN_174__(ActiveUsableExit, -1)))
		{
			AnimCallback_UserDetached();
		}
		return;
	}
	stop;
}

defaultproperties
{
	States(0)=SAnimationFadeBlend="eZ	* bY*kvVK",
/* Exception thrown while deserializing States
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.UnrealStreamImplementations.ReadNameReference(IUnrealStream stream) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 838
   at UELib.Core.UDefaultProperty.DeserializeTagUE1() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 204
   at UELib.Core.UDefaultProperty.DeserializeNextTag() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 193
   at UELib.Core.UDefaultProperty.Deserialize() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 169
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 767 */
	States(1)=(NewState=AttachUserLERP)
	States(2)=(UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=/* Array type was not detected. */),SlotPriority=0,VolumePrefab=0,Slots=/* Array type was not detected. */)
	States(3)=(Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0),Velocity3D=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	States(4)=none
	States(5)=(Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=/* Array type was not detected. */)
	States(6)=(Filters=/* Array type was not detected. */)
}
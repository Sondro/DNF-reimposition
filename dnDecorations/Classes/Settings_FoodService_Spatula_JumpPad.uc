/*******************************************************************************
 * Settings_FoodService_Spatula_JumpPad generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_FoodService_Spatula_JumpPad extends Settings_FoodService
	collapsecategories;

var() bool bDisablePlayerAirControl;
var dnJumpPadTarget TargetPoint;
var KBoxSensor MySensor;

simulated event PostVerifySelf()
{
	local name BeginSenseEvent;

	super(dnDecoration).PostVerifySelf();
	TargetPoint = dnJumpPadTarget(FindActor(class'dnJumpPadTarget', Event));
	BeginSenseEvent = __NFUN_343__(__NFUN_302__(string(Name), "_Begin"));
	__NFUN_718__('BeginSenseObject', BeginSenseEvent);
	MySensor = KBoxSensor(FindMountedActor(, class'KBoxSensor'));
	// End:0xC0
	if(__NFUN_340__(MySensor, none))
	{
		MySensor.BeginSenseEvent = BeginSenseEvent;
		MySensor.__NFUN_1125__(__NFUN_232__(10, 6, 5));
		// End:0xC0
		if(__NFUN_342__(PhysicsEntityGroup, 'None'))
		{
			MySensor.__NFUN_816__(PhysicsEntityGroup);
		}
	}
	return;
}

final simulated function TriggerFunc_BeginSenseObject()
{
	DecoActivity(0, 'Boing');
	return;
}

simulated event Tick(float DeltaSeconds)
{
	local int i;
	local array<SKarmaInteraction> SensedActors;

	super(Actor).Tick(DeltaSeconds);
	// End:0x94
	if(__NFUN_148__(__NFUN_340__(MySensor, none), __NFUN_340__(TargetPoint, none)))
	{
		SensedActors = MySensor.__NFUN_1123__();
		i = 0;
		J0x3F:

		// End:0x94 [Loop If]
		if(__NFUN_169__(i, string(SensedActors)))
		{
			SensedActors[i].Actor.JumpPadLaunch(Location, TargetPoint.Location, 50,, bDisablePlayerAirControl);
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0x3F;
		}
	}
	return;
}

defaultproperties
{
	DecoActivities_Default=/* Array type was not detected. */
	X=/* Unknown default property type! */
	
/* Exception thrown while deserializing Engine
System.ArgumentOutOfRangeException: Length cannot be less than zero.
Parameter name: length
   at System.String.Substring(Int32 startIndex, Int32 length)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 578 */
}
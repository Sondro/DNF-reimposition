/*******************************************************************************
 * GeoWaterMultisampler generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GeoWaterMultisampler extends InfoActor
	collapsecategories
	hidecategories(Collision,Filter,Interactivity,Karma,Lighting,Networking,Sound);

var() noexport bool bFilterHeight "Base total height on averaged height of source points. (If the water surface is showing through, set this to false.)";
var() noexport bool bFlipRoll "Cause the Roll value returned by the BobPoints to be reversed.";
var() noexport name PointTags[3] "Tag of the points to use.";
var() noexport float HeightOffset "Value to add to the calculated height to get the final location of the object.";
var() noexport float DampenPitch "1.0 = normal, 0.0 = no change, 2.0 = double";
var() noexport float DampenRoll "1.0 = normal, 0.0 = no change, 2.0 = double";
var() noexport float UpdateRate "How frequently to update.";
var() noexport Vector WaterSpeed "Allows the sampler to move along the top of 'moving water'.";
var GeoWaterBobPoint Points[3];
var Vector PointLocs[3];
var GeoWater Water;
var float DampenPitchOrig;
var float DampenRollOrig;
var bool bInstantMove;

event PostBeginPlay()
{
	// End:0x12
	if(__NFUN_339__(Owner, none))
	{
		InitSelf();
	}
	super(Actor).PostBeginPlay();
	return;
}

final function InitSelf()
{
	local GeoWaterBobPoint P;
	local GeoWater W;
	local int i;

	DesiredLocation[0].TimeTotal = UpdateRate;
	DesiredRotationPitch[0].TimeTotal = UpdateRate;
	DesiredRotationRoll[0].TimeTotal = UpdateRate;
	DampenPitchOrig = DampenPitch;
	DampenRollOrig = DampenRoll;
	// End:0x110
	if(__NFUN_150__(__NFUN_150__(__NFUN_339__(Points[1], none), __NFUN_339__(Points[1], none)), __NFUN_339__(Points[2], none)))
	{
		i = 0;
		J0x82:

		// End:0x110 [Loop If]
		if(__NFUN_169__(i, 3))
		{
			Points[i] = GeoWaterBobPoint(FindActor(class'GeoWaterBobPoint', PointTags[i]));
			// End:0x106
			if(__NFUN_339__(Points[i], none))
			{
				__NFUN_355__(__NFUN_302__(__NFUN_302__(__NFUN_302__(string(self), ": could not find point tagged \""), string(PointTags[i])), "\"."));
			}
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0x82;
		}
	}
	// End:0x137
	if(__NFUN_339__(Water, none))
	{
		Water = GeoWater(FindActor(class'GeoWater', Event));
	}
	// End:0x1B1
	if(__NFUN_148__(__NFUN_339__(Water, none), __NFUN_145__(bFilterHeight)))
	{
		bFilterHeight = true;
		__NFUN_355__(__NFUN_302__(__NFUN_302__(__NFUN_302__(string(self), ": could not find water surface tagged \""), string(Event)), "\" -- using filtered height"));
	}
	// End:0x1E7
	if(__NFUN_201__(UpdateRate, 0))
	{
		bInstantMove = false;
		__NFUN_362__('Tick');
		UpdateLocation();
		__NFUN_605__(UpdateRate, true, 'UpdateLocation');		
	}
	else
	{
		bInstantMove = true;
		__NFUN_361__('Tick');
	}
	return;
}

final function UpdateLocation()
{
	local Vector vDPitch, vDRoll;
	local Rotator R;
	local int i;

	i = 0;
	J0x07:

	// End:0x6A [Loop If]
	if(__NFUN_169__(i, 3))
	{
		// End:0x4F
		if(__NFUN_340__(Points[i], none))
		{
			PointLocs[i] = Points[i].Sample(Water);
			// [Explicit Continue]
			goto J0x60;
		}
		PointLocs[i] = Location;
		J0x60:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	vDRoll = __NFUN_239__(PointLocs[2], PointLocs[1]);
	vDPitch = __NFUN_239__(__NFUN_237__(__NFUN_238__(PointLocs[1], PointLocs[2]), 2), PointLocs[0]);
	R.Roll = int(__NFUN_195__(DampenRoll, float(Rotator(vDRoll).Pitch)));
	R.Pitch = int(__NFUN_195__(DampenPitch, float(Rotator(vDPitch).Pitch)));
	// End:0x101
	if(bFlipRoll)
	{
		__NFUN_178__(R.Roll, float(-1));
	}
	DesiredRotationPitch[0].Target = R.Pitch;
	DesiredRotationRoll[0].Target = R.Roll;
	DesiredLocation[0].Target = __NFUN_232__(__NFUN_198__(Location.X, __NFUN_195__(WaterSpeed.X, UpdateRate)), __NFUN_198__(Location.Y, __NFUN_195__(WaterSpeed.Y, UpdateRate)), HeightOffset);
	// End:0x1CC
	if(bFilterHeight)
	{
		__NFUN_209__(DesiredLocation[0].Target.Z, __NFUN_196__(__NFUN_198__(__NFUN_198__(PointLocs[0].Z, PointLocs[1].Z), PointLocs[2].Z), 3));		
	}
	else
	{
		__NFUN_209__(DesiredLocation[0].Target.Z, Water.__NFUN_1116__(Location));
	}
	// End:0x234
	if(bInstantMove)
	{
		__NFUN_652__(__NFUN_265__(DesiredRotationPitch[0].Target, Rotation.Yaw, DesiredRotationRoll[0].Target));
		__NFUN_645__(DesiredLocation[0].Target);		
	}
	else
	{
		__NFUN_656__(0);
		__NFUN_658__(0);
		__NFUN_646__(0);
	}
	return;
}

event Tick(float DeltaSeconds)
{
	super(Actor).Tick(DeltaSeconds);
	UpdateRate = DeltaSeconds;
	UpdateLocation();
	return;
}

defaultproperties
{
	bFilterHeight=true
	DampenPitch=1
	DampenRoll=1
	UpdateRate=0.25
	bHidden=true
	bNoNativeTick=false
	DesiredLocation=/* Array type was not detected. */
}
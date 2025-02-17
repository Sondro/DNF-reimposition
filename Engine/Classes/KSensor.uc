/*******************************************************************************
 * KSensor generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KSensor extends KarmaActor
	abstract
	native
	collapsecategories
	notplaceable;

cpptext
{
// Stripped
}

var() const noexport deprecated name OnlySenseTagged "If non-None, this will only sense objects with a matching Tag.";
var() const noexport array< class<KarmaActor> > OnlySenseClasses "If not empty, Actors must be of one of these classes or a subclass to be sensed. Please don't add duplicates. Please note that this works on top of the default StaticInteractionClass setting, but is much slower.";
var() const noexport name SensorEnableTag "Calling this will turn the sensor on.";
var() const noexport name SensorDisableTag "Calling this will turn the sensor off.";
var() noexport deprecated name BeginSenseEvent "This event will be fired whenever an object meeting the sense criteria ([OnlySenseTagged], etc.) starts colliding with the sensor region.";
var() noexport deprecated name EndSenseEvent "This event will be fired whenever an object meeting the sense criteria ([OnlySenseTagged], etc.) that was previously colliding with the sensor region stops colliding.";

event PostVerifySelf()
{
	super(Actor).PostVerifySelf();
	__NFUN_718__('SensorEnable', SensorEnableTag);
	__NFUN_718__('SensorDisable', SensorDisableTag);
	return;
}

event BeginSenseObject(KarmaActor Actor)
{
	GlobalTrigger(BeginSenseEvent, Actor.Instigator, Actor);
	return;
}

event EndSenseObject(KarmaActor Actor)
{
	GlobalTrigger(EndSenseEvent, Actor.Instigator, Actor);
	return;
}

final function TriggerFunc_SensorEnable()
{
	__NFUN_621__(,,, true);
	return;
}

final function TriggerFunc_SensorDisable()
{
	__NFUN_621__(,,, false);
	return;
}

// Export UKSensor::execAddSensableClass(FFrame&, void* const)
native(1120) final function AddSensableClass(class<KarmaActor> Class)
{
	//native.Class;	
}

// Export UKSensor::execRemoveSensableClass(FFrame&, void* const)
native(1121) final function RemoveSensableClass(class<KarmaActor> Class)
{
	//native.Class;	
}

// Export UKSensor::execGetFirstSensedPawn(FFrame&, void* const)
native(1122) final function Pawn GetFirstSensedPawn(optional bool bAlien, optional bool bAllowVehicleDrivers)
{
	//native.bAlien;
	//native.bAllowVehicleDrivers;	
}

// Export UKSensor::execGetSensedActors(FFrame&, void* const)
native(1123) final function array<SKarmaInteraction> GetSensedActors();

defaultproperties
{
	bBlockKarma=true
	bHidden=true
	bDirectional=true
	TickStyle=0
}
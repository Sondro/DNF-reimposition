/*******************************************************************************
 * KSpringDamper generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KSpringDamper extends KAffector
	abstract
	native
	collapsecategories
	notplaceable
	hidecategories(Collision,HeatVision,Interactivity,Karma,KarmaCollision);

cpptext
{
// Stripped
}

enum ESpringDamperSimulationMode
{
	SPRINGDAMPER_Stable,
	SPRINGDAMPER_Fast
};

var(KAffector) const KSpringDamper.ESpringDamperSimulationMode SimulationMode;
var(KAffector) const noexport float K "The spring constant for this spring. Larger numbers will result in a stiffer spring. 0 will be a zero-strength spring, so this constraint will work only as a damper.";
var(KAffector) const noexport float D "Sets the damping constant for this constraint. This number represents the amount of energy lost over time.";

// Export UKSpringDamper::execSetSpringSimulationMode(FFrame&, void* const)
native(1097) final function SetSpringSimulationMode(KSpringDamper.ESpringDamperSimulationMode NewSimulationMode)
{
	//native.NewSimulationMode;	
}

// Export UKSpringDamper::execSetSpringK(FFrame&, void* const)
native(1098) final function SetSpringK(float NewSpringK)
{
	//native.NewSpringK;	
}

// Export UKSpringDamper::execSetSpringD(FFrame&, void* const)
native(1099) final function SetSpringD(float NewSpringD)
{
	//native.NewSpringD;	
}

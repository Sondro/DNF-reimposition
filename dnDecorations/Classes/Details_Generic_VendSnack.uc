/*******************************************************************************
 * Details_Generic_VendSnack generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_VendSnack extends Snacks_Generic
	abstract
	collapsecategories;

function GrabComplete()
{
	super(InteractiveActor).GrabComplete();
	// End:0x1D
	if(__NFUN_340__(CarriedBy, none))
	{
		Consume(CarriedBy);
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(class'DukePlayer'.default.VoicePack, 'Consume');
	PrecacheIndex.__NFUN_1277__(class'DukePlayer'.default.VoicePack, 'Drunk_Hiccup');
	return;
}

defaultproperties
{
	DestroyedActivities=/* Array type was not detected. */
	MountParentTag=(Radius=/* Array type was not detected. */,ClampedOffsetFromMachine=4.741573E+30,LKcas_ColStatue_Leg_L=/* Array type was not detected. */,MountedCase=1.773959E+28,DA_Sound_dnControl_Turret_SuperTurret_Disengage=/* Array type was not detected. */,GarbageCanPlastic_cd=false,MIne=/* Unknown default property type! */,Electrical_Malfunction=/* Unknown default property type! */,waffle_gib2=false,GrabInfo=(bCanDuckWhileHeld=true,MountItemOverride=mount_handright,MountOrigin=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),MountAngles=(Pitch=8709,Yaw=571080704,Roll=0),Roll=0)
	LKcas_ColStatue_Leg_L=/* Array type was not detected. */
}
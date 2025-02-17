/*******************************************************************************
 * Biology_Generic_DestructiblePumpkin generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Biology_Generic_DestructiblePumpkin extends Biology_Generic
	collapsecategories;

var class<dnScreenSplatters> ScreenSplatterClass;
var bool bBroken;
var bool bPostNetInit;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		bBroken;
}

simulated function PostNetInitial()
{
	bPostNetInit = true;
	super(dnDecoration).PostNetInitial();
	return;
}

simulated function NU_Broken(bool broken)
{
	// End:0x27
	if(__NFUN_148__(__NFUN_148__(__NFUN_145__(bBroken), broken), bPostNetInit))
	{
		Destroyed();
	}
	return;
}

simulated event Destroyed()
{
	local dnScreenSplatters ScreenSplatter;

	ScreenSplatter = dnScreenSplatters(FindStaticActor(ScreenSplatterClass));
	// End:0x44
	if(__NFUN_340__(ScreenSplatter, none))
	{
		ScreenSplatter.__NFUN_645__(Location);
		ScreenSplatter.ExecuteEffect();
	}
	RemoveMountedActorListActors();
	bBroken = true;
	super(dnDecoration).Destroyed();
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(ScreenSplatterClass);
	return;
}

defaultproperties
{
	ScreenSplatterClass='dnScreenSplatter_Pumpkin'
	bAutoNavDoor_AutoToggle=true
	bSurviveDeath=true
	DestroyedActivities=/* Array type was not detected. */
	DestroyActionPointRadius=60
	HealthPrefab=5
	DamageTypesInstaKill=/* Array type was not detected. */
	bDisabled=/* Array type was not detected. */
	ObjectProperty=/* Unknown default property type! */
}
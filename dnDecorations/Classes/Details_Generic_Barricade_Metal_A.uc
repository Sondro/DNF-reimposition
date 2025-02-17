/*******************************************************************************
 * Details_Generic_Barricade_Metal_A generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_Barricade_Metal_A extends Details_Generic
	collapsecategories;

simulated event Destroyed()
{
	// End:0x0F
	if(__NFUN_340__(MountParent, none))
	{
		__NFUN_631__();
	}
	super(dnDecoration).Destroyed();
	return;
}

defaultproperties
{
	bSurviveDeath=true
	DestroyedActivities=/* Array type was not detected. */
	DestroyActionPointRadius=30
	HealthPrefab=5
	DamageIgnoreRules=/* Array type was not detected. */
	ObjectProperty=/* Unknown default property type! */
}
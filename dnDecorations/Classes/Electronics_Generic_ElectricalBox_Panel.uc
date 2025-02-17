/*******************************************************************************
 * Electronics_Generic_ElectricalBox_Panel generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_ElectricalBox_Panel extends Electronics_Generic
	abstract
	collapsecategories
	dependson(Electronics_Generic_ElectricalBox);

event Destroyed()
{
	local Electronics_Generic_ElectricalBox Box;

	super(dnDecoration).Destroyed();
	Box = Electronics_Generic_ElectricalBox(MountParent);
	// End:0x32
	if(__NFUN_340__(Box, none))
	{
		Box.CriticalDamage();
	}
	return;
}

defaultproperties
{
	bSurviveDeath=true
	DestroyedActivities=/* Array type was not detected. */
	radiansThisFrame=41025793
	Y=16843383
}
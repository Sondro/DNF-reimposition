/*******************************************************************************
 * Settings_Bathroom_ToiletPaper_Holder generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_Bathroom_ToiletPaper_Holder extends Settings_Bathroom
	collapsecategories;

event BeginPlay()
{
	ForceOneMountOnSpawn();
	super(dnDecoration).BeginPlay();
	return;
}

defaultproperties
{
	HealthPrefab=0
}
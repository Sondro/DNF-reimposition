/*******************************************************************************
 * DecoActivities_HealthChange generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DecoActivities_HealthChange extends DecoActivities
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport bool bForceDestroy "When true, will cause the decoration to be destroyed no matter how much health it has.";
var() noexport float HealthChange "Amount to modify the health of the decoration by.";
var() noexport class<DamageType> DamageType "Type of damage class to use when we take damage (negative HealthChange).";

defaultproperties
{
	DamageType='Engine.CrushingDamage'
}
/*******************************************************************************
 * dnControlQuestItem generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControlQuestItem extends dnQuestItem
	abstract;

var dnControl Control;
var class<dnControl> ControlClass;

simulated function bool CanFire()
{
	return false;
	return;
}

simulated function Fire(optional bool bContinueFire)
{
	return;
}

simulated function SetWeaponAnimState(name NewWeaponAnimState, optional bool bForceReset)
{
	return;
}

defaultproperties
{
	WeaponConfig='dnControlQuestItemWeaponConfig'
	ChargeDisplayType=0
}
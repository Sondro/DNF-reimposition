/*******************************************************************************
 * MP_Invincibility generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_Invincibility extends MP_Weapon;

simulated function PostBeginPlay()
{
	__NFUN_614__();
	return;
}

simulated function SetWeaponAnimState(name NewWeaponAnimState, optional bool bForceReset)
{
	return;
}

simulated function bool CanPickupLikeWeapon(class<Weapon> WeaponClass)
{
	return true;
	return;
}

defaultproperties
{
	WeaponConfig='MP_InvincibilityWeaponConfig'
	CommandAlias="UseWeapon dnGame.MP_Invincibility"
	InventoryReferenceClass='MP_Invincibility'
	PickupClass='MP_InvincibilityPickup'
}
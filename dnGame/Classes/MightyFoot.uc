/*******************************************************************************
 * MightyFoot generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MightyFoot extends Weapon;

simulated function Fire(optional bool bContinueFire)
{
	Melee();
	return;
}

simulated function string GetHUDAmmoDisplay()
{
	return "";
	return;
}

simulated function string GetHUDNumber()
{
	return "";
	return;
}

simulated event bool ShouldShowHoloDukeEffect()
{
	return false;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
	// End:0x33
	if(PrecacheIndex.__NFUN_1285__(self))
	{
		PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'fists_melee');
	}
	return;
}

defaultproperties
{
	WeaponConfig='MightyFootWeaponConfig'
	bActivatableByCategoryIteration=false
	bActivatableByGlobalIteration=false
	dnInventoryCategory=1
	dnCategoryPriority=1
	ChargeDisplayType=0
	CommandAlias="UseWeapon dnGame.MightyFoot"
	InventoryReferenceClass='MightyFoot'
	bIsDefaultWeapon=true
	AnimationControllerClass='dnAnimationControllerEx_MightyFoot'
	bCastStencilShadows=false
	bReplicateWhenOwnerSeen=true
	Mesh='c_dnWeapon.MightyFoot_Melee'
	Skins=/* Array type was not detected. */
}
/*******************************************************************************
 * MiniGun_BL generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MiniGun_BL extends MachineGun;

var() float BaseDamagePerShot;

simulated function bool IsCompletelyOutOfAmmo()
{
	return false;
	return;
}

simulated function bool IsOutOfLoadedAmmo()
{
	return false;
	return;
}

simulated event int GetLoadedAmmo()
{
	return 1;
	return;
}

simulated function int GetTotalAmmo()
{
	return 1;
	return;
}

simulated function float GetBaseFiringDamage()
{
	return BaseDamagePerShot;
	return;
}

simulated event float GetBaseDamage(Actor Victim, optional Pawn Instigator, optional class<DamageType> DamageType, optional Vector HitDirection, optional Vector HitLocation, optional name BoneName, optional Vector SourceTraceOrigin)
{
	return BaseDamagePerShot;
	return;
}

k2call simulated function Eject_Casing(optional EventInfo AnimEventInfo)
{
	return;
}

defaultproperties
{
	BaseDamagePerShot=1
	WeaponConfig='MiniGun_BLWeaponConfig'
	FullClipRenderObject=none
	EmptyClipRenderObject=none
	UserInsertClipMount=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	WeaponClipMount=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	dnInventoryCategory=1
	CommandAlias="UseWeapon dnGame.MiniGun_BL"
	InventoryReferenceClass='MiniGun_BL'
	PickupClass=none
	AutoRegisterIKClasses=/* Array type was not detected. */
}
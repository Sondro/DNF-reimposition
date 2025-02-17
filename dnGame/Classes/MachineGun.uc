/*******************************************************************************
 * MachineGun generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MachineGun extends dnContinuousFireWeapon;

var float BaseDamagePerShot;

simulated function float GetBaseFiringDamage()
{
	return __NFUN_195__(Instigator.TraceFireDamageMultiplier, BaseDamagePerShot);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	// End:0xCF
	if(PrecacheIndex.__NFUN_1285__(self))
	{
		PrecacheIndex.__NFUN_1269__(class'crosshair_ripper_fb');
		PrecacheIndex.__NFUN_1277__(VoicePack, 'Activate');
		PrecacheIndex.__NFUN_1277__(VoicePack, 'Deactivate');
		PrecacheIndex.__NFUN_1277__(VoicePack, 'ClipIn');
		PrecacheIndex.__NFUN_1277__(VoicePack, 'ClipOut');
		PrecacheIndex.__NFUN_1277__(VoicePack, 'Slide_Bck');
		PrecacheIndex.__NFUN_1277__(VoicePack, 'Slide_Fwd');
		PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'machinegun_melee');
	}
	return;
}

defaultproperties
{
	BaseDamagePerShot=9
	bFiringSoundForFireStart=true
	WeaponConfig='MachineGunWeaponConfig'
	AmmoLoaded=50
	HUDAmmoClipIcon=2
	DOFWeapDist=9
	DOFWeapDistDelta=2
	CrosshairIndex=6
	FullClipRenderObject='sm_class_dukeitems.Ripper_Ammo.ripper_clip_full'
	EmptyClipRenderObject='sm_class_dukeitems.Ripper_Ammo.ripper_clip_empty'
	UserInsertClipMount=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_handleft,MountOrigin=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	WeaponClipMount=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_magazine,MountOrigin=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	EmptyClipPhysMaterial='dnMaterial.dnPhysicsMaterial_EmptyClip'
	dnInventoryCategory=2
	dnCategoryPriority=2
	CommandAlias="UseWeapon dnGame.MachineGun"
	InventoryReferenceClass='MachineGun'
	PickupClass='MachineGunPickup'
	bIsPrimaryWeapon=true
	HUDPickupEventIcon=2
	AutoRegisterIKClasses=/* Array type was not detected. */
}
/*******************************************************************************
 * MP_Shrinkray generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_Shrinkray extends MP_Weapon;

var class<SoftParticleSystem> MuzzleFlashClass;
var SoftParticleSystem MuzzleFlashActor;
var bool bFirePreProjectile;
var SAmbientSoundInfo IdleAmbientSoundInfo;

replication
{
	// Pos:0x000
	reliable if(__NFUN_148__(__NFUN_173__(int(Role), int(ROLE_Authority)), __NFUN_145__(bNetOwner)))
		HandleMuzzleFlash;
}

event PostVerifySelf()
{
	super(RenderActor).PostVerifySelf();
	TurnOffMountedLights();
	return;
}

simulated function SetupWeaponSupportActors()
{
	super(Weapon).SetupWeaponSupportActors();
	// End:0x21
	if(__NFUN_340__(MuzzleFlashClass, none))
	{
		MuzzleFlashActor = __NFUN_615__(MuzzleFlashClass, self);
	}
	return;
}

simulated function DestroyWeaponSupportActors()
{
	super(Weapon).DestroyWeaponSupportActors();
	// End:0x1F
	if(__NFUN_340__(MuzzleFlashActor, none))
	{
		MuzzleFlashActor.__NFUN_614__();
	}
	return;
}

simulated function AttachSupportActors()
{
	super(Weapon).AttachSupportActors();
	// End:0x77
	if(__NFUN_340__(MuzzleFlashActor, none))
	{
		MuzzleFlashActor.MountType = 2;
		MuzzleFlashActor.MountMeshItem = WeaponConfig.default.MuzzleInfo[0].MuzzleBoneName;
		MuzzleFlashActor.__NFUN_635__(self);
		MuzzleFlashActor.TickStyle = MuzzleFlashActor.default.TickStyle;
	}
	return;
}

simulated function DetachSupportActors()
{
	super(Weapon).DetachSupportActors();
	// End:0x31
	if(__NFUN_340__(MuzzleFlashActor, none))
	{
		MuzzleFlashActor.__NFUN_631__();
		MuzzleFlashActor.TickStyle = 0;
	}
	return;
}

simulated function bool BringUp()
{
	TurnOnMountedLights();
	return super(Weapon).BringUp();
	return;
}

simulated function bool PutDown()
{
	TurnOffMountedLights();
	return super(Weapon).PutDown();
	return;
}

noexport simulated delegate HandleMuzzleFlash()
{
	// End:0x17
	if(__NFUN_340__(MuzzleFlashActor, none))
	{
		HandleParticleEffect(MuzzleFlashActor);
	}
	return;
}

simulated function Fire(optional bool bContinueFire)
{
	super.Fire(bContinueFire);
	bFirePreProjectile = true;
	HandleMuzzleFlash();
	return;
}

k2call simulated function Fire_Effects(optional EventInfo AnimEventInfo)
{
	bFirePreProjectile = false;
	super(Weapon).Fire_Effects(AnimEventInfo);
	return;
}

simulated event Projectile ProjectileFire(class<Projectile> ProjClass)
{
	ProjectileFirePool();
	return;
}

simulated function GetCurrentBarrelLocation(out Vector OutBarrelLocation, optional out Rotator OutBarrelRotation)
{
	super(Weapon).GetCurrentBarrelLocation(OutBarrelLocation, OutBarrelRotation);
	return;
}

final simulated function FireFadedOut()
{
	FindAndStopSound('Fire');
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1269__(class'crosshair_shrinkray_fb');
	PrecacheIndex.__NFUN_1266__(MuzzleFlashClass);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Activate');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Deactivate');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'idle');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Fire');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'shrinkray_melee');
	PrecacheIndex.__NFUN_1269__(class'Pawn'.default.ShrinkingMaterial);
	PrecacheIndex.__NFUN_1276__(class'Pawn'.default.ShrinkSound);
	PrecacheIndex.__NFUN_1276__(class'Pawn'.default.ExpandSound);
	PrecacheIndex.__NFUN_1266__(class'dnScreenSplatter_Blood');
	PrecacheIndex.__NFUN_1279__(class'ShrunkSmashDamage');
	PrecacheIndex.__NFUN_1277__(class'DukePlayer'.default.VoicePack, 'Stomp_Squish');
	PrecacheIndex.__NFUN_1277__(class'DukePlayer'.default.VoicePack, 'StompLines');
	return;
}

state() Firing
{
	event EndState()
	{
		// End:0x28
		if(bFirePreProjectile)
		{
			FindAndFadeSound('Fire', 0.25,,, 'FireFadedOut');
			bFirePreProjectile = false;
		}
		super.EndState();
		return;
	}
	stop;
}

state Activating
{
	simulated function EndState()
	{
		FindAndPlaySound('idle');
		super(Object).EndState();
		return;
	}
	stop;
}

state Deactivating
{
	simulated function BeginState()
	{
		__NFUN_701__(none);
		super.BeginState();
		return;
	}
	stop;
}

defaultproperties
{
	MuzzleFlashClass='p_Weapons.ShrinkRay_MuzzleFlash.ShrinkRay_MuzzleFlash_Spawner'
	PoolSize=3
	PoolLifeSpan=3
	WeaponConfig='MP_ShrinkrayWeaponConfig'
	AmmoLoaded=7
	HUDAmmoClipIcon=10
	DOFWeapDist=11.5
	DOFWeapDistDelta=2
	CrosshairIndex=8
	dnInventoryCategory=5
	dnCategoryPriority=1
	CommandAlias="UseWeapon dnGame.MP_ShrinkRay"
	InventoryReferenceClass='MP_Shrinkray'
	PickupClass='MP_ShrinkrayPickup'
	bIsPrimaryWeapon=true
	HUDPickupEventIcon=9
	MountOnSpawn=/* Array type was not detected. */
	AnimationName=/* Unknown default property type! */
	bSurviveDismount=false
	bDontScaleByDrawScale=false
	bScaleByDrawScaleNonDefault=false
	bTransformDrawScale3DChange=false
	bTakeParentTag=false
	bTransferToCorpse=false
	bDontSetOwner=false
	MountParentTag=None
	DrawScaleOverride=0
	AppendToTag=None
	ForceTag=None
	ForceEvent=None
	MountMeshItem=None
	MountOrigin=(X=1.292418E-41,Y=2.954472E-17,Z=-4.25)
	MountOriginVariance=(X=1.292418E-41,Y=2.94903E-17,Z=0)
	MountAngles=(Pitch=8741,Yaw=572915712,Roll=16384)
	MountAnglesVariance=(Pitch=8741,Yaw=572915712,Roll=0)
	MountType=0
	DismountPhysics=0
}
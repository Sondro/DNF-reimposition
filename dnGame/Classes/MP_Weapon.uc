/*******************************************************************************
 * MP_Weapon generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_Weapon extends Weapon
	abstract
	dependson(dnProjectile);

var array<Projectile> ProjectilePool;
var transient int PoolIndex;
var transient bool PoolMode;
var const int PoolSize;
var float PoolLifeSpan;
var bool bIsImpactFire;
var bool bIsNonChannel;
var SFireProjectile WeaponFireProjectile;

replication
{
	// Pos:0x000
	reliable if(__NFUN_148__(__NFUN_173__(int(Role), int(ROLE_Authority)), __NFUN_145__(bIsNonChannel)))
		ClientWeaponFireProjectile;

	// Pos:0x018
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		GiveClientAmmoAndForceReload;
}

simulated function PostFireProjectile(Projectile Proj)
{
	return;
}

simulated delegate ClientWeaponFireProjectile(SFireProjectile in_FireProjectile)
{
	local dnProjectile rocket;
	local int i, Index;
	local Vector SpawnLocation, Forward;
	local Rotator SpawnRotation;

	WeaponFireProjectile = in_FireProjectile;
	// End:0x16
	if(bIsNonChannel)
	{
		return;
	}
	rocket = dnProjectile(ProjectilePool[PoolIndex]);
	// End:0xA9
	if(__NFUN_145__(bIsImpactFire))
	{
		SpawnLocation = in_FireProjectile.Location;
		SpawnRotation.Roll = 0;
		SpawnRotation.Pitch = __NFUN_163__(in_FireProjectile.PitchYaw, 32768);
		SpawnRotation.Yaw = __NFUN_162__(2, __NFUN_166__(in_FireProjectile.PitchYaw, __NFUN_162__(32768, SpawnRotation.Pitch)));
		__NFUN_178__(SpawnRotation.Pitch, float(2));		
	}
	else
	{
		SpawnLocation = in_FireProjectile.Location;
	}
	rocket.TickStyle = 2;
	rocket.__NFUN_645__(SpawnLocation);
	rocket.__NFUN_652__(SpawnRotation);
	SetupProjectile(rocket);
	rocket.__NFUN_590__(false);
	rocket.__NFUN_621__(,, true);
	rocket.bExploded = false;
	rocket.bHasDeferredExplosion = false;
	rocket.MuzzleFireIndex = byte(MuzzleFireIndex);
	rocket.PoolLifeSpan = rocket.default.PoolLifeSpan;
	rocket.ExecutePostVerifySelf();
	rocket.SetHiddenMountedActor(false);
	rocket.MuteAmbientSound(false);
	// End:0x1B1
	if(__NFUN_145__(bIsImpactFire))
	{		
	}
	else
	{
		rocket.ExecuteExplode(SpawnLocation);
	}
	__NFUN_184__(PoolIndex);
	// End:0x1EB
	if(__NFUN_172__(PoolIndex, PoolSize))
	{
		PoolIndex = 0;
		PoolMode = true;
	}
	PostFireProjectile(rocket);
	return;
}

simulated function PostBeginPlay()
{
	local int i;

	super(ActivatableInventory).PostBeginPlay();
	PoolIndex = 0;
	// End:0x30
	if(__NFUN_145__(bIsNonChannel))
	{
		// End:0x2A
		if(bIsImpactFire)
		{
			CreateImpactProjectilePool();			
		}
		else
		{
			CreateProjectilePool();
		}
	}
	return;
}

simulated function CreateProjectilePool()
{
	local int i;

	// End:0x1B
	if(__NFUN_148__(__NFUN_174__(int(Role), int(ROLE_Authority)), bIsNonChannel))
	{
		return;
	}
	i = 0;
	J0x22:

	// End:0x55 [Loop If]
	if(__NFUN_169__(i, PoolSize))
	{
		ProjectilePool[ProjectilePool.Add(1)] = CreateProjectile(GetProjectileClass());
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x22;
	}
	return;
}

simulated function CreateImpactProjectilePool()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x3A [Loop If]
	if(__NFUN_169__(i, PoolSize))
	{
		ProjectilePool[ProjectilePool.Add(1)] = CreateProjectile(GetImpactProjectileClass());
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	return;
}

simulated function bool CanMelee()
{
	// End:0x2D
	if(__NFUN_148__(__NFUN_340__(Owner, none), __NFUN_173__(int(DukeMultiPlayer(Owner).LowerBodyOverrideState), int(3))))
	{
		return false;
	}
	return super.CanMelee();
	return;
}

simulated function OnDestroyed()
{
	local int i;
	local float Time;

	i = __NFUN_166__(string(ProjectilePool), 1);
	J0x0F:

	// End:0xCC [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0xAF
		if(__NFUN_174__(int(ProjectilePool[i].TickStyle), int(0)))
		{
			// End:0x69
			if(bIsNonChannel)
			{
				Time = dnProjectile(ProjectilePool[i]).FireProjectile.Time;				
			}
			else
			{
				Time = WeaponFireProjectile.Time;
			}
			ProjectilePool[i].LifeSpan = __NFUN_199__(PoolLifeSpan, __NFUN_199__(Level.TimeSeconds, Time));
			// [Explicit Continue]
			goto J0xC2;
		}
		ProjectilePool[i].__NFUN_614__();
		J0xC2:

		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x0F;
	}
	super.OnDestroyed();
	return;
}

simulated function Projectile CreateProjectile(class<Projectile> ProjClass)
{
	local Projectile SpawnedProjectile;

	SpawnedProjectile = __NFUN_615__(ProjClass,,, Location, Rotation,, WeaponConfig.default.bSkipProjectileFindSpot);
	SpawnedProjectile.LifeSpan = 0;
	SpawnedProjectile.TickStyle = 0;
	SetupProjectile(SpawnedProjectile);
	SpawnedProjectile.MuzzleFireIndex = byte(MuzzleFireIndex);
	return SpawnedProjectile;
	return;
}

simulated function bool CanFire()
{
	// End:0x30
	if(__NFUN_340__(DukeMultiPlayer(Owner), none))
	{
		// End:0x30
		if(__NFUN_174__(int(DukeMultiPlayer(Owner).FrozenState), int(0)))
		{
			return false;
		}
	}
	return super.CanFire();
	return;
}

simulated event DrawscaleChanged(float DefaultDrawscaleRatio, Vector DefaultDrawscale3DRatio)
{
	// End:0x3D
	if(__NFUN_340__(Owner, none))
	{
		// End:0x3D
		if(__NFUN_340__(DukeMultiPlayer(Owner), none))
		{
			// End:0x3D
			if(DukeMultiPlayer(Owner).bSpawnShrunk)
			{
				__NFUN_591__(0.25);
			}
		}
	}
	super(Actor).DrawscaleChanged(DefaultDrawscaleRatio, DefaultDrawscale3DRatio);
	return;
}

simulated function dnProjectile ProjectileFirePool(optional Vector NewLocation, optional bool bNoFailLocation)
{
	local dnProjectile rocket;
	local int i, Index;
	local Vector SpawnLocation, Forward;
	local Rotator SpawnRotation;

	rocket = dnProjectile(ProjectilePool[PoolIndex]);
	// End:0x78
	if(__NFUN_145__(bIsImpactFire))
	{
		Instigator.GetWeaponAim(SpawnLocation, Forward);
		// End:0x59
		if(WeaponConfig.default.bFireProjFromMuzzle)
		{
			GetCurrentBarrelLocation(SpawnLocation);
		}
		SpawnRotation = Rotator(Forward);
		AdjustProjectileSpawn(SpawnLocation, SpawnRotation);		
	}
	else
	{
		SpawnLocation = NewLocation;
	}
	rocket.TickStyle = 2;
	rocket.__NFUN_645__(SpawnLocation, bNoFailLocation);
	rocket.__NFUN_652__(SpawnRotation);
	// End:0x21E
	if(__NFUN_145__(bIsImpactFire))
	{
		// End:0x193
		if(bIsNonChannel)
		{
			rocket.FireProjectile.Time = Level.TimeSeconds;
			rocket.FireProjectile.Location = rocket.Location;
			rocket.FireProjectile.PitchYaw = __NFUN_165__(__NFUN_162__(__NFUN_175__(32767, __NFUN_163__(rocket.Rotation.Pitch, 2)), 32768), __NFUN_175__(32767, __NFUN_163__(rocket.Rotation.Yaw, 2)));
			rocket.ClientFireProjectile(rocket.FireProjectile);			
		}
		else
		{
			WeaponFireProjectile.Time = Level.TimeSeconds;
			WeaponFireProjectile.Location = rocket.Location;
			WeaponFireProjectile.PitchYaw = __NFUN_165__(__NFUN_162__(__NFUN_175__(32767, __NFUN_163__(rocket.Rotation.Pitch, 2)), 32768), __NFUN_175__(32767, __NFUN_163__(rocket.Rotation.Yaw, 2)));
			ClientWeaponFireProjectile(WeaponFireProjectile);
		}
	}
	SetupProjectile(rocket);
	rocket.__NFUN_590__(false);
	rocket.__NFUN_621__(,, true);
	rocket.bExploded = false;
	rocket.bHasDeferredExplosion = false;
	rocket.MuzzleFireIndex = byte(MuzzleFireIndex);
	rocket.PoolLifeSpan = rocket.default.PoolLifeSpan;
	rocket.ExecutePostVerifySelf();
	rocket.SetHiddenMountedActor(false);
	rocket.MuteAmbientSound(false);
	// End:0x2F0
	if(bIsImpactFire)
	{
		rocket.ExecuteExplode(SpawnLocation);
	}
	__NFUN_184__(PoolIndex);
	// End:0x315
	if(__NFUN_172__(PoolIndex, PoolSize))
	{
		PoolIndex = 0;
		PoolMode = true;
	}
	return rocket;
	return;
}

simulated function SetupProjectile(Projectile Proj)
{
	// End:0x0E
	if(__NFUN_339__(Proj, none))
	{
		return;
	}
	// End:0x43
	if(__NFUN_340__(Instigator, none))
	{
		DukeMultiPlayer(Instigator).ProjectileFire(Proj.Class, Proj);
	}
	Proj.Instigator = Instigator;
	return;
}

simulated function Fire(optional bool bContinousFire)
{
	super.Fire(bContinousFire);
	// End:0x2E
	if(__NFUN_340__(Owner, none))
	{
		DukeMultiPlayer(Owner).WeaponFire(self);
	}
	return;
}

simulated event Projectile ProjectileFire(class<Projectile> ProjClass)
{
	local Projectile P;

	P = super.ProjectileFire(ProjClass);
	DukeMultiPlayer(Owner).ProjectileFire(ProjClass, P);
	return P;
	return;
}

simulated function NotifyHoloDukeStart()
{
	return;
}

simulated function NotifyHoloDukeEnd()
{
	return;
}

simulated function Actor GetIgnoreMeleeActor(Actor defaultIgnore)
{
	local ActivatableInventory Jetpack;

	Jetpack = ActivatableInventory(DukeMultiPlayer(Owner).__NFUN_918__('MP_Jetpack'));
	// End:0x34
	if(__NFUN_340__(Jetpack, none))
	{
		return Jetpack;
	}
	return defaultIgnore;
	return;
}

function float PickedUpAdditionalCopyCustom(Pawn Other, class<Inventory> InvClass, Pickup Source)
{
	local float AmmoChargeBefore;

	AmmoChargeBefore = Ammo.Charge;
	// End:0x5A
	if(__NFUN_148__(__NFUN_340__(Source, none), __NFUN_174__(Source.AmmoCharge, 0)))
	{
		Ammo.AddAmmo(Source.AmmoCharge);		
	}
	else
	{
		Ammo.AddAmmo(int(Ammo.MaxCharge));
	}
	// End:0x104
	if(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_148__(bIsPrimaryWeapon, Other.bIsPlayerPawn), __NFUN_145__(PlayerPawn(Other).bOnSteroids)), __NFUN_204__(AmmoChargeBefore, float(0))), __NFUN_340__(Other.Weapon, none)), __NFUN_145__(Other.Weapon.bIsPrimaryWeapon)))
	{
		ClientMaybeWeaponSwitch();		
	}
	else
	{
		// End:0x173
		if(__NFUN_148__(__NFUN_148__(bIsPrimaryWeapon, __NFUN_339__(Other.Weapon, self)), __NFUN_204__(AmmoChargeBefore, float(0))))
		{
			// End:0x15E
			if(Other.IsLocallyControlled())
			{
				Pawn(Owner).Reload();				
			}
			else
			{
				GiveClientAmmoAndForceReload(Ammo.Charge);
			}
		}
	}
	return __NFUN_199__(Ammo.Charge, AmmoChargeBefore);
	return;
}

simulated function GiveClientAmmoAndForceReload(float newcharge)
{
	Ammo.Charge = newcharge;
	Pawn(Owner).Reload();
	return;
}

simulated event float GetBaseDamage(Actor Victim, optional Pawn DamageInstigator, optional class<DamageType> DamageType, optional Vector HitDirection, optional Vector HitPosition, optional name BoneName, optional Vector SourceTraceOrigin)
{
	return __NFUN_195__(GetTraceFireDamageScale(DamageInstigator, DamageType), super.GetBaseDamage(Victim, DamageInstigator, DamageType, HitDirection, HitPosition, BoneName, SourceTraceOrigin));
	return;
}

simulated function float GetTraceFireDamageScale(Pawn DamageInstigator, class<DamageType> aDamageType)
{
	// End:0x4B
	if(__NFUN_148__(__NFUN_145__(DamageInstigator.bSpawnShrunk), aDamageType.default.bIsTraceDamageType))
	{
		return __NFUN_196__(DamageInstigator.DrawScale, DamageInstigator.default.DrawScale);
	}
	return 1;
	return;
}

state Firing
{
	k2call simulated function WeaponCallback_MaybeDoneFiring()
	{
		// End:0x53
		if(__NFUN_148__(__NFUN_148__(__NFUN_340__(Owner, none), Owner.bIsPlayerPawn), PlayerPawn(Owner).IsFrozen()))
		{
			StopWeaponViewKick(PlayerPawn(Owner));
			WeaponCallback_DefinitelyDoneFiring();
			return;
		}
		super.WeaponCallback_MaybeDoneFiring();
		return;
	}
	stop;
}

defaultproperties
{
	bUseHitEffectOverrides=true
	FireHitEffectSystemSizeScaleScale=1.5
	FireHitEffectFakeLightIntensityOverride=10
	FireHitEffectLifetimeScale=0.75
	bCastStencilShadows=false
}
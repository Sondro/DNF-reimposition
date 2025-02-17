/*******************************************************************************
 * MP_DualPistol generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_DualPistol extends PistolBase;

var() travel class<DualPistolDummy> SecondPistolClass;
var travel DualPistolDummy SecondPistol;
var() travel SPistolInfo PistolInfo[2];
var travel bool bSecondPistolHadMoreAmmo;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		SecondPistol;
}

static event GiveToAI(Pawn Other)
{
	local class<Weapon> PistolClass;

	// End:0x0E
	if(__NFUN_339__(Other, none))
	{
		return;
	}
	PistolClass = Other.GetPistolClass();
	// End:0x32
	if(__NFUN_339__(PistolClass, none))
	{
		return;
	}
	Other.Level.Game.GiveInventoryTo(Other, PistolClass, true);
	Other.Level.Game.GiveInventoryTo(Other, PistolClass, true);
	return;
}

event ApplyAIScale(Pawn Other)
{
	super(Weapon).ApplyAIScale(Other);
	// End:0x44
	if(__NFUN_340__(SecondPistol, none))
	{
		SecondPistol.__NFUN_591__(__NFUN_195__(SecondPistol.DrawScale, Other.DrawScale));
	}
	return;
}

k2call simulated function SpawnClip()
{
	return;
}

simulated function bool CanActivate()
{
	return false;
	return;
}

simulated function bool CanActivateNow()
{
	return false;
	return;
}

event DrawscaleChanged(float DefaultDrawscaleRatio, Vector DefaultDrawscale3DRatio)
{
	super(Actor).DrawscaleChanged(DefaultDrawscaleRatio, DefaultDrawscale3DRatio);
	// End:0x33
	if(__NFUN_340__(SecondPistol, none))
	{
		SecondPistol.__NFUN_593__(DrawScale, DrawScale3D);
	}
	return;
}

simulated function DestroyWeaponSupportActors()
{
	super(Weapon).DestroyWeaponSupportActors();
	// End:0x1F
	if(__NFUN_340__(SecondPistol, none))
	{
		SecondPistol.__NFUN_614__();
	}
	return;
}

simulated event UnhideWeapon()
{
	super(Weapon).UnhideWeapon();
	// End:0x20
	if(__NFUN_340__(SecondPistol, none))
	{
		SecondPistol.__NFUN_590__(false);
	}
	return;
}

simulated function HideWeapon()
{
	super(Weapon).HideWeapon();
	// End:0x20
	if(__NFUN_340__(SecondPistol, none))
	{
		SecondPistol.__NFUN_590__(true);
	}
	return;
}

simulated function AttachSupportActors()
{
	super(Weapon).AttachSupportActors();
	// End:0x24
	if(__NFUN_340__(SecondPistol, none))
	{
		SecondPistol.__NFUN_635__(Instigator);
	}
	// End:0x6B
	if(__NFUN_174__(string(MuzzleFlashActors), 2))
	{
		Warn("dual pistol setup with incorrect number of muzzles");
	}
	MuzzleFlashActors[0].__NFUN_635__(SecondPistol);
	return;
}

simulated function DetachSupportActors()
{
	super(Weapon).DetachSupportActors();
	// End:0x1F
	if(__NFUN_340__(SecondPistol, none))
	{
		SecondPistol.__NFUN_631__();
	}
	return;
}

k2call simulated function Fire_Effects(optional EventInfo AnimEventInfo)
{
	super(Weapon).Fire_Effects(AnimEventInfo);
	UpdateBullets(PistolInfo[MuzzleFireIndex]);
	return;
}

simulated function GetCurrentBarrelLocation(out Vector OutBarrelLocation, optional out Rotator OutBarrelRotation)
{
	local name MuzzleBoneName;

	// End:0x86
	if(__NFUN_148__(__NFUN_173__(MuzzleFireIndex, 1), __NFUN_340__(SecondPistol.__NFUN_568__(), none)))
	{
		MuzzleBoneName = WeaponConfig.default.MuzzleInfo[MuzzleFireIndex].MuzzleBoneName;
		OutBarrelLocation = SecondPistol.__NFUN_568__().__NFUN_533__(MuzzleBoneName, true);
		OutBarrelRotation = SecondPistol.__NFUN_568__().__NFUN_534__(MuzzleBoneName, true);		
	}
	else
	{
		super(Weapon).GetCurrentBarrelLocation(OutBarrelLocation, OutBarrelRotation);
	}
	return;
}

simulated function GetCurrentShellEjectionLocation(out Vector OutEjectionLocation, out Rotator OutEjectionRotation)
{
	local name ShellEjectionBoneName;

	// End:0xB2
	if(__NFUN_148__(__NFUN_173__(MuzzleFireIndex, 0), __NFUN_340__(SecondPistol.__NFUN_568__(), none)))
	{
		ShellEjectionBoneName = WeaponConfig.default.MuzzleInfo[MuzzleFireIndex].ShellEjectionBoneName;
		__NFUN_354__(__NFUN_342__(ShellEjectionBoneName, 'None'), "No shell ejection bone set");
		OutEjectionLocation = SecondPistol.__NFUN_568__().__NFUN_533__(ShellEjectionBoneName, true);
		OutEjectionRotation = SecondPistol.__NFUN_568__().__NFUN_534__(ShellEjectionBoneName, true);		
	}
	else
	{
		__NFUN_1072__(OutEjectionLocation, OutEjectionRotation);
	}
	return;
}

simulated function SetWeaponAnimState(name NewWeaponAnimState, optional bool bForceReset)
{
	super(Weapon).SetWeaponAnimState(NewWeaponAnimState);
	// End:0x44
	if(__NFUN_148__(__NFUN_340__(SecondPistol, none), __NFUN_342__(NewWeaponAnimState, 'None')))
	{
		SecondPistol.SetAnimControllerState(NewWeaponAnimState, bForceReset);
	}
	return;
}

simulated function StartActivate()
{
	local int BulletsInClips[2];

	super(ActivatableInventory).StartActivate();
	// End:0x5D
	if(__NFUN_174__(PistolInfo[0].MaxBulletsInClip, PistolInfo[1].MaxBulletsInClip))
	{
		Warn("pistol logic won't work with differing clip sizing");
	}
	BulletsInClips[1] = __NFUN_163__(AmmoLoaded, 2);
	// End:0x90
	if(__NFUN_148__(bSecondPistolHadMoreAmmo, __NFUN_173__(__NFUN_175__(AmmoLoaded, 1), 1)))
	{
		__NFUN_184__(BulletsInClips[1]);
	}
	BulletsInClips[0] = __NFUN_166__(AmmoLoaded, BulletsInClips[1]);
	PistolInfo[0].BulletsFired = __NFUN_166__(PistolInfo[0].MaxBulletsInClip, BulletsInClips[0]);
	PistolInfo[1].BulletsFired = __NFUN_166__(PistolInfo[1].MaxBulletsInClip, BulletsInClips[1]);
	return;
}

simulated function int CalculateReservedAmmo()
{
	bSecondPistolHadMoreAmmo = __NFUN_170__(PistolInfo[1].MaxBulletsInClip, PistolInfo[0].MaxBulletsInClip);
	return __NFUN_165__(PistolInfo[0].MaxBulletsInClip, PistolInfo[1].MaxBulletsInClip);
	return;
}

function SetupDualPistol(class<Inventory> InvClass, MP_Pistol SinglePistol)
{
	local class<DualPistolDummy> DualPistolDummyClass;
	local int i;

	__NFUN_595__(SinglePistol.Mesh);
	__NFUN_591__(SinglePistol.DrawScale);
	i = __NFUN_166__(SinglePistol.__NFUN_743__(), 1);
	J0x3A:

	// End:0x69 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		__NFUN_741__(i, SinglePistol.__NFUN_740__(i));
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x3A;
	}
	DualPistolDummyClass = SecondPistolClass;
	// End:0x8B
	if(__NFUN_339__(DualPistolDummyClass, none))
	{
		SecondPistolClass = class'DualPistolDummy';
	}
	SecondPistol = __NFUN_615__(SecondPistolClass, Owner);
	// End:0xC9
	if(__NFUN_339__(InvClass.default.Mesh, none))
	{
		SecondPistol.__NFUN_595__(Mesh);		
	}
	else
	{
		SecondPistol.__NFUN_595__(InvClass.default.Mesh);
	}
	// End:0x14D
	if(__NFUN_170__(string(InvClass.default.Skins), 0))
	{
		i = 0;
		J0x102:

		// End:0x14D [Loop If]
		if(__NFUN_169__(i, string(InvClass.default.Skins)))
		{
			SecondPistol.__NFUN_741__(i, InvClass.default.Skins[i]);
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0x102;
		}
	}
	SecondPistol.bTravel = true;
	SecondPistol.__NFUN_591__(SinglePistol.DrawScale);
	PistolInfo[0].PistolActor = self;
	PistolInfo[1].PistolActor = SecondPistol;
	return;
}

function DualPistolSpawnPickup(KarmaActor PistolActor, int AmmoCharge, optional float OverrideDrawScale)
{
	// End:0x3F
	if(__NFUN_339__(PistolActor.__NFUN_740__(0), PistolActor.__NFUN_742__(0)))
	{
		SpawnPickupFor(class'Pistol_Gold', AmmoCharge, PistolActor, OverrideDrawScale);		
	}
	else
	{
		SpawnPickupFor(class'Pistol', AmmoCharge, PistolActor, OverrideDrawScale);
	}
	return;
}

function Pickup SpawnPickupForWeapon(optional float OverrideDrawScale, optional bool bNoPawnInteractions)
{
	DualPistolSpawnPickup(self, __NFUN_163__(AmmoLoaded, 2), OverrideDrawScale);
	DualPistolSpawnPickup(SecondPistol, __NFUN_166__(AmmoLoaded, __NFUN_163__(AmmoLoaded, 2)), OverrideDrawScale);
	return none;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(class'DualPistolDummy');
	return;
}

defaultproperties
{
	SecondPistolClass='DualPistolDummy'
	PistolInfo[0]=(PistolActor=none,BulletsFired=0,MaxBulletsInClip=15,MaxBulletsInChamber=8)
	PistolInfo[1]=(PistolActor=none,BulletsFired=0,MaxBulletsInClip=15,MaxBulletsInChamber=8)
	BaseDamagePerShot=6
	WeaponConfig='MP_DualPistolWeaponConfig'
	AmmoLoaded=30
	dnInventoryCategory=1
	dnCategoryPriority=1
	CommandAlias="UseWeapon dnGame.MP_DualPistol"
	InventoryReferenceClass='MP_PistolBase'
	HUDPickupEventIcon=0
	AnimationControllerClass='dnAnimationControllerEx_DualPistol_Primary'
	Mesh='c_dnWeapon.Pistol'
	Skins=/* Array type was not detected. */
}
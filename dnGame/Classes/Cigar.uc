/*******************************************************************************
 * Cigar generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Cigar extends dnActivateUsedWeapon;

var Vector DesiredMountPosition;
var Rotator DesiredMountAngles;

function bool CanActivateNow()
{
	// End:0x1F
	if(__NFUN_340__(Instigator.FindMountedActor(, class'CigarAttachment'), none))
	{
		return false;
	}
	return super(Weapon).CanActivateNow();
	return;
}

simulated function name GetWeaponAnimReq(byte WeaponStateReq, optional out byte byForceReset)
{
	// End:0x17
	if(__NFUN_173__(int(WeaponStateReq), int(1)))
	{
		return 'CigarActivate';		
	}
	else
	{
		// End:0x2B
		if(__NFUN_173__(int(WeaponStateReq), int(2)))
		{
			return 'CigarDeactivate';
		}
	}
	return super(Weapon).GetWeaponAnimReq(WeaponStateReq, byForceReset);
	return;
}

k2call simulated function ActivateItem()
{
	local CigarAttachment MountedCigar;

	__NFUN_590__(true);
	// End:0x14
	if(__NFUN_169__(int(Role), int(ROLE_Authority)))
	{
		return;
	}
	MountedCigar = __NFUN_615__(class'CigarAttachment',, 'CigarAttachment', Location, Rotation);
	// End:0x40
	if(__NFUN_339__(MountedCigar, none))
	{
		return;
	}
	MountedCigar.MountType = 4;
	MountedCigar.__NFUN_635__(Instigator,,, true);
	MountedCigar.DestroyOnDismount = true;
	MountedCigar.MakePawnPuff(Instigator);
	// End:0xC0
	if(__NFUN_243__(MountedCigar.MountOrigin, DesiredMountPosition))
	{
		MountedCigar.__NFUN_649__(DesiredMountPosition,,, 0.25);
	}
	// End:0xF3
	if(__NFUN_272__(MountedCigar.MountAngles, DesiredMountAngles))
	{
		MountedCigar.__NFUN_663__(DesiredMountAngles, 0, 0.25);
	}
	return;
}

simulated function float GetClipPCT()
{
	return 1;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(class'CigarAttachment');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Activate');
	PrecacheIndex.__NFUN_1277__(class'DukePlayer'.default.VoicePack, 'Cig_Exhale');
	return;
}

state Activating
{
	simulated function BeginState()
	{
		bDeactivationAllowed = false;
		super.BeginState();
		// End:0x28
		if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		{
			__NFUN_210__(Charge, 1);
		}
		return;
	}
	stop;
}

state ActivateComplete
{
	simulated event BeginState()
	{
		bDeactivationAllowed = true;
		super.BeginState();
		return;
	}
	stop;
}

defaultproperties
{
	DesiredMountPosition=(X=0.01111699,Y=2.954406E-17,Z=1.229101)
	DesiredMountAngles=(Pitch=-99016155,Yaw=572981247,Roll=-30015)
	bQuickChangeTo=true
	bDrawLastWeaponHUD=true
	WeaponConfig='CigarWeaponConfig'
	CommandAlias="UseWeapon dnGame.Cigar"
	InventoryReferenceClass='Cigar'
	PickupClass='CigarPickup'
	Charge=1
	MaxCharge=1
	AutoRegisterIKClasses=/* Array type was not detected. */
}
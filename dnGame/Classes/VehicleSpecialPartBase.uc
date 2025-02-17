/*******************************************************************************
 * VehicleSpecialPartBase generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class VehicleSpecialPartBase extends dnDecoration
	abstract
	native
	collapsecategories;

cpptext
{
// Stripped
}

var() noexport bool bForwardUseCalls "If true, will forward all attempts to use this object onto the vehicle that it's attached to.";
var bool bVehiclePartRequiresUpdate;
var VehicleBase ParentVehicle;
var bool PassDamageToOwner;
var bool bDontCastShadowFromVehicleLights;

event Used(Actor Other, Pawn EventInstigator)
{
	super.Used(Other, EventInstigator);
	// End:0x41
	if(__NFUN_148__(bForwardUseCalls, __NFUN_340__(ParentVehicle, none)))
	{
		ParentVehicle.Used(Other, EventInstigator);
	}
	return;
}

simulated function DriverChange(Pawn NewDriver)
{
	// End:0x1C
	if(__NFUN_339__(NewDriver, none))
	{
		DecoActivity(0, 'DriverLeft');		
	}
	else
	{
		DecoActivity(0, 'DriverEntered');
	}
	return;
}

simulated event VehicleSpecialPartUpdate()
{
	return;
}

simulated event Spawned()
{
	super(Actor).Spawned();
	// End:0x61
	if(__NFUN_145__(AttachToVehicle(VehicleBase(Owner))))
	{
		BroadcastLog(__NFUN_302__(__NFUN_302__(__NFUN_302__(string(self), ".Spawned(): could not attach to vehicle '"), string(Owner)), "'."));
	}
	return;
}

simulated function bool AttachToVehicle(VehicleBase Vehicle)
{
	// End:0x63
	if(__NFUN_340__(ParentVehicle, none))
	{
		BroadcastLog(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(string(self), ".AttachToVehicle( "), string(Vehicle)), " ): previously attached to "), string(ParentVehicle)), "!"));
	}
	ParentVehicle = Vehicle;
	return true;
	return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	super.TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	// End:0x73
	if(__NFUN_148__(__NFUN_340__(Owner, none), PassDamageToOwner))
	{
		Owner.TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	}
	return;
}

defaultproperties
{
	bMimicOwner=true
	bPassUseToOwner=true
	bCollisionAssumeValid=true
	bBlockPlayers=false
	bNoNativeTick=true
	bTickOnlyRecent=false
	bTickOnlyZoneRecent=false
	bTickOnlyWhenOwnerShould=true
}
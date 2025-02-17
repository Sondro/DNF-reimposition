/*******************************************************************************
 * Vehicles_Deco_Parts generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Vehicles_Deco_Parts extends Vehicles_Deco;

var noexport bool bHasBatteryDeath "True if this part does something special during battery death.";
var bool bCarAlarmState;
var bool bCanBlowOff;
var bool bDestroyOnExplosion;
var Vehicles_Deco_Bodies Vehicle;

function PostVerifySelf()
{
	local StaticMesh Mesh;

	super(dnDecoration).PostVerifySelf();
	Mesh = StaticMesh(__NFUN_596__());
	__NFUN_595__(BurntMesh);
	__NFUN_595__(Mesh);
	return;
}

function CopyOwnerProperties()
{
	local int i;

	super(Actor).CopyOwnerProperties();
	ActorColorList.Empty();
	i = __NFUN_166__(string(Owner.ActorColorList), 1);
	J0x25:

	// End:0x52 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		__NFUN_602__(Owner.ActorColorList[i]);
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x25;
	}
	return;
}

function AttachToVehicle(Vehicles_Deco_Bodies NewVehicle)
{
	Vehicle = NewVehicle;
	return;
}

function DetachFromVehicle()
{
	return;
}

function ScheduleExplode(int Delay)
{
	__NFUN_607__(__NFUN_195__(float(Delay), 0.0333), false, 'Explode');
	return;
}

function Explode()
{
	// End:0x0E
	if(bDestroyOnExplosion)
	{
		__NFUN_614__();
		return;
	}
	SwitchToBurntMesh();
	return;
}

function SwitchToBurntMesh()
{
	// End:0x14
	if(__NFUN_340__(BurntMesh, none))
	{
		__NFUN_595__(BurntMesh);
	}
	return;
}

event HiddenChanged()
{
	local Actor A;

	super(Actor).HiddenChanged();
	// End:0x2A
	foreach __NFUN_753__(class'Actor', A)
	{
		A.__NFUN_590__(bHidden);		
	}	
	return;
}

function UpdateBatteryDeath(float Scalar)
{
	return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	super(dnDecoration).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	// End:0x43
	if(__NFUN_201__(ThisFrameDamage.Damage, 0))
	{
		TryStartAlarm();
	}
	return;
}

final function TryStartAlarm()
{
	// End:0x31
	if(__NFUN_148__(__NFUN_340__(Vehicle, none), __NFUN_339__(Owner, Vehicle)))
	{
		Vehicle.super(Vehicles_Deco_Parts).TryStartAlarm();		
	}
	else
	{
		// End:0x57
		if(__NFUN_340__(Vehicles_Deco_Parts(Owner), none))
		{
			Vehicles_Deco_Parts(Owner).super(Vehicles_Deco_Parts).TryStartAlarm();
		}
	}
	return;
}

final function ToggleAlarmState()
{
	bCarAlarmState = __NFUN_145__(bCarAlarmState);
	// End:0x21
	if(bCarAlarmState)
	{
		TriggerFunc_PowerOn();		
	}
	else
	{
		TriggerFunc_PowerOff();
	}
	return;
}

defaultproperties
{
	bBlockAI=true
	CollisionRadius=0
	CollisionHeight=0
}
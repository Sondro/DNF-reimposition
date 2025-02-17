/*******************************************************************************
 * Vehicles_Deco_Parts_Karma generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Vehicles_Deco_Parts_Karma extends Vehicles_Deco_Parts
	collapsecategories;

var() class<SoftParticleSystem> FireParticleClass;
var SoftParticleSystem Fire;
var() Vector FireOffset;
var() float BurnTime;
var() float BurnTimeVariance;

function PostVerifySelf()
{
	super.PostVerifySelf();
	return;
}

event PhysicsChange(optional Engine.Object.EPhysics PreviousPhysics)
{
	super(KarmaActor).PhysicsChange(PreviousPhysics);
	// End:0x2A
	if(__NFUN_148__(__NFUN_173__(int(Physics), int(18)), __NFUN_340__(MountParent, none)))
	{
		__NFUN_631__();
	}
	return;
}

function DetachFromVehicle()
{
	local int i;

	super.DetachFromVehicle();
	AutoConstraints.Empty();
	i = __NFUN_166__(__NFUN_806__(), 1);
	J0x18:

	// End:0x3D [Loop If]
	if(__NFUN_172__(i, 0))
	{
		__NFUN_807__(i).__NFUN_614__();
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x18;
	}
	__NFUN_816__('VehiclesDecoGroup');
	return;
}

function Explode()
{
	local Vector Direction;

	super.Explode();
	// End:0x11A
	if(__NFUN_148__(bCanBlowOff, __NFUN_150__(bCriticalDamage, __NFUN_173__(__NFUN_164__(__NFUN_187__(24), 3), 0))))
	{
		__NFUN_642__(18);
		Direction = __NFUN_239__(Location, Vehicle.Location);
		__NFUN_209__(Direction.Z, 100);
		// End:0x7D
		if(__NFUN_148__(__NFUN_340__(MountParent, none), __NFUN_339__(MountParent, Vehicle)))
		{
			__NFUN_631__();
		}
		DetachFromVehicle();
		__NFUN_820__(__NFUN_234__(Direction, float(1500)), Location);
		__NFUN_791__(__NFUN_234__(__NFUN_234__(__NFUN_253__(__NFUN_255__()), __NFUN_223__(2, 6)), 3.141593));
		FindAndPlaySound('OnFire', 1);
		Fire = __NFUN_615__(FireParticleClass,,, __NFUN_238__(__NFUN_241__(FireOffset, Rotation), Location));
		Fire.MountType = 0;
		Fire.__NFUN_635__(self, false, false, true);
		__NFUN_607__(__NFUN_226__(BurnTime, BurnTimeVariance), false, 'EndFire');
	}
	__NFUN_621__(false, false, false, true, false);
	return;
}

function EndFire()
{
	__NFUN_701__(none);
	// End:0x34
	if(__NFUN_340__(Fire, none))
	{
		Fire.Enabled = false;
		Fire.DestroyWhenEmpty = true;
	}
	return;
}

function KarmaSetConstraintProperties(KConstraint ConstraintActor)
{
	super(KarmaActor).KarmaSetConstraintProperties(ConstraintActor);
	ConstraintActor.KConstraintActor2 = KarmaActor(Owner);
	return;
}

function Destroyed()
{
	// End:0x2E
	if(__NFUN_148__(__NFUN_148__(__NFUN_145__(bCriticalDamage), __NFUN_340__(MountParent, none)), __NFUN_339__(MountParent, Vehicle)))
	{
		__NFUN_631__();
	}
	EndFire();
	super(dnDecoration).Destroyed();
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(Vehicles_Deco).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'OnFire');
	PrecacheIndex.__NFUN_1266__(FireParticleClass);
	return;
}

defaultproperties
{
	FireParticleClass='p_Decorations.Car_Fire.Car_Fire_Main'
	BurnTime=10
	BurnTimeVariance=3
	bSurviveDeath=true
	DestroyedActivities=/* Array type was not detected. */
	bTickOnlyWhenPhysicsAwake=true
	PhysicsSoundOverrides=/* Array type was not detected. */
	OtherMaterialTypes=/* Array type was not detected. */
}
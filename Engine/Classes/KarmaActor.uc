/*******************************************************************************
 * KarmaActor generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KarmaActor extends Actor
	abstract
	native
	collapsecategories
	notplaceable
	dependson(KConstraint)
	dependson(PhysicsVolume)
	dependson(LevelInfo);

enum EStaticInteractionClassification
{
	KSINTERACTIONCLASS_Default,
	KSINTERACTIONCLASS_ForceDynamic,
	KSINTERACTIONCLASS_OnlyPawns,
	KSINTERACTIONCLASS_EverythingButPawns,
	KSINTERACTIONCLASS_OnlyVehicles,
	KSINTERACTIONCLASS_OnlyPlayerPawns,
	KSINTERACTIONCLASS_StaticPawn,
	KSINTERACTIONCLASS_OnlyPawnsAndDrivenVehicles,
	KSINTERACTIONCLASS_OnlyNonPlayerPawns
};

enum EDynamicInteractionClassification
{
	KDINTERACTIONCLASS_Default,
	KDINTERACTIONCLASS_NoPawnInteractions,
	KDINTERACTIONCLASS_HighDetail,
	KDINTERACTIONCLASS_DynamicPawn,
	KDINTERACTIONCLASS_Vehicle,
	KDINTERACTIONCLASS_DynamicPlayerPawn,
	KDINTERACTIONCLASS_DrivenVehicle,
	KDINTERACTIONCLASS_NoFullSizePawnInteractions,
	KDINTERACTIONCLASS_NoInteractions,
	KDINTERACTIONCLASS_OnlyPawns,
	KDINTERACTIONCLASS_OnlyStaticNonPawns
};

struct SKarmaInteraction
{
	var KarmaActor Actor;
	var name BoneName;
};

struct MeqonRigidBodyNetworkState
{
	var() int Timestamp;
	var() float LocX;
	var() float LocY;
	var() float LocZ;
	var() byte StateFlags;
	var() byte PitchA;
	var() byte PitchB;
	var() byte YawA;
	var() byte YawB;
	var() byte RollA;
	var() byte RollB;
	var() float VelX;
	var() float VelY;
	var() float VelZ;
	var() float AngX;
	var() float AngY;
	var() float AngZ;
};

struct SPhysicsWaterInteraction
{
	var Vector Location;
	var Vector Velocity;
};

struct SPhysicsSoundOverride
{
	var() noexport Object.EPhysicsImpactType SoundType "Acceptable types are PHYSIMPACT_Crash, PHYSIMPACT_Roll, and PHYSIMPACT_Slide";
	var() noexport array< class<PhysicsMaterial> > OtherMaterialTypes "Acceptable other material types.  Leave empty to accept all types.";
	var() noexport array<Object.EPhysicsMassType> OtherMassTypes "Acceptable other mass types.  Leave empty to accept all types.";
	var() noexport array<Sound> Sounds "List of sounds we could play.";
	var() noexport SPhysicsEffectSoundInfo SoundInfo "Input range for velocity, output ranges for pitch and volume.";
	var() noexport bool bDisableSoundInWater "If true, this sound won't play in water.";
};

var const transient bool bDirtyPhysics;
var transient bool bGearboxEngineGlobalReference;
var bool bIsDeferredJumpPadLaunch;
var(Karma) const noexport bool bResetOnFellOutOfWorld "If true, this Actor will restore its last position when it falls out of the world.";
var(Karma) const bool bClientSidePhysics;
var(Karma) noexport bool bPawnRideable "If true, pawns will be able to ride around on this object as it was sticky, like non-physics movers. This will not affect the pawn's [view]rotation.";
var(movement) noexport bool bModifyTickOnPhysicsChange "When the Physics type of the actor changes, auto-modify the TickStyle to the most common style. Working moving styles = TICK_Normal, Non working or Non Moving = TICK_Never";
var(Karma) noexport bool bIgnoresAmmoCasings "The actor will not collide with ammo casings";
var(Karma) noexport bool bTakeDamageMomentum "Does this object take momentum from being hit by trace fire and radius damage?";
var(Karma) noexport bool bTakeExplosionDamageMomentum "Does this object take momentum from being hit by radius damage even if it ignores trace fire?";
var(Karma) noexport bool bStartEnabled "Start simulation of this object on level load?";
var(Karma) const noexport bool bHighInertia "Artificially inflate the inertia of this object. This will result in \"heavier\"-looking motion and will help out certain effects such as high friction. (Note: only works on staticmeshes.)";
var(Karma) noexport bool bCanBreakGlass "Can this actor break sheets of glass if it impacts with enough energy? (If not, collisions with the glass will still be valid, but won't result in breakage.)";
var(Karma) noexport bool bIgnorePawnAirCushion "If true, when this object enter's a pawn's aircloud, it will be pushed away.  Only for dynamic physics objects that are KDINTERACTIONCLASS_NoPawnInteractions.";
var(Karma) noexport bool bIgnoreVehicles "If true, this object will not interact with vehicles.";
var(Karma) noexport bool bIgnorePawnDownwardForce "If true, this object will not be affected by downward force applied from Pawns standing on it.";
var(KarmaCollision) bool bEnableImpactSounds;
var(KarmaCollision) bool bEnableImpactEffects;
var(KarmaCollision) noexport bool bDoPhysicsWaterEffects "If true, special physics based splashes will be enabled.";
var(Crushing) noexport bool bCanCrushOthers "If true, this object can crush others.  NOTE: Objects can only crush other objects with <= Mass.";
var(Crushing) noexport bool bDontCrush "If true, this object cannot be crushed.";
var(KarmaDamage) noexport bool bIgnoresPhysicsDamage "If true, this object ignores damage from physics collisions.";
var(KarmaDamage) noexport bool bIgnoreSelfDamage "If true, this object will not include its own velocity when computing impact damage.  Pawns will always do this even if the flag is not set.";
var(KarmaDamage) bool bPlayerFallingDamageExempt;
var(Interpolation) noexport bool bUsePhysMeqonInterp "If true, when attaching to an interpolation path, Physics will be set to PHYS_Meqon and the meqon keyframing system will be used to perform the movement.  Doesn't work for ragdolls.";
var(movement) noexport bool bUsePhysMeqonKeyframing "If true, KeyframeDispatch and others desired location/rotation will be performed on this Actor using PHYS_Meqon and the meqon keyframing system.";
var(TickRules) noexport bool bTickOnlyWhenPhysicsAwake "If true, actor will not tick when asleep in the physics simulation";
var(KarmaCollision) noexport class<dnFriendFX_Spawners> WaterSplash "Class to use for splashing water if bDoRagdollWaterEffects is true";
var(KarmaCollision) noexport float MinSplashTime "Minimum time between splashes";
var array<SPhysicsWaterInteraction> WaterInteractions;
var float NextSplashTime;
var const editconst transient pointer PhysicsUserData;
var const editconst transient pointer MeqConstraints;
var const editconst transient array<transient pointer> PhysicsStateStack;
var const int iAwake;
var const transient int PseudoDynamicsHandle;
var(Karma) float ImpactSoundRadius;
var(Karma) float ImpactSoundInnerRadius;
var(Karma) float ImpactSoundVolume;
var(Karma) noexport float ImpactSoundTimer "This much time must pass between each impact sound playing.";
var float NextLegalImpactSoundTime;
var int NextLegalImpactSoundOffset;
var(Karma) const KarmaActor.EStaticInteractionClassification StaticInteractionClassification;
var(Karma) const KarmaActor.EDynamicInteractionClassification DynamicInteractionClassification;
var transient Object.ESoundSlot PersistantEffectType;
var transient Object.ESoundSlot LastPersistantEffectType;
var transient int PersistantEffectDBIndex;
var transient int LastPersistantEffectDBIndex;
var transient Sound PersistantEffectSound;
var transient float PersistantEffectVolume;
var transient float PersistantEffectPitch;
var transient float PersistantEffectTime;
var(Karma) class<PhysicsMaterial> PhysicsMaterial;
var(Karma) Object.EPhysicsMassType PhysicsMassType;
var(Karma) noexport float KFriction "Friction coeffecient of object surfaces. Multiplied by the friction of the surface sliding against to get total friction.";
var(Karma) noexport float KRestitution "Just pretend it says \"bounciness\"...";
var(Karma) noexport float KImpactThreshold "Intensity of impact required to receive a KImpact.";
var(Karma) noexport float KLinearDamping "This percentage of an object's linear velocity will be lost over one second. (A value of 0.2 will cause 20% to be lost each second.) This simulates air resistance.";
var float StoredKLinearDamping;
var(Karma) noexport float KAngularDamping "See [KLinearDamping]. This affects angular velocity instead of linear velocity.";
var(Karma) const noexport Vector KCenterOfMass "Offset in local space defining the center of mass for this Actor.  Does not affect ragdolls.  Should not be used for Pawns.  Cannot change while Actor exists in physics land.";
var(Karma) noexport float GravityScale "Scale the Gravity of the PhysicsVolume this actor is in by this amount before applying it. (Negative values are legal and will move the object in the direction opposite gravity.";
var(Karma) noexport float Density "The approximate density of this object, used for buoyancy calculations. 1.0 will barely float in water, where smaller values (0.4), will float better. Higher values (3.0) still get buoyancy, but not enough to make them float up to the surface.";
var(Karma) const noexport float MagneticCharge "If 0.0, this object won't have any magnetic interaction. Differently-charged objects will attract each other, while similarly-charged objects will repulse. (The strength is based on the multiplied charge of the two objects in question.";
var(Karma) const noexport float MagneticRange "This is the maximum range at which this object will affect other objects based on [MagneticCharge].";
var(Karma) const noexport float EnableDisableThreshold "Scale the minimum speed at which this object thinks it is \"at rest\". Numbers between 0.0 and 1.0 will cause the object to stay awake longer (and be able to move more slowly), where numbers greater than 1.0 will cause it to come to rest faster.";
var(Karma) const float PhysicsTimeScale;
var(KarmaEvents) noexport name KImpactEvent "Event to fire off when we receive a KImpact.";
var(KarmaEvents) noexport name KWakeEvent "Event to fire off when we change from asleep to awake.";
var(KarmaEvents) noexport name KSleepEvent "Event to fire off when we change from awake to asleep.";
var(KarmaDamage) noexport float MinImpactTime "Minimum amount of time between impacts.  Impacts occurring too soon after one another are ignored.";
var(KarmaDamage) noexport float MinDamageVelocity "Minimum impact velocity required to deliver any damage.";
var(KarmaDamage) noexport float MinDamageVelocityThrown "Minimum impact velocity required to deliver any damage after being thrown.";
var(KarmaDamage) noexport float MinDamageVelocityDropped "Minimum impact velocity required to deliver any damage after being dropped.";
var float DefaultMinDamageVelocity;
var(KarmaDamage) noexport float DamageScaler "When hitting another actor, scale the damage we were going to issue based on mass and kinetic energy by this much. Allows you to make something very lethal, or very weak even if it is heavy and fast.";
var(KarmaDamage) noexport float MaxImpactDamage "Maximum amount of impact damage this object can take in one impact. < 0 means take the full damage no matter what.";
var(KarmaDamage) float FixedPhysicsDamageToNotPlayer;
var(KarmaDamage) float FixedPhysicsDamageToPlayer;
var(KarmaDamage) class<DamageType> OverridePhysicsImpactDamageType;
var float CurrentImpactDamage;
var float NextImpactTime;
var(Crushing) noexport float CrushResistance "This is the amount of crushing force this object can withstand before it is crushed.  Set to -1 to never be crushed.";
var(Karma) float PhysicsReplicationThrottle;
var(Karma) float PhysicsReplicationTimer;
var(Karma) StandardPhysicsAction StandardPhysicsAction;
var(Karma) array<PhysicsAction> PhysicsActions;
var(Karma) const name PhysicsEntityGroup;
var(Karma) array<SPhysicsSoundOverride> PhysicsSoundOverrides;
var(Startup) noexport float PhysicsStartupTime "Amount of time to simulated the physics for this actor at map start";
var Model SimpleCollisionModel;

replication
{
	// Pos:0x000
	unreliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		ClientReceivePhysicsState;

	// Pos:0x00B
	reliable if(__NFUN_148__(__NFUN_173__(int(Role), int(ROLE_Authority)), bNetInitial))
		DynamicInteractionClassification, GravityScale;
}

event AttachToPath(name PathName, optional bool TeleportTo)
{
	super.AttachToPath(PathName, TeleportTo);
	// End:0x2F
	if(__NFUN_148__(bUsePhysMeqonInterp, __NFUN_173__(int(Physics), int(8))))
	{
		__NFUN_642__(18);
	}
	return;
}

// Export UKarmaActor::execKSetLinearVelocity(FFrame&, void* const)
native(790) final function bool KSetLinearVelocity(Vector NewLVelocity, optional Object.EVectModifier Modifier, optional name BoneName)
{
	//native.NewLVelocity;
	//native.Modifier;
	//native.BoneName;	
}

// Export UKarmaActor::execKSetAngularVelocity(FFrame&, void* const)
native(791) final function bool KSetAngularVelocity(Vector NewAVelocity, optional Object.EVectModifier Modifier, optional name BoneName)
{
	//native.NewAVelocity;
	//native.Modifier;
	//native.BoneName;	
}

// Export UKarmaActor::execKSetLinearAcceleration(FFrame&, void* const)
native(792) final function bool KSetLinearAcceleration(Vector NewLAccel, optional Object.EVectModifier Modifier, optional name BoneName)
{
	//native.NewLAccel;
	//native.Modifier;
	//native.BoneName;	
}

// Export UKarmaActor::execKSetAngularAcceleration(FFrame&, void* const)
native(793) final function bool KSetAngularAcceleration(Vector NewAAccel, optional Object.EVectModifier Modifier, optional name BoneName)
{
	//native.NewAAccel;
	//native.Modifier;
	//native.BoneName;	
}

// Export UKarmaActor::execKGetLinearVelocity(FFrame&, void* const)
native(794) final function bool KGetLinearVelocity(out Vector OutLVelocity, optional name BoneName)
{
	//native.OutLVelocity;
	//native.BoneName;	
}

// Export UKarmaActor::execKGetAngularVelocity(FFrame&, void* const)
native(795) final function bool KGetAngularVelocity(out Vector OutAVelocity, optional name BoneName)
{
	//native.OutAVelocity;
	//native.BoneName;	
}

// Export UKarmaActor::execKGetLinearAcceleration(FFrame&, void* const)
native(796) final function bool KGetLinearAcceleration(out Vector OutLAccel, optional name BoneName)
{
	//native.OutLAccel;
	//native.BoneName;	
}

// Export UKarmaActor::execKGetAngularAcceleration(FFrame&, void* const)
native(797) final function bool KGetAngularAcceleration(out Vector OutAAccel, optional name BoneName)
{
	//native.OutAAccel;
	//native.BoneName;	
}

// Export UKarmaActor::execKGetLinearVelocityAtPoint(FFrame&, void* const)
native(798) final function Vector KGetLinearVelocityAtPoint(Vector TestPoint, optional name BoneName)
{
	//native.TestPoint;
	//native.BoneName;	
}

// Export UKarmaActor::execKGetRotationVector(FFrame&, void* const)
native(799) final function Vector KGetRotationVector(Rotator SourceRotation, Rotator DestRotation)
{
	//native.SourceRotation;
	//native.DestRotation;	
}

// Export UKarmaActor::execKPushState(FFrame&, void* const)
native(800) final function KPushState(optional KarmaActor ReceivingActor)
{
	//native.ReceivingActor;	
}

// Export UKarmaActor::execKPopState(FFrame&, void* const)
native(801) final function KPopState(optional bool bUseDynamics, optional bool bUseFrame)
{
	//native.bUseDynamics;
	//native.bUseFrame;	
}

// Export UKarmaActor::execKPushGeneratedSimpleState(FFrame&, void* const)
native(802) final function KPushGeneratedSimpleState(Vector StateLocation, Rotator StateRotation)
{
	//native.StateLocation;
	//native.StateRotation;	
}

// Export UKarmaActor::execSetPhysicsPose(FFrame&, void* const)
native(803) final function SetPhysicsPose(name AnimationPoseName, optional float AnimationPoseFrame, optional bool bResetState)
{
	//native.AnimationPoseName;
	//native.AnimationPoseFrame;
	//native.bResetState;	
}

// Export UKarmaActor::execKHurtRadiusActivity(FFrame&, void* const)
native(804) final function bool KHurtRadiusActivity(Actor DamageInstigator, Vector DamageOrigin, float DamageRadius, float DamageFalloffStart, class<DamageType> DamageType, optional float RelativeScale)
{
	//native.DamageInstigator;
	//native.DamageOrigin;
	//native.DamageRadius;
	//native.DamageFalloffStart;
	//native.DamageType;
	//native.RelativeScale;	
}

// Export UKarmaActor::execStopPersistantPhysicsEffects(FFrame&, void* const)
native(805) final function StopPersistantPhysicsEffects();

// Export UKarmaActor::execGetConstraintCount(FFrame&, void* const)
native(806) final function int GetConstraintCount();

// Export UKarmaActor::execGetConstraint(FFrame&, void* const)
native(807) final function KConstraint GetConstraint(int Index)
{
	//native.Index;	
}

// Export UKarmaActor::execSetKFriction(FFrame&, void* const)
native(808) final function SetKFriction(float NewKFriction)
{
	//native.NewKFriction;	
}

// Export UKarmaActor::execSetKRestitution(FFrame&, void* const)
native(809) final function SetKRestitution(float NewKRestitution)
{
	//native.NewKRestitution;	
}

// Export UKarmaActor::execSetKMaterialProperties(FFrame&, void* const)
native(810) final function SetKMaterialProperties(float NewKFriction, float NewKRestitution)
{
	//native.NewKFriction;
	//native.NewKRestitution;	
}

// Export UKarmaActor::execSetStaticInteractionClassification(FFrame&, void* const)
native(811) final function SetStaticInteractionClassification(KarmaActor.EStaticInteractionClassification NewStaticClass)
{
	//native.NewStaticClass;	
}

// Export UKarmaActor::execSetDynamicInteractionClassification(FFrame&, void* const)
native(812) final simulated function SetDynamicInteractionClassification(KarmaActor.EDynamicInteractionClassification NewDynamicClass)
{
	//native.NewDynamicClass;	
}

// Export UKarmaActor::execSetMagneticProperties(FFrame&, void* const)
native(813) final function SetMagneticProperties(optional float MagneticCharge, optional float MagneticRange)
{
	//native.MagneticCharge;
	//native.MagneticRange;	
}

// Export UKarmaActor::execSetEnableDisableThreshold(FFrame&, void* const)
native(814) final function SetEnableDisableThreshold(float NewEnableDisableThreshold)
{
	//native.NewEnableDisableThreshold;	
}

// Export UKarmaActor::execSetPhysicsTimeScale(FFrame&, void* const)
native(815) final function SetPhysicsTimeScale(float NewPhysicsTimeScale)
{
	//native.NewPhysicsTimeScale;	
}

// Export UKarmaActor::execSetPhysicsEntityGroup(FFrame&, void* const)
native(816) final function SetPhysicsEntityGroup(name NewEntityGroup)
{
	//native.NewEntityGroup;	
}

// Export UKarmaActor::execKWake(FFrame&, void* const)
native(817) final function bool KWake();

// Export UKarmaActor::execKSleep(FFrame&, void* const)
native(818) final function bool KSleep();

// Export UKarmaActor::execKAddForce(FFrame&, void* const)
native(819) final function KAddForce(Vector Force, optional Vector Position, optional name BoneName)
{
	//native.Force;
	//native.Position;
	//native.BoneName;	
}

// Export UKarmaActor::execKAddImpulse(FFrame&, void* const)
native(820) final function KAddImpulse(Vector Impulse, optional Vector Position, optional name BoneName, optional bool bIgnoreLimit)
{
	//native.Impulse;
	//native.Position;
	//native.BoneName;
	//native.bIgnoreLimit;	
}

// Export UKarmaActor::execKAddTorque(FFrame&, void* const)
native(821) final function KAddTorque(Vector Torque, optional name BoneName)
{
	//native.Torque;
	//native.BoneName;	
}

// Export UKarmaActor::execKDisableCollisionBetween(FFrame&, void* const)
native(822) final function KDisableCollisionBetween(KarmaActor Other)
{
	//native.Other;	
}

// Export UKarmaActor::execKUndisableCollisionBetween(FFrame&, void* const)
native(823) final function KUndisableCollisionBetween(KarmaActor Other)
{
	//native.Other;	
}

// Export UKarmaActor::execKFindPhysicsAction(FFrame&, void* const)
native(824) final function PhysicsAction KFindPhysicsAction(class<PhysicsAction> PhysicsActionClass, optional bool bCreate)
{
	//native.PhysicsActionClass;
	//native.bCreate;	
}

// Export UKarmaActor::execKRemovePhysicsAction(FFrame&, void* const)
native(825) final function KRemovePhysicsAction(class<PhysicsAction> PhysicsActionClass, optional bool bRemoveMultiple)
{
	//native.PhysicsActionClass;
	//native.bRemoveMultiple;	
}

// Export UKarmaActor::execKRemoveBelowNamed(FFrame&, void* const)
native(826) final function bool KRemoveBelowNamed(name BoneName)
{
	//native.BoneName;	
}

// Export UKarmaActor::execKRemoveAboveNamed(FFrame&, void* const)
native(827) final function bool KRemoveAboveNamed(name BoneName)
{
	//native.BoneName;	
}

// Export UKarmaActor::execKSetJointsFrozenPercent(FFrame&, void* const)
native(828) final function KSetJointsFrozenPercent(float FreezePercent)
{
	//native.FreezePercent;	
}

// Export UKarmaActor::execKGetCollidingActors(FFrame&, void* const)
native(829) final function array<SKarmaInteraction> KGetCollidingActors(optional name BoneName)
{
	//native.BoneName;	
}

// Export UKarmaActor::execKGetInteractingActors(FFrame&, void* const)
native(830) final function array<SKarmaInteraction> KGetInteractingActors(optional name BoneName)
{
	//native.BoneName;	
}

// Export UKarmaActor::execKGetSensors(FFrame&, void* const)
native(831) final function array<KSensor> KGetSensors(optional name BoneName)
{
	//native.BoneName;	
}

event PostPhysMeqon(float DeltaTime)
{
	local int i;
	local Vector Center, Vel, WaterPoint;
	local float Radius;

	// End:0x16B
	if(__NFUN_170__(string(WaterInteractions), 0))
	{
		// End:0x165
		if(__NFUN_148__(bDoPhysicsWaterEffects, __NFUN_203__(Level.GameTimeSeconds, NextSplashTime)))
		{
			i = __NFUN_166__(string(WaterInteractions), 1);
			J0x3F:

			// End:0x82 [Loop If]
			if(__NFUN_172__(i, 0))
			{
				__NFUN_249__(Center, WaterInteractions[i].Location);
				__NFUN_249__(Vel, WaterInteractions[i].Velocity);
				__NFUN_185__(i);
				// [Loop Continue]
				goto J0x3F;
			}
			__NFUN_248__(Vel, float(string(WaterInteractions)));
			__NFUN_248__(Center, float(string(WaterInteractions)));
			// End:0x165
			if(__NFUN_203__(__NFUN_252__(Vel), 900))
			{
				Radius = __NFUN_196__(__NFUN_195__(10, DrawScale), default.DrawScale);
				i = __NFUN_166__(string(WaterInteractions), 1);
				J0xD7:

				// End:0x112 [Loop If]
				if(__NFUN_172__(i, 0))
				{
					Radius = __NFUN_225__(Radius, __NFUN_251__(__NFUN_239__(Center, WaterInteractions[i].Location)));
					__NFUN_185__(i);
					// [Loop Continue]
					goto J0xD7;
				}
				// End:0x165
				if(__NFUN_732__(Center, 250, WaterPoint))
				{
					ExecuteFriendSpawner(WaterSplash, WaterPoint, __NFUN_265__(0, 0, 0), __NFUN_196__(Radius, 40));
					NextSplashTime = __NFUN_198__(Level.GameTimeSeconds, MinSplashTime);
				}
			}
		}
		WaterInteractions.Empty();
	}
	return;
}

event KImpact(name SelfBoneName, KarmaActor Other, name OtherBoneName, Vector Position, Vector ImpactVelocity, Vector ImpactNormal)
{
	GlobalTrigger(KImpactEvent, Pawn(Other), self);
	return;
}

event WalkedOn(Pawn Other)
{
	return;
}

event PhysicsEntityGroupChanged()
{
	return;
}

event bool NotifyCrushed()
{
	return bDontCrush;
	return;
}

event bool TakePhysicsImpactDamage(float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, Pawn Instigator, KarmaActor DamageActor)
{
	TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, 'None', DamageOrigin);
	return false;
	return;
}

event bool CausedPhysicsImpactDamage(float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, Pawn Instigator, KarmaActor DamagedActor)
{
	return false;
	return;
}

event OnEntityWake(int NumAwake)
{
	return;
}

event OnEntitySleep(int NumAwake)
{
	return;
}

event OnWake()
{
	GlobalTrigger(KWakeEvent, none, self);
	return;
}

event OnSleep()
{
	GlobalTrigger(KSleepEvent, none, self);
	return;
}

event PreBeginPlay()
{
	// End:0x0F
	if(bModifyTickOnPhysicsChange)
	{
		PhysicsChange();
	}
	DefaultMinDamageVelocity = MinDamageVelocity;
	super.PreBeginPlay();
	return;
}

event PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	local float WorkingEnableDisableThreshold;

	super.PhysicsVolumeChange(NewVolume);
	// End:0x78
	if(__NFUN_148__(__NFUN_340__(PhysicsVolume, none), __NFUN_201__(PhysicsVolume.KEnableDisableScalar, 0)))
	{
		// End:0x59
		if(__NFUN_204__(EnableDisableThreshold, PhysicsVolume.KEnableDisableScalar))
		{
			WorkingEnableDisableThreshold = -1;			
		}
		else
		{
			WorkingEnableDisableThreshold = __NFUN_196__(EnableDisableThreshold, PhysicsVolume.KEnableDisableScalar);
		}		
	}
	else
	{
		WorkingEnableDisableThreshold = EnableDisableThreshold;
	}
	// End:0xD9
	if(__NFUN_201__(NewVolume.KEnableDisableScalar, 0))
	{
		// End:0xC3
		if(__NFUN_200__(WorkingEnableDisableThreshold, 0))
		{
			WorkingEnableDisableThreshold = NewVolume.KEnableDisableScalar;			
		}
		else
		{
			__NFUN_207__(WorkingEnableDisableThreshold, NewVolume.KEnableDisableScalar);
		}
	}
	__NFUN_814__(WorkingEnableDisableThreshold);
	// End:0xF9
	if(__NFUN_145__(Level.bStartup))
	{
		__NFUN_817__();
	}
	return;
}

event PhysicsChange(optional Object.EPhysics PreviousPhysics)
{
	super.PhysicsChange(PreviousPhysics);
	// End:0x7B
	if(bModifyTickOnPhysicsChange)
	{
		// End:0x63
		if(__NFUN_150__(__NFUN_150__(__NFUN_173__(int(Physics), int(18)), __NFUN_173__(int(Physics), int(9))), __NFUN_173__(int(Physics), int(8))))
		{
			// End:0x58
			if(__NFUN_173__(int(TickStyle), int(0)))
			{
				TickStyle = 2;
			}
			bNoNativeTick = false;			
		}
		else
		{
			TickStyle = default.TickStyle;
			bNoNativeTick = default.bNoNativeTick;
		}
	}
	return;
}

event TickAlmostDisabled()
{
	super.TickAlmostDisabled();
	__NFUN_805__();
	return;
}

// Export UKarmaActor::execTraceFireHit(FFrame&, void* const)
native simulated event Actor.ETraceFireHitResponse TraceFireHit(Actor SourceActor, class<TraceDamageType> TraceDamageType, Vector SourceTraceOrigin, Vector HitLocation, Vector HitNormal, name HitBoneName, bool bExtentTrace)
{
	//native.SourceActor;
	//native.TraceDamageType;
	//native.SourceTraceOrigin;
	//native.HitLocation;
	//native.HitNormal;
	//native.HitBoneName;
	//native.bExtentTrace;	
}

function HurtRadiusActivity(Actor DamageInstigator, float DamageAmount, Vector DamageOrigin, float DamageRadius, float DamageFalloffStart, class<DamageType> DamageType, Vector DamageStart, optional bool bIgnoreDrawScale, optional float RelativeScale)
{
	super.HurtRadiusActivity(DamageInstigator, DamageAmount, DamageOrigin, DamageRadius, DamageFalloffStart, DamageType, DamageStart, bIgnoreDrawScale, RelativeScale);
	GiveExplosionImpulse(DamageInstigator, DamageOrigin, DamageRadius, DamageFalloffStart, DamageType, RelativeScale);
	return;
}

function GiveExplosionImpulse(Actor DamageInstigator, Vector DamageOrigin, float DamageRadius, float DamageFalloffStart, class<DamageType> DamageType, float RelativeScale)
{
	local Vector EstimatedDirection;
	local float HurtRadiusPct;

	// End:0xA6
	if(ShouldTakeExplosionImpulse(DamageType))
	{
		// End:0xA6
		if(__NFUN_145__(__NFUN_804__(DamageInstigator, DamageOrigin, DamageRadius, DamageFalloffStart, DamageType, RelativeScale)))
		{
			EstimatedDirection = __NFUN_253__(__NFUN_239__(Location, DamageOrigin));
			HurtRadiusPct = CalcRadiusDamagePercent(DamageOrigin, Location, DamageRadius, DamageFalloffStart);
			__NFUN_820__(__NFUN_235__(HurtRadiusPct, GenerateExplosionImpulse(EstimatedDirection, DamageType, RelativeScale)));
			__NFUN_821__(__NFUN_235__(HurtRadiusPct, GenerateExplosionTorque(EstimatedDirection, DamageType, RelativeScale)));
		}
	}
	return;
}

simulated function float GetDamageMomentumPostScale(class<DamageType> DamageType)
{
	return 1;
	return;
}

simulated event bool ShouldTakeDamageImpulse(class<DamageType> DamageType)
{
	return __NFUN_148__(bTakeDamageMomentum, __NFUN_145__(__NFUN_357__(DamageType, class'CrushingDamage')));
	return;
}

simulated function bool ShouldTakeExplosionImpulse(class<DamageType> DamageType)
{
	return __NFUN_148__(bTakeExplosionDamageMomentum, __NFUN_357__(DamageType, class'ExplosionDamage'));
	return;
}

simulated event Vector GenerateDamageMomentum(Vector DamageDirection, class<DamageType> DamageType, float RelativeScale, bool bSteroids)
{
	local float ImpulseScale;
	local Pawn Instigator;

	// End:0x1E
	if(__NFUN_339__(DamageType, none))
	{
		return __NFUN_232__(0, 0, 0);
	}
	ImpulseScale = 1;
	// End:0x62
	if(__NFUN_206__(RelativeScale, 0))
	{
		ImpulseScale = RelativeScale;
		// End:0x62
		if(bSteroids)
		{
			__NFUN_207__(ImpulseScale, DamageType.default.SteroidsImpulseMultiplier);
		}
	}
	return __NFUN_235__(__NFUN_195__(__NFUN_195__(ImpulseScale, DamageType.default.MomentumTransfer), GetDamageMomentumPostScale(DamageType)), __NFUN_253__(DamageDirection));
	return;
}

simulated function Vector GenerateExplosionLift(Vector DamageDirection, class<DamageType> DamageType, float RelativeScale)
{
	local float ImpulseScale;

	// End:0x1E
	if(__NFUN_339__(DamageType, none))
	{
		return __NFUN_232__(0, 0, 0);
	}
	// End:0x46
	if(__NFUN_200__(__NFUN_244__(__NFUN_233__(DamageDirection), __NFUN_640__()), 0))
	{
		return __NFUN_232__(0, 0, 0);
	}
	ImpulseScale = 1;
	// End:0x6B
	if(__NFUN_206__(RelativeScale, 0))
	{
		ImpulseScale = RelativeScale;
	}
	return __NFUN_234__(__NFUN_235__(__NFUN_195__(__NFUN_195__(ImpulseScale, DamageType.default.MomentumTransfer), GetDamageMomentumPostScale(DamageType)), __NFUN_253__(__NFUN_640__())), -0.3);
	return;
}

simulated event Vector GenerateExplosionImpulse(Vector DamageDirection, class<DamageType> DamageType, float RelativeScale)
{
	return __NFUN_238__(GenerateDamageMomentum(DamageDirection, DamageType, RelativeScale, false), GenerateExplosionLift(DamageDirection, DamageType, RelativeScale));
	return;
}

simulated function Vector GenerateExplosionTorque(Vector DamageDirection, class<DamageType> DamageType, float RelativeScale)
{
	local float ImpulseScale;
	local Vector RandomTorque;

	// End:0x1E
	if(__NFUN_339__(DamageType, none))
	{
		return __NFUN_232__(0, 0, 0);
	}
	ImpulseScale = 1;
	// End:0x43
	if(__NFUN_206__(RelativeScale, 0))
	{
		ImpulseScale = RelativeScale;
	}
	RandomTorque = __NFUN_256__(__NFUN_232__(0.875, 0.875, 0.875), __NFUN_232__(0.5, 0.5, 0.5));
	__NFUN_246__(RandomTorque, 10);
	// End:0x97
	if(__NFUN_200__(__NFUN_222__(), 0.5))
	{
		__NFUN_207__(RandomTorque.X, -1);
	}
	// End:0xB4
	if(__NFUN_200__(__NFUN_222__(), 0.5))
	{
		__NFUN_207__(RandomTorque.Y, -1);
	}
	// End:0xD1
	if(__NFUN_200__(__NFUN_222__(), 0.5))
	{
		__NFUN_207__(RandomTorque.Z, -1);
	}
	return __NFUN_235__(__NFUN_195__(ImpulseScale, DamageType.default.MomentumTransfer), RandomTorque);
	return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	local int i;
	local KConstraint C;

	super.TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	i = __NFUN_166__(__NFUN_806__(), 1);
	J0x35:

	// End:0x98 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		C = __NFUN_807__(i);
		C.ConstrainedTakeDamage(self, Instigator, Damage, DamageOrigin, DamageDirection, DamageType);
		// End:0x8E
		if(C.bOnlyBreakOne)
		{
			// [Explicit Break]
			goto J0x98;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x35;
	}
	J0x98:

	return;
}

final simulated function KConstraint KarmaSetupConstraint(optional class<KConstraint> ConstraintClass, optional KarmaActor ConstraintOwner, optional name ConstraintBone, optional KarmaActor OtherConstraintActor, optional name OtherConstraintBone)
{
	local Vector SpawnLocation;
	local KConstraint Constraint;

	// End:0x17
	if(__NFUN_339__(ConstraintClass, none))
	{
		ConstraintClass = class'KFixed';
	}
	// End:0x2A
	if(__NFUN_339__(ConstraintOwner, none))
	{
		ConstraintOwner = self;
	}
	Constraint = __NFUN_615__(ConstraintClass, ConstraintOwner);
	// End:0x4B
	if(__NFUN_339__(Constraint, none))
	{
		return none;
	}
	Constraint.__NFUN_642__(0);
	Constraint.KConstraintActor1 = ConstraintOwner;
	Constraint.KConstraintActor1Bone = ConstraintBone;
	Constraint.KConstraintActor2 = OtherConstraintActor;
	Constraint.KConstraintActor2Bone = OtherConstraintBone;
	KarmaSetConstraintProperties(Constraint);
	return Constraint;
	return;
}

function KarmaSetConstraintProperties(KConstraint Constraint)
{
	return;
}

static final function KarmaEnableConstraint(KConstraint Constraint)
{
	// End:0x0E
	if(__NFUN_339__(Constraint, none))
	{
		return;
	}
	Constraint.__NFUN_642__(18);
	return;
}

// Export UKarmaActor::execImportNetworkRigidBodyState(FFrame&, void* const)
native simulated function ImportNetworkRigidBodyState(MeqonRigidBodyNetworkState NetworkState)
{
	//native.NetworkState;	
}

simulated event delegate ClientReceivePhysicsState(MeqonRigidBodyNetworkState NetworkState)
{
	// End:0x19
	if(__NFUN_173__(int(Role), int(ROLE_SimulatedProxy)))
	{
		ImportNetworkRigidBodyState(NetworkState);
	}
	return;
}

function ApplyImpulse(Vector Dir, Vector Loc, optional name BoneName)
{
	__NFUN_820__(Dir, Loc, BoneName);
	return;
}

final function SetMinDamageVelocityDropped()
{
	MinDamageVelocity = MinDamageVelocityDropped;
	__NFUN_607__(1.5, false, 'ResetMinDamageVelocity');
	return;
}

final function SetMinDamageVelocityThrown()
{
	MinDamageVelocity = MinDamageVelocityThrown;
	__NFUN_607__(1.5, false, 'ResetMinDamageVelocity');
	return;
}

final function ResetMinDamageVelocity()
{
	MinDamageVelocity = DefaultMinDamageVelocity;
	return;
}

final simulated function PrepForJumpPadLaunch(float Duration, bool bDisableAirControl)
{
	local PlayerPawn P;

	// End:0x1A
	if(__NFUN_204__(StoredKLinearDamping, 0))
	{
		StoredKLinearDamping = KLinearDamping;
	}
	KLinearDamping = 0;
	// End:0x92
	if(__NFUN_148__(bDisableAirControl, bIsPlayerPawn))
	{
		P = PlayerPawn(self);
		// End:0x7D
		if(__NFUN_204__(P.StoredAirControlEx, 0))
		{
			P.StoredAirControlEx = P.AirControlEx;
		}
		P.AirControlEx = 0;
	}
	__NFUN_605__(Duration, false, 'RestoreFromJumpPadLaunch');
	__NFUN_605__(__NFUN_195__(Duration, 2), false, 'RestoreOnLandedTime');
	return;
}

simulated function NotifyRestoreFromJumpPadLaunch()
{
	return;
}

function RestoreOnLandedTime()
{
	return;
}

final simulated function RestoreFromJumpPadLaunch()
{
	KLinearDamping = StoredKLinearDamping;
	StoredKLinearDamping = 0;
	// End:0x72
	if(__NFUN_148__(bIsPlayerPawn, __NFUN_206__(PlayerPawn(self).StoredAirControlEx, 0)))
	{
		PlayerPawn(self).AirControlEx = PlayerPawn(self).StoredAirControlEx;
		PlayerPawn(self).StoredAirControlEx = 0;
	}
	NotifyRestoreFromJumpPadLaunch();
	return;
}

simulated function JumpPadLaunch(Vector JumpStart, Vector JumpTarget, float MaxHeight, optional Vector LeadVelocity, optional bool bDisableAirControl)
{
	local float JumpTime;
	local Vector LinVel;

	JumpTime = __NFUN_668__(JumpTarget, MaxHeight, true, LinVel);
	__NFUN_249__(LinVel, LeadVelocity);
	PrepForJumpPadLaunch(JumpTime, bDisableAirControl);
	// End:0xCD
	if(__NFUN_148__(bIsPawn, Pawn(self).bPhysicsControllerActive))
	{
		// End:0xA6
		if(__NFUN_174__(int(Physics), int(18)))
		{
			__NFUN_642__(2);
			Acceleration.X = 0;
			Acceleration.Y = 0;
			Acceleration.Z = 0;
			Velocity = LinVel;			
		}
		else
		{
			Pawn(self).GameplayDesiredPhysicsVelocity = LinVel;
			Pawn(self).__NFUN_966__();
		}		
	}
	else
	{
		// End:0xE9
		if(__NFUN_174__(int(Physics), int(18)))
		{
			Velocity = LinVel;			
		}
		else
		{
			__NFUN_790__(LinVel, 1);
			__NFUN_792__(__NFUN_232__(0, 0, 0), 1);
		}
	}
	return;
}

defaultproperties
{
	bTakeDamageMomentum=true
	bTakeExplosionDamageMomentum=true
	bEnableImpactSounds=true
	bCanCrushOthers=true
	bIgnoresPhysicsDamage=true
	MinSplashTime=0.1
	ImpactSoundRadius=4096
	ImpactSoundInnerRadius=192
	ImpactSoundVolume=1
	ImpactSoundTimer=0.2
	KFriction=0.65
	KRestitution=0.2
	KImpactThreshold=100000
	KLinearDamping=0.05
	KAngularDamping=0.1
	GravityScale=1
	Density=0.82
	EnableDisableThreshold=-1
	PhysicsTimeScale=1
	MinImpactTime=1
	MinDamageVelocity=500
	MinDamageVelocityThrown=200
	MinDamageVelocityDropped=700
	DamageScaler=1
	MaxImpactDamage=1000
	CrushResistance=-1
	PhysicsReplicationThrottle=0.2
	StandardPhysicsAction=StandardPhysicsAction'KarmaActor.DefaultKarmaActorPhysicsAction'
	bTraceShootable=true
	bIsKarmaActor=true
	SoundScaled=true
	TransientSoundScaled=true
	RemoteRole=2
}
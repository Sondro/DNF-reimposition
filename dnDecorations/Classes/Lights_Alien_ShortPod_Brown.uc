/*******************************************************************************
 * Lights_Alien_ShortPod_Brown generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Lights_Alien_ShortPod_Brown extends Lights_Alien
	collapsecategories;

const MaxAbsXY45 = 0.707107f;
const OneMinusMaxAbsXY45 = 0.292893f;
const BlinkMidTime1 = 0.25f;
const BlinkEndTime1 = 0.4f;
const BlinkStartTime2 = 1.36f;
const BlinkMidTime2 = 1.5f;
const BlinkEndTime2 = 1.67f;
const GridLimit = 0.5f;

enum EMovementMode
{
	MOVE_Track,
	MOVE_Free,
	MOVE_Hold
};

var() noexport Color HurtActorColor "Actor color to use when hurt";
var() noexport Color IdleActorCOlor "Actor color to use when idling";
var() noexport float SensorRadius "Radius of the KSphereSensor around this pod.";
var Biology_Generic_AlienSensor Sensor;
var Lights_Alien_ShortPod_Brown.EMovementMode MovementMode;
var Pawn TrackedActor;
var() noexport name TentacleTag "Any tentacle with this tag will be tied to this eye and shut down and wake up with the eye when it is damaged.";
var array<Biology_Generic_Tentacle> TentacleList;
var() noexport float RechargeTime "Time to recharge after taking damage";
var() noexport float BlinkTime "Average time in between blinks";
var() noexport float BlinkVariance "Variance of blink times in between blinks";
var() noexport float FreeLookSpeed "How fast to look around in free look";
var float IdleToHurtTime;
var float HurtToIdleTime;
var float BlinkLightOffTime;
var bool Idling;
var bool Hurt;
var float AimGridX;
var float AimGridY;
var float LastX;
var float LastY;
var float FreeX;
var float FreeY;
var float BlinkStartTickTime;
var array<float> InitialLightRadius;

event PostBeginPlay()
{
	local name SenseEvent;
	local int i, j;
	local Biology_Generic_Tentacle t;

	super(Lights_Generic).PostBeginPlay();
	InitialLightRadius.Empty();
	i = 0;
	J0x13:

	// End:0x6D [Loop If]
	if(__NFUN_169__(i, string(LightList)))
	{
		j = InitialLightRadius.Add(1);
		// End:0x63
		if(__NFUN_340__(LightList[i], none))
		{
			InitialLightRadius[i] = LightList[i].LightRadius;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x13;
	}
	// End:0x96
	foreach __NFUN_747__(class'Biology_Generic_Tentacle', t, TentacleTag)
	{
		TentacleList[TentacleList.Add(1)] = t;		
	}	
	// End:0xD1
	if(__NFUN_340__(__NFUN_568__(), none))
	{
		IdleToHurtTime = MeshInstance.__NFUN_553__('a_relaxed_hurt');
		HurtToIdleTime = MeshInstance.__NFUN_553__('a_hurt_relaxed');
	}
	Sensor = Biology_Generic_AlienSensor(FindMountedActor(, class'Biology_Generic_AlienSensor'));
	// End:0x106
	if(__NFUN_340__(Sensor, none))
	{
		Sensor.__NFUN_1124__(SensorRadius);
	}
	DecoActivity(0, 'RefPose');
	BeginIdleState();
	return;
}

function OnSenseHumanPawn()
{
	TrackedActor = Sensor.CurrentlySensingPawn;
	return;
}

function OnUnsenseHumanPawn()
{
	TrackedActor = none;
	return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	local int i;

	super(dnDecoration).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	// End:0xA8
	if(Idling)
	{
		DecoActivity(0, 'Hurt');
		CancelBlinkTimer();
		ForcePowerOff();
		bIgnoreAimAssist = true;
		__NFUN_605__(IdleToHurtTime, false, 'BeginHurtState');
		i = 0;
		J0x68:

		// End:0x98 [Loop If]
		if(__NFUN_169__(i, string(TentacleList)))
		{
			TentacleList[i].Stun();
			__NFUN_182__(i);
			// [Loop Continue]
			goto J0x68;
		}
		MovementMode = 2;
		Idling = false;
	}
	return;
}

final function BeginHurtState()
{
	DecoActivity(0, 'HurtIdle');
	__NFUN_605__(RechargeTime, false, 'EndHurtState');
	CancelBlinkTimer();
	return;
}

final function EndHurtState()
{
	DecoActivity(0, 'Relax');
	__NFUN_605__(HurtToIdleTime, false, 'BeginIdleState');
	bIgnoreAimAssist = false;
	return;
}

final function BeginIdleState()
{
	local int i;

	DecoActivity(0, 'BeginIdle');
	StartBlinkTimer();
	MovementMode = 0;
	Idling = true;
	i = 0;
	J0x2A:

	// End:0x5A [Loop If]
	if(__NFUN_169__(i, string(TentacleList)))
	{
		TentacleList[i].UnStunned();
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x2A;
	}
	ForcePowerOn();
	return;
}

event Tick(float DeltaSeconds)
{
	local int i;
	local Color LightColor;

	super(Actor).Tick(DeltaSeconds);
	// End:0x38
	if(__NFUN_148__(__NFUN_339__(TrackedActor, none), __NFUN_173__(int(MovementMode), int(0))))
	{
		MovementMode = 1;
		StartFreeLook();		
	}
	else
	{
		// End:0x5C
		if(__NFUN_148__(__NFUN_340__(TrackedActor, none), __NFUN_173__(int(MovementMode), int(1))))
		{
			MovementMode = 0;
		}
	}
	switch(MovementMode)
	{
		// End:0x7C
		case 0:
			MoveTrack(TrackedActor, DeltaSeconds);
			// End:0xB4
			break;
		// End:0x8F
		case 1:
			MoveFree(DeltaSeconds);
			// End:0xB4
			break;
		// End:0xB1
		case 2:
			MoveTo(0, 0, DeltaSeconds, 20);
			// End:0xB4
			break;
		// End:0xFFFF
		default:
			break;
	}
	// End:0xDC
	if(__NFUN_148__(__NFUN_170__(string(LightList), 0), __NFUN_203__(BlinkStartTickTime, 0)))
	{
		CalcLightRadius(DeltaSeconds);
	}
	return;
}

final function MoveTrack(Pawn P, float DeltaSeconds)
{
	local float X, Y;
	local Vector V;

	// End:0x8E
	if(__NFUN_340__(P, none))
	{
		V = __NFUN_239__(P.Location, Location);
		V = __NFUN_263__(V, __NFUN_267__(-1, Rotation));
		V = __NFUN_253__(V);
		X = __NFUN_194__(V.Y);
		Y = __NFUN_194__(V.X);
		MoveTo(X, Y, DeltaSeconds, 10);
	}
	return;
}

final function MoveFree(float DeltaSeconds)
{
	// End:0x38
	if(__NFUN_148__(__NFUN_200__(__NFUN_211__(__NFUN_199__(AimGridX, FreeX)), 0.01), __NFUN_200__(__NFUN_211__(__NFUN_199__(AimGridY, FreeY)), 0.01)))
	{
		StartFreeLook();
	}
	__NFUN_209__(AimGridX, __NFUN_195__(FreeX, DeltaSeconds));
	__NFUN_209__(AimGridY, __NFUN_195__(FreeY, DeltaSeconds));
	// End:0x84
	if(__NFUN_201__(AimGridX, 0.5))
	{
		AimGridX = 0.5;
		__NFUN_207__(FreeX, -1);
	}
	// End:0xAE
	if(__NFUN_200__(AimGridX, __NFUN_194__(0.5)))
	{
		AimGridX = __NFUN_194__(0.5);
		__NFUN_207__(FreeX, -1);
	}
	// End:0xD4
	if(__NFUN_201__(AimGridY, 0.5))
	{
		AimGridY = 0.5;
		__NFUN_207__(FreeY, -1);
	}
	// End:0xFE
	if(__NFUN_200__(AimGridY, __NFUN_194__(0.5)))
	{
		AimGridY = __NFUN_194__(0.5);
		__NFUN_207__(FreeY, -1);
	}
	AnimationController.SetAnimGridState('idle', AimGridX, AimGridY);
	LastX = AimGridX;
	LastY = AimGridY;
	return;
}

final function MoveTo(float X, float Y, float DeltaSeconds, float Speed)
{
	AimGridX = __NFUN_227__(__NFUN_198__(AimGridX, __NFUN_195__(__NFUN_195__(__NFUN_199__(X, AimGridX), Speed), DeltaSeconds)), -1, 1);
	AimGridY = __NFUN_227__(__NFUN_198__(AimGridY, __NFUN_195__(__NFUN_195__(__NFUN_199__(Y, AimGridY), Speed), DeltaSeconds)), -1, 1);
	X = __NFUN_227__(__NFUN_198__(AimGridX, __NFUN_195__(__NFUN_196__(AimGridX, 0.707107), 0.292893)), __NFUN_194__(0.5), 0.5);
	Y = __NFUN_227__(__NFUN_198__(AimGridY, __NFUN_195__(__NFUN_196__(AimGridY, 0.707107), 0.292893)), __NFUN_194__(0.5), 0.5);
	AnimationController.SetAnimGridState('idle', X, Y);
	LastX = X;
	LastY = Y;
	return;
}

final function StartFreeLook()
{
	local Rotator R;
	local Vector V;

	R.Yaw = __NFUN_187__(65536);
	V = __NFUN_235__(FreeLookSpeed, __NFUN_263__(__NFUN_232__(1, 0, 0), R));
	FreeX = V.X;
	FreeY = V.Y;
	AimGridX = LastX;
	AimGridY = LastY;
	return;
}

final function StartBlinkTimer()
{
	__NFUN_605__(__NFUN_225__(__NFUN_226__(BlinkTime, BlinkVariance), 0), false, 'bLink');
	return;
}

final function CancelBlinkTimer()
{
	__NFUN_606__('bLink');
	__NFUN_606__('BlinkLightOn');
	return;
}

final function bLink()
{
	DecoActivity(0, 'bLink');
	BlinkStartTickTime = 0;
	StartBlinkTimer();
	return;
}

k2call simulated function LightSwitch()
{
	ForcePowerOff();
	__NFUN_605__(BlinkLightOffTime, false, 'BlinkLightOn');
	return;
}

final function BlinkLightOn()
{
	ForcePowerOn();
	return;
}

final function CalcLightRadius(float DeltaTime)
{
	local int i;

	BlinkStartTickTime = __NFUN_224__(__NFUN_198__(BlinkStartTickTime, DeltaTime), 1.67);
	i = __NFUN_166__(string(LightList), 1);
	J0x28:

	// End:0x5E [Loop If]
	if(__NFUN_172__(i, 0))
	{
		UpdateLightRadius(LightList[i], InitialLightRadius[i], DeltaTime);
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x28;
	}
	return;
}

final function UpdateLightRadius(LightEx Light, float FullRadius, float DeltaTime)
{
	local Color LightColor;

	// End:0x11
	if(__NFUN_200__(BlinkStartTickTime, 0))
	{
		return;
	}
	// End:0xBA
	if(__NFUN_200__(BlinkStartTickTime, 1.36))
	{
		// End:0x5A
		if(__NFUN_200__(BlinkStartTickTime, 0.25))
		{
			Light.LightRadius = __NFUN_228__(__NFUN_196__(BlinkStartTickTime, 0.25), FullRadius, 0);			
		}
		else
		{
			// End:0xA2
			if(__NFUN_200__(BlinkStartTickTime, 0.4))
			{
				Light.LightRadius = __NFUN_228__(__NFUN_196__(__NFUN_199__(BlinkStartTickTime, 0.25), __NFUN_199__(0.4, 0.25)), 0, FullRadius);				
			}
			else
			{
				Light.LightRadius = FullRadius;
			}
		}		
	}
	else
	{
		// End:0x14A
		if(__NFUN_200__(BlinkStartTickTime, 1.67))
		{
			// End:0x111
			if(__NFUN_200__(BlinkStartTickTime, 1.5))
			{
				Light.LightRadius = __NFUN_228__(__NFUN_196__(__NFUN_199__(BlinkStartTickTime, 1.36), __NFUN_199__(1.5, 1.36)), FullRadius, 0);				
			}
			else
			{
				Light.LightRadius = __NFUN_228__(__NFUN_196__(__NFUN_199__(BlinkStartTickTime, 1.5), __NFUN_199__(1.67, 1.5)), 0, FullRadius);
			}			
		}
		else
		{
			Light.LightRadius = FullRadius;
			BlinkStartTickTime = -1;
		}
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(Lights_Generic).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1283__('idle', AnimationControllerClass, Mesh);
	return;
}

defaultproperties
{
	SensorRadius=250
	RechargeTime=5
	BlinkTime=10
	BlinkVariance=5
	FreeLookSpeed=0.75
	BlinkLightOffTime=0.5
	BlinkStartTickTime=-1
	DefaultBoneMount=mount_light
	AnimTriggers=/* Array type was not detected. */
}
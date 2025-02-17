/*******************************************************************************
 * dnParticleCreatureFX_SmallSwarm_Fly generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnParticleCreatureFX_SmallSwarm_Fly extends dnParticleCreatureFX
	collapsecategories
	hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

var transient float fNextDropTime;
var transient bool bDying;
var transient bool bDead;
var(SwarmDeath) noexport Sound ParticleDeathSound[4] "Sounds to play when a fly dies.";
var(SwarmDeath) noexport float ParticleDeathSoundVolume "Volume to play death sounds at.";
var(SwarmDeath) noexport float ParticleDeathSoundChance "Chance that a sound will play when a fly dies.  Range 0.0 - 1.0.";

function PostBeginPlay()
{
	__NFUN_362__('Tick');
	super(InteractiveActor).PostBeginPlay();
	return;
}

simulated function Tick(float fDeltaTime)
{
	local int i, n;
	local Particle P;

	super(Actor).Tick(fDeltaTime);
	// End:0x28
	if(__NFUN_145__(bDying))
	{
		bNoNativeTick = true;
		__NFUN_362__('Tick');
		return;
	}
	// End:0x43
	if(__NFUN_200__(Level.GameTimeSeconds, fNextDropTime))
	{
		return;
	}
	// End:0x61
	if(bDead)
	{
		__NFUN_362__('Tick');
		bNoNativeTick = true;
		__NFUN_614__();
		return;
	}
	// End:0x169
	if(__NFUN_146__(__NFUN_1036__(nMinFlockNumber, P), true))
	{
		P.Velocity.X = 0;
		P.Velocity.Y = 0;
		P.Velocity.Z = 0;
		P.Acceleration = PhysicsVolume.Gravity;
		__NFUN_209__(P.Acceleration.Z, __NFUN_198__(__NFUN_195__(__NFUN_222__(), 300), float(450)));
		__NFUN_1037__(nMinFlockNumber, P);
		SoundVolume = byte(__NFUN_195__(float(255), __NFUN_199__(1, __NFUN_196__(float(nMinFlockNumber), float(HighestParticleNumber)))));
		n = __NFUN_163__(int(__NFUN_195__(__NFUN_222__(), 100)), 25);
		// End:0x169
		if(__NFUN_148__(__NFUN_340__(ParticleDeathSound[n], none), __NFUN_200__(__NFUN_222__(), ParticleDeathSoundChance)))
		{
			__NFUN_697__(1, ParticleDeathSound[n], 1,,,, ParticleDeathSoundVolume);
		}
	}
	__NFUN_184__(nMinFlockNumber);
	// End:0x21F
	if(__NFUN_172__(nMinFlockNumber, HighestParticleNumber))
	{
		AlphaStart = 1;
		AlphaEnd = 0;
		bUseAlphaRamp = false;
		SoundVolume = 0;
		i = 0;
		J0x1AC:

		// End:0x1F8 [Loop If]
		if(__NFUN_169__(i, HighestParticleNumber))
		{
			// End:0x1EE
			if(__NFUN_146__(__NFUN_1036__(i, P), true))
			{
				P.Lifetime = 3;
				P.RemainingLifetime = 3;
			}
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0x1AC;
		}
		bDead = true;
		fNextDropTime = __NFUN_198__(3.1, Level.GameTimeSeconds);		
	}
	else
	{
		fNextDropTime = __NFUN_198__(__NFUN_198__(__NFUN_195__(__NFUN_222__(), 0.2), 0.05), Level.GameTimeSeconds);
	}
	return;
}

simulated function KillSwarm()
{
	// End:0x0E
	if(__NFUN_146__(bDead, true))
	{
		return;
	}
	UseZoneGravity = true;
	ParticlesCollideWithWorld = true;
	__NFUN_361__('Tick');
	bNoNativeTick = false;
	nMinFlockNumber = 0;
	fNextDropTime = Level.GameTimeSeconds;
	bDying = true;
	bDead = false;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local int i;

	super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
	i = 0;
	J0x12:

	// End:0x40 [Loop If]
	if(__NFUN_169__(i, 4))
	{
		PrecacheIndex.__NFUN_1274__(ParticleDeathSound[i]);
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x12;
	}
	return;
}

defaultproperties
{
	ParticleDeathSound[0]='a_ambient.Insects.FlyDie01'
	ParticleDeathSound[1]='a_ambient.Insects.FlyDie01'
	ParticleDeathSound[2]='a_ambient.Insects.FlyDie01'
	ParticleDeathSound[3]='a_ambient.Insects.FlyDie01'
	ParticleDeathSoundVolume=0.75
	ParticleDeathSoundChance=0.3
	Enabled=false
	bBoundParticles=true
	RelativeLocation=true
	UseZoneGravity=false
	PrimeCount=32
	PrimeTimeIncrement=0
	SpawnNumber=0
	SpawnPeriod=0
	MaximumParticles=32
	Lifetime=0
	InitialVelocity=(X=1.291857E-41,Y=2.797242E-17,Z=0)
	MaxVelocityVariance=(X=1.291857E-41,Y=2.797242E-17,Z=0)
	BounceElasticity=0
	FlockToCenterVelocity=49
	FlockCenterWeight=32
	Textures=/* Array type was not detected. */
	SpawnCount=/* Unknown default property type! */
	ParticleAmbientLight=(B=85,G=1,R=1,A=32)
	bUnlit=false
	bCollideActors=true
	CollisionRadius=16
	CollisionHeight=16
	Style=2
	SoundVolume=48
	SoundRadius=256
	SoundInnerRadius=128
	AmbientSound='a_ambient.Insects.Flies01'
}
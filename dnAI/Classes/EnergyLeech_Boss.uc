/*******************************************************************************
 * EnergyLeech_Boss generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class EnergyLeech_Boss extends AIActor_Boss
	config
	dependson(EnergyLeech_Boss_Gib)
	dependson(EnergyLeech_HelperCollision)
	dependson(EnergyLeech_HelperCollision_Body);

var() noexport deprecated name StartBattleTag "Call to activate the leech and begin the boss battle";
var() noexport deprecated name StrengthTapModeTag "Trigger this to begin strength tap mode.";
var() noexport deprecated name StrengthTapCompleteEvent "This event will be triggered when strength tap is complete.";
var() noexport deprecated name SlamAttackTag "Trigger this to force a slam attack";
var() noexport deprecated name SlamAttackCompleteEvent "This event will be triggered whenever a slam attack is complete.";
var() noexport deprecated name BiteAttackTag "Trigger this to force a bite attack";
var() noexport deprecated name BiteAttackCompleteEvent "This event will be triggered whenever a bite attack is complete.";
var() noexport deprecated name SpitAttackTag "Trigger this to force a spit attack";
var() noexport deprecated name SpitMultiAttackTag "Trigger this to force multiple spit attacks in succession";
var() noexport deprecated name SpitAttackCompleteEvent "This event will be triggered whenever a spit attack is complete.";
var() noexport float FunnelFadeInTime "Time it takes for suck funnel to fade in.";
var() noexport float FunnelFadeOutTime "Time it takes for suck funnel to fade out.";
var() noexport deprecated name SuckModeTag "Trigger this to begin suction attack.";
var() noexport deprecated name SuckModeStartEvent "This event will be triggered when the suck event starts";
var() noexport deprecated name SuckModeLoopEvent "This event will be triggered when the suck event begins playing the looping sucking animation";
var() noexport deprecated name SuckModeEndEvent "This event will be triggered when the suck event begins playing is end sucking animation";
var() noexport deprecated name SuckModeCompleteEvent "This event will be triggered when the suck event is completely done";
var float FullHealth;
var() noexport float Stage2_Health "Stage2 starts when he has this much health.";
var() noexport float Stage3_Health "Stage3 starts when he has this much health.";
var() noexport float RecoveryHealth "How much health to come back with after stunned state if it fails.";
var() noexport float RecoveryTime "How long it takes to recover from the stunned state.";
var() Object Stage2_RenderObject;
var() Object Stage3_RenderObject;
var bool SwapStage2AtAnimEnd;
var bool SwapStage3AtAnimEnd;
var float BestDamage;
var dnControl BattleControl;
var SMountPrefab BattleControlMountPrefab;
var Biology_Generic_EnergyLeech_SuctionFunnel Funnel;
var Actor AimFromActor;
var Actor AimFromActorPitch;
var Actor SpawnProjActor;
var AimAssist_Enemy_Decoration AimAssistDeco;
var EnergyLeech_Boss_HurtRadiusSensor TopHurtRadiusActor;
var EnergyLeech_HelperCollision HelperCollision;
var EnergyLeech_HelperCollision_Body HelperCollision2;
var(EnergyLeech_Boss_Startup) noexport float StartupForcedIdleTime "How long to remain in idle state before attacking after the fight starts.";
var(EnergyLeech_Boss_Startup) noexport float StartupKnockbackForce "How Hard to knock back";
var float StartupGate;
var(EnergyLeech_Boss_BiteAttack) float BiteAttackMinInterval;
var(EnergyLeech_Boss_BiteAttack) noexport float BiteAttackIntialInterval "Time from start of fight before we can use bite attack";
var(EnergyLeech_Boss_BiteAttack) float BiteAttackDamage;
var(EnergyLeech_Boss_BiteAttack) float BiteAttackRadius;
var(EnergyLeech_Boss_BiteAttack) float BiteAttackMaxDistance;
var float BiteAttackGate;
var(EnergyLeech_Boss_SuckAttack) noexport float SuckAttackMinInterval "Minimum time between suck attacks. Does not prevent map side triggered sucks.";
var(EnergyLeech_Boss_SuckAttack) noexport float SuckAttackDamageToStop "How much damage the player has to do during the suck attack to stop it";
var(EnergyLeech_Boss_SuckAttack) noexport float SuckAttackPainInterval "Time in between pain anims in the suck attack";
var(EnergyLeech_Boss_SuckAttack) noexport float SuckAttackEffectInterval "Time in between each physics pull event of suck attack";
var float SuckAttackGate;
var float SuckPainGate;
var float SuckAttackDamageTaken;
var(EnergyLeech_Boss_SuckBiteAttack) noexport float SuckBiteAttackMaxRange "Max range at which biting can occur during suck attack.";
var(EnergyLeech_Boss_SuckBiteAttack) noexport float SuckBiteAttackMinInterval "Minimum time between bites during suck attack.";
var(EnergyLeech_Boss_SuckBiteAttack) noexport float SuckBiteAttackDamage "Damage of suck bite attack";
var(EnergyLeech_Boss_SuckBiteAttack) noexport float SuckBiteAttackRadius "Radius of suck bit attack";
var(EnergyLeech_Boss_SuckBiteAttack) noexport float SuckBiteAttackKnockback "How hard to knock player back";
var noexport float SuckBiteAttackGate "Minimum time between suck attacks. Does not prevent map side triggered sucks.";
var(EnergyLeech_Boss_SpitAttack) noexport float SpitAttackForceHeight "If player is this many units higher than us, force spit attack";
var(EnergyLeech_Boss_SpitAttack) noexport int SpitAttackMultiCount "How many consecutive spits to do when we do multi spits.";
var(EnergyLeech_Boss_SpitAttack) noexport float SpitAttackDefaultSpeed "How fast the projectiles go during single shots.";
var(EnergyLeech_Boss_SpitAttack) noexport float SpitAttackMultiSpeed "How fast the projectiles go during multi shots.";
var(EnergyLeech_Boss_SpitAttack) noexport float SpitAttackDamage "Damage to use for the spit attack projectile.";
var int SpitAttackMultiCounter;
var(EnergyLeech_Boss_SlamAttack) name SlamAttackBone;
var(EnergyLeech_Boss_SlamAttack) float SlamAttackRadius;
var(EnergyLeech_Boss_SlamAttack) float SlamAttackDamage;
var(EnergyLeech_Boss_SlamAttack) SViewShakeInfo SlamAttackViewShake;
var(EnergyLeech_Boss_SlamAttack) bool SlamAttackDebug;
var(EnergyLeech_Boss_SlamAttack) Vector SlamAttackKnockbackVelocity;
var(EnergyLeech_Boss_SlamAttack) noexport float SlamAttackMinDistance "Min distance from leech to do slam attack. ie - if player is closer than this we dont do slam attacks";
var(EnergyLeech_Boss_SlamAttack) noexport float SlamAttackMaxDistance "Max distance from leech origin that we should try slam attack from";
var(EnergyLeech_Boss_SlamAttack) noexport float SlamAttackMinInterval "Minimum time in between slam attacks";
var float SlamAttackGate;
var class<SoftParticleSystem> SlamParticleSystem;
var Vector SlamEffectOffset;
var array<Actor> SlamAttackHurtRadiusActors;
var bool bAllowSlamAttackDamage;
var bool SlamRadiusCapped;
var name MeleeAnim;
var class<SoftParticleSystem> ExplosionParticleSystem;
var array<Object> GibRenderObjects;
var() noexport float StrengthTapTimeout "How much time the user has to complete the str tap once attached.";
var() float StrengthTapFailDamage;

simulated function PostBeginPlay()
{
	local Actor A;

	super.PostBeginPlay();
	Funnel = Biology_Generic_EnergyLeech_SuctionFunnel(FindMountedActor(, class'Biology_Generic_EnergyLeech_SuctionFunnel'));
	AimAssistDeco = AimAssist_Enemy_Decoration(FindMountedActor(, class'AimAssist_Enemy_Decoration'));
	TopHurtRadiusActor = EnergyLeech_Boss_HurtRadiusSensor(FindMountedActor('ProjectileSpawn'));
	HelperCollision = EnergyLeech_HelperCollision(FindMountedActor(, class'EnergyLeech_HelperCollision'));
	HelperCollision2 = EnergyLeech_HelperCollision_Body(FindMountedActor(, class'EnergyLeech_HelperCollision_Body'));
	// End:0x95
	if(__NFUN_340__(HelperCollision, none))
	{
		HelperCollision.__NFUN_621__(,,, false);
	}
	// End:0xB2
	if(__NFUN_340__(HelperCollision2, none))
	{
		HelperCollision2.__NFUN_621__(,,, false);
	}
	AimFromActor = FindMountedActor('AimFrom');
	AimFromActorPitch = FindMountedActor('AimFromPitch');
	SpawnProjActor = FindMountedActor('ProjectileSpawn');
	// End:0x10E
	foreach __NFUN_753__(class'Actor', A, 'HurtRadiusActor')
	{
		SlamAttackHurtRadiusActors[SlamAttackHurtRadiusActors.Add(1)] = A;		
	}	
	__NFUN_718__('BeginStrengthTap', StrengthTapModeTag);
	__NFUN_718__('ForceSlamAttack', SlamAttackTag);
	__NFUN_718__('ForceSuckAttack', SuckModeTag);
	__NFUN_718__('ForceBiteAttack', BiteAttackTag);
	__NFUN_718__('ForceSpitAttack', SpitAttackTag);
	__NFUN_718__('ForceSpitMultiAttack', SpitMultiAttackTag);
	__NFUN_718__('StartBattle', StartBattleTag);
	SuckAttackGate = __NFUN_198__(Level.GameTimeSeconds, SuckAttackMinInterval);
	// End:0x1FE
	if(__NFUN_342__(StartBattleTag, 'None'))
	{
		bNoDamage = true;
		__NFUN_590__(true);
		StoreCollision();
		__NFUN_621__(false, false, false, false, false);
		TickStyle = 0;
		AimAssistDeco.bIgnoreAimAssist = true;
		AimAssistDeco.StoreCollision();
		AimAssistDeco.__NFUN_621__(false, false, false, false, false);
		DisableCollisionHelpers();
		StopProcAiming();
		stopheadaim();
	}
	FullHealth = Health;
	Instigator = self;
	return;
}

event Tick(float DeltaSeconds)
{
	super(Actor).Tick(DeltaSeconds);
	DoProcAiming(DeltaSeconds);
	CheckSuckBiteAttack(DeltaSeconds);
	return;
}

simulated event float GetHealthMeterPercent()
{
	return __NFUN_196__(Health, FullHealth);
	return;
}

final simulated function TriggerFunc_StartBattle()
{
	PlayIntro();
	return;
}

function PlayDefaultSpawnAnim()
{
	PlayAnim('EnergyLeech_Intro');
	return;
}

function Vector GetPitchAimFromLocation()
{
	return AimFromActorPitch.Location;
	return;
}

function Vector GetYawAimFromLocation()
{
	return AimFromActor.Location;
	return;
}

final simulated function TriggerFunc_BeginStrengthTap()
{
	__NFUN_832__(0);
	DiedActivity();
	return;
}

final simulated function TriggerFunc_ForceBiteAttack()
{
	bForceMelee = true;
	MeleeAnim = 'Anim_Bite';
	CanUseOp(92);
	CurrentOpMustFinish = false;
	ExecuteOp(92);
	CurrentOpMustFinish = true;
	SuspendExecutive(true);
	SuspendExecutive(false);
	SetExecutive(2);
	return;
}

final simulated function TriggerFunc_ForceSlamAttack()
{
	bForceMelee = true;
	// End:0x25
	if(__NFUN_200__(Health, Stage2_Health))
	{
		MeleeAnim = 'Anim_AttackDouble';		
	}
	else
	{
		MeleeAnim = 'Anim_AttackSingle';
	}
	CanUseOp(92);
	CurrentOpMustFinish = false;
	ExecuteOp(92);
	CurrentOpMustFinish = true;
	SuspendExecutive(true);
	SuspendExecutive(false);
	SetExecutive(2);
	return;
}

final simulated function TriggerFunc_ForceSuckAttack()
{
	// End:0x0B
	if(bNoDamage)
	{
		return;
	}
	CanUseOp(95);
	CurrentOpMustFinish = false;
	ExecuteOp(95);
	CurrentOpMustFinish = true;
	SuspendExecutive(true);
	SuspendExecutive(false);
	return;
}

event NotifyOpStarted(Engine.BaseAI.EAIOp NewOp, Engine.BaseAI.EAIOp OldOp)
{
	// End:0x35
	if(__NFUN_173__(int(NewOp), int(95)))
	{
		StopProcAiming();
		CurrentOpMustFinish = true;
		SuckAttackDamageTaken = 0;
		FindSoundAndSpeak('Sound_Vortex');		
	}
	else
	{
		// End:0x74
		if(__NFUN_173__(int(NewOp), int(92)))
		{
			// End:0x5E
			if(__NFUN_341__(MeleeAnim, 'Anim_Bite'))
			{
				CurrentOpMustFinish = true;				
			}
			else
			{
				FindSoundAndSpeak('Sound_Roar');
				CurrentOpMustFinish = false;
			}			
		}
		else
		{
			// End:0xE9
			if(__NFUN_173__(int(NewOp), int(23)))
			{
				StopProcAiming();
				TopHurtRadiusActor.SensorEnabled = false;
				AimAssistDeco.bIgnoreAimAssist = true;
				// End:0xC9
				if(__NFUN_340__(HelperCollision, none))
				{
					HelperCollision.__NFUN_621__(,,, true);
				}
				// End:0xE6
				if(__NFUN_340__(HelperCollision2, none))
				{
					HelperCollision2.__NFUN_621__(,,, true);
				}				
			}
			else
			{
				// End:0xFD
				if(__NFUN_173__(int(NewOp), int(117)))
				{
					startheadaim();
				}
			}
		}
	}
	return;
}

event NotifyOpEnded(Engine.BaseAI.EAIOp Op, Engine.BaseAI.EAIOpStatus Status)
{
	// End:0x65
	if(__NFUN_173__(int(Op), int(95)))
	{
		SuctionOff();
		StartProcAiming();
		// End:0x62
		if(__NFUN_148__(__NFUN_340__(Funnel, none), __NFUN_206__(Funnel.AlphaEnd, 0)))
		{
			Funnel.SetFunnelAlphaTarget(0, __NFUN_196__(FunnelFadeOutTime, 2));
		}		
	}
	else
	{
		// End:0xA9
		if(__NFUN_173__(int(Op), int(92)))
		{
			// End:0x93
			if(__NFUN_341__(MeleeAnim, 'Anim_Bite'))
			{
				GlobalTrigger(BiteAttackCompleteEvent, none, self);				
			}
			else
			{
				GlobalTrigger(SlamAttackCompleteEvent, none, self);
			}
			StartProcAiming();			
		}
		else
		{
			// End:0x11E
			if(__NFUN_173__(int(Op), int(23)))
			{
				StrengthTapEnded();
				TopHurtRadiusActor.SensorEnabled = true;
				AimAssistDeco.bIgnoreAimAssist = false;
				// End:0xFE
				if(__NFUN_340__(HelperCollision, none))
				{
					HelperCollision.__NFUN_621__(,,, false);
				}
				// End:0x11B
				if(__NFUN_340__(HelperCollision2, none))
				{
					HelperCollision2.__NFUN_621__(,,, false);
				}				
			}
			else
			{
				// End:0x154
				if(__NFUN_173__(int(Op), int(117)))
				{
					GlobalTrigger(SpitAttackCompleteEvent, none, self);
					// End:0x14E
					if(__NFUN_170__(SpitAttackMultiCounter, 0))
					{
						__NFUN_185__(SpitAttackMultiCounter);						
					}
					else
					{
						stopheadaim();
					}
				}
			}
		}
	}
	return;
}

event NotifyMultiAnimStop()
{
	SuctionOff();
	return;
}

function Anim_SuckAttackLoopStarted()
{
	SuctionOn();
	return;
}

function SuctionOn()
{
	GlobalTrigger(SuckModeStartEvent, none, self);
	// End:0x33
	if(__NFUN_340__(Funnel, none))
	{
		Funnel.SetFunnelAlphaTarget(1, FunnelFadeInTime);
	}
	return;
}

function SuctionOff()
{
	GlobalTrigger(SuckModeCompleteEvent, none, self);
	FindAndStopSound('Sound_Vortex', 3);
	// End:0x40
	if(__NFUN_340__(Funnel, none))
	{
		Funnel.SetFunnelAlphaTarget(0, FunnelFadeOutTime);
	}
	return;
}

k2call simulated function unhide(optional EventInfo EventParms)
{
	bNoDamage = false;
	__NFUN_590__(false);
	RestoreCollision();
	EnableCollisionHelpers();
	AimAssistDeco.RestoreCollision();
	BiteAttackGate = __NFUN_198__(Level.GameTimeSeconds, BiteAttackIntialInterval);
	StartupGate = __NFUN_198__(Level.GameTimeSeconds, StartupForcedIdleTime);
	FindSoundAndSpeak('Sound_Roar');
	return;
}

final function PlayIntro()
{
	TickStyle = 2;
	SetAnimPresets(0, 'EnergyLeech_Intro', true, -1, none, __NFUN_232__(0, 0, 0), 0);
	CanUseOp(6);
	ExecuteOp(6);
	CurrentOpMustFinish = true;
	SuspendExecutive(true);
	SuspendExecutive(false);
	SetExecutive(2);
	AnimPreset.UseExactAnimName = false;
	// End:0xA7
	if(__NFUN_340__(Level.__NFUN_1161__(), none))
	{
		__NFUN_249__(Level.__NFUN_1161__().GameplayDesiredPhysicsVelocity, __NFUN_234__(Vector(Rotation), StartupKnockbackForce));
	}
	return;
}

final function IntroComplete()
{
	AimAssistDeco.bIgnoreAimAssist = false;
	StartProcAiming();
	startheadaim();
	return;
}

function Engine.BaseAI.EAICode COND_ShouldPlayStartupIdle()
{
	// End:0x1C
	if(__NFUN_201__(StartupGate, Level.GameTimeSeconds))
	{
		return 0;
	}
	return 2;
	return;
}

event name GetShootProjectileAnimName()
{
	// End:0x11
	if(__NFUN_170__(SpitAttackMultiCounter, 0))
	{
		return 'Anim_ShootProjectileFast';
	}
	return 'Anim_ShootProjectile';
	return;
}

k2call simulated function ShootProjectile(optional EventInfo AnimEventInfo)
{
	ProjectileClass.default.Damage = SpitAttackDamage;
	// End:0x38
	if(__NFUN_170__(SpitAttackMultiCounter, 0))
	{
		ProjectileClass.default.Speed = SpitAttackMultiSpeed;		
	}
	else
	{
		ProjectileClass.default.Speed = SpitAttackDefaultSpeed;
	}
	FindSoundAndSpeak('Sound_ShootSpike');
	super(AIActor).ShootProjectile(AnimEventInfo);
	return;
}

function GetMuzzleMountLocation(name MuzzleName, out Vector MuzzlePos, out Rotator MuzzleRot)
{
	MuzzlePos = SpawnProjActor.Location;
	// End:0x48
	if(PrimaryTarget.IsValidTarget())
	{
		MuzzleRot = Rotator(__NFUN_253__(__NFUN_239__(PrimaryTarget.GetAimPos(), MuzzlePos)));
	}
	return;
}

function Engine.BaseAI.EAICode COND_ShouldForceSpit()
{
	local float DeltaZ;

	// End:0x26
	if(__NFUN_150__(__NFUN_145__(PrimaryTarget.IsValidTarget()), __NFUN_339__(PrimaryTargetActor, none)))
	{
		return 4;
	}
	DeltaZ = __NFUN_199__(PrimaryTargetActor.Location.Z, Location.Z);
	// End:0x78
	if(__NFUN_201__(DeltaZ, SpitAttackForceHeight))
	{
		// End:0x75
		if(__NFUN_200__(Health, Stage3_Health))
		{
			SpitAttackMultiCounter = SpitAttackMultiCount;
		}
		return 0;
	}
	return 1;
	return;
}

function Engine.BaseAI.EAICode COND_ShouldSpitAttack()
{
	// End:0x1A
	if(__NFUN_200__(Health, Stage3_Health))
	{
		SpitAttackMultiCounter = SpitAttackMultiCount;
	}
	return 0;
	return;
}

function Engine.BaseAI.EAICode COND_ShouldKeepSpitting()
{
	// End:0x16
	if(__NFUN_170__(SpitAttackMultiCounter, 0))
	{
		ForceShootProjectile = true;
		return 0;
	}
	return 1;
	return;
}

function Engine.BaseAI.EAICode COND_ShouldSuckAttack()
{
	local Engine.BaseAI.EAICode Code;

	// End:0x12
	if(__NFUN_201__(Health, Stage3_Health))
	{
		return 1;
	}
	// End:0x2E
	if(__NFUN_201__(SuckAttackGate, Level.GameTimeSeconds))
	{
		return 2;
	}
	SuckAttackGate = __NFUN_198__(Level.GameTimeSeconds, SuckAttackMinInterval);
	return 0;
	return;
}

function CheckSuckBiteAttack(float DeltaSeconds)
{
	// End:0x34
	if(__NFUN_150__(__NFUN_150__(__NFUN_174__(int(CurrentOp), int(95)), __NFUN_174__(MultiAnimMode, 1)), __NFUN_145__(PrimaryTarget.IsValidTarget())))
	{
		return;
	}
	// End:0x4F
	if(__NFUN_201__(SuckBiteAttackGate, Level.GameTimeSeconds))
	{
		return;
	}
	// End:0x6B
	if(__NFUN_201__(PrimaryTarget.GetDist(), SuckBiteAttackMaxRange))
	{
		return;
	}
	SuckBiteAttackGate = __NFUN_198__(Level.GameTimeSeconds, SuckBiteAttackMinInterval);
	SuctionOff();
	MultiAnimMode = -1;
	ExitAIState(2, "Animation Fininshed");
	MultiAnimMode = 1;
	CanUseState_Anim('Anim_SuckBite', false, -1);
	ExecuteState_Anim();
	return;
}

k2call simulated function SuckBite(optional EventInfo EventParms)
{
	local Actor HurtRadiusActor;
	local Vector SuckBiteAttackOrigin;
	local PlayerPawn P;

	FindSoundAndSpeak('Sound_Bite');
	HurtRadiusActor = SlamAttackHurtRadiusActors[__NFUN_166__(string(SlamAttackHurtRadiusActors), 1)];
	SuckBiteAttackOrigin = HurtRadiusActor.Location;
	SlamRadiusCapped = false;
	HurtRadius(SuckBiteAttackDamage, SuckBiteAttackOrigin, SuckBiteAttackRadius, SuckBiteAttackRadius, class'CrushingDamage');
	P = PlayerPawn(PrimaryTargetActor);
	// End:0x96
	if(__NFUN_340__(P, none))
	{
		__NFUN_249__(P.GameplayDesiredPhysicsVelocity, __NFUN_234__(Vector(Rotation), SuckBiteAttackKnockback));
	}
	return;
}

function Engine.BaseAI.EAICode COND_ShouldBiteAttack()
{
	local Engine.BaseAI.EAICode Code;

	// End:0x1C
	if(__NFUN_201__(BiteAttackGate, Level.GameTimeSeconds))
	{
		return 2;
	}
	Code = TargetInHorizRangeLimits(0, BiteAttackMaxDistance);
	// End:0x46
	if(__NFUN_174__(int(Code), int(0)))
	{
		return Code;
	}
	BiteAttackGate = __NFUN_198__(Level.GameTimeSeconds, BiteAttackMinInterval);
	bForceMelee = true;
	MeleeAnim = 'Anim_Bite';
	return 0;
	return;
}

k2call simulated function Biteattack(optional EventInfo AnimEventInfo)
{
	local Actor HurtRadiusActor, ClosestActor;
	local float DistSq, BestDistSq;
	local Vector BiteOrigin, Dir;
	local int i;

	FindSoundAndSpeak('Sound_Bite');
	__NFUN_568__();
	BestDistSq = 999999;
	SlamRadiusCapped = false;
	HurtRadiusActor = SlamAttackHurtRadiusActors[__NFUN_166__(string(SlamAttackHurtRadiusActors), 1)];
	BiteOrigin = HurtRadiusActor.Location;
	HurtRadius(BiteAttackDamage, BiteOrigin, BiteAttackRadius, BiteAttackRadius, class'CrushingDamage');
	// End:0xD8
	if(__NFUN_148__(__NFUN_340__(PrimaryTargetActor, none), PrimaryTargetActor.bIsPlayerPawn))
	{
		DistSq = __NFUN_252__(__NFUN_239__(HurtRadiusActor.Location, PrimaryTargetActor.Location));
		// End:0xD8
		if(__NFUN_200__(DistSq, BestDistSq))
		{
			BestDistSq = DistSq;
			ClosestActor = HurtRadiusActor;
		}
	}
	// End:0x118
	if(SlamAttackDebug)
	{
		__NFUN_672__(BiteOrigin, NewColorBytes(255, 255, 0), 5);
		__NFUN_674__(BiteOrigin, SlamAttackRadius, NewColorBytes(255, 0, 0), 5);
	}
	// End:0x170
	if(__NFUN_148__(__NFUN_340__(PrimaryTargetActor, none), PrimaryTargetActor.bIsPlayerPawn))
	{
		// End:0x155
		if(__NFUN_340__(ClosestActor, none))
		{
			SlamAttackViewShake.FalloffActor = ClosestActor;
		}
		PlayerPawn(PrimaryTargetActor).ShakeView(SlamAttackViewShake, false);
	}
	return;
}

simulated function bool CanHurtRadiusOther(Actor Other)
{
	// End:0x3B
	if(Other.bIsPlayerPawn)
	{
		// End:0x1E
		if(SlamRadiusCapped)
		{
			return false;
		}
		SlamRadiusCapped = true;
		PlayerPawn(Other).LightContactRumble();
	}
	return true;
	return;
}

k2call simulated function Slamattack(optional EventInfo AnimEventInfo)
{
	local Actor HurtRadiusActor, ClosestActor;
	local float DistSq, BestDistSq;
	local Vector Dir, SlamVelocity;
	local int i;

	DoSlamEffect();
	// End:0x35
	if(__NFUN_340__(Level.__NFUN_1161__(), none))
	{
		PlayerPawn(PrimaryTargetActor).ShakeView(SlamAttackViewShake, false);
	}
	return;
}

function Engine.BaseAI.EAICode COND_ShouldSlamAttack()
{
	local Engine.BaseAI.EAICode Code;

	// End:0x1C
	if(__NFUN_201__(SlamAttackGate, Level.GameTimeSeconds))
	{
		return 2;
	}
	Code = TargetInHorizRangeLimits(SlamAttackMinDistance, SlamAttackMaxDistance);
	// End:0x46
	if(__NFUN_174__(int(Code), int(0)))
	{
		return Code;
	}
	SlamAttackGate = __NFUN_198__(Level.GameTimeSeconds, SlamAttackMinInterval);
	bForceMelee = true;
	// End:0x87
	if(__NFUN_200__(Health, Stage2_Health))
	{
		MeleeAnim = 'Anim_AttackDouble';		
	}
	else
	{
		MeleeAnim = 'Anim_AttackSingle';
	}
	return 0;
	return;
}

function DoSlamEffect()
{
	local dnFriendFX_Spawners FriendActor;
	local Vector SpawnLocation;

	FriendActor = FindFriendSpawner(class<dnFriendFX_Spawners>(SlamParticleSystem));
	// End:0x73
	if(__NFUN_340__(FriendActor, none))
	{
		SpawnLocation = __NFUN_238__(SpawnProjActor.Location, SlamEffectOffset);
		FriendActor.__NFUN_645__(SpawnLocation);
		FriendActor.RemoteRole = ROLE_None;
		FriendActor.ExecuteEffect(true);
	}
	return;
}

k2call simulated function DeathSlam(optional EventInfo AnimEventInfo)
{
	DoSlamEffect();
	return;
}

k2call simulated function EnableSlamAttackDamage(optional EventInfo AnimEventInfo)
{
	bAllowSlamAttackDamage = true;
	// End:0x35
	if(SlamAttackDebug)
	{
		BroadcastLog(__NFUN_302__(string(self), ":EnableSlamAttackDamage"));
	}
	return;
}

k2call simulated function DisableSlamAttackDamage(optional EventInfo AnimEventInfo)
{
	bAllowSlamAttackDamage = false;
	// End:0x36
	if(SlamAttackDebug)
	{
		BroadcastLog(__NFUN_302__(string(self), ":DisableSlamAttackDamage"));
	}
	return;
}

final simulated function StrengthTapBegin()
{
	bUsable = true;
	bNoDamage = true;
	FadeOverlayEffect(1, 0);
	FadeOverlayEffect(1, 1);
	DisableCollisionHelpers();
	return;
}

final simulated function StrengthTapEnded()
{
	FadeOverlayEffect(0, 1);
	GlobalTrigger(StrengthTapCompleteEvent, none, self);
	return;
}

final simulated function StrengthTapRecovered()
{
	EnableCollisionHelpers();
	SetHealthCap(RecoveryHealth);
	__NFUN_832__(RecoveryHealth);
	FadeOverlayEffect(0, 1);
	bUsable = false;
	bNoDamage = false;
	return;
}

function bool ShouldUseDieOp(class<DamageType> DamageType)
{
	return true;
	return;
}

event AttachControlX(dnControl MyControl)
{
	MyControl.__NFUN_633__(BattleControlMountPrefab, self);
	BattleControl = MyControl;
	StrengthTapBegin();
	return;
}

simulated event Used(Actor Other, Pawn EventInstigator)
{
	super(AIActor).Used(Other, EventInstigator);
	// End:0x62
	if(__NFUN_340__(BattleControl, none))
	{
		__NFUN_606__('Recover');
		BattleControl.bUsable = true;
		BattleControl.Used(Other, EventInstigator);
		BattleControl.bUsable = false;
	}
	return;
}

function EndControlX_UserFailed()
{
	return;
}

function EndControlX_UserSuccess()
{
	return;
}

simulated function bool CanBeUsedBy(Pawn P)
{
	return false;
	return;
}

simulated event bool ShouldDrawHUDInfoUsePhrase(Pawn TestPawn)
{
	return false;
	return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	// End:0x9B
	if(__NFUN_148__(__NFUN_173__(int(CurrentOp), int(95)), __NFUN_203__(SuckAttackDamageTaken, 0)))
	{
		__NFUN_209__(SuckAttackDamageTaken, Damage);
		// End:0x9B
		if(__NFUN_170__(MultiAnimMode, 0))
		{
			// End:0x50
			if(__NFUN_203__(SuckAttackDamageTaken, SuckAttackDamageToStop))
			{
				CurrentOpMustFinish = false;				
			}
			else
			{
				// End:0x9B
				if(__NFUN_173__(MultiAnimMode, 1))
				{
					// End:0x9B
					if(__NFUN_200__(SuckPainGate, Level.GameTimeSeconds))
					{
						SuckPainGate = __NFUN_198__(Level.GameTimeSeconds, SuckAttackPainInterval);
						PlayAnim('Anim_SuckPain');
					}
				}
			}
		}
	}
	// End:0xCD
	if(__NFUN_148__(__NFUN_201__(Health, Stage2_Health), __NFUN_202__(__NFUN_199__(Health, Damage), Stage2_Health)))
	{
		SwapStage2AtAnimEnd = true;		
	}
	else
	{
		// End:0xFC
		if(__NFUN_148__(__NFUN_201__(Health, Stage3_Health), __NFUN_202__(__NFUN_199__(Health, Damage), Stage3_Health)))
		{
			SwapStage3AtAnimEnd = true;
		}
	}
	super(Pawn).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	return;
}

simulated event bool UpdateHoldingBreath()
{
	return true;
	return;
}

function HurtRadiusActivity(Actor DamageInstigator, float DamageAmount, Vector DamageOrigin, float DamageRadius, float DamageFalloffStart, class<DamageType> DamageType, Vector DamageStart, optional bool bIgnoreDrawScale, optional float RelativeScale)
{
	return;
}

k2call simulated function AllowPain(optional EventInfo EventParms)
{
	CurrentOpMustFinish = false;
	return;
}

k2call simulated function nopain(optional EventInfo EventParms)
{
	CurrentOpMustFinish = true;
	return;
}

final simulated function NoteSensorDamaged(float Damage)
{
	BestDamage = __NFUN_225__(BestDamage, Damage);
	__NFUN_607__(1E-06, false, 'ApplyBestDamage');
	return;
}

final simulated function ApplyBestDamage()
{
	TakeDamage(Level.__NFUN_1161__(), BestDamage, Location, __NFUN_232__(1, 0, 0), class'ExplosionDamage');
	BestDamage = 0;
	return;
}

function DoExplosionEffects()
{
	local dnFriendFX_Spawners FriendActor;
	local Vector SpawnLocation;

	FriendActor = FindFriendSpawner(class<dnFriendFX_Spawners>(ExplosionParticleSystem));
	// End:0x6C
	if(__NFUN_340__(FriendActor, none))
	{
		SpawnLocation = SpawnProjActor.Location;
		FriendActor.__NFUN_645__(SpawnLocation);
		FriendActor.RemoteRole = ROLE_None;
		FriendActor.ExecuteEffect(true);
	}
	return;
}

function SpawnGibs()
{
	local int i;
	local Rotator Rot;
	local EnergyLeech_Boss_Gib NewGib;

	i = 0;
	J0x07:

	// End:0xE3 [Loop If]
	if(__NFUN_169__(i, string(GibRenderObjects)))
	{
		NewGib = __NFUN_615__(class'EnergyLeech_Boss_Gib', self,, Location);
		NewGib.__NFUN_595__(GibRenderObjects[i]);
		NewGib.__NFUN_621__(true, true, true, true, true);
		NewGib.__NFUN_642__(18);
		NewGib.__NFUN_817__();
		Rot = Rotation;
		__NFUN_180__(Rot.Yaw, __NFUN_166__(__NFUN_187__(16384), 8192));
		__NFUN_180__(Rot.Pitch, __NFUN_166__(__NFUN_187__(16384), 8192));
		NewGib.__NFUN_819__(__NFUN_234__(Vector(Rot), 1000000));
		NewGib.__NFUN_821__(__NFUN_234__(__NFUN_255__(), 50000));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	Rot = Rotation;
	Rot.Pitch = 16384;
	NewGib = __NFUN_615__(class'EnergyLeech_Boss_Gib_Tail', self,, Location, Rot);
	NewGib.__NFUN_621__(true, true, true, true, true);
	NewGib.__NFUN_642__(18);
	NewGib.__NFUN_817__();
	return;
}

event Die(optional Pawn Killer, optional int Damage, optional Vector DamageOrigin, optional Vector DamageDirection, optional class<DamageType> DamageType, optional name HitBoneName)
{
	FindSoundAndSpeak('Sound_Executed');
	super(AIActor).Die(Killer, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName);
	return;
}

function AIActor_AnimEnd(int nChannel, name AnimName, int nRefId)
{
	// End:0x11
	if(__NFUN_173__(nChannel, 0))
	{
		CheckDamageStateMeshSwap();
	}
	super(AIActor).AIActor_AnimEnd(nChannel, AnimName, nRefId);
	return;
}

function CheckDamageStateMeshSwap()
{
	// End:0x22
	if(SwapStage2AtAnimEnd)
	{
		__NFUN_595__(Stage2_RenderObject);
		SwapStage2AtAnimEnd = false;
		Anim_Idle();
		__NFUN_842__();
	}
	// End:0x44
	if(SwapStage3AtAnimEnd)
	{
		__NFUN_595__(Stage3_RenderObject);
		SwapStage3AtAnimEnd = false;
		Anim_Idle();
		__NFUN_842__();
	}
	return;
}

event name GetMeleeAttackAnimName()
{
	// End:0x14
	if(__NFUN_173__(int(CurrentOp), int(95)))
	{
		return 'Anim_SuckBite';
	}
	return MeleeAnim;
	return;
}

function EnableCollisionHelpers()
{
	local EnergyLeech_Boss_HurtRadiusSensor Sensor;

	// End:0x23
	foreach __NFUN_753__(class'EnergyLeech_Boss_HurtRadiusSensor', Sensor)
	{
		Sensor.SensorEnabled = true;		
	}	
	return;
}

function DisableCollisionHelpers()
{
	local EnergyLeech_Boss_HurtRadiusSensor Sensor;

	// End:0x23
	foreach __NFUN_753__(class'EnergyLeech_Boss_HurtRadiusSensor', Sensor)
	{
		Sensor.SensorEnabled = false;		
	}	
	return;
}

function SensedPlayer(EnergyLeech_Boss_HurtRadiusSensor Sensor, PlayerPawn P)
{
	// End:0x71
	if(bAllowSlamAttackDamage)
	{
		bAllowSlamAttackDamage = false;
		P.TakeDamage(self, SlamAttackDamage, Sensor.Location, __NFUN_253__(__NFUN_239__(P.Location, Sensor.Location)), class'CrushingDamage', 'None', Sensor.Location);
	}
	return;
}

k2call simulated function FailDamage(optional EventInfo AnimEventInfo)
{
	// End:0x87
	if(__NFUN_148__(__NFUN_340__(ControlXParms.MyControl, none), __NFUN_340__(ControlXParms.MyControl.User, none)))
	{
		ControlXParms.MyControl.User.TakeDamage(self, StrengthTapFailDamage, Location, __NFUN_253__(__NFUN_239__(ControlXParms.MyControl.User.Location, Location)), class'MeleeDamage_NoRumble');		
	}
	else
	{
		BroadcastLog(__NFUN_302__(__NFUN_303__(__NFUN_302__(__NFUN_303__("Warning: Leech Boss unable to damage attached user.", "ControlXParms.MyControl="), string(ControlXParms.MyControl)), "ControlXParms.MyControl.User="), string(ControlXParms.MyControl.User)));
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local int i;

	super(Pawn).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(ExplosionParticleSystem);
	PrecacheIndex.__NFUN_1266__(class'EnergyLeech_Boss_Gib');
	PrecacheIndex.__NFUN_1266__(class'EnergyLeech_Boss_Gib_Tail');
	PrecacheIndex.__NFUN_1266__(SlamParticleSystem);
	PrecacheIndex.__NFUN_1266__(class'dnControl_EnergyLeech_Boss_BattleFinish');
	PrecacheIndex.__NFUN_1283__('Anim_Idle', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('Anim_AttackSingle', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('Anim_AttackDouble', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('Anim_Bite', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('Anim_SuckBite', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('Anim_SuckPain', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('Anim_ShootProjectile', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('Anim_ShootProjectileFast', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('Anim_SuctionStart0', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('Anim_SuctionLoop0', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('Anim_SuctionStop0', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('EnergyLeech_Pain_Center', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('EnergyLeech_Pain_Left', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('EnergyLeech_Pain_Right', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('EnergyLeech_Intro', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('EnergyLeech_Wounded_Loop_Begin', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('EnergyLeech_Wounded_Loop', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1283__('EnergyLeech_Wounded_Loop_End', class'acEnergyLeechBoss', Mesh);
	PrecacheIndex.__NFUN_1279__(class'CrushingDamage');
	PrecacheIndex.__NFUN_1279__(class'ExplosionDamage');
	PrecacheIndex.__NFUN_1267__(Primitive(Stage2_RenderObject));
	PrecacheIndex.__NFUN_1267__(Primitive(Stage3_RenderObject));
	i = __NFUN_166__(string(GibRenderObjects), 1);
	J0x2BE:

	// End:0x2F0 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		PrecacheIndex.__NFUN_1267__(Primitive(GibRenderObjects[i]));
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x2BE;
	}
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_Bite');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_Executed');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_FallDown');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_HoleRip_Short');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_Roar');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_ShootSpike');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_SlamImpact');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_TrueDeath');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_UnderWaterMove');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_Vortex');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_WBomb_CntDwn');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_Whoosh');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'EquipRuffle');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'Gen_Grunt');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'STR_FistLeech');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'STR_LeechHankyPanky');
	PrecacheIndex.__NFUN_1282__(class'acEnergyLeechBoss', Mesh);
	return;
}

event EnumerateUsableAnimationControllers(PrecacheIndex PrecacheIndex, out array<Engine.BaseAI.EAIAnimController> UsableControllers)
{
	UsableControllers[string(UsableControllers)] = 1;
	return;
}

state ControlX
{
	simulated function bool CanBeUsedBy(Pawn User)
	{
		return true;
		return;
	}

	simulated event Used(Actor Other, Pawn EventInstigator)
	{
		super.Used(Other, EventInstigator);
		// End:0x5A
		if(__NFUN_340__(BattleControl, none))
		{
			BattleControl.bUsable = true;
			BattleControl.Used(Other, EventInstigator);
			BattleControl.bUsable = false;
		}
		return;
	}

	function EndControlX_Died()
	{
		StrengthTapEnded();
		super.EndControlX_Died();
		return;
	}

	function EndControlX_Lived()
	{
		StrengthTapRecovered();
		super.EndControlX_Lived();
		return;
	}

	function TimeOutControlX()
	{
		StrengthTapRecovered();
		super.TimeOutControlX();
		return;
	}

	function EndControlX_UserFailed()
	{
		EndControlX_Lived();
		return;
	}
	stop;
}

state AnimX
{
	function AIActor_AnimEnd(int nChannel, name AnimName, int nRefId)
	{
		// End:0x11
		if(__NFUN_173__(nChannel, 0))
		{
			CheckDamageStateMeshSwap();
		}
		super.AIActor_AnimEnd(nChannel, AnimName, nRefId);
		return;
	}
	stop;
}

defaultproperties
{
	FunnelFadeInTime=0.6
	FunnelFadeOutTime=0.6
	Stage2_Health=1000
	Stage3_Health=500
	RecoveryHealth=400
	RecoveryTime=15
	Stage2_RenderObject='c_characters.energyleech_damaged'
	Stage3_RenderObject='c_characters.energyleech_damaged_2'
	BattleControlMountPrefab=(bDontActuallyMount=true,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=-245.1414,Y=3.778814E-17,Z=-26.563),Z=-276.568)
	StartupForcedIdleTime=15
	StartupKnockbackForce=50000
	BiteAttackMinInterval=2.5
	BiteAttackIntialInterval=15
	BiteAttackDamage=50
	BiteAttackRadius=600
	BiteAttackMaxDistance=700
	SuckAttackMinInterval=40
	SuckAttackDamageToStop=150
	SuckAttackPainInterval=0.5
	SuckBiteAttackMaxRange=275
	SuckBiteAttackMinInterval=5
	SuckBiteAttackDamage=40
	SuckBiteAttackRadius=600
	SuckBiteAttackKnockback=10000
	SpitAttackForceHeight=100
	SpitAttackMultiCount=3
	SpitAttackDefaultSpeed=1000
	SpitAttackMultiSpeed=1400
	SpitAttackDamage=50
	SlamAttackBone=head_04
	SlamAttackRadius=200
	SlamAttackDamage=90
	SlamAttackViewShake=(bNoLerp=false,bToggleSign=true,Style=2,Function=1,FalloffActor=none,FalloffDistance=1000,ShakeDuration=0.6,ShakeFrequency=0.08,ShakeMagnitude=550,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=EnergyLeech_Boss_SlamShake)
	SlamAttackKnockbackVelocity=(X=1.298303E-41,Y=3.778866E-17,Z=0)
	SlamAttackMinDistance=500
	SlamAttackMaxDistance=1500
	SlamAttackMinInterval=6
	SlamParticleSystem='p_Creatures.EnergyLeech.LeechSlam_Spawner'
	SlamEffectOffset=(X=1.298303E-41,Y=3.773024E-17,Z=0)
	MeleeAnim=Anim_AttackSingle
	ExplosionParticleSystem='p_Creatures.EnergyLeech.LeechExplode_Spawner'
	GibRenderObjects(0)=ObjectProperty'AIActor.PrimaryTarget'
	Cond=114164198
	Ident[6]=/* Unknown default property type! */
}
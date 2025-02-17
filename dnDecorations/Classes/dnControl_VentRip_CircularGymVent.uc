/*******************************************************************************
 * dnControl_VentRip_CircularGymVent generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_VentRip_CircularGymVent extends dnControl_TapPowered
	collapsecategories;

const kStandardUsableExitIdx = 0;
const kRippedUsableExitIdx = 1;

var() noexport name PryLoopSoundName "VoicePack entry to play when we are being pryed open.  Should be bPlayAsAmbient = true.";
var dnControlHelper_CircularGymVent Vent;

event PostBeginPlay()
{
	local int i;

	super(dnUsableSomething).PostBeginPlay();
	Vent = dnControlHelper_CircularGymVent(FindMountedActor(, class'dnControlHelper_CircularGymVent'));
	// End:0x74
	if(__NFUN_340__(Vent, none))
	{
		Vent.__NFUN_595__(__NFUN_596__());
		i = __NFUN_166__(__NFUN_743__(), 1);
		J0x45:

		// End:0x74 [Loop If]
		if(__NFUN_172__(i, 0))
		{
			Vent.__NFUN_741__(i, __NFUN_740__(i));
			__NFUN_185__(i);
			// [Loop Continue]
			goto J0x45;
		}
	}
	return;
}

simulated function PlayMyAnim()
{
	// End:0x4F
	if(__NFUN_342__(States[CurrentStateIndex].MyAnim.Animation, 'None'))
	{
		Vent.AnimationController.SetAnimState(States[CurrentStateIndex].MyAnim.Animation);
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local int i;

	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, PryLoopSoundName);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'CircularGymVent_Bend');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'CircularGymVent_Break');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Sound_ElevatorNoise');
	PrecacheIndex.__NFUN_1281__('VentRip_CircularGymVent_Idle');
	i = __NFUN_166__(string(States), 1);
	J0x88:

	// End:0xC9 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		PrecacheIndex.__NFUN_1283__(States[i].MyAnim.Animation, class'acCircularGymVent', class'CircularVent_Cover');
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x88;
	}
	return;
}

state() AttachUserAnim
{
	event BeginState()
	{
		super(Object).BeginState();
		UserLiftVal = -1;
		// End:0x2E
		if(__NFUN_145__(bHidden))
		{
			__NFUN_590__(true);
			Vent.__NFUN_590__(false);
		}
		return;
	}
	stop;
}

state() idle
{
	event BeginState()
	{
		super(Object).BeginState();
		FindAndPlaySound(PryLoopSoundName);
		return;
	}

	function FullyLifted()
	{
		super(dnControl_TapPowered).FullyLifted();
		bUsable = false;
		ControlEvent(, 'RipVent');
		return;
	}

	function UpdateUserLift()
	{
		local float UserLiftPct;
		local Vector2D GridPt;

		// End:0x11
		if(__NFUN_204__(UserLiftVal, 1))
		{
			return;
		}
		User.AnimationController.SetAnimGridState('VentRip_CircularGymVent_Idle', UserLiftVal);
		Vent.AnimationController.SetAnimGridState('idle', UserLiftVal);
		SoundPitch = byte(__NFUN_195__(float(64), __NFUN_198__(1, __NFUN_195__(0.15, __NFUN_198__(UserLiftVal, 1)))));
		// End:0xC1
		if(__NFUN_204__(UserLiftVal, -1))
		{
			SoundVolume = byte(__NFUN_189__(0, __NFUN_166__(int(SoundVolume), int(__NFUN_195__(__NFUN_195__(4, Level.TimeDeltaSeconds), 255)))));			
		}
		else
		{
			SoundVolume = byte(__NFUN_188__(255, __NFUN_165__(int(SoundVolume), int(__NFUN_195__(__NFUN_195__(4, Level.TimeDeltaSeconds), 255)))));
		}
		return;
	}
	stop;
}

state() DetachUser
{
	event BeginState()
	{
		super(Object).BeginState();
		__NFUN_701__(none);
		return;
	}
	stop;
}

state() FinishRipVent
{
	event BeginState()
	{
		super(Object).BeginState();
		SetupControlRemapperForDetach();
		return;
	}

	event Tick(float DeltaSeconds)
	{
		super(dnControl).Tick(DeltaSeconds);
		// End:0x4D
		if(__NFUN_340__(AmbientSound, none))
		{
			SoundVolume = byte(__NFUN_189__(0, __NFUN_166__(int(SoundVolume), int(__NFUN_195__(__NFUN_195__(4, DeltaSeconds), 255)))));
			// End:0x4D
			if(__NFUN_173__(int(SoundVolume), 0))
			{
				__NFUN_701__(none);
			}
		}
		return;
	}
	stop;
}

defaultproperties
{
	PryLoopSoundName=SplitDoor_PryLoop
	bForceDrop=false
	RateOfGain=0.2
	TapUsePhrase="<?int?dnDecorations.dnControl_VentRip_CircularGymVent.TapUsePhrase?>"
	UserGruntSoundName=Gen_Grunt
}
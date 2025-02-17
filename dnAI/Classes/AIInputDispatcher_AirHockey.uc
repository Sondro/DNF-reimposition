/*******************************************************************************
 * AIInputDispatcher_AirHockey generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AIInputDispatcher_AirHockey extends AIInputDispatcher_Auto
	collapsecategories
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

var dnControl_AirHockeyPlayer HockeyCtler;
var float ShotGate;
var Vector Accel;
var Vector Vel;
var() bool Debug;
var(AirHockeySkill) noexport float MaxShotTime "Maximum time we take a shot over.  (Smaller values produce faster shots.)";
var(AirHockeySkill) noexport float MaxAccel "Maximum allowable magnitude of the grid acceleration.";
var(AirHockeySkill) noexport float MaxAccelVar "Random variance subtracted from MaxAccel to give it a bit of variety.";
var(AirHockeySkill) noexport float MaxVel "Maximum allowable magnitude of the grid velocity.";
var(AirHockeySkill) noexport Vector PullbackVel "Initial pullback velocity (before serve).";
var(AirHockeySkill) noexport Vector PullbackVelVar "Random vartiance added to the initial pullback velocity.";
var(AirHockeySkill) noexport float CenteringDisp "Accelerate towards the centre position with this factor of the current displacement from centre.";
var(AirHockeySkill) noexport float CenteringVel "Decelerate the grid motion by this factor of the current velocity when returning to centre.";

event Tick(float Secs)
{
	super.Tick(Secs);
	// End:0x27
	if(__NFUN_150__(__NFUN_339__(MyActor, none), __NFUN_339__(HockeyCtler, none)))
	{
		return;
	}
	// End:0x4A
	if(HockeyCtler.__NFUN_398__('Play'))
	{
		PlayAirHockey(Secs);		
	}
	else
	{
		Reset();
	}
	return;
}

function Reset()
{
	ShotGate = 0;
	Accel = __NFUN_232__(0, 0, 0);
	Vel = __NFUN_256__(PullbackVel, PullbackVelVar);
	return;
}

function StartDispatching()
{
	super.StartDispatching();
	HockeyCtler = dnControl_AirHockeyPlayer(MyActor.InteractiveDecoration);
	Reset();
	MyActor.HeadAimerRemoveTarget(true, 0.2);
	return;
}

function EndDispatching()
{
	super.EndDispatching();
	// End:0x19
	if(__NFUN_340__(HockeyCtler, none))
	{
		HockeyCtler = none;
	}
	MyActor.HeadAimerRemoveTarget(true, 0.2);
	return;
}

function ControlsStateChanged(name NewStateName)
{
	// End:0x61
	if(__NFUN_341__(NewStateName, 'Play'))
	{
		MyActor.HeadAimerAddTargetActor(HockeyCtler.Table.Puck, 'None', -1, 0.2, true, -1, MyActor.HeadTrackRate, false);		
	}
	else
	{
		MyActor.HeadAimerRemoveTarget(true, 0.2);
	}
	return;
}

function bool CalcShot()
{
	local float ShotTime, MaxAccelThisShot;

	// End:0xEA
	if(HockeyCtler.CalcShot(MaxShotTime, Accel, ShotTime, Debug))
	{
		ShotGate = __NFUN_198__(Level.GameTimeSeconds, ShotTime);
		Vel = __NFUN_232__(0, 0, 0);
		MaxAccelThisShot = __NFUN_199__(MaxAccel, __NFUN_224__(__NFUN_195__(__NFUN_222__(), MaxAccelVar), MaxAccel));
		// End:0xE8
		if(__NFUN_201__(__NFUN_252__(Accel), __NFUN_195__(MaxAccelThisShot, MaxAccelThisShot)))
		{
			// End:0xD4
			if(Debug)
			{
				BroadcastLog(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("Exceed Max Accel: (", string(__NFUN_251__(Accel))), "/"), string(MaxAccelThisShot)), ")"));
			}
			Accel = __NFUN_234__(__NFUN_253__(Accel), MaxAccelThisShot);
		}
		return true;
	}
	return false;
	return;
}

function PlayAirHockey(float Secs)
{
	local Vector AvgVel, EndVel;

	assert(__NFUN_340__(HockeyCtler, none));
	// End:0x99
	if(__NFUN_148__(__NFUN_201__(Level.GameTimeSeconds, ShotGate), __NFUN_145__(CalcShot())))
	{
		Accel = __NFUN_232__(__NFUN_198__(__NFUN_195__(__NFUN_194__(HockeyCtler.MouseInputX), CenteringDisp), __NFUN_195__(__NFUN_194__(Vel.X), CenteringVel)), __NFUN_198__(__NFUN_195__(__NFUN_194__(HockeyCtler.MouseInputY), CenteringDisp), __NFUN_195__(__NFUN_194__(Vel.Y), CenteringVel)), 0);
	}
	EndVel = __NFUN_238__(Vel, __NFUN_234__(Accel, Secs));
	AvgVel = __NFUN_235__(0.5, __NFUN_238__(Vel, EndVel));
	HockeyCtler.MouseInputX = __NFUN_227__(__NFUN_198__(HockeyCtler.MouseInputX, __NFUN_195__(AvgVel.X, Secs)), -1, 1);
	HockeyCtler.MouseInputY = __NFUN_227__(__NFUN_198__(HockeyCtler.MouseInputY, __NFUN_195__(AvgVel.Y, Secs)), -1, 1);
	// End:0x182
	if(__NFUN_203__(__NFUN_211__(HockeyCtler.MouseInputX), 1))
	{
		Accel.X = 0;
		EndVel.X = 0;
	}
	// End:0x1BD
	if(__NFUN_203__(__NFUN_211__(HockeyCtler.MouseInputY), 1))
	{
		Accel.Y = 0;
		EndVel.Y = 0;
	}
	MyActor.AnimationController.SetAnimGridState(HockeyCtler.AimGridName, HockeyCtler.MouseInputX, HockeyCtler.MouseInputY);
	Vel = EndVel;
	// End:0x27E
	if(__NFUN_201__(__NFUN_252__(Vel), __NFUN_195__(MaxVel, MaxVel)))
	{
		// End:0x26A
		if(Debug)
		{
			BroadcastLog(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("Exceeded MaxVel: (", string(__NFUN_251__(Vel))), "/"), string(MaxVel)), ")"));
		}
		Vel = __NFUN_234__(__NFUN_253__(Vel), MaxVel);
	}
	return;
}

defaultproperties
{
	MaxShotTime=0.1
	MaxAccel=90
	MaxAccelVar=50
	MaxVel=25
	PullbackVel=(X=1.298303E-41,Y=3.773024E-17,Z=-20)
	PullbackVelVar=(X=1.298303E-41,Y=3.778466E-17,Z=-5)
	CenteringDisp=20
	CenteringVel=1
}
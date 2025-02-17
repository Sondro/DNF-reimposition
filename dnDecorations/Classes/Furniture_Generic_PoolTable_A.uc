/*******************************************************************************
 * Furniture_Generic_PoolTable_A generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Furniture_Generic_PoolTable_A extends Furniture_Generic
	collapsecategories;

const BALLS_ON_TABLE = 16;

var() noexport bool bIncludeBalls "If this is false, the table won't auto-create and manage it's own balls. It'll just be a static table. This will remove all Details_Balls_PoolBall in MountOnSpawn.";
var() name SE_EightBall;
var() name SE_NineBall;
var() noexport name SE_WinEgoCapIncrease "Trigger this when the player wins at Pool to give a permanent ego cap increase.";
var Vector RackPoint;
var Vector CuePoint;
var float BallSize;
var float BallSpacing;
var float RackLine;
var array<Details_Balls_PoolBall> PoolBalls;
var array<Vector> PoolBallLocations;

function PreBeginPlay()
{
	__NFUN_718__('EightBall', SE_EightBall);
	__NFUN_718__('NineBall', SE_NineBall);
	__NFUN_718__('WinEgoCapIncrease', SE_WinEgoCapIncrease);
	super(dnDecoration).PreBeginPlay();
	return;
}

function PostVerifySelf()
{
	local int i;

	// End:0x59
	if(__NFUN_145__(bIncludeBalls))
	{
		i = 0;
		J0x12:

		// End:0x59 [Loop If]
		if(__NFUN_169__(i, string(MountOnSpawn)))
		{
			// End:0x4F
			if(__NFUN_357__(MountOnSpawn[i].SpawnClass, class'Details_Balls_PoolBall'))
			{
				MountOnSpawn[i].SpawnClass = none;
			}
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0x12;
		}
	}
	super(dnDecoration).PostVerifySelf();
	SetupBalls();
	return;
}

function SetupBalls()
{
	local int i;

	// End:0x204
	if(bIncludeBalls)
	{
		// End:0x5B
		if(__NFUN_173__(string(PoolBalls), 0))
		{
			PoolBalls.Insert(0, 16);
			i = 0;
			J0x25:

			// End:0x5B [Loop If]
			if(__NFUN_169__(i, 16))
			{
				PoolBalls[i] = Details_Balls_PoolBall(FindMountedActor(__NFUN_343__(string(i))));
				__NFUN_184__(i);
				// [Loop Continue]
				goto J0x25;
			}
		}
		PoolBalls[0].SetPoolBall(0);
		PoolBalls[1].SetPoolBall(1);
		PoolBalls[2].SetPoolBall(2);
		PoolBalls[3].SetPoolBall(3);
		PoolBalls[4].SetPoolBall(4);
		PoolBalls[5].SetPoolBall(5);
		PoolBalls[6].SetPoolBall(6);
		PoolBalls[7].SetPoolBall(7);
		PoolBalls[8].SetPoolBall(8);
		PoolBalls[9].SetPoolBall(9);
		PoolBalls[10].SetPoolBall(10);
		PoolBalls[11].SetPoolBall(11);
		PoolBalls[12].SetPoolBall(12);
		PoolBalls[13].SetPoolBall(13);
		PoolBalls[14].SetPoolBall(14);
		PoolBalls[15].SetPoolBall(15);
		__NFUN_246__(CuePoint, DrawScale);
		__NFUN_246__(RackPoint, DrawScale);
		BallSize = __NFUN_198__(PoolBalls[0].default.CollisionRadius, BallSpacing);
		RackLine = __NFUN_220__(__NFUN_199__(__NFUN_221__(__NFUN_195__(2, BallSize)), __NFUN_221__(BallSize)));
		RackTable_EightBall();
	}
	return;
}

function ShowComponents()
{
	local int i;

	ClearBalls();
	SetupBalls();
	i = 0;
	J0x13:

	// End:0x5C [Loop If]
	if(__NFUN_169__(i, 16))
	{
		PoolBalls[i].__NFUN_642__(18);
		PoolBalls[i].__NFUN_645__(PoolBallLocations[i]);
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x13;
	}
	super(InteractiveActor).ShowComponents();
	return;
}

function HideComponents()
{
	local int i;

	super(InteractiveActor).HideComponents();
	i = 0;
	J0x0D:

	// End:0x50 [Loop If]
	if(__NFUN_169__(i, 16))
	{
		PoolBalls[i].bCanExistOutOfWorld = true;
		PoolBalls[i].__NFUN_642__(0);
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x0D;
	}
	return;
}

final function RackTable_EightBall()
{
	local float RowOffset;

	// End:0x0E
	if(__NFUN_171__(string(PoolBalls), 0))
	{
		return;
	}
	ClearBalls();
	PoolBalls[0].ShowBall(self, CuePoint, 0, 0);
	PoolBalls[8].ShowBall(self, RackPoint, 0, __NFUN_195__(2, RackLine));
	RowOffset = __NFUN_195__(4, RackLine);
	PoolBalls[__NFUN_165__(__NFUN_187__(7), 1)].ShowBall(self, RackPoint, __NFUN_195__(4, BallSize), RowOffset);
	PoolBalls[__NFUN_165__(__NFUN_187__(7), 9)].ShowBall(self, RackPoint, __NFUN_195__(4, __NFUN_194__(BallSize)), RowOffset);
	PoolBalls[GetBall(15)].ShowBall(self, RackPoint, 0, 0);
	PoolBalls[GetBall(15)].ShowBall(self, RackPoint, BallSize, RackLine);
	PoolBalls[GetBall(15)].ShowBall(self, RackPoint, __NFUN_194__(BallSize), RackLine);
	RowOffset = __NFUN_195__(2, RackLine);
	PoolBalls[GetBall(15)].ShowBall(self, RackPoint, __NFUN_195__(2, BallSize), RowOffset);
	PoolBalls[GetBall(15)].ShowBall(self, RackPoint, __NFUN_195__(2, __NFUN_194__(BallSize)), RowOffset);
	RowOffset = __NFUN_195__(3, RackLine);
	PoolBalls[GetBall(15)].ShowBall(self, RackPoint, __NFUN_195__(3, BallSize), RowOffset);
	PoolBalls[GetBall(15)].ShowBall(self, RackPoint, BallSize, RowOffset);
	PoolBalls[GetBall(15)].ShowBall(self, RackPoint, __NFUN_194__(BallSize), RowOffset);
	PoolBalls[GetBall(15)].ShowBall(self, RackPoint, __NFUN_195__(3, __NFUN_194__(BallSize)), RowOffset);
	RowOffset = __NFUN_195__(4, RackLine);
	PoolBalls[GetBall(15)].ShowBall(self, RackPoint, __NFUN_195__(2, BallSize), RowOffset);
	PoolBalls[GetBall(15)].ShowBall(self, RackPoint, 0, RowOffset);
	PoolBalls[GetBall(15)].ShowBall(self, RackPoint, __NFUN_195__(2, __NFUN_194__(BallSize)), RowOffset);
	return;
}

final function RackTable_NineBall()
{
	local int i;
	local float RowOffset;

	// End:0x0E
	if(__NFUN_171__(string(PoolBalls), 0))
	{
		return;
	}
	ClearBalls();
	i = 10;
	J0x1C:

	// End:0x4C [Loop If]
	if(__NFUN_169__(i, string(PoolBalls)))
	{
		PoolBalls[i].HideBall();
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x1C;
	}
	PoolBalls[0].ShowBall(self, CuePoint, 0, 0);
	PoolBalls[1].ShowBall(self, RackPoint, 0, 0);
	PoolBalls[9].ShowBall(self, RackPoint, 0, __NFUN_195__(2, RackLine));
	PoolBalls[GetBall(9)].ShowBall(self, RackPoint, BallSize, RackLine);
	PoolBalls[GetBall(9)].ShowBall(self, RackPoint, __NFUN_194__(BallSize), RackLine);
	RowOffset = __NFUN_195__(2, RackLine);
	PoolBalls[GetBall(9)].ShowBall(self, RackPoint, __NFUN_195__(2, BallSize), RowOffset);
	PoolBalls[GetBall(9)].ShowBall(self, RackPoint, __NFUN_195__(2, __NFUN_194__(BallSize)), RowOffset);
	RowOffset = __NFUN_195__(3, RackLine);
	PoolBalls[GetBall(9)].ShowBall(self, RackPoint, BallSize, RowOffset);
	PoolBalls[GetBall(9)].ShowBall(self, RackPoint, __NFUN_194__(BallSize), RowOffset);
	PoolBalls[GetBall(9)].ShowBall(self, RackPoint, 0, __NFUN_195__(4, RackLine));
	return;
}

final function ClearBalls()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x39 [Loop If]
	if(__NFUN_169__(i, string(PoolBalls)))
	{
		PoolBalls[i].bInUse = false;
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	return;
}

final function int GetBall(int Max)
{
	local int Result;

	Result = __NFUN_187__(__NFUN_165__(Max, 1));
	J0x10:

	// End:0x49 [Loop If]
	if(PoolBalls[Result].bInUse)
	{
		__NFUN_184__(Result);
		// End:0x46
		if(__NFUN_170__(Result, Max))
		{
			Result = 1;
		}
		// [Loop Continue]
		goto J0x10;
	}
	return Result;
	return;
}

final function TriggerFunc_EightBall()
{
	RackTable_EightBall();
	return;
}

final function TriggerFunc_NineBall()
{
	RackTable_NineBall();
	return;
}

final function TriggerFunc_WinEgoCapIncrease()
{
	local DukePlayer Duke;

	Duke = DukePlayer(Level.__NFUN_1161__());
	// End:0x36
	if(__NFUN_340__(Duke, none))
	{
		Duke.GivePermanentEgoCapAward(23);
	}
	return;
}

defaultproperties
{
	bIncludeBalls=true
	RackPoint=(X=1.291717E-41,Y=2.802811E-17,Z=0)
	CuePoint=(X=1.291717E-41,Y=2.813685E-17,Z=0)
	BallSpacing=0.25
	HealthPrefab=0
	MountOnSpawn=/* Array type was not detected. */
}
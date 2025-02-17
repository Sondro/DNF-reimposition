/*******************************************************************************
 * dnControl_CycloidHumiliation_FieldGoal generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_CycloidHumiliation_FieldGoal extends dnControl
	dependson(CycloidCorpse);

var() deprecated CycloidCorpse cycloid;

simulated function PostVerifySelf()
{
	super.PostVerifySelf();
	cycloid = CycloidCorpse(Owner);
	return;
}

simulated function AttachPawnSuccess(Pawn Attachee, optional bool bForced)
{
	super.AttachPawnSuccess(Attachee, bForced);
	User.TickBefore = cycloid;
	return;
}

simulated function AttachComplete()
{
	super(dnUsableSomething).AttachComplete();
	__NFUN_630__();
	InternalControlRemapper.__NFUN_630__();
	User.__NFUN_630__();
	return;
}

simulated function PlayUserAnim()
{
	super.PlayUserAnim();
	// End:0x71
	if(__NFUN_148__(__NFUN_148__(__NFUN_342__(States[CurrentStateIndex].UserAnimName, 'None'), __NFUN_340__(cycloid, none)), __NFUN_340__(cycloid.AnimationController, none)))
	{
		cycloid.AnimationController.SetAnimState(States[CurrentStateIndex].UserAnimName);
	}
	return;
}

final simulated function BeginIdle()
{
	ControlEvent(, 'idle');
	return;
}

simulated event bool UsableSomething_AIShouldIgnoreUser()
{
	return true;
	return;
}

final simulated function DoDestroy()
{
	__NFUN_614__();
	return;
}

state() PreIdle
{
	event BeginState()
	{
		super(Object).BeginState();
		__NFUN_607__(__NFUN_198__(cycloid.FadeFromBlackTime, 0.5), false, 'BeginIdle');
		return;
	}
	stop;
}

state() idle
{
	simulated function AnimCallback_UserAnimEnd()
	{
		global.AnimCallback_UserAnimEnd();
		User.TickBefore = none;
		// End:0x3E
		if(__NFUN_340__(cycloid, none))
		{
			GlobalTrigger(cycloid.HumiliationCompleteEvent, User, self);
		}
		return;
	}
	stop;
}

state() Unuseable
{
	event BeginState()
	{
		super(Object).BeginState();
		__NFUN_607__(5, false, 'DoDestroy');
		return;
	}
	stop;
}

defaultproperties
{
	States=/* Array type was not detected. */
}
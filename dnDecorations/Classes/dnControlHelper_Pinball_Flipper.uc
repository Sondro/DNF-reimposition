/*******************************************************************************
 * dnControlHelper_Pinball_Flipper generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControlHelper_Pinball_Flipper extends dnControlHelper_Pinball
	collapsecategories;

var PhysicsAction_ConstVel ConstVel;
var bool bLeftFlipper;
var bool bUp;

simulated event PostVerifySelf()
{
	super.PostVerifySelf();
	ConstVel = PhysicsAction_ConstVel(__NFUN_824__(class'PhysicsAction_ConstVel', true));
	// End:0x38
	if(__NFUN_340__(ConstVel, none))
	{
		ConstVel.Setup(false, false);
	}
	return;
}

function KarmaSetConstraintProperties(KConstraint ConstraintActor)
{
	local KAngularJointLimit Limit;

	super(KarmaActor).KarmaSetConstraintProperties(ConstraintActor);
	Limit = KAngularJointLimit(ConstraintActor);
	// End:0x37
	if(__NFUN_340__(Limit, none))
	{
		Limit.__NFUN_1106__(8192);
	}
	return;
}

final simulated function InitFlipper(bool bIsLeftFlipper)
{
	bLeftFlipper = bIsLeftFlipper;
	bUp = true;
	FlipDown(true);
	return;
}

final simulated function FlipUp()
{
	// End:0x0B
	if(bUp)
	{
		return;
	}
	bUp = true;
	__NFUN_817__();
	// End:0x46
	if(bLeftFlipper)
	{
		ConstVel.Setup(false, true,, __NFUN_232__(0, 0, -30));		
	}
	else
	{
		ConstVel.Setup(false, true,, __NFUN_232__(0, 0, 30));
	}
	FindAndPlaySound('Pinball_FlipUp', 1);
	return;
}

final simulated function FlipDown(optional bool bNoSound)
{
	// End:0x0D
	if(__NFUN_145__(bUp))
	{
		return;
	}
	bUp = false;
	__NFUN_817__();
	// End:0x48
	if(bLeftFlipper)
	{
		ConstVel.Setup(false, true,, __NFUN_232__(0, 0, 30));		
	}
	else
	{
		ConstVel.Setup(false, true,, __NFUN_232__(0, 0, -30));
	}
	// End:0x77
	if(bNoSound)
	{
		return;
	}
	FindAndPlaySound('Pinball_FlipDown', 1);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Pinball_FlipUp');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Pinball_FlipDown');
	return;
}

defaultproperties
{
	bUseMachinePEG=true
}
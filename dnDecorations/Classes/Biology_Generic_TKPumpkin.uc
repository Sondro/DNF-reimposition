/*******************************************************************************
 * Biology_Generic_TKPumpkin generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Biology_Generic_TKPumpkin extends Biology_Generic;

var class<dnScreenSplatters> ScreenSplatterClass;
var bool bIsTKed;

function StartTelekinesis(Pawn TKOwner)
{
	// End:0x17
	if(__NFUN_340__(MountParent, none))
	{
		DestroyOnDismount = false;
		__NFUN_631__();
	}
	bIsTKed = true;
	__NFUN_642__(18);
	super(InteractiveActor).StartTelekinesis(TKOwner);
	return;
}

event KImpact(name SelfBoneName, KarmaActor Other, name OtherBoneName, Vector Position, Vector ImpactVelocity, Vector ImpactNormal)
{
	super(dnDecoration).KImpact(SelfBoneName, Other, OtherBoneName, Position, ImpactVelocity, ImpactNormal);
	// End:0x33
	if(bIsTKed)
	{
		CriticalDamage();
	}
	return;
}

simulated event Destroyed()
{
	local dnScreenSplatters ScreenSplatter;

	ScreenSplatter = dnScreenSplatters(FindStaticActor(ScreenSplatterClass));
	// End:0x44
	if(__NFUN_340__(ScreenSplatter, none))
	{
		ScreenSplatter.__NFUN_645__(Location);
		ScreenSplatter.ExecuteEffect();
	}
	super(dnDecoration).Destroyed();
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(ScreenSplatterClass);
	return;
}

defaultproperties
{
	ScreenSplatterClass='dnScreenSplatter_Pumpkin'
	DestroyedActivities=/* Array type was not detected. */
	bTransferToCorpse=/* Unknown default property type! */
}
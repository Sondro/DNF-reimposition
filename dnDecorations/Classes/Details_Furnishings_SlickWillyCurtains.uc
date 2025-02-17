/*******************************************************************************
 * Details_Furnishings_SlickWillyCurtains generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Furnishings_SlickWillyCurtains extends Details_Generic
	collapsecategories;

var() name PortalSurfaceTag;
var bool bOpen;
var Details_Generic_CollisionSheet CollisionSheet;

function PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	DecoActivity(0, 'CurtainIdleClose');
	FullyClosed();
	CollisionSheet = Details_Generic_CollisionSheet(FindMountedActor(, class'Details_Generic_CollisionSheet'));
	// End:0xA7
	if(__NFUN_340__(CollisionSheet, none))
	{
		CollisionSheet.PhysicsMaterial = class'dnPhysicsMaterial_Carpet';
		CollisionSheet.PhysicsMassType = 1;
		CollisionSheet.__NFUN_592__(__NFUN_232__(0.1, 1.3, 1.8));
		CollisionSheet.__NFUN_811__(3);
		CollisionSheet.DecoActivity(0, 'TurnOn');
	}
	return;
}

event Touch(Actor Other)
{
	super(dnDecoration).Touch(Other);
	// End:0x22
	if(__NFUN_340__(Pawn(Other), none))
	{
		PerformOpen();
	}
	return;
}

event UnTouch(Actor Other)
{
	super(dnDecoration).UnTouch(Other);
	// End:0x1E
	if(__NFUN_339__(GetFirstTouchingPawn(), none))
	{
		PerformClose();
	}
	return;
}

final simulated function PerformOpen()
{
	// End:0x0B
	if(bOpen)
	{
		return;
	}
	// End:0x24
	if(__NFUN_342__(PortalSurfaceTag, 'None'))
	{
		__NFUN_739__(PortalSurfaceTag, true);
	}
	// End:0x47
	if(__NFUN_340__(CollisionSheet, none))
	{
		CollisionSheet.DecoActivity(0, 'TurnOff');
	}
	bOpen = true;
	DecoActivity(0, 'CurtainOpen');
	return;
}

final simulated function FullyOpened()
{
	// End:0x0D
	if(__NFUN_145__(bOpen))
	{
		return;
	}
	DecoActivity(0, 'CurtainOpenIdle');
	// End:0x2D
	if(__NFUN_339__(GetFirstTouchingPawn(), none))
	{
		PerformClose();
	}
	return;
}

final simulated function PerformClose()
{
	// End:0x0D
	if(__NFUN_145__(bOpen))
	{
		return;
	}
	bOpen = false;
	DecoActivity(0, 'CurtainClose');
	// End:0x45
	if(__NFUN_340__(CollisionSheet, none))
	{
		CollisionSheet.DecoActivity(0, 'TurnOn');
	}
	return;
}

final simulated function FullyClosed()
{
	// End:0x0B
	if(bOpen)
	{
		return;
	}
	// End:0x24
	if(__NFUN_342__(PortalSurfaceTag, 'None'))
	{
		__NFUN_739__(PortalSurfaceTag, false);
	}
	DecoActivity(0, 'CurtainCloseIdle');
	// End:0x44
	if(__NFUN_340__(GetFirstTouchingPawn(), none))
	{
		PerformOpen();
	}
	return;
}

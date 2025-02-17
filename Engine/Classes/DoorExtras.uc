/*******************************************************************************
 * DoorExtras generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DoorExtras extends Decoration
	abstract
	native
	collapsecategories
	notplaceable;

var() noexport bool bAnimates "Whether the extra is supposed to animate or not.";
var() noexport Vector LocationOffset "Amount to offset the extra from the door.";
var() noexport Rotator RotationOffset "Amount to modify the base rotation once the extra is mounted to the door.";
var() noexport name OpenSequence "Sequence to play when the door starts being opened. If left empty, will default to 'open'";
var() noexport name OpenedSequence "Sequence to play when the door is opened.";
var() noexport name KickedOpenSequence "Sequence to play when the door is kicked open.";
var() noexport name CloseSequence "Sequence to play when the door starts closing.";
var() noexport name ClosedSequence "Sequence to play when the door is closed.";
var() noexport name LockedSequence "Sequence to play when the door is locked. If left empty, will default to 'locked'";
var() noexport Object LeftRenderObject "RenderObject to display when the handle is to the 'left' of the hinge. If empty, defaults to the RenderObject specified under Display.";
var() noexport Object RightRenderObject "RenderObject to display when the handle is to the 'right' of the hinge. If empty, defaults to the RenderObject specified under Display.";

function bool VerifySelf()
{
	InitializeMeshAndAnimations();
	return super(Actor).VerifySelf();
	return;
}

simulated function InitializeMeshAndAnimations()
{
	// End:0x15
	if(__NFUN_339__(LeftRenderObject, none))
	{
		LeftRenderObject = __NFUN_596__();
	}
	// End:0x2A
	if(__NFUN_339__(RightRenderObject, none))
	{
		RightRenderObject = __NFUN_596__();
	}
	// End:0x7C
	if(__NFUN_148__(bAnimates, __NFUN_173__(int(DrawType), int(2))))
	{
		// End:0x5E
		if(__NFUN_341__(OpenSequence, 'None'))
		{
			OpenSequence = 'Open';
		}
		// End:0x79
		if(__NFUN_341__(LockedSequence, 'None'))
		{
			LockedSequence = 'Locked';
		}		
	}
	else
	{
		bAnimates = false;
	}
	return;
}

final function SetSide(int Left)
{
	switch(Left)
	{
		// End:0x25
		case 1:
			// End:0x22
			if(__NFUN_340__(__NFUN_596__(), LeftRenderObject))
			{
				__NFUN_595__(LeftRenderObject);
			}
			// End:0x49
			break;
		// End:0x46
		case -1:
			// End:0x43
			if(__NFUN_340__(__NFUN_596__(), RightRenderObject))
			{
				__NFUN_595__(RightRenderObject);
			}
			// End:0x49
			break;
		// End:0xFFFF
		default:
			break;
	}
	return;
}

final simulated function PlayOpenDoor()
{
	HandlePlayAnim(OpenSequence);
	return;
}

final simulated function PlayOpenedDoor()
{
	HandlePlayAnim(OpenedSequence);
	return;
}

final simulated function PlayKickedOpenDoor()
{
	HandlePlayAnim(KickedOpenSequence);
	return;
}

final simulated function PlayCloseDoor()
{
	HandlePlayAnim(CloseSequence);
	return;
}

final simulated function PlayClosedDoor()
{
	HandlePlayAnim(ClosedSequence);
	return;
}

final simulated function PlayLockedDoor()
{
	HandlePlayAnim(LockedSequence);
	return;
}

final simulated function HandlePlayAnim(name HandleSequence)
{
	// End:0x0D
	if(__NFUN_145__(bAnimates))
	{
		return;
	}
	// End:0x1F
	if(__NFUN_341__(HandleSequence, 'None'))
	{
		return;
	}
	__NFUN_703__(HandleSequence);
	bDumbMesh = false;
	TickStyle = 2;
	return;
}

simulated event AnimEndEx(SAnimEndInfo AnimEndInfo)
{
	super(RenderActor).AnimEndEx(AnimEndInfo);
	bDumbMesh = true;
	TickStyle = 0;
	return;
}

event PhysicsChange(optional Object.EPhysics PreviousPhysics)
{
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local Mesh TempMesh;

	super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
	InitializeMeshAndAnimations();
	// End:0x166
	if(bAnimates)
	{
		TempMesh = Mesh(LeftRenderObject);
		// End:0xC0
		if(__NFUN_340__(TempMesh, none))
		{
			PrecacheIndex.__NFUN_1284__(TempMesh, OpenSequence);
			PrecacheIndex.__NFUN_1284__(TempMesh, OpenedSequence);
			PrecacheIndex.__NFUN_1284__(TempMesh, KickedOpenSequence);
			PrecacheIndex.__NFUN_1284__(TempMesh, CloseSequence);
			PrecacheIndex.__NFUN_1284__(TempMesh, ClosedSequence);
			PrecacheIndex.__NFUN_1284__(TempMesh, LockedSequence);
		}
		TempMesh = Mesh(RightRenderObject);
		// End:0x166
		if(__NFUN_340__(TempMesh, none))
		{
			PrecacheIndex.__NFUN_1284__(TempMesh, OpenSequence);
			PrecacheIndex.__NFUN_1284__(TempMesh, OpenedSequence);
			PrecacheIndex.__NFUN_1284__(TempMesh, KickedOpenSequence);
			PrecacheIndex.__NFUN_1284__(TempMesh, CloseSequence);
			PrecacheIndex.__NFUN_1284__(TempMesh, ClosedSequence);
			PrecacheIndex.__NFUN_1284__(TempMesh, LockedSequence);
		}
	}
	PrecacheIndex.__NFUN_1267__(Primitive(LeftRenderObject), self);
	PrecacheIndex.__NFUN_1267__(Primitive(RightRenderObject), self);
	return;
}

defaultproperties
{
	bAnimates=true
	RotationOffset=(Pitch=8751,Yaw=38404096,Roll=4194338)
	Physics=9
	bTraceUsable=false
	bTraceShootable=false
	bBlockCamera=false
	bTickOnlyRecent=false
	bTickOnlyZoneRecent=false
	bTickOnlyWhenOwnerShould=true
	bNoFailMountedMovement=true
	CollisionRadius=0
	CollisionHeight=0
	TickStyle=0
	DrawType=2
}
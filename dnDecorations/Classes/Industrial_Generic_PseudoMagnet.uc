/*******************************************************************************
 * Industrial_Generic_PseudoMagnet generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Industrial_Generic_PseudoMagnet extends Industrial_Generic
	collapsecategories;

struct SClassEvent
{
	var() class<Actor> Class;
	var() noexport name Event "We will fire off this custom Event whenever we attach to an object of this class or a child class.";
};

var() noexport float MultipleObjectAttachTimeWindow "After we attach to our first object, we have this long (in seconds) to attach to other objects before our attach functionality shut down. This allows for \"sloppy\" attaches.";
var() noexport int ObjectAttachmentLimit "If non-negative, this will limit the maximum number of other objects that can be attached to this at any one point in time.";
var() noexport name AttachEvent "Fire off this event when we attach to each object.";
var() noexport name CouldntAttachEvent "We'll fire off this event when we hit something that I couldn't attach to for whatever reason.";
var() noexport name DetachTag "Detach all attached objects from this \"magnet\" when this event is fired.";
var() name EnableTag;
var() noexport name DisableTag "Disable the ability to attach to new objects. Note that this will *not* detach any currently-attached objects.";
var() noexport bool bEnabled "Does this start the map off active? This state can be changed with [EnableTag] and [DisableTag].";
var() noexport array< class<KarmaActor> > AttachClasses "What classes are we able to attach to? If this list is empty, we'll consider anything.";
var() noexport array<name> AttachTags "What tags are we able to attach to? If this list is empty, we'll attach to anything.";
var() array<SClassEvent> AttachEvents;
var array<KFixed> AttachedActors;
var float AttachmentTimeWindowStart;

event PreBeginPlay()
{
	local int i;

	__NFUN_718__('Detach', DetachTag);
	__NFUN_718__('Enable', EnableTag);
	__NFUN_718__('Disable', DisableTag);
	// End:0x3E
	if(__NFUN_173__(string(AttachClasses), 0))
	{
		__NFUN_622__(class'KarmaActor');		
	}
	else
	{
		i = __NFUN_166__(string(AttachClasses), 1);
		J0x4D:

		// End:0x70 [Loop If]
		if(__NFUN_172__(i, 0))
		{
			__NFUN_622__(AttachClasses[i]);
			__NFUN_185__(i);
			// [Loop Continue]
			goto J0x4D;
		}
	}
	super(dnDecoration).PreBeginPlay();
	return;
}

function bool CanPseudoMagnetize(KarmaActor Other)
{
	local int i;

	// End:0x3D
	if(__NFUN_150__(__NFUN_150__(__NFUN_339__(Other, none), __NFUN_174__(int(Other.Physics), int(18))), Other.bIsPawn))
	{
		return false;
	}
	// End:0x4F
	if(__NFUN_172__(string(AttachedActors), ObjectAttachmentLimit))
	{
		return false;
	}
	i = __NFUN_166__(string(AttachedActors), 1);
	J0x5E:

	// End:0x95 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x8B
		if(__NFUN_339__(AttachedActors[i].KConstraintActor2, Other))
		{
			return false;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x5E;
	}
	// End:0xF9
	if(__NFUN_174__(string(AttachClasses), 0))
	{
		i = __NFUN_166__(string(AttachClasses), 1);
		J0xB0:

		// End:0xE8 [Loop If]
		if(__NFUN_172__(i, 0))
		{
			// End:0xDE
			if(__NFUN_357__(Other.Class, AttachClasses[i]))
			{
				// [Explicit Break]
				goto J0xE8;
			}
			__NFUN_185__(i);
			// [Loop Continue]
			goto J0xB0;
		}
		J0xE8:

		// End:0xF9
		if(__NFUN_173__(i, -1))
		{
			return false;
		}
	}
	// End:0x15D
	if(__NFUN_174__(string(AttachTags), 0))
	{
		i = __NFUN_166__(string(AttachTags), 1);
		J0x114:

		// End:0x14C [Loop If]
		if(__NFUN_172__(i, 0))
		{
			// End:0x142
			if(__NFUN_341__(Other.Tag, AttachTags[i]))
			{
				// [Explicit Break]
				goto J0x14C;
			}
			__NFUN_185__(i);
			// [Loop Continue]
			goto J0x114;
		}
		J0x14C:

		// End:0x15D
		if(__NFUN_173__(i, -1))
		{
			return false;
		}
	}
	// End:0x18D
	if(__NFUN_148__(__NFUN_170__(string(AttachedActors), 0), __NFUN_201__(__NFUN_199__(Level.TimeSeconds, AttachmentTimeWindowStart), MultipleObjectAttachTimeWindow)))
	{
		return false;
	}
	return true;
	return;
}

event KImpact(name SelfBoneName, KarmaActor Other, name OtherBoneName, Vector Position, Vector ImpactVelocity, Vector ImpactNormal)
{
	super(dnDecoration).KImpact(SelfBoneName, Other, OtherBoneName, Position, ImpactVelocity, ImpactNormal);
	AttemptAttach(Other, Position, SelfBoneName, OtherBoneName);
	return;
}

final function AttemptAttach(KarmaActor Other, Vector Position, name SelfBoneName, name OtherBoneName)
{
	local int i;
	local KFixed NewConstraint;

	// End:0x0D
	if(__NFUN_145__(bEnabled))
	{
		return;
	}
	// End:0x2A
	if(__NFUN_145__(CanPseudoMagnetize(Other)))
	{
		GlobalTrigger(CouldntAttachEvent);
		return;
	}
	// End:0x4B
	if(__NFUN_173__(string(AttachedActors), 0))
	{
		AttachmentTimeWindowStart = Level.TimeSeconds;
	}
	NewConstraint = __NFUN_615__(class'KFixed', self,, Position);
	NewConstraint.KConstraintActor1 = self;
	NewConstraint.KConstraintActor1Bone = SelfBoneName;
	NewConstraint.KConstraintActor2 = Other;
	NewConstraint.KConstraintActor2Bone = OtherBoneName;
	NewConstraint.__NFUN_642__(18);
	FindAndPlaySound('PseudoMag_Attach');
	i = __NFUN_166__(string(AttachEvents), 1);
	J0xD9:

	// End:0x129 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x11F
		if(__NFUN_357__(Other.Class, AttachEvents[i].Class))
		{
			GlobalTrigger(AttachEvents[i].Event);
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0xD9;
	}
	AttachedActors[AttachedActors.Add(1)] = NewConstraint;
	GlobalTrigger(AttachEvent);
	return;
}

function TriggerFunc_ForceReattach()
{
	local KarmaActor KA;

	TriggerFunc_Detach();
	// End:0x49
	foreach __NFUN_749__(class'KarmaActor', KA)
	{
		AttemptAttach(KA, __NFUN_237__(__NFUN_238__(Location, KA.Location), 2), 'None', 'None');		
	}	
	return;
}

function TriggerFunc_Detach()
{
	local int i;

	i = __NFUN_166__(string(AttachedActors), 1);
	J0x0F:

	// End:0x37 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		AttachedActors[i].__NFUN_614__();
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x0F;
	}
	AttachedActors.Empty();
	FindAndPlaySound('PseudoMag_Detach');
	AttachmentTimeWindowStart = default.AttachmentTimeWindowStart;
	return;
}

function TriggerFunc_Enable()
{
	bEnabled = true;
	return;
}

function TriggerFunc_Disable()
{
	bEnabled = false;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'PseudoMag_Attach');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'PseudoMag_Detach');
	return;
}

defaultproperties
{
	MultipleObjectAttachTimeWindow=0.1
	bEnabled=true
	AttachmentTimeWindowStart=-1
	HealthPrefab=0
}
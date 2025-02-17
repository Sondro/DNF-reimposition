/*******************************************************************************
 * dnControl_ScriptedAnim generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_ScriptedAnim extends dnControl
	collapsecategories;

struct STriggerableAnims
{
	var() noexport name Sequence "Raw animation sequence name to play when AnimTag is triggered.";
	var() noexport name Tag "Trigger this event to make this animation play.";
	var() noexport bool bLoopAnim "If true, this animation will loop.";
	var() noexport float Frame "Frame to start animation on.";
	var() noexport float Rate "Rate to use for animation playback.  If left as 0.0, rate will automatically become 1.0.";
	var() noexport bool bNoInterrupt "If true and animation is already playing, will not attempt to play again.";
	var() noexport name AnimEndEvent "Event to trigger when this animation finishes.";
	var int SpecialEventID;
};

var() noexport deprecated Actor IKTargetActor "If set, this is the Actor the user will IK to.";
var() noexport bool bClearPreviousControlAnims "If true, we'll clear out all dnControl specific anim channels on attach.";
var() noexport bool bMoveToUserLocation "If true, this dnControl will move to the User's location on attach";
var() noexport bool bMoveToUserRotation "If true, this dnControl will match the User's rotation on attach";
var() noexport bool bWaitForDetachAnim "If true, the detach animation will play out entirely before detaching continues.  Otherwise, detaching will occur simultaneously.";
var() noexport bool bUsePhysMeqon "If true, PHYS_Meqon will be used to process animation motion.  Interpolation in/out will not work in this mode.";
var() noexport name AttachAnimName "Raw animation sequence to play during attach.  Can be left empty.";
var() noexport name DetachAnimName "Raw animation sequence to play during detach.  Can be left empty.";
var() noexport float AttachAnimStartFrame "Frame to start attach animation on.";
var() noexport float DetachAnimStartFrame "Frame to start detach animation on.";
var() noexport array<STriggerableAnims> Anims "List of triggerable animations";
var() noexport float AttachTime "Time it takes to interpolate in.";
var() noexport float DetachTime "Time it takes to interpolate out.";
var() noexport bool AIIgnored "If true, AI will not attack player.";

function PostVerifySelf()
{
	local int i;

	InterpolationInTime = AttachTime;
	InterpolationOutTime = DetachTime;
	super.PostVerifySelf();
	Texture = none;
	i = __NFUN_166__(string(Anims), 1);
	J0x32:

	// End:0xF2 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x67
		if(__NFUN_341__(Anims[i].Tag, 'None'))
		{
			Anims.Remove(i, 1);
			// [Explicit Continue]
			goto J0xE8;
		}
		Anims[i].SpecialEventID = __NFUN_718__('PlayAnim', Anims[i].Tag);
		Anims[i].Frame = __NFUN_225__(0, Anims[i].Frame);
		// End:0xE8
		if(__NFUN_202__(Anims[i].Rate, 0))
		{
			Anims[i].Rate = 1;
		}
		J0xE8:

		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x32;
	}
	// End:0x10D
	if(__NFUN_341__(AttachAnimName, 'None'))
	{
		AttachAnimName = 'XSpecial_AnimEnd';
	}
	bDelayedDetach = true;
	// End:0x133
	if(__NFUN_341__(DetachAnimName, 'None'))
	{
		DetachAnimName = 'XSpecial_AnimEnd';		
	}
	else
	{
		bDelayedDetach = bWaitForDetachAnim;
	}
	return;
}

event PostBeginPlay()
{
	super(dnUsableSomething).PostBeginPlay();
	// End:0x2F
	if(__NFUN_148__(bUsePhysMeqon, __NFUN_340__(InternalControlRemapper, none)))
	{
		InternalControlRemapper.CoreType = 2;
	}
	return;
}

simulated event Actor GetIKActor(name LimbID)
{
	return IKTargetActor;
	return;
}

simulated function TriggerFunc_PlayAnim()
{
	return;
}

final simulated function OverrideUserAnimation(name EntryName, name AnimSequence, optional float Frame, optional float Rate, optional bool bLoopAnim, optional bool bNoInterrupt, optional name AnimEndEvent)
{
	local int AnimIndex;

	Frame = __NFUN_225__(0, Frame);
	// End:0x2C
	if(__NFUN_202__(Rate, 0))
	{
		Rate = 1;
	}
	// End:0x183
	if(__NFUN_148__(__NFUN_340__(User, none), __NFUN_340__(User.AnimationController, none)))
	{
		AnimIndex = User.AnimationController.__NFUN_1307__(EntryName);
		// End:0x183
		if(__NFUN_174__(AnimIndex, -1))
		{
			User.AnimationController.Animations[AnimIndex].AnimSequence = AnimSequence;
			User.AnimationController.Animations[AnimIndex].AnimStartingFrame = Frame;
			User.AnimationController.Animations[AnimIndex].AnimRate = Rate;
			User.AnimationController.Animations[AnimIndex].bLoopAnim = bLoopAnim;
			User.AnimationController.Animations[AnimIndex].bForceCrossfade = __NFUN_145__(bNoInterrupt);
			User.AnimationController.Animations[AnimIndex].AnimEnd_Event = AnimEndEvent;
		}
	}
	return;
}

simulated function AttachPawnSuccess(Pawn Attachee, optional bool bForced)
{
	Attachee.BecomeUnfrozen();
	// End:0x4B
	if(__NFUN_145__(Attachee.Weapon.CanDeactivate()))
	{
		Attachee.Weapon.bDeactivationAllowed = true;
	}
	// End:0x60
	if(Attachee.IsDead())
	{
		return;
	}
	Attachee.ForceDetachCompleteFromUsableSomething();
	// End:0xA8
	if(bMoveToUserLocation)
	{
		__NFUN_645__(__NFUN_239__(Attachee.Location, __NFUN_232__(0, 0, Attachee.CollisionHeight)));
	}
	// End:0xC3
	if(bMoveToUserRotation)
	{
		__NFUN_652__(Attachee.Rotation);
	}
	// End:0xDC
	if(__NFUN_340__(InternalControlRemapper, none))
	{
		InternalControlRemapper.__NFUN_630__();
	}
	// End:0x11C
	if(__NFUN_148__(bClearPreviousControlAnims, __NFUN_340__(Attachee.AnimationController, none)))
	{
		Attachee.AnimationController.EmptyAnimChannels_ByBlock('FBBlock');
	}
	super.AttachPawnSuccess(Attachee, bForced);
	Attachee.__NFUN_842__();
	return;
}

event EnumerateRawAnimationSequences(out array<SAnimationEnumeration> References)
{
	local int i;

	super.EnumerateRawAnimationSequences(References);
	// End:0x30
	if(__NFUN_342__(AttachAnimName, 'None'))
	{
		AddAnimationEnumeration(References, AttachAnimName, class'Duke');
	}
	// End:0x55
	if(__NFUN_342__(DetachAnimName, 'None'))
	{
		AddAnimationEnumeration(References, DetachAnimName, class'Duke');
	}
	i = 0;
	J0x5C:

	// End:0xB1 [Loop If]
	if(__NFUN_169__(i, string(Anims)))
	{
		// End:0xA7
		if(__NFUN_342__(Anims[i].Sequence, 'None'))
		{
			AddAnimationEnumeration(References, Anims[i].Sequence, class'Duke');
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x5C;
	}
	return;
}

simulated event bool UsableSomething_AIShouldIgnoreUser()
{
	return AIIgnored;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local int i;

	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1284__(class'Duke', AttachAnimName);
	PrecacheIndex.__NFUN_1284__(class'Duke', DetachAnimName);
	i = __NFUN_166__(string(Anims), 1);
	J0x48:

	// End:0x7F [Loop If]
	if(__NFUN_172__(i, 0))
	{
		PrecacheIndex.__NFUN_1284__(class'Duke', Anims[i].Sequence);
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x48;
	}
	return;
}

state() AttachUserAnim
{
	function PlayUserAnim()
	{
		OverrideUserAnimation(States[CurrentStateIndex].UserAnimName, AttachAnimName, AttachAnimStartFrame);
		super.PlayUserAnim();
		User.__NFUN_842__();
		return;
	}
	stop;
}

state() idle
{
	simulated function TriggerFunc_PlayAnim()
	{
		local Actor Other;
		local Pawn EventInstigator;
		local int i, SpecialEventID;

		__NFUN_720__(Other, EventInstigator, SpecialEventID);
		i = __NFUN_166__(string(Anims), 1);
		J0x21:

		// End:0x102 [Loop If]
		if(__NFUN_172__(i, 0))
		{
			// End:0xF8
			if(__NFUN_173__(Anims[i].SpecialEventID, SpecialEventID))
			{
				// End:0xF6
				if(__NFUN_148__(__NFUN_340__(User, none), __NFUN_340__(User.AnimationController, none)))
				{
					OverrideUserAnimation('ScriptedAnim_Animation', Anims[i].Sequence, Anims[i].Frame, Anims[i].Rate, Anims[i].bLoopAnim, Anims[i].bNoInterrupt, Anims[i].AnimEndEvent);
					User.AnimationController.SetAnimState('ScriptedAnim_Animation');
				}
				return;
			}
			__NFUN_185__(i);
			// [Loop Continue]
			goto J0x21;
		}
		return;
	}
	stop;
}

state() DetachUser
{
	function PlayUserAnim()
	{
		OverrideUserAnimation(States[CurrentStateIndex].UserAnimName, DetachAnimName, DetachAnimStartFrame);
		super.PlayUserAnim();
		return;
	}
	stop;
}

defaultproperties
{
	AttachTime=0.3
	DetachTime=0.3
}
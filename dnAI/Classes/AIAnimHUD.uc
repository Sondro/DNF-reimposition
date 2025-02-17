/*******************************************************************************
 * AIAnimHUD generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AIAnimHUD extends AIHUD
	collapsecategories;

const ANIMHUD_AnimControllerEntry = 1;

var Vector startLocation;
var Rotator StartRotation;
var BGInfo TreeLogBG;
var BGInfo InspectAnimBG;
var BGInfo AnimEntryInfoBG;
var BGInfo AnimqQueueBG;
var int AnimEntryInfoIndex;
var array<Color> ColorTable;
var bool bInspectAnims;
var bool bDrawDiamonds;
var bool bSingleTargetInspect;
var bool bDrawTargetCylinder;
var bool bShowProgrammerAnimNames;
var array<string> SearchStrings;
var bool bDebugSearch;
var bool AnimSinglePlay;
var bool bPlayingQueuedAnims;
var int QueueIndex;
var array<name> AnimNameQueue;

simulated function DrawAIHUD(Canvas C)
{
	local SPathingHistory Hist;
	local string str;
	local int i;
	local float sx, sy, xw, yh, StartY;

	// End:0x0E
	if(__NFUN_339__(C, none))
	{
		return;
	}
	sx = __NFUN_195__(10, HUDScaleX);
	sy = __NFUN_195__(32, HUDScaleY);
	C.DrawColor = WhiteColor;
	C.__NFUN_1231__("AIPathHud", xw, yh);
	StartColumn(int(sx), int(__NFUN_199__(sy, yh)), int(yh));
	C.__NFUN_1250__(0, 0);
	DrawString(C, "AI Animation DebugHUD");
	// End:0xCF
	if(__NFUN_171__(string(DebugTreeItems), 0))
	{
		return;
	}
	// End:0x190
	if(__NFUN_148__(__NFUN_206__(DebugTreeBGSizeX, float(0)), __NFUN_206__(DebugTreeBGSizeY, float(0))))
	{
		C.__NFUN_1250__(sx, sy);
		C.Style = 5;
		C.DrawColor.R = 0;
		C.DrawColor.G = 0;
		C.DrawColor.B = 0;
		C.__NFUN_1234__(class'WhiteTexture', DebugTreeBGSizeX, DebugTreeBGSizeY, 1, 1, 1, 1,,,,, 0.5);
	}
	C.__NFUN_1250__(sx, sy);
	DrawDebugTree(C, DebugTreeItems, C.CurX, C.CurY);
	// End:0x262
	if(bInspectAnims)
	{
		C.__NFUN_1250__(__NFUN_198__(DebugTreeBGSizeX, __NFUN_195__(float(30), HUDScaleX)), __NFUN_195__(32, HUDScaleY));
		StartColumn(int(C.CurX), int(C.CurY), int(yh));
		StartBG(C, InspectAnimBG);
		DrawInspectAnimHUD(C);
		EndBG(C, InspectAnimBG);		
	}
	else
	{
		// End:0x2BC
		if(__NFUN_148__(bDrawTargetCylinder, __NFUN_340__(m_aTarget, none)))
		{
			__NFUN_675__(m_aTarget.Location, m_aTarget.CollisionRadius, m_aTarget.CollisionHeight, NewColorBytes(255, 255, 255, 255), 0.001);
		}
	}
	C.__NFUN_1250__(sx, __NFUN_198__(sy, DebugTreeBGSizeY));
	StartColumn(int(sx), int(__NFUN_198__(sy, DebugTreeBGSizeY)), int(yh));
	// End:0x3A2
	if(__NFUN_172__(AnimEntryInfoIndex, 0))
	{
		C.__NFUN_1250__(C.CurX, __NFUN_198__(C.CurY, __NFUN_195__(HUDScaleY, 32)));
		StartColumn(int(C.CurX), int(__NFUN_198__(C.CurY, __NFUN_195__(HUDScaleY, 32))), int(yh));
		StartBG(C, AnimEntryInfoBG);
		DrawAnimEntryInfoHUD(C);
		EndBG(C, AnimEntryInfoBG);
	}
	// End:0x438
	if(__NFUN_170__(string(AnimNameQueue), 0))
	{
		C.__NFUN_1250__(sx, __NFUN_198__(C.CurY, __NFUN_195__(HUDScaleY, 32)));
		StartColumn(int(sx), int(__NFUN_198__(C.CurY, __NFUN_195__(HUDScaleY, 32))), int(yh));
		StartBG(C, AnimqQueueBG);
		DrawAnimQueue(C);
		EndBG(C, AnimqQueueBG);
	}
	C.DrawColor = WhiteColor;
	DrawString(C, " ");
	DrawString(C, " ");
	DrawString(C, " ");
	DrawString(C, " ");
	DrawString(C, " ");
	return;
}

function LoadAnimations()
{
	local int i, Index;
	local SHUDDebugTreeItem Item;
	local name MenuName;

	Index = DebugTreeGetIndex(0, "Browse_AnimController");
	Item = DebugTreeItems[Index];
	string(DebugTreeItems) = __NFUN_165__(Index, 1);
	BroadcastLog("AIAnim HUD loading animations...");
	// End:0x8D
	if(__NFUN_339__(m_aTarget, none))
	{
		DebugTreeItems[Index].Push = false;
		return;
	}
	DebugTreeItems[Index].Push = true;
	i = 0;
	J0xA7:

	// End:0x171 [Loop If]
	if(__NFUN_169__(i, string(m_aTarget.AnimCtrl.m_oController.Animations)))
	{
		// End:0x10B
		if(bShowProgrammerAnimNames)
		{
			MenuName = m_aTarget.AnimCtrl.m_oController.Animations[i].AnimationName;			
		}
		else
		{
			MenuName = m_aTarget.AnimCtrl.m_oController.Animations[i].AnimSequence;
		}
		// End:0x14E
		if(__NFUN_145__(ValidAnim(string(MenuName))))
		{
			// [Explicit Continue]
			goto J0x167;
		}
		DebugTreeAddItem(,, MenuName, 'PlayAnim', 1, float(i));
		J0x167:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0xA7;
	}
	DebugTreeEndGroup();
	startLocation = m_aTarget.Location;
	StartRotation = m_aTarget.Rotation;
	return;
}

function bool ValidAnim(coerce string str)
{
	local int i, K;

	str = __NFUN_319__(str);
	i = 0;
	J0x15:

	// End:0xAA [Loop If]
	if(__NFUN_169__(i, string(SearchStrings)))
	{
		K = __NFUN_315__(str, SearchStrings[i]);
		// End:0x93
		if(bDebugSearch)
		{
			BroadcastLog(__NFUN_302__(__NFUN_303__(__NFUN_302__(__NFUN_303__(__NFUN_302__("DCR str=", str), "SearchStrings[i]="), SearchStrings[i]), "k="), string(K)));
		}
		// End:0xA0
		if(__NFUN_169__(K, 0))
		{
			return false;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x15;
	}
	return true;
	return;
}

simulated function OnNewTarget(AIActor OldTarget)
{
	OldTarget.MyAnimHUD = none;
	super.OnNewTarget(OldTarget);
	LoadAnimations();
	return;
}

function bool DebugTreeOnEnter(optional bool Found)
{
	local SHUDDebugTreeItem Item;

	super(HUD).DebugTreeOnEnter(Found);
	return true;
	return;
}

function DebugTreeKeyEvent(Engine.Object.EInputKey Key, Engine.Object.EInputAction Action, float Delta)
{
	local SHUDDebugTreeItem Item;

	super(HUD).DebugTreeKeyEvent(Key, Action, Delta);
	Item = DebugTreeItems[DebugTreeUseIndex];
	// End:0x4A
	if(__NFUN_173__(Item.var1, 1))
	{
		AnimEntryInfoIndex = int(Item.var2);		
	}
	else
	{
		AnimEntryInfoIndex = -1;
	}
	return;
}

function string GetAnimOpStr(int Op)
{
	local string str;

	switch(Op)
	{
		// End:0x26
		case 1:
			str = __NFUN_302__(str, "Replace");
			// End:0x7B
			break;
		// End:0x41
		case 2:
			str = __NFUN_302__(str, "Add");
			// End:0x7B
			break;
		// End:0x61
		case 3:
			str = __NFUN_302__(str, "Subtract");
			// End:0x7B
			break;
		// End:0xFFFF
		default:
			str = __NFUN_302__(str, "NULL");
			// End:0x7B
			break;
			break;
	}
	return str;
	return;
}

simulated function AIDrawAnimsInternal(Canvas C, RenderActor A, optional name GroupName)
{
	local SAllAnimInfo AnimInfo;
	local string str;

	// End:0x0E
	if(__NFUN_339__(A, none))
	{
		return;
	}
	// End:0x13F
	foreach A.__NFUN_840__(AnimInfo, GroupName)
	{
		// End:0x9D
		if(AnimInfo.bIsGroup)
		{
			str = __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("Group: <", string(AnimInfo.Channel)), ">  Op: <"), GetAnimOpStr(int(AnimInfo.Op))), ">   Alpha: <"), string(AnimInfo.Blend)), ">");			
		}
		else
		{
			str = __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("    Animation: <", string(AnimInfo.Sequence)), ">   Alpha: <"), string(AnimInfo.Blend)), ">   Time: <"), string(AnimInfo.Time)), ">");
		}
		DrawString(C, str);
		// End:0x13E
		if(AnimInfo.bIsGroup)
		{
			AIDrawAnimsInternal(C, A, AnimInfo.Sequence);
		}		
	}	
	DrawString(C, "   ");
	return;
}

function DrawInspectAnimHUD(Canvas C)
{
	local AIActor A;
	local int i;

	// End:0x40
	if(__NFUN_148__(bSingleTargetInspect, __NFUN_340__(m_aTarget, none)))
	{
		C.DrawColor = ColorTable[0];
		InspectAnim(C, m_aTarget);
		return;
	}
	// End:0xC8
	foreach __NFUN_747__(class'AIActor', A)
	{
		// End:0x7E
		if(__NFUN_201__(__NFUN_199__(Level.TimeSeconds, A.LastRenderTime), 1))
		{
			continue;			
		}
		C.DrawColor = ColorTable[i];
		InspectAnim(C, A);
		__NFUN_184__(i);
		// End:0xC7
		if(__NFUN_172__(i, string(ColorTable)))
		{
			i = 0;
		}		
	}	
	return;
}

function DrawAnimEntryInfoHUD(Canvas C)
{
	local SAnimationInfo AnimInfo;

	C.DrawColor = WhiteColor;
	AnimInfo = m_aTarget.AnimCtrl.m_oController.Animations[AnimEntryInfoIndex];
	DrawString(C, "Animation Information:");
	DrawString(C, __NFUN_302__("Name:                    ", string(AnimInfo.AnimationName)));
	DrawString(C, __NFUN_302__("Animation:               ", string(AnimInfo.AnimSequence)));
	DrawString(C, __NFUN_302__("AnimRate:                ", string(AnimInfo.AnimRate)));
	DrawString(C, __NFUN_302__("AnimEarlyEndTime:        ", string(AnimInfo.AnimEarlyEndTime)));
	DrawString(C, __NFUN_302__("GroupCrossfadeOverride:  ", string(AnimInfo.AnimEarlyEndTime)));
	return;
}

function DrawAnimQueue(Canvas C)
{
	local int i;

	C.DrawColor = WhiteColor;
	DrawString(C, "Animation Queue:");
	DrawString(C, "----------------");
	i = 0;
	J0x56:

	// End:0xF5 [Loop If]
	if(__NFUN_169__(i, string(AnimNameQueue)))
	{
		// End:0xB7
		if(__NFUN_148__(__NFUN_173__(QueueIndex, i), bPlayingQueuedAnims))
		{
			C.DrawColor = LightBlueColor;
			DrawString(C, __NFUN_302__(" > ", string(AnimNameQueue[i])));
			// [Explicit Continue]
			goto J0xEB;
		}
		C.DrawColor = WhiteColor;
		DrawString(C, __NFUN_302__("   ", string(AnimNameQueue[i])));
		J0xEB:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x56;
	}
	return;
}

function InspectAnim(Canvas C, AIActor A)
{
	DrawString(C, string(A));
	AIDrawAnimsInternal(C, A);
	// End:0xA1
	if(bDrawDiamonds)
	{
		__NFUN_675__(A.Location, A.CollisionRadius, A.CollisionHeight, NewColorBytes(C.DrawColor.R, C.DrawColor.G, C.DrawColor.B), 0.001);
	}
	return;
}

function ResetWindows()
{
	return;
}

function Inspect_Playing_Animations()
{
	bInspectAnims = __NFUN_145__(bInspectAnims);
	return;
}

function Hide_Cylinder()
{
	bDrawDiamonds = __NFUN_145__(bDrawDiamonds);
	return;
}

function Single_Target()
{
	bSingleTargetInspect = __NFUN_145__(bSingleTargetInspect);
	return;
}

exec function AnimSearch(optional name Str1, optional name Str2, optional name str3, optional name str4, optional name str5)
{
	local int i;

	string(SearchStrings) = 0;
	// End:0x2F
	if(__NFUN_342__(Str1, 'None'))
	{
		SearchStrings[SearchStrings.Add(1)] = __NFUN_319__(string(Str1));
	}
	// End:0x56
	if(__NFUN_342__(Str2, 'None'))
	{
		SearchStrings[SearchStrings.Add(1)] = __NFUN_319__(string(Str2));
	}
	// End:0x7D
	if(__NFUN_342__(str3, 'None'))
	{
		SearchStrings[SearchStrings.Add(1)] = __NFUN_319__(string(str3));
	}
	// End:0xA4
	if(__NFUN_342__(str4, 'None'))
	{
		SearchStrings[SearchStrings.Add(1)] = __NFUN_319__(string(str4));
	}
	// End:0xCB
	if(__NFUN_342__(str5, 'None'))
	{
		SearchStrings[SearchStrings.Add(1)] = __NFUN_319__(string(str5));
	}
	LoadAnimations();
	return;
}

function Draw_TargetCollisionCyclinder()
{
	bDrawTargetCylinder = __NFUN_145__(bDrawTargetCylinder);
	return;
}

function Show_ProgrammerNames()
{
	bShowProgrammerAnimNames = true;
	LoadAnimations();
	ReplaceFunc('Show_ProgrammerNames', 'Show_AnimatorNames');
	return;
}

function Show_AnimatorNames()
{
	bShowProgrammerAnimNames = false;
	LoadAnimations();
	ReplaceFunc('Show_AnimatorNames', 'Show_ProgrammerNames');
	return;
}

function PlayAnim()
{
	local SHUDDebugTreeItem Item;
	local SAnimationInfo AnimInfo;

	Item = DebugTreeItems[DebugTreeUseIndex];
	AnimInfo = m_aTarget.AnimCtrl.m_oController.Animations[AnimEntryInfoIndex];
	// End:0x9C
	if(__NFUN_148__(__NFUN_340__(m_aTarget, none), AnimSinglePlay))
	{
		m_aTarget.MyAnimHUD = self;
		m_aTarget.SuspendExecutive(true);
		m_aTarget.PlayAnim(AnimInfo.AnimationName,,, true);
		bPlayingQueuedAnims = false;		
	}
	else
	{
		AnimNameQueue[AnimNameQueue.Add(1)] = AnimInfo.AnimationName;
	}
	return;
}

function NotifyAnimEnd(AIActor act, int nChannel, name AnimName, int nRefId)
{
	// End:0x19
	if(bPlayingQueuedAnims)
	{
		__NFUN_184__(QueueIndex);
		PlayNextQueuedAnim();		
	}
	else
	{
		act.MyAnimHUD = none;
		act.Anim_Idle();
	}
	return;
}

function DebugSearch()
{
	bDebugSearch = __NFUN_145__(bDebugSearch);
	return;
}

function Clear_Queue()
{
	string(AnimNameQueue) = 0;
	return;
}

function Play_Queue()
{
	// End:0x24
	if(__NFUN_170__(string(AnimNameQueue), 0))
	{
		bPlayingQueuedAnims = true;
		QueueIndex = 0;
		PlayNextQueuedAnim();		
	}
	else
	{
		BroadcastLog("AI AnimHUD Warning: No anims queued to play!");
	}
	return;
}

function PlayNextQueuedAnim()
{
	// End:0x53
	if(__NFUN_170__(string(AnimNameQueue), QueueIndex))
	{
		m_aTarget.MyAnimHUD = self;
		m_aTarget.SuspendExecutive(true);
		m_aTarget.PlayAnim(AnimNameQueue[QueueIndex],,, true);		
	}
	else
	{
		bPlayingQueuedAnims = false;
		m_aTarget.MyAnimHUD = none;
		m_aTarget.Anim_Idle();
	}
	return;
}

function Enable_Queuing()
{
	AnimSinglePlay = false;
	ReplaceFunc('Enable_Queuing', 'Enable_SinglePlay');
	return;
}

function Enable_SinglePlay()
{
	AnimSinglePlay = true;
	ReplaceFunc('Enable_SinglePlay', 'Enable_Queuing');
	return;
}

defaultproperties
{
	AnimEntryInfoIndex=-1
	
	Cond=255
	A=0
}
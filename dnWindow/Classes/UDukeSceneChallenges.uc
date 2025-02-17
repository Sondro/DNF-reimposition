/*******************************************************************************
 * UDukeSceneChallenges generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneChallenges extends UWindowScene
	config;

var localized string MenuTitleText;
var float TitleXPosPct;
var float TitleYOffset;
var float TitleScale;
var float BkgAlpha;
var float TitleYPos;
var config float DigsListBoxXPct;
var config float DigsListBoxYPct;
var config float DigsWindowWidthPct;
var config float DigsListBoxHeightPct;
var config float ItemWidthPct;
var UDukeScrollingWindow ScrollWindow;
var array<UDukeChallengeEntry> ItemList;
var UDukeChallengeEntry LastFocus;
var float ScrollWindowHeight;
var float ScrollWindowY;
var UDukeChallengeDisplayWindow DisplayWindow;
var config float DisplayX;
var config float DisplayY;
var config float DisplayWidth;
var config float DisplayHeight;
var float LogoX;
var float LogoY;
var float ItemHeight;
var float TotalHeight;

function Created()
{
	local int i;
	local UDukeChallengeEntry Item;

	super.Created();
	DisplayWindow = UDukeChallengeDisplayWindow(CreateWindow(class'UDukeChallengeDisplayWindow', 1, 1, 1, 1, self));
	ScrollWindow = UDukeScrollingWindow(CreateWindow(class'UDukeScrollingWindow', 1, 1, 1, 1, self));
	ScrollWindow.DesiredScrollAmount = 40;
	i = 0;
	J0x78:

	// End:0x12B [Loop If]
	if(__NFUN_169__(i, string(class'ChallengeInfo'.default.ChallengesArray)))
	{
		// End:0x121
		if(__NFUN_174__(class'ChallengeInfo'.default.ChallengesArray[i].EXPBonus, 0))
		{
			Item = UDukeChallengeEntry(ScrollWindow.CreateSubWindow(class'UDukeChallengeEntry', 1, 1, 1, 1, self));
			Item.Register(self);
			ItemList[ItemList.Add(1)] = Item;
			ItemList[i].HideWindow();
		}
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x78;
	}
	UpdateItems();
	KeyButtons[0].HideWindow();
	KeyButtons[2].PCButton = SPCText;
	KeyButtons[2].PCInputKey = int(32);
	i = 0;
	J0x178:

	// End:0x1B9 [Loop If]
	if(__NFUN_169__(i, __NFUN_166__(string(ItemList), 1)))
	{
		ItemList[i].NavDown = ItemList[__NFUN_165__(i, 1)];
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x178;
	}
	i = 1;
	J0x1C0:

	// End:0x1FE [Loop If]
	if(__NFUN_169__(i, string(ItemList)))
	{
		ItemList[i].NavUp = ItemList[__NFUN_166__(i, 1)];
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x1C0;
	}
	// End:0x252
	if(__NFUN_148__(__NFUN_170__(string(ItemList), 0), __NFUN_340__(ScrollWindow.ClientArea, none)))
	{
		ScrollWindow.ClientArea.ChildInFocus = ItemList[0];
		NotifyFromControl(ItemList[0], 17);
	}
	return;
}

function UpdateItems()
{
	local int ItemCounter, i, ChallID;
	local Engine.Object.EChallengeStatus Status;

	ItemCounter = 0;
	i = 0;
	J0x0E:

	// End:0x134 [Loop If]
	if(__NFUN_169__(i, string(class'ChallengeInfo'.default.ChallengesArray)))
	{
		ChallID = class'ChallengeInfo'.default.ChallengesArray[i].ChallengeID;
		Status = DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatus(ChallID);
		// End:0x12A
		if(__NFUN_148__(__NFUN_174__(class'ChallengeInfo'.default.ChallengesArray[i].EXPBonus, 0), __NFUN_173__(int(Status), int(1))))
		{
			ItemList[ItemCounter].ItemState = 1;
			ItemList[ItemCounter].ChallID = ChallID;
			ItemList[ItemCounter].SetText(__NFUN_356__("ChallengeNames", class'ChallengeInfo'.default.ChallengesArray[i].Name, "dnWindow"));
			__NFUN_182__(ItemCounter);
		}
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x0E;
	}
	i = 0;
	J0x13B:

	// End:0x261 [Loop If]
	if(__NFUN_169__(i, string(class'ChallengeInfo'.default.ChallengesArray)))
	{
		ChallID = class'ChallengeInfo'.default.ChallengesArray[i].ChallengeID;
		Status = DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatus(ChallID);
		// End:0x257
		if(__NFUN_148__(__NFUN_174__(class'ChallengeInfo'.default.ChallengesArray[i].EXPBonus, 0), __NFUN_170__(int(Status), int(1))))
		{
			ItemList[ItemCounter].ItemState = 0;
			ItemList[ItemCounter].ChallID = ChallID;
			ItemList[ItemCounter].SetText(__NFUN_356__("ChallengeNames", class'ChallengeInfo'.default.ChallengesArray[i].Name, "dnWindow"));
			__NFUN_182__(ItemCounter);
		}
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x13B;
	}
	i = 0;
	J0x268:

	// End:0x38E [Loop If]
	if(__NFUN_169__(i, string(class'ChallengeInfo'.default.ChallengesArray)))
	{
		ChallID = class'ChallengeInfo'.default.ChallengesArray[i].ChallengeID;
		Status = DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatus(ChallID);
		// End:0x384
		if(__NFUN_148__(__NFUN_174__(class'ChallengeInfo'.default.ChallengesArray[i].EXPBonus, 0), __NFUN_173__(int(Status), int(0))))
		{
			ItemList[ItemCounter].ItemState = 2;
			ItemList[ItemCounter].ChallID = ChallID;
			ItemList[ItemCounter].SetText(__NFUN_356__("ChallengeNames", class'ChallengeInfo'.default.ChallengesArray[i].Name, "dnWindow"));
			__NFUN_182__(ItemCounter);
		}
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x268;
	}
	// End:0x3FB
	if(__NFUN_148__(__NFUN_170__(string(ItemList), 0), __NFUN_340__(ScrollWindow.ClientArea, none)))
	{
		ItemList[0].ShowWindow();
		ScrollWindow.ClientArea.ChildInFocus = ItemList[0];
		NotifyFromControl(ItemList[0], 17);
		LastFocus = none;
	}
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local float XL, YL, NewScale;
	local int i;
	local float NextWinTop, DesiredTop;
	local bool bNeedAlign;
	local UDukeChallengeEntry SelectedButton, focusedChild;
	local float OrgX, OrgY, ClipX, ClipY;

	DrawStretchedTexture(C, 0, 0, WinWidth, WinHeight, class'BlackTexture', BkgAlpha,,, true);
	super.Paint(C, X, Y);
	ItemHeight = __NFUN_195__(35, WinScaleY);
	TotalHeight = __NFUN_195__(float(__NFUN_166__(string(ItemList), 1)), float(ControlBuffer));
	i = 0;
	J0x72:

	// End:0x246 [Loop If]
	if(__NFUN_169__(i, string(ItemList)))
	{
		ItemList[i].WinLeft = 0;
		ItemList[i].WinTop = NextWinTop;
		ItemList[i].WinWidth = __NFUN_195__(WinWidth, ItemWidthPct);
		ItemList[i].WinHeight = ItemHeight;
		// End:0x186
		if(__NFUN_148__(__NFUN_203__(NextWinTop, __NFUN_199__(ScrollWindow.VertSB.pos, __NFUN_195__(ItemHeight, float(2)))), __NFUN_200__(__NFUN_198__(NextWinTop, ItemHeight), __NFUN_198__(__NFUN_198__(ScrollWindow.VertSB.pos, ScrollWindow.WinHeight), __NFUN_195__(ItemHeight, float(2))))))
		{
			ItemList[i].ShowWindow();			
		}
		else
		{
			// End:0x1F6
			if(__NFUN_148__(__NFUN_148__(__NFUN_340__(ItemList[i], ChildInFocus), __NFUN_340__(ItemList[i].NavUp, ChildInFocus)), __NFUN_340__(ItemList[i].NavDown, ChildInFocus)))
			{
				ItemList[i].HideWindow();
			}
		}
		NextWinTop = __NFUN_198__(__NFUN_198__(ItemList[i].WinTop, ItemList[i].WinHeight), float(ControlBuffer));
		__NFUN_209__(TotalHeight, ItemHeight);
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x72;
	}
	focusedChild = UDukeChallengeEntry(ItemList[0].ParentWindow.ChildInFocus);
	DesiredTop = focusedChild.WinTop;
	// End:0x2A4
	if(__NFUN_340__(LastFocus, focusedChild))
	{
		bNeedAlign = true;
		LastFocus = focusedChild;
	}
	SelectedButton = focusedChild;
	ScrollWindow.WinWidth = __NFUN_195__(WinWidth, ItemWidthPct);
	ScrollWindow.WinLeft = float(ButtonLeft);
	ScrollWindow.WinTop = __NFUN_195__(ScrollWindowY, float(C.SizeY));
	ScrollWindow.WinHeight = __NFUN_195__(ScrollWindowHeight, float(C.SizeY));
	ScrollWindow.DesiredClientHeight = TotalHeight;
	// End:0x3BE
	if(__NFUN_201__(TotalHeight, ScrollWindow.WinHeight))
	{
		ScrollWindow.VertSB.ShowWindow();
		// End:0x3BB
		if(bNeedAlign)
		{
			ScrollWindow.ScrollTo(0, DesiredTop);
			ScrollWindow.ScrollTo(0, __NFUN_198__(DesiredTop, ItemHeight));
		}		
	}
	else
	{
		ScrollWindow.VertSB.HideWindow();
		ScrollWindow.ScrollTo(0, 0);
	}
	ChildInFocus = LastFocus;
	// End:0x562
	if(__NFUN_340__(SelectedButton, none))
	{
		OrgX = C.OrgX;
		OrgY = C.OrgY;
		ClipX = C.ClipX;
		ClipY = C.ClipY;
		C.__NFUN_1251__(ScrollWindow.WinLeft, ScrollWindow.WinTop);
		C.__NFUN_1252__(ScrollWindow.WinWidth, ScrollWindow.WinHeight);
		class'UWindowScene'.static.DrawSelectionIcon(C, __NFUN_195__(-8, C.FixedScale), __NFUN_199__(__NFUN_198__(SelectedButton.WinTop, __NFUN_195__(0.5, SelectedButton.WinHeight)), ScrollWindow.VertSB.pos), C.FixedScale, 1);
		C.__NFUN_1251__(OrgX, OrgY);
		C.__NFUN_1252__(ClipX, ClipY);
	}
	NewScale = __NFUN_195__(TitleScale, TTFontScale);
	TextSize(C, TitleText, XL, YL, NewScale, NewScale);
	DisplayWindow.WinWidth = __NFUN_195__(float(C.SizeX), DigsWindowWidthPct);
	DisplayWindow.WinHeight = __NFUN_195__(float(C.SizeY), DigsListBoxHeightPct);
	DisplayWindow.WinTop = __NFUN_195__(float(C.SizeY), DigsListBoxYPct);
	DisplayWindow.WinLeft = __NFUN_199__(__NFUN_195__(float(C.SizeX), DigsListBoxXPct), DisplayWindow.WinWidth);
	return;
}

function OnNavForward()
{
	super.OnNavForward();
	UpdateItems();
	return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	super.NotifyFromControl(C, E);
	// End:0x56
	if(C.__NFUN_358__('UDukeChallengeEntry'))
	{
		// End:0x56
		if(__NFUN_173__(int(E), 17))
		{
			DisplayWindow.SetChallId(UDukeChallengeEntry(C).ChallID);
		}
	}
	return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
	ScrollWindow.WindowEvent(msg, C, X, Y, Key);
	super.WindowEvent(msg, C, X, Y, Key);
	return;
}

defaultproperties
{
	TitleXPosPct=0.04
	TitleScale=1.5
	BkgAlpha=0.75
	TitleYPos=145
	DigsListBoxXPct=0.93
	DigsListBoxYPct=0.355
	DigsWindowWidthPct=0.45
	DigsListBoxHeightPct=0.48
	ItemWidthPct=0.37
	ScrollWindowHeight=0.48
	ScrollWindowY=0.355
	LogoX=339
	LogoY=90
	LineBottomY=600
	FilmGrainMaterial=none
	TitleText="<?int?dnWindow.UDukeSceneChallenges.TitleText?>"
	bAcceptsFocus=true
}
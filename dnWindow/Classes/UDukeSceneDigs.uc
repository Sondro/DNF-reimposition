/*******************************************************************************
 * UDukeSceneDigs generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneDigs extends UWindowScene
	config;

var localized string ToggleButtonStringShow;
var localized string ToggleButtonStringHide;
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
var array<UDukeDigsCustomCheckBox> ItemList;
var UDukeDigsCustomCheckBox LastFocus;
var float ScrollWindowHeight;
var float ScrollWindowY;
var UDukeDigsDisplayWindow DisplayWindow;
var config float DisplayX;
var config float DisplayY;
var config float DisplayWidth;
var config float DisplayHeight;
var bool bPrevHideCrosshair;
var float fScrollSpeed;

function BeforeCreate()
{
	super.BeforeCreate();
	TitleText = MenuTitleText;
	return;
}

function Created()
{
	local int i;
	local UDukeDigsCustomCheckBox Item;

	super.Created();
	DisplayWindow = UDukeDigsDisplayWindow(CreateWindow(class'UDukeDigsDisplayWindow', 1, 1, 1, 1, self));
	ScrollWindow = UDukeScrollingWindow(CreateWindow(class'UDukeScrollingWindow', 1, 1, 1, 1, self));
	i = 0;
	J0x63:

	// End:0x103 [Loop If]
	if(__NFUN_169__(i, string(class'ChallengeInfo'.default.ChallengesArray)))
	{
		// End:0xF9
		if(__NFUN_173__(int(class'ChallengeInfo'.default.ChallengesArray[i].Category), int(1)))
		{
			Item = UDukeDigsCustomCheckBox(ScrollWindow.CreateSubWindow(class'UDukeDigsCustomCheckBox', 1, 1, 1, 1, self));
			Item.Register(self);
			ItemList[ItemList.Add(1)] = Item;
		}
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x63;
	}
	UpdateItems();
	KeyButtons[0].HideWindow();
	KeyButtons[2].PCButton = SPCText;
	KeyButtons[2].PCInputKey = int(32);
	ItemList[0].NavUp = ItemList[__NFUN_166__(string(ItemList), 1)];
	ItemList[__NFUN_166__(string(ItemList), 1)].NavDown = ItemList[0];
	i = 0;
	J0x192:

	// End:0x212 [Loop If]
	if(__NFUN_169__(i, string(ItemList)))
	{
		// End:0x1D9
		if(__NFUN_169__(__NFUN_165__(i, 1), string(ItemList)))
		{
			ItemList[i].NavDown = ItemList[__NFUN_165__(i, 1)];
		}
		// End:0x208
		if(__NFUN_174__(i, 0))
		{
			ItemList[i].NavUp = ItemList[__NFUN_166__(i, 1)];
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x192;
	}
	// End:0x266
	if(__NFUN_148__(__NFUN_170__(string(ItemList), 0), __NFUN_340__(ScrollWindow.ClientArea, none)))
	{
		ScrollWindow.ClientArea.ChildInFocus = ItemList[0];
		NotifyFromControl(ItemList[0], 17);
	}
	return;
}

function sortItemList()
{
	local int i, j, Count, Idx, thresholdI, thresholdJ;

	local UDukeDigsCustomCheckBox temp;

	Count = string(ItemList);
	i = 0;
	J0x13:

	// End:0xBE [Loop If]
	if(__NFUN_169__(i, __NFUN_166__(Count, 1)))
	{
		j = __NFUN_165__(i, 1);
		J0x33:

		// End:0xB4 [Loop If]
		if(__NFUN_169__(j, Count))
		{
			// End:0xAA
			if(__NFUN_172__(ItemList[i].UnlockLevel, ItemList[j].UnlockLevel))
			{
				temp = ItemList[j];
				ItemList[j] = ItemList[i];
				ItemList[i] = temp;
			}
			__NFUN_184__(j);
			// [Loop Continue]
			goto J0x33;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x13;
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

	// End:0x52 [Loop If]
	if(__NFUN_169__(i, string(class'ChallengeInfo'.default.ChallengesArray)))
	{
		ChallID = class'ChallengeInfo'.default.ChallengesArray[i].ChallengeID;
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x0E;
	}
	i = 0;
	J0x59:

	// End:0x235 [Loop If]
	if(__NFUN_169__(i, string(class'ChallengeInfo'.default.ChallengesArray)))
	{
		ChallID = class'ChallengeInfo'.default.ChallengesArray[i].ChallengeID;
		Status = DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatus(ChallID);
		// End:0x22B
		if(__NFUN_173__(int(class'ChallengeInfo'.default.ChallengesArray[i].Category), int(1)))
		{
			// End:0x10A
			if(__NFUN_173__(int(Status), int(1)))
			{
				ItemList[ItemCounter].ItemState = 1;				
			}
			else
			{
				// End:0x133
				if(__NFUN_170__(int(Status), int(1)))
				{
					ItemList[ItemCounter].ItemState = 0;					
				}
				else
				{
					ItemList[ItemCounter].ItemState = 2;
				}
			}
			ItemList[ItemCounter].bChecked = __NFUN_150__(__NFUN_173__(int(Status), int(3)), __NFUN_173__(int(Status), int(1)));
			ItemList[ItemCounter].ChallID = ChallID;
			ItemList[ItemCounter].UnlockLevel = ChallengeObject_Stat(class'ChallengeInfo'.default.ChallengesArray[i].ChallObj).StatThreshold;
			ItemList[ItemCounter].SetText(__NFUN_356__("ChallengeNames", class'ChallengeInfo'.default.ChallengesArray[i].Name, "dnWindow"));
			__NFUN_182__(ItemCounter);
		}
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x59;
	}
	sortItemList();
	// End:0x28F
	if(__NFUN_148__(__NFUN_170__(string(ItemList), 0), __NFUN_340__(ScrollWindow.ClientArea, none)))
	{
		ScrollWindow.ClientArea.ChildInFocus = ItemList[0];
		NotifyFromControl(ItemList[0], 17);
	}
	return;
}

function AfterCreate()
{
	super(UWindowWindow).AfterCreate();
	return;
}

function BeforePaint(Canvas C, float X, float Y)
{
	super.BeforePaint(C, X, Y);
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local float XL, YL, NewScale;
	local int i;
	local float NextWinTop, DesiredTop, TotalHeight;
	local bool bNeedAlign;
	local UDukeDigsCustomCheckBox SelectedButton;
	local float OrgX, OrgY, ClipX, ClipY;

	DrawStretchedTexture(C, 0, 0, WinWidth, WinHeight, class'BlackTexture', BkgAlpha,,, true);
	TotalHeight = __NFUN_195__(float(__NFUN_166__(string(ItemList), 1)), float(ControlBuffer));
	i = 0;
	J0x4B:

	// End:0x1AB [Loop If]
	if(__NFUN_169__(i, string(ItemList)))
	{
		ItemList[i].WinLeft = 0;
		ItemList[i].WinTop = NextWinTop;
		ItemList[i].WinWidth = __NFUN_195__(WinWidth, ItemWidthPct);
		ItemList[i].WinHeight = float(ButtonHeight);
		NextWinTop = __NFUN_198__(__NFUN_198__(ItemList[i].WinTop, ItemList[i].WinHeight), float(ControlBuffer));
		// End:0x194
		if(__NFUN_339__(ItemList[i].ParentWindow.ChildInFocus, ItemList[i]))
		{
			DesiredTop = ItemList[i].WinTop;
			// End:0x183
			if(__NFUN_340__(LastFocus, ItemList[i]))
			{
				bNeedAlign = true;
				LastFocus = ItemList[i];
			}
			SelectedButton = ItemList[i];
		}
		__NFUN_209__(TotalHeight, float(ButtonHeight));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x4B;
	}
	ScrollWindow.WinWidth = __NFUN_195__(WinWidth, ItemWidthPct);
	ScrollWindow.WinLeft = __NFUN_195__(80, WinScaleX);
	ScrollWindow.WinTop = __NFUN_195__(ScrollWindowY, WinScaleY);
	ScrollWindow.WinHeight = __NFUN_195__(ScrollWindowHeight, WinScaleY);
	ScrollWindow.DesiredClientHeight = TotalHeight;
	// End:0x2AB
	if(__NFUN_201__(TotalHeight, ScrollWindow.WinHeight))
	{
		ScrollWindow.VertSB.ShowWindow();
		// End:0x2A8
		if(bNeedAlign)
		{
			ScrollWindow.ScrollTo(0, DesiredTop);
			ScrollWindow.ScrollTo(0, __NFUN_198__(DesiredTop, float(ButtonHeight)));
		}		
	}
	else
	{
		ScrollWindow.VertSB.HideWindow();
		ScrollWindow.ScrollTo(0, 0);
	}
	ChildInFocus = LastFocus;
	super.Paint(C, X, Y);
	GetPlayerOwner().StopSoundInfo(SoundMenuAmbience);
	// End:0x3A3
	if(__NFUN_340__(SelectedButton, none))
	{
		OrgX = C.OrgX;
		OrgY = C.OrgY;
		ClipX = C.ClipX;
		ClipY = C.ClipY;
		C.__NFUN_1251__(OrgX, OrgY);
		C.__NFUN_1252__(ClipX, ClipY);
	}
	NewScale = __NFUN_195__(TitleScale, TTFontScale);
	TextSize(C, MenuTitleText, XL, YL, NewScale, NewScale);
	DisplayWindow.WinWidth = __NFUN_195__(float(C.SizeX), DigsWindowWidthPct);
	DisplayWindow.WinHeight = __NFUN_195__(float(C.SizeY), DigsListBoxHeightPct);
	DisplayWindow.WinTop = __NFUN_195__(float(C.SizeY), DigsListBoxYPct);
	DisplayWindow.WinLeft = __NFUN_199__(__NFUN_195__(float(C.SizeX), DigsListBoxXPct), DisplayWindow.WinWidth);
	return;
}

function OnNavForward()
{
	super.OnNavForward();
	// End:0x44
	if(__NFUN_340__(MetagameHUD(GetPlayerOwner().MyHUD), none))
	{
		dnDigsHud(GetPlayerOwner().MyHUD).bDrawDigsHud = false;
	}
	DisplayWindow.OnNavForward();
	Root.Console.bDontDrawMouse = false;
	bPrevHideCrosshair = GetPlayerOwner().MyHUD.bHideCrosshair;
	GetPlayerOwner().MyHUD.bHideCrosshair = true;
	return;
}

function NavigateBack()
{
	GetPlayerOwner().MyHUD.bHideCrosshair = bPrevHideCrosshair;
	// End:0x60
	if(__NFUN_340__(MetagameHUD(GetPlayerOwner().MyHUD), none))
	{
		dnDigsHud(GetPlayerOwner().MyHUD).bDrawDigsHud = true;
	}
	dnMyDigs(GetLevel().Game).CheckShow();
	super.NavigateBack();
	Root.Console.bShowDigsMenu = false;
	// End:0xDB
	if(__NFUN_145__(Root.Console.bShowConsole))
	{
		Root.Console.CloseUWindow();
	}
	GetPlayerOwner().PlaySoundInfo(0, SoundNavigateBackInfo);
	return;
}

function ToggleShowHideText(bool bShow)
{
	KeyButtons[2].ShowWindow();
	// End:0x37
	if(bShow)
	{
		KeyButtons[2].SetText(ToggleButtonStringShow);		
	}
	else
	{
		KeyButtons[2].SetText(ToggleButtonStringHide);
	}
	return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	local bool IsShown, IsLocked;
	local class<ChallengeInfo> CIC;

	super.NotifyFromControl(C, E);
	// End:0x1B5
	if(C.__NFUN_358__('UDukeDigsCustomCheckBox'))
	{
		// End:0x122
		if(__NFUN_150__(__NFUN_173__(int(E), 17), __NFUN_173__(int(E), 1)))
		{
			IsLocked = __NFUN_173__(int(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatus(UDukeDigsCustomCheckBox(C).ChallID)), int(0));
			IsShown = __NFUN_173__(int(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetChallengeStatus(UDukeDigsCustomCheckBox(C).ChallID)), int(3));
			// End:0xE1
			if(IsLocked)
			{
				KeyButtons[2].HideWindow();				
			}
			else
			{
				ToggleShowHideText(__NFUN_145__(UDukeDigsCustomCheckBox(C).bChecked));
			}
			DisplayWindow.SetChallId(UDukeDigsCustomCheckBox(C).ChallID);
		}
		// End:0x1B5
		if(__NFUN_173__(int(E), 1))
		{
			// End:0x17F
			if(UDukeDigsCustomCheckBox(C).bChecked)
			{
				DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.SetChallengeStatus(UDukeDigsCustomCheckBox(C).ChallID, 3);				
			}
			else
			{
				DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.SetChallengeStatus(UDukeDigsCustomCheckBox(C).ChallID, 2);
			}
		}
	}
	return;
}

function GetTitleLocation(Canvas C, coerce out float Top, coerce out float Right)
{
	super.GetTitleLocation(C, Top, Right);
	Top = __NFUN_195__(TitleYPos, WinScaleY);
	return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
	// End:0xA1
	if(__NFUN_173__(int(msg), int(7)))
	{
		switch(Key)
		{
			// End:0x5B
			case int(236):
				ScrollWindow.VertSB.Scroll(__NFUN_195__(__NFUN_194__(ScrollWindow.VertSB.ScrollAmount), fScrollSpeed));
				// End:0xA1
				break;
			// End:0x9E
			case int(237):
				ScrollWindow.VertSB.Scroll(__NFUN_195__(ScrollWindow.VertSB.ScrollAmount, fScrollSpeed));
				// End:0xA1
				break;
			// End:0xFFFF
			default:
				break;
		}
	}
	else
	{
		super.WindowEvent(msg, C, X, Y, Key);
		return;
	}
}

defaultproperties
{
	ToggleButtonStringShow="<?int?dnWindow.UDukeSceneDigs.ToggleButtonStringShow?>"
	ToggleButtonStringHide="<?int?dnWindow.UDukeSceneDigs.ToggleButtonStringHide?>"
	TitleXPosPct=0.04
	TitleScale=1.5
	BkgAlpha=0.75
	TitleYPos=95
	DigsListBoxXPct=0.9
	DigsListBoxYPct=0.2
	DigsWindowWidthPct=0.4
	DigsListBoxHeightPct=0.65
	ItemWidthPct=0.43
	ScrollWindowHeight=420
	ScrollWindowY=180
	fScrollSpeed=5
	LineTopY=135
	LineBottomY=600
	LogoTexture=none
	FilmGrainMaterial=none
	TitleText="<?int?dnWindow.UDukeSceneDigs.TitleText?>"
	bNoLogo=true
	bNoBackground=true
	bMenuMusic=false
	bAcceptsFocus=true
}
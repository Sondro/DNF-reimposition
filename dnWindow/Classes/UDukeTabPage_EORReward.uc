/*******************************************************************************
 * UDukeTabPage_EORReward generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeTabPage_EORReward extends UDukeTabPage
	dependson(UDukeGainedXPProgressBar);

const MaxEntries = 6;

struct SNewChallInfo
{
	var string LocdName;
	var int XPValue;
	var string Reward;
};

var int NumEntries;
var int BaseEntry;
var float SwitchTimer;
var float cSwitchTime;
var localized string LevelUpTitle;
var localized string LevelUpSubTitle;
var localized string CongratTitle;
var localized string XPSummaryTitle;
var localized string ViewResults;
var localized string CountDownStr;
var localized string NoRewardText;
var string ExpGainStr;
var localized string ChallengesCompleted;
var localized string ItemsUnlocked;
var localized string CombatXP;
var localized string ChallengeXP;
var localized string MatchXP;
var string TitleStr;
var string SubTitleStr;
var string curLvlStr;
var string nextLvlStr;
var Texture HorizBarTexture;
var float BarSpacing;
var float LineXIndentPct;
var float CDXPos;
var float CDYPos;
var float CDTextScale;
var Color BorderColor;
var float FillLeft;
var float FillTop;
var float FillWidth;
var float FillHeight;
var float FillHalf;
var float borderwidth;
var float FillAlpha;
var float FillLeftPct;
var float FillTopPct;
var float FillWidthPct;
var float FillHeightPct;
var float TitleTextScale;
var float SubTitleTextScale;
var float ChallTextScale;
var float ChallItemTextScale;
var float ChallXPTitleXPct;
var float ChallTitleXPct;
var float ChallItemXPct;
var float ChallXPXPct;
var float RewardTitleXPct;
var float RewardItemXPct;
var float BottomBarYPct;
var UDukeGainedXPProgressBar ProgressBar;
var float ProgressBarXPct;
var float ProgressBarWidthPct;
var float ProgressBarHeightPct;
var float XPCenterXOffset;
var string CombatXPStr;
var string ChallengeXPStr;
var string MatchXPStr;
var array<SNewChallInfo> NewChallenges;

function Created()
{
	super.Created();
	ExpGainStr = __NFUN_356__("MetagameHUD", "ExpGainStr", "dngame");
	ProgressBar = UDukeGainedXPProgressBar(CreateWindow(class'UDukeGainedXPProgressBar',,,,, self));
	ProgressBar.Register(self);
	return;
}

function SetSceneButtons()
{
	super.SetSceneButtons();
	SceneWindow.KeyButtons[0].HideWindow();
	SceneWindow.KeyButtons[0].bDo480FontScale = false;
	SceneWindow.KeyButtons[0].setFontScale(0.6);
	SceneWindow.KeyButtons[1].ShowWindow();
	SceneWindow.KeyButtons[1].bDo480FontScale = false;
	SceneWindow.KeyButtons[1].setFontScale(0.6);
	SceneWindow.KeyButtons[3].ShowWindow();
	SceneWindow.KeyButtons[3].PCButton = class'UDukeKeyBinderControl'.default.LocalizedKeyName[32];
	SceneWindow.KeyButtons[3].SetText(ViewResults);
	SceneWindow.KeyButtons[3].bDo480FontScale = false;
	SceneWindow.KeyButtons[3].setFontScale(0.6);
	return;
}

function SetBackgroundBoundries(Canvas C)
{
	borderwidth = 5;
	FillLeft = __NFUN_195__(FillLeftPct, float(C.SizeX));
	FillTop = __NFUN_195__(FillTopPct, float(C.SizeY));
	FillWidth = __NFUN_195__(FillWidthPct, float(C.SizeX));
	FillHeight = __NFUN_195__(FillHeightPct, float(C.SizeY));
	FillHalf = __NFUN_198__(FillLeft, __NFUN_196__(FillWidth, 2));
	return;
}

function DrawBackground(Canvas C)
{
	C.DrawColor = WhiteColor;
	C.Style = 8;
	DrawStretchedTexture(C, FillLeft, FillTop, FillWidth, FillHeight, class'BlackTexture', FillAlpha,,, true);
	C.DrawColor = BorderColor;
	C.Style = 1;
	DrawStretchedTexture(C, __NFUN_199__(FillLeft, borderwidth), __NFUN_199__(FillTop, borderwidth), __NFUN_198__(FillWidth, borderwidth), borderwidth, class'WhiteTexture');
	DrawStretchedTexture(C, __NFUN_199__(FillLeft, borderwidth), FillTop, borderwidth, FillHeight, class'WhiteTexture');
	DrawStretchedTexture(C, __NFUN_199__(__NFUN_198__(FillLeft, FillWidth), borderwidth), FillTop, borderwidth, FillHeight, class'WhiteTexture');
	DrawStretchedTexture(C, __NFUN_199__(FillLeft, borderwidth), __NFUN_198__(FillTop, FillHeight), __NFUN_198__(FillWidth, borderwidth), borderwidth, class'WhiteTexture');
	return;
}

function SetTitle()
{
	local array<string> FormatArr;

	SubTitleStr = " ";
	// End:0x7E
	if(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.HasLeveledUp())
	{
		TitleStr = LevelUpTitle;
		FormatArr.Insert(0, 1);
		FormatArr[0] = string(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetLevel());
		SubTitleStr = __NFUN_328__(LevelUpSubTitle, FormatArr);		
	}
	else
	{
		// End:0x97
		if(__NFUN_170__(NumEntries, 0))
		{
			TitleStr = CongratTitle;			
		}
		else
		{
			TitleStr = XPSummaryTitle;
		}
	}
	return;
}

function Tick(float Delta)
{
	super(UWindowWindow).Tick(Delta);
	// End:0x5C
	if(__NFUN_170__(NumEntries, 6))
	{
		__NFUN_209__(SwitchTimer, Delta);
		// End:0x5C
		if(__NFUN_201__(SwitchTimer, cSwitchTime))
		{
			SwitchTimer = 0;
			__NFUN_180__(BaseEntry, 6);
			// End:0x5C
			if(__NFUN_172__(BaseEntry, NumEntries))
			{
				BaseEntry = 0;
			}
		}
	}
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local float CDXL, CDYL, TitleXL, TitleYL, SubtitleXL, SubtitleYL,
		XL, YL;

	local string S;
	local float YOffset, StoredYOffset, CDFontScale, TitleFontScale, SubtitleFontScale, OtherFontScale,
		ChallItemFontScale;

	local int i, ItemCount;
	local array<string> XP;

	super.Paint(C, X, Y);
	CDFontScale = __NFUN_195__(TTFontScale, CDTextScale);
	TitleFontScale = __NFUN_195__(TTFontScale, TitleTextScale);
	SubtitleFontScale = __NFUN_195__(TTFontScale, SubTitleTextScale);
	OtherFontScale = __NFUN_195__(TTFontScale, ChallTextScale);
	ChallItemFontScale = __NFUN_195__(TTFontScale, ChallItemTextScale);
	SetBackgroundBoundries(C);
	DrawBackground(C);
	C.Font = C.TallFont;
	C.DrawColor = class'UWindowScene'.default.GreyColor;
	YOffset = FillTop;
	TextSize(C, TitleStr, TitleXL, TitleYL, TitleFontScale, TitleFontScale);
	ClipText(C, __NFUN_199__(FillHalf, __NFUN_196__(TitleXL, 2)), YOffset, TitleStr,, TitleFontScale, TitleFontScale, 1, 2);
	__NFUN_209__(YOffset, TitleYL);
	TextSize(C, SubTitleStr, SubtitleXL, SubtitleYL, SubtitleFontScale, SubtitleFontScale);
	ClipText(C, __NFUN_199__(FillHalf, __NFUN_196__(SubtitleXL, 2)), YOffset, SubTitleStr,, SubtitleFontScale, SubtitleFontScale, 1, 2);
	__NFUN_209__(YOffset, SubtitleYL);
	__NFUN_209__(YOffset, BarSpacing);
	C.Style = 8;
	DrawStretchedTexture(C, __NFUN_198__(FillLeft, __NFUN_195__(FillWidth, LineXIndentPct)), YOffset, __NFUN_199__(__NFUN_195__(FillWidth, __NFUN_199__(1, LineXIndentPct)), FillLeft), 8, HorizBarTexture, 1);
	__NFUN_209__(YOffset, __NFUN_195__(BarSpacing, 2));
	C.Style = 1;
	TextSize(C, ChallengesCompleted, XL, YL, OtherFontScale, OtherFontScale);
	ClipText(C, __NFUN_198__(FillLeft, __NFUN_195__(FillWidth, ChallTitleXPct)), YOffset, ChallengesCompleted,, OtherFontScale, OtherFontScale, 1, 2);
	TextSize(C, ChallengeXP, XL, YL, OtherFontScale, OtherFontScale);
	ClipText(C, __NFUN_198__(FillLeft, __NFUN_195__(FillWidth, ChallXPTitleXPct)), YOffset, ChallengeXP,, OtherFontScale, OtherFontScale, 1, 2);
	TextSize(C, ItemsUnlocked, XL, YL, OtherFontScale, OtherFontScale);
	ClipText(C, __NFUN_198__(FillLeft, __NFUN_195__(FillWidth, RewardTitleXPct)), YOffset, ItemsUnlocked,, OtherFontScale, OtherFontScale, 1, 2);
	__NFUN_209__(YOffset, YL);
	StoredYOffset = YOffset;
	ItemCount = 0;
	i = BaseEntry;
	J0x383:

	// End:0x53E [Loop If]
	if(__NFUN_169__(i, __NFUN_188__(NumEntries, __NFUN_165__(BaseEntry, 6))))
	{
		TextSize(C, NewChallenges[i].LocdName, XL, YL, ChallItemFontScale, ChallItemFontScale);
		ClipText(C, __NFUN_198__(FillLeft, __NFUN_195__(FillWidth, ChallItemXPct)), YOffset, NewChallenges[i].LocdName,, ChallItemFontScale, ChallItemFontScale, 1, 2);
		XP[0] = string(NewChallenges[i].XPValue);
		ClipText(C, __NFUN_198__(FillLeft, __NFUN_195__(FillWidth, ChallXPXPct)), YOffset, __NFUN_328__(ExpGainStr, XP),, ChallItemFontScale, ChallItemFontScale, 1, 2);
		// End:0x4D5
		if(__NFUN_309__(NewChallenges[i].Reward, ""))
		{
			ClipText(C, __NFUN_198__(FillLeft, __NFUN_195__(FillWidth, RewardItemXPct)), YOffset, NewChallenges[i].Reward,, ChallItemFontScale, ChallItemFontScale, 1, 2);			
		}
		else
		{
			ClipText(C, __NFUN_198__(FillLeft, __NFUN_195__(FillWidth, RewardItemXPct)), YOffset, NoRewardText,, ChallItemFontScale, ChallItemFontScale, 1, 2);
		}
		__NFUN_209__(YOffset, YL);
		__NFUN_182__(ItemCount);
		// End:0x534
		if(__NFUN_173__(ItemCount, 6))
		{
			// [Explicit Break]
			goto J0x53E;
		}
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x383;
	}
	J0x53E:

	__NFUN_209__(YOffset, __NFUN_195__(YL, float(__NFUN_166__(6, ItemCount))));
	C.Style = 8;
	DrawStretchedTexture(C, __NFUN_198__(FillLeft, __NFUN_195__(FillWidth, LineXIndentPct)), YOffset, __NFUN_199__(__NFUN_195__(FillWidth, __NFUN_199__(1, LineXIndentPct)), FillLeft), 8, HorizBarTexture, 1);
	__NFUN_209__(YOffset, __NFUN_195__(BarSpacing, 2));
	C.Style = 1;
	ProgressBar.textscale = OtherFontScale;
	ProgressBar.WinTop = YOffset;
	ProgressBar.WinWidth = __NFUN_198__(FillLeft, __NFUN_195__(FillWidth, ProgressBarWidthPct));
	ProgressBar.WinLeft = __NFUN_199__(FillHalf, __NFUN_196__(ProgressBar.WinWidth, 2));
	ProgressBar.WinHeight = __NFUN_195__(FillHeight, ProgressBarHeightPct);
	ProgressBar.SetStartEnd(int(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetXPForLevel()), int(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetXPForLevel(1)));
	ProgressBar.SetCurrentValue(int(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetTotalXP()));
	ProgressBar.SetGainedValue(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetXP());
	ProgressBar.StartText = curLvlStr;
	ProgressBar.EndText = nextLvlStr;
	__NFUN_209__(YOffset, ProgressBar.WinHeight);
	TextSize(C, CombatXP, XL, YL, OtherFontScale, OtherFontScale);
	ClipText(C, __NFUN_199__(__NFUN_199__(FillHalf, __NFUN_195__(FillWidth, XPCenterXOffset)), XL), YOffset, CombatXP,, OtherFontScale, OtherFontScale, 1, 2);
	ClipText(C, __NFUN_198__(FillHalf, __NFUN_195__(FillWidth, XPCenterXOffset)), YOffset, CombatXPStr,, OtherFontScale, OtherFontScale, 1, 2);
	__NFUN_209__(YOffset, YL);
	TextSize(C, ChallengeXP, XL, YL, OtherFontScale, OtherFontScale);
	ClipText(C, __NFUN_199__(__NFUN_199__(FillHalf, __NFUN_195__(FillWidth, XPCenterXOffset)), XL), YOffset, ChallengeXP,, OtherFontScale, OtherFontScale, 1, 2);
	ClipText(C, __NFUN_198__(FillHalf, __NFUN_195__(FillWidth, XPCenterXOffset)), YOffset, ChallengeXPStr,, OtherFontScale, OtherFontScale, 1, 2);
	__NFUN_209__(YOffset, YL);
	TextSize(C, MatchXP, XL, YL, OtherFontScale, OtherFontScale);
	ClipText(C, __NFUN_199__(__NFUN_199__(FillHalf, __NFUN_195__(FillWidth, XPCenterXOffset)), XL), YOffset, MatchXP,, OtherFontScale, OtherFontScale, 1, 2);
	C.DrawColor = class'UWindowScene'.default.OrangeColor;
	ClipText(C, __NFUN_198__(FillHalf, __NFUN_195__(FillWidth, XPCenterXOffset)), YOffset, MatchXPStr,, OtherFontScale, OtherFontScale, 1, 2);
	C.DrawColor = class'UWindowScene'.default.GreyColor;
	// End:0xAA0
	if(__NFUN_170__(MPGameReplicationInfo(GetPlayerOwner().GameReplicationInfo).EORCountTime, 0))
	{
		C.DrawColor = WhiteColor;
		S = __NFUN_302__(CountDownStr, __NFUN_329__(int(__NFUN_198__(float(MPGameReplicationInfo(GetPlayerOwner().GameReplicationInfo).EORCountTime), 0.999))));
		TextSize(C, S, CDXL, CDYL, CDFontScale, CDFontScale);
		ClipText(C, __NFUN_199__(__NFUN_195__(float(C.SizeX), CDXPos), CDXL), __NFUN_199__(__NFUN_195__(float(C.SizeY), CDYPos), CDYL), S,, CDFontScale, CDFontScale, 1, 2);
	}
	return;
}

function DukeSuperMessageBoxDone(int Result, Engine.Object.EConsole_Dialog id)
{
	__NFUN_355__(__NFUN_303__(__NFUN_303__(__NFUN_303__(__NFUN_303__(__NFUN_303__(string(self), "::DukeSuperMessageBoxDone("), string(Result)), ", "), string(__NFUN_365__(class'EConsole_Dialog', int(id)))), ")"));
	// End:0xC9
	if(__NFUN_148__(__NFUN_173__(Result, 1), __NFUN_173__(int(id), int(19))))
	{
		// End:0xAB
		if(UDukeRootWindow(Root).AgentOnline.IsInGame())
		{
			UDukeRootWindow(Root).AgentOnline.LeaveGame();			
		}
		else
		{			
			GetPlayerOwner().ConsoleCommand("DISCONNECT");
		}
	}
	return;
}

function OnNavForward()
{
	local int i, dbgchal;
	local ChallengeInfoStruct InfoStruct;
	local int MatchXP, ChallengeXP;
	local array<string> FormatArr;
	local string XPFormater;

	ChallengeXP = 0;
	XPFormater = __NFUN_356__("UDukeChallengeEntry", "XPFormater", "dnwindow");
	super.OnNavForward();
	NewChallenges.Remove(0, string(NewChallenges));
	NewChallenges.Insert(0, string(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.AwardedChallengesInMatch));
	NumEntries = string(NewChallenges);
	i = 0;
	J0x88:

	// End:0x1FE [Loop If]
	if(__NFUN_169__(i, NumEntries))
	{
		InfoStruct = class'ChallengeInfo'.default.ChallengesArray[DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.AwardedChallengesInMatch[i]];
		// End:0x158
		if(__NFUN_173__(int(InfoStruct.StatDependency), int(239)))
		{
			NewChallenges[i].LocdName = __NFUN_356__("ChallengeNames", InfoStruct.HelpText, "dnWindow");
			NewChallenges[i].Reward = __NFUN_356__("ChallengeNames", InfoStruct.Name, "dnWindow");			
		}
		else
		{
			NewChallenges[i].LocdName = __NFUN_356__("ChallengeNames", InfoStruct.Name, "dnWindow");
			NewChallenges[i].Reward = __NFUN_356__("ChallengeNames", InfoStruct.HelpText, "dnWindow");
		}
		NewChallenges[i].XPValue = InfoStruct.EXPBonus;
		__NFUN_180__(ChallengeXP, InfoStruct.EXPBonus);
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x88;
	}
	SetTitle();
	FormatArr.Insert(0, 1);
	MatchXP = DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.ScreenMatchXP;
	FormatArr[0] = string(__NFUN_166__(MatchXP, ChallengeXP));
	CombatXPStr = __NFUN_328__(XPFormater, FormatArr);
	FormatArr[0] = string(ChallengeXP);
	ChallengeXPStr = __NFUN_328__(XPFormater, FormatArr);
	FormatArr[0] = string(MatchXP);
	MatchXPStr = __NFUN_328__(XPFormater, FormatArr);
	curLvlStr = __NFUN_356__("MetagameHUD", "LevelLabel", "dngame");
	nextLvlStr = curLvlStr;
	FormatArr[0] = string(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetLevel());
	curLvlStr = __NFUN_328__(curLvlStr, FormatArr);
	FormatArr[0] = string(__NFUN_165__(DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.GetLevel(), 1));
	nextLvlStr = __NFUN_328__(nextLvlStr, FormatArr);
	return;
}

defaultproperties
{
	cSwitchTime=2
	HorizBarTexture='Menu.MP.divider_horiz'
	BarSpacing=5
	LineXIndentPct=0.1
	CDXPos=0.85
	CDYPos=0.82
	CDTextScale=1.25
	BorderColor=(B=36,G=1,R=255,A=37)
	FillAlpha=0.65
	FillLeftPct=0.11
	FillTopPct=0.25
	FillWidthPct=0.75
	FillHeightPct=0.575
	TitleTextScale=1.65
	SubTitleTextScale=0.75
	ChallTextScale=0.8
	ChallItemTextScale=0.75
	ChallXPTitleXPct=0.38
	ChallTitleXPct=0.05
	ChallItemXPct=0.075
	ChallXPXPct=0.4
	RewardTitleXPct=0.65
	RewardItemXPct=0.68
	BottomBarYPct=0.6
	ProgressBarXPct=0.33
	ProgressBarWidthPct=0.33
	ProgressBarHeightPct=0.075
	XPCenterXOffset=0.015
}
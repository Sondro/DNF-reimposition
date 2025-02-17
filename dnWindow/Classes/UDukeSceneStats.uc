/*******************************************************************************
 * UDukeSceneStats generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneStats extends UWindowScene;

var Color GreyColor;
var DukeMultiPlayer PlayerModel;
var string PlayerNameStr;
var localized string LevelStr;
var localized string KillStr;
var localized string DeathsStr;
var localized string KDRatioStr;
var localized string TotalXPStr;
var localized string Title;
var float TFFontScale;
var DukeMultiPlayer dmp;
var float LeftSizeOffset;
var UDukeScrollingWindow StatDisplayScroller;
var UDukeStatDisplayWindow StatDisplay;
var string PlayerName;
var float fScrollSpeed;
var class<Actor> DLCClass;
var bool bCheckedDLC;

function Created()
{
	super.Created();
	KeyButtons[0].HideWindow();
	StatDisplayScroller = UDukeScrollingWindow(CreateWindow(class'UDukeScrollingWindow', 1, 1, 1, 1, self));
	StatDisplay = UDukeStatDisplayWindow(StatDisplayScroller.CreateSubWindow(class'UDukeStatDisplayWindow', 1, 1, 1, 1));
	CancelAcceptsFocus();
	PlayerNameStr = __NFUN_356__("UDukeSceneMultiPlayerScoreboardBase", "PlayerName", "dnWindow");
	TitleText = Title;
	return;
}

function BeforePaint(Canvas C, float X, float Y)
{
	local float StatDisplayHeight;
	local int statWinWidth;

	super.BeforePaint(C, X, Y);
	statWinWidth = int(__NFUN_195__(float(C.SizeX), 0.5));
	StatDisplayScroller.WinTop = float(ControlStart);
	StatDisplayScroller.WinWidth = float(statWinWidth);
	StatDisplayScroller.WinLeft = float(ButtonLeft);
	StatDisplayScroller.WinHeight = __NFUN_199__(__NFUN_199__(__NFUN_195__(float(LineBottomY), WinScaleY), 1.5), StatDisplayScroller.WinTop);
	StatDisplay.WinWidth = __NFUN_199__(__NFUN_199__(StatDisplayScroller.WinWidth, StatDisplayScroller.VertSB.WinWidth), 5);
	StatDisplay.GetDesiredHeight(C, StatDisplayHeight);
	StatDisplay.WinHeight = StatDisplayHeight;
	StatDisplayScroller.DesiredClientHeight = StatDisplay.WinHeight;
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local float StatDisplayHeight;
	local int statWinWidth;

	super.Paint(C, X, Y);
	statWinWidth = int(__NFUN_195__(float(C.SizeX), 0.5));
	C.DrawColor = WhiteColor;
	DrawBackgroundBox(C, float(ButtonLeft), float(__NFUN_166__(ControlStart, 2)), float(statWinWidth), __NFUN_199__(__NFUN_195__(float(LineBottomY), WinScaleY), StatDisplayScroller.WinTop));
	StatDisplayScroller.WinTop = float(ControlStart);
	StatDisplayScroller.WinWidth = float(statWinWidth);
	StatDisplayScroller.WinLeft = float(ButtonLeft);
	StatDisplayScroller.WinHeight = __NFUN_199__(__NFUN_199__(__NFUN_195__(float(LineBottomY), WinScaleY), 1.5), StatDisplayScroller.WinTop);
	StatDisplay.WinWidth = __NFUN_199__(__NFUN_199__(StatDisplayScroller.WinWidth, StatDisplayScroller.VertSB.WinWidth), 5);
	StatDisplay.GetDesiredHeight(C, StatDisplayHeight);
	StatDisplay.WinHeight = StatDisplayHeight;
	StatDisplayScroller.DesiredClientHeight = StatDisplay.WinHeight;
	return;
}

function OnNavForward()
{
	super.OnNavForward();
	KeyButtons[1].ShowWindow();
	// End:0x5F
	if(__NFUN_145__(__NFUN_402__()))
	{
		StatDisplay.ShowPlayerProfileImage = UDukeRootWindow(Root).AgentOnline.GetPlayerProfileTexture(StatDisplay.PlayerProfileImage);
	}
	PlayerName = UDukeRootWindow(Root).AgentOnline.GetDefaultPlayerName();
	PopulateStatDisplay();
	return;
}

function NavigateBack()
{
	super.NavigateBack();
	return;
}

function PopulateStatDisplay()
{
	local DukeMultiPlayer dmp;
	local PlayerProgression PlayerStats;
	local float CurrentXP, NextLevelXP, CurrentLevelXP;
	local int TotalKills, TotalDeaths, DM_Kills, DM_Deaths, TDM_Kills, TDM_Deaths,
		CTB_Kills, CTB_Deaths, HTTK_Kills, HTTK_Deaths, HTTK_Points,
		TotalWins, TotalLosses, DM_Wins, DM_Losses, TDM_Wins,
		TDM_Losses, CTB_Wins, CTB_Losses, HTTK_Wins, HTTK_Losses,
		CTB_Captures, CTB_CarrierKills, HP_Kills, HP_Deaths, HP_Captures,
		HP_CarrierKills, FT_Kills, FT_Deaths, FFAHTTK_Kills, FFAHTTK_Deaths,
		FFAHTTK_Points, FFAHTTK_Wins, FFAHTTK_Losses, HP_Wins, HP_Losses,
		FT_Wins, FT_Losses, DLC_Wins, DLC_Losses;

	StatDisplay.ClearStats();
	dmp = DukeMultiPlayer(GetPlayerOwner());
	PlayerStats = dmp.PlayerProgress;
	PlayerStats.LoadPlayerProgression();
	StatDisplay.AddHeader("S_NAME", PlayerName);
	StatDisplay.AddHeader("S_LEVEL", string(PlayerStats.GetLevel()));
	StatDisplay.AddDiv();
	CurrentXP = PlayerStats.GetXP();
	NextLevelXP = PlayerStats.GetXPForLevel(1);
	StatDisplay.AddHeader("EXP_HEADER");
	StatDisplay.AddStat2("S_EXPCURRENT", FloatToString(CurrentXP, 0), "S_EXPUNIT");
	StatDisplay.AddStat2("S_EXPNEXT", FloatToString(NextLevelXP, 0), "S_EXPUNIT");
	StatDisplay.AddDiv();
	TotalKills = PlayerStats.GetStat_Total(2);
	TotalDeaths = PlayerStats.GetStat_Total(3);
	StatDisplay.AddHeader("GLOBAL_HEADER");
	StatDisplay.AddStat2("S_KILLS", string(TotalKills));
	StatDisplay.AddStat2("S_DEATHS", string(TotalDeaths));
	// End:0x231
	if(__NFUN_170__(TotalDeaths, 0))
	{
		StatDisplay.AddStat2("S_KILLDEATHRATIO", FloatToString(__NFUN_196__(float(TotalKills), float(TotalDeaths)), 2));		
	}
	else
	{
		StatDisplay.AddStat2("S_KILLDEATHRATIO", FloatToString(float(TotalKills), 2));
	}
	DM_Wins = PlayerStats.GetStat_Total(9);
	TDM_Wins = PlayerStats.GetStat_Total(11);
	CTB_Wins = PlayerStats.GetStat_Total(13);
	HTTK_Wins = PlayerStats.GetStat_Total(109);
	DM_Losses = PlayerStats.GetStat_Total(10);
	TDM_Losses = PlayerStats.GetStat_Total(12);
	CTB_Losses = PlayerStats.GetStat_Total(14);
	HTTK_Losses = PlayerStats.GetStat_Total(110);
	DLC_Wins = __NFUN_165__(__NFUN_165__(PlayerStats.GetStat_Total(244), PlayerStats.GetStat_Total(246)), PlayerStats.GetStat_Total(248));
	DLC_Losses = __NFUN_165__(__NFUN_165__(PlayerStats.GetStat_Total(245), PlayerStats.GetStat_Total(247)), PlayerStats.GetStat_Total(249));
	TotalWins = __NFUN_165__(__NFUN_165__(__NFUN_165__(__NFUN_165__(DM_Wins, TDM_Wins), CTB_Wins), HTTK_Wins), DLC_Wins);
	TotalLosses = __NFUN_165__(__NFUN_165__(__NFUN_165__(__NFUN_165__(DM_Losses, TDM_Losses), CTB_Losses), HTTK_Losses), DLC_Losses);
	StatDisplay.AddStat2("S_WINS", string(TotalWins));
	StatDisplay.AddStat2("S_LOSSES", string(TotalLosses));
	// End:0x46A
	if(__NFUN_170__(TotalLosses, 0))
	{
		StatDisplay.AddStat2("S_RATIO", FloatToString(__NFUN_196__(float(TotalWins), float(TotalLosses)), 2));		
	}
	else
	{
		StatDisplay.AddStat2("S_RATIO", FloatToString(float(TotalWins), 2));
	}
	StatDisplay.AddDiv();
	DM_Kills = PlayerStats.GetStat_Total(98);
	DM_Deaths = PlayerStats.GetStat_Total(99);
	StatDisplay.AddHeader("DM_HEADER");
	StatDisplay.AddStat2("S_DEATHMATCHWINS", string(DM_Wins));
	StatDisplay.AddStat2("S_DEATHMATCHLOSSES", string(DM_Losses));
	// End:0x585
	if(__NFUN_170__(DM_Losses, 0))
	{
		StatDisplay.AddStat2("S_DEATHMATCHRATIO", FloatToString(__NFUN_196__(float(DM_Wins), float(DM_Losses)), 2));		
	}
	else
	{
		StatDisplay.AddStat2("S_DEATHMATCHRATIO", FloatToString(float(DM_Wins), 2));
	}
	StatDisplay.AddStat2("S_DEATHMATCHKILLS", string(DM_Kills));
	StatDisplay.AddStat2("S_DEATHMATCHDEATHS", string(DM_Deaths));
	// End:0x654
	if(__NFUN_170__(DM_Deaths, 0))
	{
		StatDisplay.AddStat2("S_DEATHMATCHKILLRATIO", FloatToString(__NFUN_196__(float(DM_Kills), float(DM_Deaths)), 2));		
	}
	else
	{
		StatDisplay.AddStat2("S_DEATHMATCHKILLRATIO", FloatToString(float(DM_Kills), 2));
	}
	StatDisplay.AddDiv();
	TDM_Kills = PlayerStats.GetStat_Total(102);
	TDM_Deaths = PlayerStats.GetStat_Total(103);
	StatDisplay.AddHeader("TDM_HEADER");
	StatDisplay.AddStat2("S_DEATHMATCHWINS", string(TDM_Wins));
	StatDisplay.AddStat2("S_DEATHMATCHLOSSES", string(TDM_Losses));
	// End:0x77E
	if(__NFUN_170__(TDM_Losses, 0))
	{
		StatDisplay.AddStat2("S_DEATHMATCHRATIO", FloatToString(__NFUN_196__(float(TDM_Wins), float(TDM_Losses)), 2));		
	}
	else
	{
		StatDisplay.AddStat2("S_DEATHMATCHRATIO", FloatToString(float(TDM_Wins), 2));
	}
	StatDisplay.AddStat2("S_DEATHMATCHKILLS", string(TDM_Kills));
	StatDisplay.AddStat2("S_DEATHMATCHDEATHS", string(TDM_Deaths));
	// End:0x84D
	if(__NFUN_170__(TDM_Deaths, 0))
	{
		StatDisplay.AddStat2("S_DEATHMATCHKILLRATIO", FloatToString(__NFUN_196__(float(TDM_Kills), float(TDM_Deaths)), 2));		
	}
	else
	{
		StatDisplay.AddStat2("S_DEATHMATCHKILLRATIO", FloatToString(float(TDM_Kills), 2));
	}
	StatDisplay.AddDiv();
	CTB_Kills = PlayerStats.GetStat_Total(115);
	CTB_Deaths = PlayerStats.GetStat_Total(116);
	CTB_Captures = PlayerStats.GetStat_Total(15);
	CTB_CarrierKills = PlayerStats.GetStat_Total(17);
	StatDisplay.AddHeader("CTB_HEADER");
	StatDisplay.AddStat2("S_CTBWINS", string(CTB_Wins));
	StatDisplay.AddStat2("S_CTBLOSSES", string(CTB_Losses));
	// End:0x992
	if(__NFUN_170__(CTB_Losses, 0))
	{
		StatDisplay.AddStat2("S_CTBRATIO", FloatToString(__NFUN_196__(float(CTB_Wins), float(CTB_Losses)), 2));		
	}
	else
	{
		StatDisplay.AddStat2("S_CTBRATIO", FloatToString(float(CTB_Wins), 2));
	}
	StatDisplay.AddStat2("S_CTBKILLS", string(CTB_Kills));
	StatDisplay.AddStat2("S_CTBDEATHS", string(CTB_Deaths));
	// End:0xA45
	if(__NFUN_170__(CTB_Deaths, 0))
	{
		StatDisplay.AddStat2("S_CTBKILLRATIO", FloatToString(__NFUN_196__(float(CTB_Kills), float(CTB_Deaths)), 2));		
	}
	else
	{
		StatDisplay.AddStat2("S_CTBKILLRATIO", FloatToString(float(CTB_Kills), 2));
	}
	StatDisplay.AddStat2("S_CTBCAPTURES", string(CTB_Captures));
	StatDisplay.AddStat2("S_CTBCARRIERKILLS", string(CTB_CarrierKills));
	StatDisplay.AddDiv();
	HTTK_Kills = PlayerStats.GetStat_Total(111);
	HTTK_Deaths = PlayerStats.GetStat_Total(112);
	HTTK_Points = PlayerStats.GetStat_Total(147);
	StatDisplay.AddHeader("KOTH_HEADER");
	StatDisplay.AddStat2("S_KOTHWINS", string(HTTK_Wins));
	StatDisplay.AddStat2("S_KOTHLOSSES", string(HTTK_Losses));
	// End:0xBBD
	if(__NFUN_170__(HTTK_Losses, 0))
	{
		StatDisplay.AddStat2("S_KOTHRATIO", FloatToString(__NFUN_196__(float(HTTK_Wins), float(HTTK_Losses)), 2));		
	}
	else
	{
		StatDisplay.AddStat2("S_KOTHRATIO", FloatToString(float(HTTK_Wins), 2));
	}
	StatDisplay.AddStat2("S_KOTHKILLS", string(HTTK_Kills));
	StatDisplay.AddStat2("S_KOTHDEATHS", string(HTTK_Deaths));
	// End:0xC74
	if(__NFUN_170__(HTTK_Deaths, 0))
	{
		StatDisplay.AddStat2("S_KOTHKILLRATIO", FloatToString(__NFUN_196__(float(HTTK_Kills), float(HTTK_Deaths)), 2));		
	}
	else
	{
		StatDisplay.AddStat2("S_KOTHKILLRATIO", FloatToString(float(HTTK_Kills), 2));
	}
	StatDisplay.AddStat2("S_KOTHPOINTS", string(HTTK_Points));
	StatDisplay.AddDiv();
	// End:0x13B5
	if(ShowDLCStats(PlayerStats))
	{
		FFAHTTK_Kills = PlayerStats.GetStat_Total(61);
		FFAHTTK_Deaths = PlayerStats.GetStat_Total(62);
		FFAHTTK_Points = PlayerStats.GetStat_Total(63);
		FFAHTTK_Wins = PlayerStats.GetStat_Total(244);
		FFAHTTK_Losses = PlayerStats.GetStat_Total(245);
		StatDisplay.AddHeader("FFAKOTH_HEADER");
		StatDisplay.AddStat2("S_FFAKOTHWINS", string(FFAHTTK_Wins));
		StatDisplay.AddStat2("S_FFAKOTHLOSSES", string(FFAHTTK_Losses));
		// End:0xE0D
		if(__NFUN_170__(FFAHTTK_Losses, 0))
		{
			StatDisplay.AddStat2("S_FFAKOTHRATIO", FloatToString(__NFUN_196__(float(FFAHTTK_Wins), float(FFAHTTK_Losses)), 2));			
		}
		else
		{
			StatDisplay.AddStat2("S_FFAKOTHRATIO", FloatToString(float(FFAHTTK_Wins), 2));
		}
		StatDisplay.AddStat2("S_FFAKOTHKILLS", string(FFAHTTK_Kills));
		StatDisplay.AddStat2("S_FFAKOTHDEATHS", string(FFAHTTK_Deaths));
		// End:0xED0
		if(__NFUN_170__(FFAHTTK_Deaths, 0))
		{
			StatDisplay.AddStat2("S_FFAKOTHKILLRATIO", FloatToString(__NFUN_196__(float(FFAHTTK_Kills), float(FFAHTTK_Deaths)), 2));			
		}
		else
		{
			StatDisplay.AddStat2("S_FFAKOTHKILLRATIO", FloatToString(float(FFAHTTK_Kills), 2));
		}
		StatDisplay.AddStat2("S_FFAKOTHPOINTS", string(FFAHTTK_Points));
		StatDisplay.AddDiv();
		FT_Kills = PlayerStats.GetStat_Total(68);
		FT_Deaths = PlayerStats.GetStat_Total(69);
		FT_Wins = PlayerStats.GetStat_Total(246);
		FT_Losses = PlayerStats.GetStat_Total(247);
		StatDisplay.AddHeader("FT_HEADER");
		StatDisplay.AddStat2("S_FTWINS", string(FT_Wins));
		StatDisplay.AddStat2("S_FTLOSSES", string(FT_Losses));
		// End:0x1035
		if(__NFUN_170__(FT_Losses, 0))
		{
			StatDisplay.AddStat2("S_FTRATIO", FloatToString(__NFUN_196__(float(FT_Wins), float(FT_Losses)), 2));			
		}
		else
		{
			StatDisplay.AddStat2("S_FTRATIO", FloatToString(float(FT_Wins), 2));
		}
		StatDisplay.AddStat2("S_FTKILLS", string(FT_Kills));
		StatDisplay.AddStat2("S_FTDEATHS", string(FT_Deaths));
		// End:0x10E4
		if(__NFUN_170__(FT_Deaths, 0))
		{
			StatDisplay.AddStat2("S_FTKILLRATIO", FloatToString(__NFUN_196__(float(FT_Kills), float(FT_Deaths)), 2));			
		}
		else
		{
			StatDisplay.AddStat2("S_FTKILLRATIO", FloatToString(float(FT_Kills), 2));
		}
		StatDisplay.AddStat2("S_FTDEFROST", string(PlayerStats.GetStat_Total(70)));
		StatDisplay.AddDiv();
		HP_Kills = PlayerStats.GetStat_Total(64);
		HP_Deaths = PlayerStats.GetStat_Total(65);
		HP_Captures = PlayerStats.GetStat_Total(66);
		HP_CarrierKills = PlayerStats.GetStat_Total(67);
		HP_Wins = PlayerStats.GetStat_Total(248);
		HP_Losses = PlayerStats.GetStat_Total(249);
		StatDisplay.AddHeader("HP_HEADER");
		StatDisplay.AddStat2("S_HPWINS", string(HP_Wins));
		StatDisplay.AddStat2("S_HPLOSSES", string(HP_Losses));
		// End:0x127D
		if(__NFUN_170__(HP_Losses, 0))
		{
			StatDisplay.AddStat2("S_HPRATIO", FloatToString(__NFUN_196__(float(HP_Wins), float(HP_Losses)), 2));			
		}
		else
		{
			StatDisplay.AddStat2("S_HPRATIO", FloatToString(float(HP_Wins), 2));
		}
		StatDisplay.AddStat2("S_HPKILLS", string(HP_Kills));
		StatDisplay.AddStat2("S_HPDEATHS", string(HP_Deaths));
		// End:0x132C
		if(__NFUN_170__(HP_Deaths, 0))
		{
			StatDisplay.AddStat2("S_HPKILLRATIO", FloatToString(__NFUN_196__(float(HP_Kills), float(HP_Deaths)), 2));			
		}
		else
		{
			StatDisplay.AddStat2("S_HPKILLRATIO", FloatToString(float(HP_Kills), 2));
		}
		StatDisplay.AddStat2("S_HPCAPTURES", string(HP_Captures));
		StatDisplay.AddStat2("S_HPCARRIERKILLS", string(HP_CarrierKills));
		StatDisplay.AddDiv();
	}
	StatDisplay.AddHeader("S_KILLSTATS");
	StatDisplay.AddStat2("S_KILLFISTS", string(PlayerStats.GetStat_Total(5)));
	StatDisplay.AddStat2("S_KILLPISTOL", string(PlayerStats.GetStat_Total(30)));
	StatDisplay.AddStat2("S_CTBKILLSWITHBABE", string(PlayerStats.GetStat_Total(123)));
	StatDisplay.AddStat2("S_KILLATLASER", string(PlayerStats.GetStat_Total(24)));
	StatDisplay.AddStat2("S_KILLDEVASTATOR", string(PlayerStats.GetStat_Total(25)));
	StatDisplay.AddStat2("S_KILLENFORCER", string(PlayerStats.GetStat_Total(26)));
	StatDisplay.AddStat2("S_KILLMACHINEGUN", string(PlayerStats.GetStat_Total(27)));
	StatDisplay.AddStat2("S_KILLPIPEBOMB", string(PlayerStats.GetStat_Total(29)));
	StatDisplay.AddStat2("S_KILLRAILGUN", string(PlayerStats.GetStat_Total(31)));
	StatDisplay.AddStat2("S_KILLRPG", string(PlayerStats.GetStat_Total(32)));
	StatDisplay.AddStat2("S_KILLSHOTGUN", string(PlayerStats.GetStat_Total(33)));
	StatDisplay.AddStat2("S_KILLMIGHTYFOOT", string(PlayerStats.GetStat_Total(35)));
	StatDisplay.AddStat2("S_KILLTRIPMINE", string(PlayerStats.GetStat_Total(36)));
	// End:0x1738
	if(ShowDLCStats(PlayerStats))
	{
		StatDisplay.AddStat2("S_KILLBFG", string(PlayerStats.GetStat_Total(240)));
		StatDisplay.AddStat2("S_KILLNOOBTUBE", string(PlayerStats.GetStat_Total(241)));
		StatDisplay.AddStat2("S_KILLMINIGUN", string(PlayerStats.GetStat_Total(242)));
		StatDisplay.AddStat2("S_KILLSTICKY", string(PlayerStats.GetStat_Total(243)));
	}
	StatDisplay.AddStat2("S_FROZENEXECUTION", string(PlayerStats.GetStat_Total(77)));
	StatDisplay.AddStat2("S_SQUISHEXECUTION", string(PlayerStats.GetStat_Total(79)));
	StatDisplay.AddStat2("S_AERIALKILLS", string(PlayerStats.GetStat_Total(38)));
	StatDisplay.AddStat2("S_KILLASSIST", string(PlayerStats.GetStat_Total(131)));
	StatDisplay.AddStat2("S_KILLSTREAK", string(PlayerStats.GetStat_Total(6)));
	StatDisplay.AddStat2("S_MULTIKILL", string(PlayerStats.GetStat_Total(7)));
	StatDisplay.AddDiv();
	StatDisplay.AddHeader("ENTERTAINMENTSTATS");
	StatDisplay.AddStat2("S_DISTANCETRAVELLED", FloatToString(__NFUN_196__(float(PlayerStats.GetStat_Total(144)), 100), 2));
	StatDisplay.AddStat2("S_DISTANCESPRINTED", FloatToString(__NFUN_196__(float(PlayerStats.GetStat_Total(84)), 100), 2));
	StatDisplay.AddStat2("S_FALLINGDISTANCE", string(PlayerStats.GetStat_Total(40)));
	StatDisplay.AddStat2("S_SECONDSINAIR", string(PlayerStats.GetStat_Total(87)));
	StatDisplay.AddStat2("S_SUICIDE", string(PlayerStats.GetStat_Total(4)));
	StatDisplay.AddStat2("S_BEERCONSUMED", string(PlayerStats.GetStat_Total(41)));
	StatDisplay.AddStat2("S_STEROIDSTAKEN", string(PlayerStats.GetStat_Total(42)));
	StatDisplay.AddStat2("S_HOLODUKEUSES", string(PlayerStats.GetStat_Total(18)));
	StatDisplay.AddStat2("S_FROZEN", string(PlayerStats.GetStat_Total(44)));
	StatDisplay.AddStat2("S_SHRUNK", string(PlayerStats.GetStat_Total(45)));
	StatDisplay.AddStat2("S_GROW", string(PlayerStats.GetStat_Total(89)));
	StatDisplay.AddStat2("S_UNFROZEN", string(PlayerStats.GetStat_Total(90)));
	StatDisplay.AddStat2("S_SQUISHED", string(PlayerStats.GetStat_Total(92)));
	StatDisplay.AddStat2("S_FROZENDEATHMELEE", string(PlayerStats.GetStat_Total(91)));
	StatDisplay.AddDiv();
	return;
}

function bool ShowDLCStats(PlayerProgression PP)
{
	// End:0x1C
	if(bCheckedDLC)
	{
		// End:0x1A
		if(__NFUN_339__(DLCClass, none))
		{
			return false;			
		}
		else
		{
			return true;
		}
	}
	bCheckedDLC = true;
	DLCClass = class<Actor>(__NFUN_366__("DLC01_Game.DukeMultiplayerDLC", class'Class'));
	// End:0x64
	if(__NFUN_339__(DLCClass, none))
	{
		return false;
	}
	return true;
	return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
	// End:0x39
	if(__NFUN_173__(int(msg), int(7)))
	{
		switch(Key)
		{
			// End:0x26
			case int(236):
				MoveUp(true);
				// End:0x39
				break;
			// End:0x36
			case int(237):
				MoveDown(true);
				// End:0x39
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

function KeyDown(int Key, float X, float Y)
{
	switch(Key)
	{
		// End:0x0E
		case int(200):
		// End:0x1D
		case int(38):
			MoveUp();
			// End:0x35
			break;
		// End:0x23
		case int(201):
		// End:0x32
		case int(40):
			MoveDown();
			// End:0x35
			break;
		// End:0xFFFF
		default:
			break;
	}
	super(UWindowWindow).KeyDown(Key, X, Y);
	return;
}

function KeyHold(int Key, float X, float Y)
{
	switch(Key)
	{
		// End:0x0E
		case int(200):
		// End:0x1E
		case int(38):
			MoveUp(true);
			// End:0x37
			break;
		// End:0x24
		case int(201):
		// End:0x34
		case int(40):
			MoveDown(true);
			// End:0x37
			break;
		// End:0xFFFF
		default:
			break;
	}
	super(UWindowWindow).KeyHold(Key, X, Y);
	return;
}

function MoveUp(optional bool bFromHold)
{
	local int i, Counter;

	// End:0x16
	if(__NFUN_148__(bNavUpRepeatBlock, bFromHold))
	{
		return;
	}
	bNavUpRepeatBlock = true;
	// End:0x75
	if(StatDisplayScroller.VertSB.Scroll(__NFUN_195__(__NFUN_194__(StatDisplayScroller.VertSB.ScrollAmount), fScrollSpeed)))
	{
		GetPlayerOwner().PlaySoundInfo(0, SoundNavigateInfo);
	}
	// End:0x9E
	if(bFromHold)
	{
		NavRepeatTimeout = __NFUN_198__(GetLevel().TimeSeconds, NavRepeatTimeHold);		
	}
	else
	{
		NavRepeatTimeout = __NFUN_198__(GetLevel().TimeSeconds, NavRepeatTime);
	}
	return;
}

function MoveDown(optional bool bFromHold)
{
	local int i, Counter;

	// End:0x16
	if(__NFUN_148__(bNavDownRepeatBlock, bFromHold))
	{
		return;
	}
	bNavDownRepeatBlock = true;
	// End:0x73
	if(StatDisplayScroller.VertSB.Scroll(__NFUN_195__(StatDisplayScroller.VertSB.ScrollAmount, fScrollSpeed)))
	{
		GetPlayerOwner().PlaySoundInfo(0, SoundNavigateInfo);
	}
	// End:0x9C
	if(bFromHold)
	{
		NavRepeatTimeout = __NFUN_198__(GetLevel().TimeSeconds, NavRepeatTimeHold);		
	}
	else
	{
		NavRepeatTimeout = __NFUN_198__(GetLevel().TimeSeconds, NavRepeatTime);
	}
	return;
}

defaultproperties
{
	GreyColor=(B=36,G=1,R=192,A=37)
	LevelStr="<?int?dnWindow.UDukeSceneStats.LevelStr?>"
	KillStr="<?int?dnWindow.UDukeSceneStats.KillStr?>"
	DeathsStr="<?int?dnWindow.UDukeSceneStats.DeathsStr?>"
	KDRatioStr="<?int?dnWindow.UDukeSceneStats.KDRatioStr?>"
	TotalXPStr="<?int?dnWindow.UDukeSceneStats.TotalXPStr?>"
	Title="<?int?dnWindow.UDukeSceneStats.Title?>"
	TFFontScale=1.25
	LeftSizeOffset=0.2
	fScrollSpeed=5
	LineTopY=237
	LineBottomY=600
	NavRepeatTime=0.25
	NavRepeatTimeHold=0.05
}
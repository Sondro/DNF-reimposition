/*******************************************************************************
 * UDukeSceneMPStats generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneMPStats extends UWindowScene;

var Color GreyColor;
var DukeMultiPlayer PlayerModel;
var localized string KillStr;
var localized string DeathsStr;
var localized string KDRatioStr;
var localized string TotalXPStr;
var UDukeProgressBar ExpBar;
var PlayerReplicationInfo PRI;
var DukeMultiPlayer dmp;

function Created()
{
	super.Created();
	KeyButtons[0].HideWindow();
	ExpBar = UDukeProgressBar(CreateWindow(class'UDukeProgressBar', 1, 1, 1, 1));
	ExpBar.Register(self);
	dmp = DukeMultiPlayer(GetPlayerOwner());
	PRI = GetPlayerOwner().PlayerReplicationInfo;
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local float XPadding, YPadding, XL, YL;
	local string tempstr;
	local Vector P1, P2;

	super.Paint(C, X, Y);
	C.Font = C.MedFont;
	C.DrawColor = WhiteColor;
	P1.X = __NFUN_195__(float(C.SizeX), 0.075);
	P1.Y = __NFUN_195__(float(C.SizeY), 0.1);
	P2.X = __NFUN_195__(float(C.SizeX), 0.925);
	P2.Y = __NFUN_195__(float(C.SizeY), 0.1);
	C.__NFUN_1240__(P1, P2);
	P1.X = __NFUN_195__(float(C.SizeX), 0.925);
	P1.Y = __NFUN_195__(float(C.SizeY), 0.1);
	P2.X = __NFUN_195__(float(C.SizeX), 0.925);
	P2.Y = __NFUN_195__(float(C.SizeY), 0.85);
	C.__NFUN_1240__(P1, P2);
	P1.X = __NFUN_195__(float(C.SizeX), 0.075);
	P1.Y = __NFUN_195__(float(C.SizeY), 0.85);
	P2.X = __NFUN_195__(float(C.SizeX), 0.925);
	P2.Y = __NFUN_195__(float(C.SizeY), 0.85);
	C.__NFUN_1240__(P1, P2);
	P1.X = __NFUN_195__(float(C.SizeX), 0.075);
	P1.Y = __NFUN_195__(float(C.SizeY), 0.1);
	P2.X = __NFUN_195__(float(C.SizeX), 0.075);
	P2.Y = __NFUN_195__(float(C.SizeY), 0.85);
	C.__NFUN_1240__(P1, P2);
	XPadding = __NFUN_195__(float(C.SizeX), 0.2);
	YPadding = __NFUN_195__(float(C.SizeY), 0.2);
	TextSize(C, PRI.PlayerName, XL, YL, TTFontScale, TTFontScale);
	C.Style = 1;
	C.__NFUN_1250__(__NFUN_199__(XPadding, 10), __NFUN_196__(__NFUN_199__(YPadding, YL), 2));
	C.__NFUN_1236__(class'BlackTexture', __NFUN_198__(XL, 20), YL, 0, 0, XL, XL, 1, false, 0);
	C.DrawColor = WhiteColor;
	ClipText(C, XPadding, __NFUN_196__(__NFUN_199__(YPadding, YL), 2), PRI.PlayerName,, TTFontScale, TTFontScale);
	XPadding = __NFUN_195__(float(C.SizeX), 0.1);
	YPadding = __NFUN_195__(float(C.SizeY), 0.2);
	YPadding = __NFUN_195__(float(C.SizeY), 0.6);
	tempstr = __NFUN_302__(KillStr, string(dmp.PlayerProgress.GetStat_Total(2)));
	TextSize(C, tempstr, XL, YL, TTFontScale, TTFontScale);
	ClipText(C, XPadding, YPadding, tempstr,, TTFontScale, TTFontScale);
	__NFUN_209__(YPadding, __NFUN_198__(YL, float(2)));
	tempstr = __NFUN_302__(DeathsStr, string(dmp.PlayerProgress.GetStat_Total(3)));
	ClipText(C, XPadding, YPadding, tempstr,, TTFontScale, TTFontScale);
	__NFUN_209__(YPadding, __NFUN_198__(YL, float(2)));
	// End:0x572
	if(__NFUN_171__(PRI.Deaths, 0))
	{
		tempstr = __NFUN_302__(KDRatioStr, string(PRI.Kills));		
	}
	else
	{
		tempstr = __NFUN_302__(KDRatioStr, string(__NFUN_163__(PRI.Kills, PRI.Deaths)));
	}
	ClipText(C, XPadding, YPadding, tempstr,, TTFontScale, TTFontScale);
	__NFUN_209__(YPadding, __NFUN_198__(YL, float(2)));
	tempstr = "LEVEL :0";
	ClipText(C, XPadding, YPadding, tempstr,, TTFontScale, TTFontScale);
	ExpBar.WinTop = __NFUN_195__(float(C.SizeY), 0.25);
	ExpBar.WinHeight = 50;
	ExpBar.WinWidth = 200;
	ExpBar.WinLeft = __NFUN_199__(__NFUN_199__(__NFUN_195__(float(C.SizeX), 0.9), ExpBar.WinWidth), float(5));
	C.DrawColor = WhiteColor;
	YPadding = __NFUN_198__(__NFUN_198__(ExpBar.WinTop, ExpBar.WinHeight), float(50));
	TextSize(C, TotalXPStr, XL, YL, TTFontScale, TTFontScale);
	ClipText(C, ExpBar.WinLeft, YPadding, TotalXPStr,, TTFontScale, TTFontScale);
	__NFUN_209__(YPadding, YL);
	return;
}

defaultproperties
{
	GreyColor=(B=36,G=1,R=192,A=37)
	KillStr="<?int?dnWindow.UDukeSceneMPStats.KillStr?>"
	DeathsStr="<?int?dnWindow.UDukeSceneMPStats.DeathsStr?>"
	KDRatioStr="<?int?dnWindow.UDukeSceneMPStats.KDRatioStr?>"
	TotalXPStr="<?int?dnWindow.UDukeSceneMPStats.TotalXPStr?>"
	FilmGrainMaterial=none
	bNoLogo=true
	bNoBackground=true
	bNoLines=true
}
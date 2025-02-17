/*******************************************************************************
 * ChallengeObject generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ChallengeObject extends Object
	native;

var array<int> ChallDependencies;
var int ChallIdx;
var string ExtraOptions;
var Object.EChallengeStatus DefaultState;
var bool bHasDefaultStatus;
var string ChallName;
var string Description;
var string HelpText;
var int CheckU;
var int CheckV;
var int CheckW;
var int CheckH;
var int OpenCheckU;
var int OpenCheckV;
var float CheckX;
var float CheckY;
var float CheckWidth;
var float YOffset;
var bool bComplete;

event SetChallIdx(int Idx)
{
	ChallIdx = Idx;
	ExtraOptions = class'ChallengeInfo'.default.ChallengesArray[ChallIdx].ExtraOptions;
	ChallName = __NFUN_356__("ChallengeNames", class'ChallengeInfo'.default.ChallengesArray[ChallIdx].Name, "dnWindow");
	Description = __NFUN_356__("ChallengeNames", class'ChallengeInfo'.default.ChallengesArray[ChallIdx].Description, "dnWindow");
	HelpText = __NFUN_356__("ChallengeNames", class'ChallengeInfo'.default.ChallengesArray[ChallIdx].HelpText, "dnWindow");
	return;
}

simulated event bool CheckChallenge(Info PP)
{
	return false;
	return;
}

event Object.EChallengeStatus GetDefaultStatus()
{
	return 0;
	return;
}

function bool GrabOption(out string Options, out string Result)
{
	// End:0x94
	if(__NFUN_308__(__NFUN_317__(Options, 1), "?"))
	{
		Result = __NFUN_316__(Options, 1);
		// End:0x4B
		if(__NFUN_172__(__NFUN_315__(Result, "?"), 0))
		{
			Result = __NFUN_317__(Result, __NFUN_315__(Result, "?"));
		}
		Options = __NFUN_316__(Options, 1);
		// End:0x87
		if(__NFUN_172__(__NFUN_315__(Options, "?"), 0))
		{
			Options = __NFUN_316__(Options, __NFUN_315__(Options, "?"));			
		}
		else
		{
			Options = "";
		}
		return true;		
	}
	else
	{
		return false;
	}
	return;
}

function GetKeyValue(string Pair, out string Key, out string Value)
{
	// End:0x49
	if(__NFUN_172__(__NFUN_315__(Pair, "="), 0))
	{
		Key = __NFUN_317__(Pair, __NFUN_315__(Pair, "="));
		Value = __NFUN_316__(Pair, __NFUN_165__(__NFUN_315__(Pair, "="), 1));		
	}
	else
	{
		Key = Pair;
		Value = "";
	}
	return;
}

function bool HasOption(string Options, string InKey)
{
	local string Pair, Key, Value;

	J0x00:
	// End:0x3D [Loop If]
	if(GrabOption(Options, Pair))
	{
		GetKeyValue(Pair, Key, Value);
		// End:0x3A
		if(__NFUN_310__(Key, InKey))
		{
			return true;
		}
		// [Loop Continue]
		goto J0x00;
	}
	return false;
	return;
}

function string ParseOption(string Options, string InKey)
{
	local string Pair, Key, Value;

	J0x00:
	// End:0x41 [Loop If]
	if(GrabOption(Options, Pair))
	{
		GetKeyValue(Pair, Key, Value);
		// End:0x3E
		if(__NFUN_310__(Key, InKey))
		{
			return Value;
		}
		// [Loop Continue]
		goto J0x00;
	}
	return "";
	return;
}

function DrawChallengeWindow(Canvas C, Object Window, optional float Scale, optional PlayerPawn PP)
{
	return;
}

function float DrawChallengeTitle(Canvas C, float YOffset, float X, float Y, float W, float h, optional float Scale, optional PlayerPawn PP)
{
	local float XL, YL, CenterX, TTFontScale;

	// End:0x1A
	if(__NFUN_204__(Scale, 0))
	{
		Scale = 1;
	}
	C.OrgX = X;
	C.OrgY = Y;
	C.ClipX = W;
	C.ClipY = h;
	CenterX = __NFUN_196__(__NFUN_199__(W, X), 2);
	TTFontScale = __NFUN_195__(Scale, 1.15);
	C.__NFUN_1238__(self.ChallName, XL, YL, TTFontScale, TTFontScale);
	C.__NFUN_1250__(__NFUN_196__(__NFUN_199__(W, XL), 2), YOffset);
	C.__NFUN_1233__(ChallName,,,, TTFontScale, TTFontScale, 1, 2);
	CheckWidth = __NFUN_195__(53, Scale);
	CheckX = __NFUN_199__(__NFUN_199__(W, CheckWidth), float(5));
	CheckY = YOffset;
	C.__NFUN_1250__(CheckX, CheckY);
	// End:0x1B0
	if(bComplete)
	{
		C.__NFUN_1236__(class'Backdrop', CheckWidth, __NFUN_195__(0.89, CheckWidth), float(CheckU), float(CheckV), float(CheckW), float(CheckH), 1, false, 0);		
	}
	else
	{
		C.__NFUN_1236__(class'Backdrop', CheckWidth, __NFUN_195__(0.89, CheckWidth), float(OpenCheckU), float(OpenCheckV), float(CheckW), float(CheckH), 1, false, 0);
	}
	__NFUN_209__(YOffset, __NFUN_195__(0.89, CheckWidth));
	return YOffset;
	return;
}

defaultproperties
{
	CheckU=72
	CheckV=66
	CheckW=53
	CheckH=50
	OpenCheckU=13
	OpenCheckV=66
	CheckWidth=53
}
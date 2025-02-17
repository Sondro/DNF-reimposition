/*******************************************************************************
 * UDukeScoreboard_TeamDMCW generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeScoreboard_TeamDMCW extends UDukeScoreboardCW;

var int Team1ScoreYOffset;
var int Team2ScoreYOffset;

function Created()
{
	super.Created();
	return;
}

function PageChange(int NewPage)
{
	local int i, TeamCounts;
	local UDukeScoreboardPlate Plate;
	local PlayerPawn P;
	local PlayerReplicationInfo PRI;

	P = GetPlayerOwner();
	// End:0x32
	if(__NFUN_150__(__NFUN_339__(P, none), __NFUN_339__(P.GameReplicationInfo, none)))
	{
		return;
	}
	ScorePage = NewPage;
	StartPlate = __NFUN_162__(ScorePage, __NFUN_163__(PlatesPerPage, 2));
	i = 0;
	J0x5A:

	// End:0x172 [Loop If]
	if(__NFUN_169__(i, 32))
	{
		Plate = ScoreboardPlates[i];
		Plate.bHidden = true;
		// End:0xA5
		if(__NFUN_173__(Plate.PRIindex, -1))
		{
			// [Explicit Continue]
			goto J0x168;
		}
		PRI = P.GameReplicationInfo.PRIArray[Plate.PRIindex];
		// End:0x168
		if(__NFUN_169__(int(PRI.Team), 4))
		{
			// End:0x150
			if(__NFUN_148__(__NFUN_172__(TeamCounts[int(PRI.Team)], StartPlate), __NFUN_169__(TeamCounts[int(PRI.Team)], __NFUN_165__(StartPlate, __NFUN_163__(PlatesPerPage, 2)))))
			{
				ScoreboardPlates[i].bHidden = false;
			}
			__NFUN_184__(TeamCounts[int(PRI.Team)]);
		}
		J0x168:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x5A;
	}
	ResizePlates();
	return;
}

function ResizePlates()
{
	local int h, TeamCount1, TeamCount2, i;
	local PlayerPawn P;
	local PlayerReplicationInfo PRI;

	super.ResizePlates();
	P = GetPlayerOwner();
	// End:0x38
	if(__NFUN_150__(__NFUN_339__(P, none), __NFUN_339__(P.GameReplicationInfo, none)))
	{
		return;
	}
	TeamCount1 = 0;
	TeamCount2 = 0;
	CalcPlatesPerPage();
	Team2ScoreYOffset = int(__NFUN_198__(float(Team1ScoreYOffset), ScoreboardPlates[0].WinHeight));
	i = 0;
	J0x73:

	// End:0x1C9 [Loop If]
	if(__NFUN_169__(i, 32))
	{
		// End:0x189
		if(__NFUN_148__(__NFUN_145__(ScoreboardPlates[i].bHidden), __NFUN_174__(ScoreboardPlates[i].PRIindex, -1)))
		{
			h = int(ScoreboardPlates[i].WinHeight);
			PRI = P.GameReplicationInfo.PRIArray[ScoreboardPlates[i].PRIindex];
			// End:0x186
			if(__NFUN_173__(int(PRI.Team), 0))
			{
				ScoreboardPlates[i].WinTop = __NFUN_198__(PlateOffset, __NFUN_195__(float(TeamCount1), __NFUN_198__(float(h), PlateSpacing)));
				__NFUN_184__(TeamCount1);
				Team2ScoreYOffset = int(__NFUN_198__(__NFUN_198__(ScoreboardPlates[i].WinTop, float(h)), PlateSpacing));
			}
			// [Explicit Continue]
			goto J0x1BF;
		}
		ScoreboardPlates[i].WinLeft = WinWidth;
		ScoreboardPlates[i].WinTop = WinHeight;
		J0x1BF:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x73;
	}
	i = 0;
	J0x1D0:

	// End:0x2CA [Loop If]
	if(__NFUN_169__(i, 32))
	{
		// End:0x2C0
		if(__NFUN_148__(__NFUN_145__(ScoreboardPlates[i].bHidden), __NFUN_174__(ScoreboardPlates[i].PRIindex, -1)))
		{
			h = int(ScoreboardPlates[i].WinHeight);
			PRI = P.GameReplicationInfo.PRIArray[ScoreboardPlates[i].PRIindex];
			// End:0x2C0
			if(__NFUN_173__(int(PRI.Team), 1))
			{
				ScoreboardPlates[i].WinTop = __NFUN_198__(float(__NFUN_165__(Team2ScoreYOffset, h)), __NFUN_195__(float(TeamCount2), __NFUN_198__(float(h), PlateSpacing)));
				__NFUN_184__(TeamCount2);
			}
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x1D0;
	}
	return;
}

function string GetPlaceString(int Rank, bool tied)
{
	local dnTeamInfo WinningTeam, LosingTeam;
	local dnDeathmatchGameReplicationInfo GRI;

	GRI = dnDeathmatchGameReplicationInfo(GetPlayerOwner().GameReplicationInfo);
	// End:0x2A
	if(__NFUN_339__(GRI, none))
	{
		return "";
	}
	// End:0x96
	if(__NFUN_170__(GRI.Teams[0].Score, GRI.Teams[1].Score))
	{
		WinningTeam = GRI.Teams[0];
		LosingTeam = GRI.Teams[1];		
	}
	else
	{
		// End:0x102
		if(__NFUN_169__(GRI.Teams[0].Score, GRI.Teams[1].Score))
		{
			WinningTeam = GRI.Teams[1];
			LosingTeam = GRI.Teams[0];			
		}
		else
		{
			return __NFUN_303__("Teams are Tied at", string(GRI.Teams[0].Score));
		}
	}
	return __NFUN_303__(__NFUN_303__(__NFUN_303__(__NFUN_302__(__NFUN_303__(__NFUN_303__(__NFUN_303__("Team", WinningTeam.TeamName), "Leads"), LosingTeam.TeamName), ","), string(GRI.Teams[0].Score)), "to"), string(GRI.Teams[1].Score));
	return;
}

function Paint(Canvas C, float MouseX, float MouseY)
{
	local float TextHeight, TextLength;
	local dnDeathmatchGameReplicationInfo GRI;
	local string TeamScoreText;

	ResizePlates();
	GRI = dnDeathmatchGameReplicationInfo(GetPlayerOwner().GameReplicationInfo);
	C.Font = C.BlockFont;
	C.DrawColor = BlueColor;
	TeamScoreText = __NFUN_303__(__NFUN_303__(GRI.Teams[0].TeamName, "-"), string(GRI.Teams[0].Score));
	TextSize(C, TeamScoreText, TextLength, TextHeight);
	ClipText(C, __NFUN_198__(PlateWinLeft, float(class'UDukeScoreboardPlate'.default.ScoreboardTabs[0])), float(Team1ScoreYOffset), TeamScoreText);
	C.DrawColor = RedColor;
	TeamScoreText = __NFUN_303__(__NFUN_303__(GRI.Teams[1].TeamName, "-"), string(GRI.Teams[1].Score));
	TextSize(C, TeamScoreText, TextLength, TextHeight);
	ClipText(C, __NFUN_198__(PlateWinLeft, float(class'UDukeScoreboardPlate'.default.ScoreboardTabs[0])), float(Team2ScoreYOffset), TeamScoreText);
	super.Paint(C, MouseX, MouseY);
	return;
}

defaultproperties
{
	Team1ScoreYOffset=80
}
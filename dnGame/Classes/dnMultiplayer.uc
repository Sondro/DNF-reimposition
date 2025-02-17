/*******************************************************************************
 * dnMultiplayer generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnMultiplayer extends GameInfo
	native
	config(Multiplayer)
	collapsecategories
	dependson(dnRespawnMarker)
	dependson(PlayerProgression)
	dependson(MPGameReplicationInfo)
	dependson(dnMPTuner)
	hidecategories(movement,Collision,Lighting,LightColor);

cpptext
{
// Stripped
}

enum EAloneState
{
	AS_FirstLoad,
	AS_Alone,
	AS_Playing
};

var bool bOvertime;
var bool bGameOver;
var float MatchStartTime;
var dnMultiplayer.EAloneState eAlone;
var() float RespawnDistance;
var() float MinFromOtherRespawnDistance;
var float MaxCountDown;
var float MaxShowWinnerSeconds;
var string savedEndGameReason;
var bool bEndOfGameRequest;
var DukeMultiPlayer FirstPlayer;
var Engine.Object.EMGametype GameType;
var Engine.Object.EMGametype gametypeDLC;
var array<PlayerStart> PlayerStarts;
var array<PlayerPawn> PlayerPawns;
var bool bAllowRestart;
var float MaxFirstLoadWaitTime;

// Export UdnMultiplayer::execFindPlayerStart(FFrame&, void* const)
native function PlayerStart FindPlayerStart(Pawn Player, optional byte InTeam, optional string IncomingName)
{
	//native.Player;
	//native.InTeam;
	//native.IncomingName;	
}

function bool GameTypeValidSpawn(PlayerStart ps)
{
	switch(GameType)
	{
		// End:0x25
		case 1:
			// End:0x22
			if(ps.bDeathMatch)
			{
				return true;
			}
			// End:0x7F
			break;
		// End:0x42
		case 3:
			// End:0x3F
			if(ps.bTeamDeathMatch)
			{
				return true;
			}
			// End:0x7F
			break;
		// End:0x5F
		case 2:
			// End:0x5C
			if(ps.bCaptureTheFlag)
			{
				return true;
			}
			// End:0x7F
			break;
		// End:0x7C
		case 4:
			// End:0x79
			if(ps.bKingOfTheHill)
			{
				return true;
			}
			// End:0x7F
			break;
		// End:0xFFFF
		default:
			break;
	}
	return false;
	return;
}

event UpdatePlayerStarts()
{
	local PlayerStart ps;
	local array<PlayerStart> BackupPlayerStarts;

	// End:0x45
	foreach __NFUN_747__(class'PlayerStart', ps)
	{
		// End:0x31
		if(GameTypeValidSpawn(ps))
		{
			PlayerStarts[PlayerStarts.Add(1)] = ps;
		}
		BackupPlayerStarts[BackupPlayerStarts.Add(1)] = ps;		
	}	
	// End:0x5D
	if(__NFUN_171__(string(PlayerStarts), 0))
	{
		PlayerStarts = BackupPlayerStarts;
	}
	return;
}

event InitGame(string Options, out string Error)
{
	super.InitGame(Options, Error);
	// End:0x22
	if(__NFUN_171__(string(PlayerStarts), 0))
	{
		UpdatePlayerStarts();
	}
	return;
}

event PreBeginPlay()
{
	super.PreBeginPlay();
	StartMatch();
	return;
}

function ToggleScreenshotMode()
{
	local bool bPreviousPauseable;

	Level.bScreenshotMode = __NFUN_145__(Level.bScreenshotMode);
	bPreviousPauseable = bPauseable;
	bPauseable = true;
	SetPause(Level.bScreenshotMode, Level.__NFUN_1161__(), " ", true);
	bPauseable = bPreviousPauseable;
	Level.NU_ScreenshotMode(Level.bScreenshotMode);
	return;
}

function SetAloneState(dnMultiplayer.EAloneState S)
{
	eAlone = S;
	GameReplicationInfo.bPreGame = __NFUN_173__(int(S), int(0));
	return;
}

function ScoreKill(Pawn Killer, Pawn Victim)
{
	super.ScoreKill(Killer, Victim);
	return;
}

function ScorePoint(DukeMultiPlayer Scorer)
{
	local Pawn P;
	local dnDeathmatchGameReplicationInfo GRI;

	GRI = dnDeathmatchGameReplicationInfo(GameReplicationInfo);
	// End:0x52
	if(__NFUN_340__(GRI, none))
	{
		// End:0x52
		if(__NFUN_150__(__NFUN_201__(GRI.CountDown, 0), __NFUN_201__(GRI.ShowWinnerSeconds, 0)))
		{
			return;
		}
	}
	P = Level.PawnList;
	J0x67:

	// End:0xA5 [Loop If]
	if(__NFUN_340__(P, none))
	{
		DukeMultiPlayer(P).ScorePoint(Scorer);
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x67;
	}
	return;
}

function PostBeginPlay()
{
	local OnlineAgent l_Online;
	local DefaultPhysicsVolume dpv;

	l_Online = OnlineAgent(class'Engine'.static.__NFUN_503__());
	// End:0x34
	if(__NFUN_340__(l_Online, none))
	{
		l_Online.NotifyGameStarted();
	}
	super(Actor).PostBeginPlay();
	NukeBadWeaponSpawns();
	return;
}

function NukeBadWeaponSpawns()
{
	local MP_WeaponPickup mpwp;

	// End:0xE2
	foreach __NFUN_747__(class'MP_WeaponPickup', mpwp)
	{
		// End:0x45
		if(__NFUN_148__(__NFUN_173__(int(GameType), int(2)), __NFUN_145__(mpwp.bCaptureTheBabe)))
		{
			mpwp.__NFUN_614__();
			// End:0xE1
			continue;
		}
		// End:0x7A
		if(__NFUN_148__(__NFUN_173__(int(GameType), int(3)), __NFUN_145__(mpwp.bTeamDeathMatch)))
		{
			mpwp.__NFUN_614__();
			// End:0xE1
			continue;
		}
		// End:0xAF
		if(__NFUN_148__(__NFUN_173__(int(GameType), int(1)), __NFUN_145__(mpwp.bDeathMatch)))
		{
			mpwp.__NFUN_614__();
			// End:0xE1
			continue;
		}
		// End:0xE1
		if(__NFUN_148__(__NFUN_173__(int(GameType), int(4)), __NFUN_145__(mpwp.bKingOfTheHill)))
		{
			mpwp.__NFUN_614__();
		}		
	}	
	return;
}

exec function ApplyDevIni()
{
	local dnMPTuner tuner;

	// End:0x14
	foreach __NFUN_747__(class'dnMPTuner', tuner)
	{
		// End:0x14
		break;		
	}	
	// End:0x34
	if(__NFUN_340__(tuner, none))
	{
		tuner.ApplyDevIni();		
	}
	else
	{
		__NFUN_355__("ApplyDevIni() :: THERE IS NO dnMPTuner IN THE LEVEL");
	}
	return;
}

exec function ForceEndGame()
{
	EndGame("ForceEndGame");
	return;
}

exec function AddFakeNetBots(int n)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x23 [Loop If]
	if(__NFUN_169__(i, n))
	{
		__NFUN_1166__();
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	return;
}

function EndGame(string Reason)
{
	local OnlineAgent l_Online;
	local Pawn P;
	local PlayerPawn PP;
	local MPGameReplicationInfo GRI;

	P = Level.PawnList;
	J0x15:

	// End:0xAE [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0x62
		if(bTeamGame)
		{
			DukeMultiPlayer(P).EndGame(DukeMultiPlayer(P).PlayerProgress.LocalTeamMatchResultScore(self));			
		}
		else
		{
			DukeMultiPlayer(P).EndGame(DukeMultiPlayer(P).PlayerProgress.LocalMatchResultScore());
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x15;
	}
	super.EndGame(Reason);
	l_Online = OnlineAgent(class'Engine'.static.__NFUN_503__());
	// End:0xED
	if(__NFUN_340__(l_Online, none))
	{
		l_Online.NotifyGameEnded();
	}
	// End:0x15F
	if(__NFUN_173__(int(Level.NetMode), int(NM_DedicatedServer)))
	{
		GRI = MPGameReplicationInfo(Level.GRI);
		// End:0x15F
		if(__NFUN_340__(GRI, none))
		{
			GRI.StartEORCountDown(class'MPGameReplicationInfo'.default.EORCountDownTime);
			GRI.__EORComplete__Delegate = LoadNextLevel;
		}
	}
	bGameOver = true;
	return;
}

function LoadNextLevel()
{
	local OnlineAgent AgentOnline;

	// End:0x1C
	if(__NFUN_340__(class'Engine'.default.NetworkDevice, class'AgentNetDriver'))
	{
		return;
	}
	AgentOnline = OnlineAgent(class'Engine'.static.__NFUN_503__());
	AgentOnline.LoadNextMap();
	return;
}

function RequestEndGame(string Reason)
{
	local Pawn P;

	savedEndGameReason = Reason;
	bEndOfGameRequest = true;
	GameReplicationInfo.ShowWinnerSeconds = MaxShowWinnerSeconds;
	P = Level.PawnList;
	J0x3D:

	// End:0x9B [Loop If]
	if(__NFUN_340__(P, none))
	{
		DukeMultiPlayer(P).GameEnded();
		DukeMultiPlayer(P).PlayerProgress.Stat_EndGame(self, Reason);
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x3D;
	}
	SetPause(true, none);
	return;
}

function ResetSprees()
{
	local Pawn P;

	P = Level.PawnList;
	J0x15:

	// End:0x65 [Loop If]
	if(__NFUN_340__(P, none))
	{
		DukeMultiPlayer(P).Spree = 0;
		DukeMultiPlayer(P).WeaponSpree = 0;
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x15;
	}
	return;
}

function EndRound()
{
	ResetSprees();
	return;
}

exec function LogMoveSpeed()
{
	local DukePlayer P;

	P = DukePlayer(Level.PawnList);
	J0x1A:

	// End:0x99 [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0x7C
		if(P.bIsPlayerPawn)
		{
			__NFUN_355__(__NFUN_302__(__NFUN_302__(P.PlayerReplicationInfo.PlayerName, ".GetWalkSpeed="), string(P.GetWalkSpeed())));
		}
		P = DukePlayer(P.NextPawn);
		// [Loop Continue]
		goto J0x1A;
	}
	return;
}

event PlayerPawn Login(string Portal, string Options, out string Error, class<PlayerPawn> SpawnClass)
{
	local PlayerPawn NewPlayer;
	local DukeMultiPlayer NewDukeMultiPlayer;

	NewPlayer = super.Login(Portal, Options, Error, SpawnClass);
	NewPlayer.__NFUN_642__(0);
	NewPlayer.bNoDamage = true;
	NewDukeMultiPlayer = DukeMultiPlayer(NewPlayer);
	// End:0x6D
	if(__NFUN_340__(NewDukeMultiPlayer, none))
	{
		CustomizePlayer(Options, NewDukeMultiPlayer);
	}
	// End:0x99
	if(__NFUN_148__(IsMP(), __NFUN_340__(MPInfo, none)))
	{
		MPInfo.PostLogin(NewPlayer);
	}
	CheckForFirstPlayer();
	__NFUN_355__(__NFUN_302__("----------Login ::  Player   ", string(NewPlayer)));
	return NewPlayer;
	return;
}

function CustomizePlayer(string Options, DukeMultiPlayer Player)
{
	local string titletag;

	Player.CustomizationInfo.HatIndex = class'ChallengeInfo'.static.__NFUN_1169__(GetIntOption(Options, "Hat", 0));
	Player.CustomizationInfo.FaceIndex = class'ChallengeInfo'.static.__NFUN_1169__(GetIntOption(Options, "Face", 0));
	Player.CustomizationInfo.ShirtIndex = class'ChallengeInfo'.static.__NFUN_1169__(GetIntOption(Options, "Shirt", 0));
	Player.CustomizationInfo.ShirtLogoIndex = class'ChallengeInfo'.static.__NFUN_1169__(GetIntOption(Options, "ShirtLogo", 0));
	Player.CustomizationInfo.ShirtColorIndex = GetIntOption(Options, "ShirtColor", 0);
	Player.CustomizationInfo.TitleIndex = class'ChallengeInfo'.static.__NFUN_1169__(GetIntOption(Options, "Title", 0));
	Player.ApplyCustomizationInfo();
	return;
}

event PostLogin(PlayerPawn NewPlayer)
{
	// End:0x4F
	if(__NFUN_340__(NewPlayer.PlayerReplicationInfo, none))
	{
		BroadcastJoinLeaveEvent(NewPlayer.PlayerReplicationInfo.PlayerName, NewPlayer.PlayerReplicationInfo.Team, true);
	}
	// End:0xBD
	if(__NFUN_148__(IsMP(), NewPlayer.IsLocallyControlled()))
	{
		// End:0xA0
		if(NewPlayer.bAlwaysTalk)
		{
			OnlineAgent(class'Engine'.static.__NFUN_503__()).StartVoIPRecording();			
		}
		else
		{
			OnlineAgent(class'Engine'.static.__NFUN_503__()).StopVoIPRecording();
		}
	}
	return;
}

function Logout(Pawn Exiting)
{
	local PlayerPawn P;

	super.Logout(Exiting);
	P = PlayerPawn(Exiting);
	// End:0x8D
	if(__NFUN_148__(__NFUN_340__(P, none), __NFUN_340__(P.PlayerReplicationInfo, none)))
	{
		BroadcastJoinLeaveEvent(P.PlayerReplicationInfo.PlayerName, P.PlayerReplicationInfo.Team, false, DukeMultiPlayer(Exiting).bKickedForIdle);
	}
	CheckAlone();
	return;
}

function ResetGametype()
{
	local Pawn P;

	P = Level.PawnList;
	J0x15:

	// End:0xBB [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0xA3
		if(__NFUN_340__(P.PlayerReplicationInfo, none))
		{
			P.PlayerReplicationInfo.Score = 0;
			P.PlayerReplicationInfo.Deaths = 0;
			P.PlayerReplicationInfo.Kills = 0;
			P.PlayerReplicationInfo.RoundKills = 0;
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x15;
	}
	return;
}

exec function TestSpawns()
{
	local PlayerStart ps;
	local int total, Team, teamInitial, gtotal, GameType, Initial;

	// End:0x1FC
	foreach __NFUN_747__(class'PlayerStart', ps)
	{
		// End:0x78
		if(__NFUN_145__(Level.__NFUN_1161__().__NFUN_645__(ps.Location)))
		{
			__NFUN_355__(__NFUN_302__(__NFUN_302__("*** PLAYERSTART OBSTRUCTED ", string(ps.Name)), " ***"));			
		}
		else
		{
			// End:0xB0
			if(ps.bCaptureTheFlag)
			{
				__NFUN_184__(GameType[0]);
				// End:0xB0
				if(ps.bInitial)
				{
					__NFUN_184__(Initial[0]);
				}
			}
			// End:0xE8
			if(ps.bKingOfTheHill)
			{
				__NFUN_184__(GameType[1]);
				// End:0xE8
				if(ps.bInitial)
				{
					__NFUN_184__(Initial[1]);
				}
			}
			// End:0x122
			if(ps.bDeathMatch)
			{
				__NFUN_184__(GameType[2]);
				// End:0x122
				if(ps.bInitial)
				{
					__NFUN_184__(Initial[2]);
				}
			}
			// End:0x15C
			if(ps.bTeamDeathMatch)
			{
				__NFUN_184__(GameType[3]);
				// End:0x15C
				if(ps.bInitial)
				{
					__NFUN_184__(Initial[3]);
				}
			}
			__NFUN_184__(gtotal);
			// End:0x1D7
			if(__NFUN_150__(__NFUN_173__(int(ps.TeamNumber), 0), __NFUN_173__(int(ps.TeamNumber), 1)))
			{
				__NFUN_184__(Team[int(ps.TeamNumber)]);
				// End:0x1D4
				if(ps.bInitial)
				{
					__NFUN_184__(teamInitial[int(ps.TeamNumber)]);
				}				
			}
			else
			{
				// End:0x1F4
				if(ps.bInitial)
				{
					__NFUN_184__(teamInitial[2]);
				}
			}
		}
		__NFUN_184__(total);		
	}	
	__NFUN_355__(__NFUN_302__("*** TOTAL NUMBER OF PLAYERSTARTS FOUND ", string(total)));
	__NFUN_355__(__NFUN_302__("*** TOTAL NUMBER OF GOOD PLAYERSTARTS FOUND ", string(gtotal)));
	__NFUN_355__(__NFUN_302__("*** TOTAL NUMBER OF GOOD TEAM 0 FOUND ", string(Team[0])));
	__NFUN_355__(__NFUN_302__("*** TOTAL NUMBER OF GOOD TEAM 1 FOUND ", string(Team[1])));
	__NFUN_355__(__NFUN_302__("*** TOTAL NUMBER OF GOOD TEAM 0 INITIALS FOUND ", string(teamInitial[0])));
	__NFUN_355__(__NFUN_302__("*** TOTAL NUMBER OF GOOD TEAM 1 INITIALS FOUND ", string(teamInitial[1])));
	__NFUN_355__(__NFUN_302__("*** TOTAL NUMBER OF GOOD NONTEAM INITIALS FOUND ", string(teamInitial[2])));
	__NFUN_355__("*** OF THOSE");
	__NFUN_355__(__NFUN_302__("*** GOOD CAPTURE THE FLAG FOUND ", string(GameType[0])));
	__NFUN_355__(__NFUN_302__("*** GOOD HTTK FOUND ", string(GameType[1])));
	__NFUN_355__(__NFUN_302__("*** GOOD DEATHMATCH FOUND ", string(GameType[2])));
	__NFUN_355__(__NFUN_302__("*** GOOD TEAM DEATHMATCH FOUND ", string(GameType[3])));
	__NFUN_355__(__NFUN_302__("*** NUMBER OF GOOD CTB INITIAL STARTS ", string(Initial[0])));
	__NFUN_355__(__NFUN_302__("*** NUMBER OF GOOD CF INITIAL STARTS ", string(Initial[1])));
	__NFUN_355__(__NFUN_302__("*** NUMBER OF GOOD DM INITIAL STARTS ", string(Initial[2])));
	__NFUN_355__(__NFUN_302__("*** NUMBER OF GOOD TDM INITIAL STARTS ", string(Initial[3])));
	return;
}

function Tick(float dt)
{
	super(Actor).Tick(dt);
	// End:0x1F
	if(__NFUN_173__(int(eAlone), int(0)))
	{
		CheckAlone();
	}
	return;
}

final function bool IsAlone()
{
	return __NFUN_145__(__NFUN_173__(int(eAlone), int(2)));
	return;
}

function CheckAlone()
{
	CheckAloneInternal(__NFUN_171__(NumPlayers, 1));
	return;
}

function GameStartBuffer()
{
	bAllowRestart = true;
	SetAloneState(1);
	CheckAloneInternal(__NFUN_171__(NumPlayers, 1));
	return;
}

final function CheckAloneInternal(bool bShouldBeAlone)
{
	local Pawn P;
	local array<SAgentPlayer> Players;
	local int tc[2];

	// End:0x1A9
	if(__NFUN_148__(__NFUN_173__(int(eAlone), int(0)), __NFUN_201__(MaxFirstLoadWaitTime, float(0))))
	{
		OnlineAgent(class'Engine'.static.__NFUN_503__()).GetLobbyPlayers(Players);
		// End:0x15F
		if(__NFUN_170__(NumPlayers, 1))
		{
			// End:0x6D
			if(__NFUN_145__(bTeamGame))
			{
				__NFUN_210__(MaxFirstLoadWaitTime, Level.TimeDeltaSeconds);				
			}
			else
			{
				P = Level.PawnList;
				J0x82:

				// End:0x15F [Loop If]
				if(__NFUN_340__(P, none))
				{
					// End:0x147
					if(__NFUN_340__(DukeMultiPlayer(P), none))
					{
						// End:0x112
						if(__NFUN_150__(__NFUN_173__(int(DukeMultiPlayer(P).PlayerReplicationInfo.Team), 0), __NFUN_173__(int(DukeMultiPlayer(P).PlayerReplicationInfo.Team), 1)))
						{
							__NFUN_184__(tc[int(DukeMultiPlayer(P).PlayerReplicationInfo.Team)]);
						}
						// End:0x147
						if(__NFUN_148__(__NFUN_170__(tc[0], 0), __NFUN_170__(tc[1], 0)))
						{
							__NFUN_210__(MaxFirstLoadWaitTime, Level.TimeDeltaSeconds);
							// [Explicit Break]
							goto J0x15F;
						}
					}
					P = P.NextPawn;
					// [Loop Continue]
					goto J0x82;
				}
			}
		}
		J0x15F:

		// End:0x1A6
		if(__NFUN_150__(__NFUN_150__(__NFUN_172__(NumPlayers, string(Players)), __NFUN_171__(string(Players), 1)), __NFUN_202__(MaxFirstLoadWaitTime, float(0))))
		{
			MaxFirstLoadWaitTime = 0;
			__NFUN_607__(1, false, 'GameStartBuffer');
			return;
		}		
	}
	else
	{
		// End:0x1CE
		if(bShouldBeAlone)
		{
			// End:0x1CB
			if(__NFUN_145__(IsAlone()))
			{
				SetAloneState(1);
				BecameAlone();
			}			
		}
		else
		{
			// End:0x1E8
			if(IsAlone())
			{
				SetAloneState(2);
				BecameNotAlone();				
			}
			else
			{
				SetAloneState(2);
			}
		}
	}
	// End:0x218
	if(__NFUN_340__(dnDeathmatchGameReplicationInfo(GameReplicationInfo), none))
	{
		GameReplicationInfo.bWaitingForPlayers = IsAlone();
	}
	return;
}

function CheckForFirstPlayer()
{
	local Pawn P;

	// End:0x0D
	if(__NFUN_170__(NumPlayers, 1))
	{
		return;
	}
	P = Level.PawnList;
	J0x22:

	// End:0x83 [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0x6B
		if(__NFUN_148__(P.bIsPlayer, P.__NFUN_358__('DukeMultiPlayer')))
		{
			FirstPlayer = DukeMultiPlayer(P);
			// [Explicit Break]
			goto J0x83;
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x22;
	}
	J0x83:

	return;
}

function BecameAlone()
{
	CheckForFirstPlayer();
	// End:0x39
	if(__NFUN_148__(__NFUN_340__(FirstPlayer, none), __NFUN_145__(FirstPlayer.bQuitGame)))
	{
		FirstPlayer.BecameAlone();
	}
	return;
}

function SkinMeshOptimizationToggle()
{
	local DukeMultiPlayer DukePlayer;
	local Pawn P;

	P = Level.PawnList;
	J0x15:

	// End:0x67 [Loop If]
	if(__NFUN_340__(P, none))
	{
		DukePlayer = DukeMultiPlayer(P);
		// End:0x4F
		if(__NFUN_340__(DukePlayer, none))
		{
			DukePlayer.__NFUN_833__(true, true);
			// [Explicit Break]
			goto J0x67;
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x15;
	}
	J0x67:

	return;
}

function BecameNotAlone()
{
	local Pickup PickupIter;
	local Pawn P;
	local DukeMultiPlayer DukePlayer;

	// End:0x16C
	if(bAllowRestart)
	{
		CheckForFirstPlayer();
		P = Level.PawnList;
		J0x24:

		// End:0xD4 [Loop If]
		if(__NFUN_340__(P, none))
		{
			DukePlayer = DukeMultiPlayer(P);
			// End:0xBC
			if(__NFUN_340__(DukePlayer, none))
			{
				// End:0x7B
				if(DukePlayer.__NFUN_833__(false, false))
				{
					DukePlayer.__NFUN_833__(true, false);
					__NFUN_607__(3, false, 'SkinMeshOptimizationToggle');
				}
				DukePlayer.RemoveTripMinesAndPipeBombs();
				DiscardInventory(DukePlayer);
				DukePlayer.BecameNotAlone();
				RestartPlayer(DukePlayer);
				AddDefaultInventory(DukePlayer);
			}
			P = P.NextPawn;
			// [Loop Continue]
			goto J0x24;
		}
		// End:0x156
		foreach __NFUN_747__(class'Pickup', PickupIter)
		{
			// End:0x10A
			if(__NFUN_200__(PickupIter.RespawnTime, float(0)))
			{
				PickupIter.__NFUN_614__();
				// End:0x155
				continue;
			}
			// End:0x145
			if(__NFUN_340__(dnRespawnMarker(PickupIter.RespawnMarkerActor), none))
			{
				dnRespawnMarker(PickupIter.RespawnMarkerActor).SetForceState(0);
			}
			PickupIter.WakeUp();			
		}		
		GameReplicationInfo.SetCountdown(MaxCountDown);
	}
	return;
}

function bool RestartPlayer(Pawn Player)
{
	local PlayerStart StartSpot;
	local DukeMultiPlayer l_MultiplayerPawn;
	local bool bSuccess;
	local float Offset;
	local int testcount;
	local Vector test[4], VOffset;
	local bool bVO;
	local PlayerStart Backup;

	Player.__NFUN_642__(2);
	CheckAlone();
	l_MultiplayerPawn = DukeMultiPlayer(Player);
	// End:0x7F
	if(__NFUN_148__(__NFUN_148__(__NFUN_145__(bAllowRestart), __NFUN_340__(l_MultiplayerPawn, none)), __NFUN_340__(l_MultiplayerPawn.LoginPlayerStart, none)))
	{
		StartSpot = l_MultiplayerPawn.LoginPlayerStart;
		l_MultiplayerPawn.LoginPlayerStart = none;		
	}
	else
	{
		StartSpot = FindPlayerStart(Player, Player.PlayerReplicationInfo.Team);
	}
	// End:0xD5
	if(__NFUN_148__(IsMP(), __NFUN_340__(MPInfo, none)))
	{
		MPInfo.PreRestartPlayer(Player);
	}
	// End:0x108
	if(__NFUN_148__(__NFUN_340__(l_MultiplayerPawn, none), l_MultiplayerPawn.bDontUseMeqonPhysics))
	{
		l_MultiplayerPawn.__NFUN_621__(true, true, true, true, true);
	}
	// End:0x4E6
	if(__NFUN_150__(__NFUN_339__(StartSpot, none), __NFUN_145__(Player.__NFUN_645__(StartSpot.GetSpawnLocation()))))
	{
		__NFUN_355__(__NFUN_302__("WARNINGWARNINGWARNINGWARNING: Failed to correctly restart player. This is a logical error and should never happen in production. Falling back to the FIRST spawn point we can find : ", string(StartSpot)));
		test[0] = __NFUN_232__(__NFUN_198__(__NFUN_195__(Player.CollisionRadius, float(2)), float(1)), 0, 0);
		test[1] = __NFUN_232__(__NFUN_194__(__NFUN_198__(__NFUN_195__(Player.CollisionRadius, float(2)), float(1))), 0, 0);
		test[2] = __NFUN_232__(0, __NFUN_198__(__NFUN_195__(Player.CollisionRadius, float(2)), float(1)), 0);
		test[3] = __NFUN_232__(0, __NFUN_194__(__NFUN_198__(__NFUN_195__(Player.CollisionRadius, float(2)), float(1))), 0);
		bSuccess = false;
		// End:0x2E8
		if(Player.__NFUN_645__(__NFUN_238__(StartSpot.GetSpawnLocation(), VOffset)))
		{
			bSuccess = true;
		}
		J0x2E8:

		// End:0x38F [Loop If]
		if(__NFUN_145__(bSuccess))
		{
			testcount = 0;
			J0x2FA:

			// End:0x34F [Loop If]
			if(__NFUN_169__(testcount, 4))
			{
				// End:0x345
				if(Player.__NFUN_645__(__NFUN_238__(__NFUN_238__(StartSpot.GetSpawnLocation(), test[testcount]), VOffset)))
				{
					bSuccess = true;
					// [Explicit Break]
					goto J0x34F;
				}
				__NFUN_184__(testcount);
				// [Loop Continue]
				goto J0x2FA;
			}
			J0x34F:

			// End:0x389
			if(__NFUN_148__(__NFUN_145__(bSuccess), __NFUN_145__(bVO)))
			{
				bVO = true;
				VOffset = __NFUN_232__(0, 0, 6);				
			}
			else
			{
				// [Explicit Break]
				goto J0x38F;
			}
			// [Loop Continue]
			goto J0x2E8;
		}
		J0x38F:

		// End:0x424
		if(bSuccess)
		{
			Backup = FindPlayerStart(Player, Player.PlayerReplicationInfo.Team);
			// End:0x419
			if(__NFUN_150__(__NFUN_339__(Backup, none), __NFUN_145__(Player.__NFUN_645__(Backup.GetSpawnLocation()))))
			{
				Player.__NFUN_645__(__NFUN_238__(StartSpot.GetSpawnLocation(), VOffset));				
			}
			else
			{
				StartSpot = Backup;
			}
		}
		// End:0x492
		if(__NFUN_145__(bSuccess))
		{
			// End:0x491
			foreach __NFUN_747__(class'PlayerStart', StartSpot)
			{
				// End:0x490
				if(Player.__NFUN_645__(StartSpot.GetSpawnLocation()))
				{
					__NFUN_355__("ERROR : choosing random candidate");
					bSuccess = true;
					// End:0x491
					break;
				}				
			}			
		}
		// End:0x4E6
		if(__NFUN_145__(bSuccess))
		{
			__NFUN_355__("CRITICAL ERROR: There are no available start spots to spawn a player");
		}
	}
	// End:0x5F4
	if(__NFUN_145__(Player.PlayerReplicationInfo.bOnlySpectator))
	{
		StartSpot.PlayTeleportEffect(Player, true);
		Player.__NFUN_652__(StartSpot.GetSpawnRotation());
		Player.ClientSetLocation(StartSpot.Location, StartSpot.Rotation);
		Player.ViewRotation = Player.Rotation;
		Player.BecomeActive();
		Player.ClientRespawnNotify(StartSpot.Location, float(StartSpot.Rotation.Yaw));
		Player.ClientSetRotation(StartSpot.GetSpawnRotation());
		SetDefaultPlayerSettings(Player);
	}
	Player.Restart();
	// End:0x630
	if(__NFUN_148__(IsMP(), __NFUN_340__(MPInfo, none)))
	{
		MPInfo.PostRestartPlayer(Player);
	}
	return true;
	return;
}

defaultproperties
{
	RespawnDistance=500
	MinFromOtherRespawnDistance=300
	MaxCountDown=5
	MaxShowWinnerSeconds=5
	MaxFirstLoadWaitTime=30
	DMMessageClass='dnDeathmatchMessage'
}
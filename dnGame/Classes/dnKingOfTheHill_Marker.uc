/*******************************************************************************
 * dnKingOfTheHill_Marker generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnKingOfTheHill_Marker extends dnKingOfTheHill_MarkerBase
	collapsecategories;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		InitProjector, SetProjectorState;
}

noexport simulated delegate InitProjector()
{
	local int i, total;
	local dnKingOfTheHill_Projector Projector;
	local InteractiveActor cyl;

	Projector = dnKotHGameReplicationInfo(Level.GRI).GetProjector();
	// End:0x33
	if(__NFUN_339__(Projector, none))
	{
		return;
	}
	i = 0;
	J0x3A:

	// End:0x6B [Loop If]
	if(__NFUN_169__(i, 3))
	{
		CopyToProjector(Projector.Group[i]);
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x3A;
	}
	// End:0x92
	if(__NFUN_150__(__NFUN_173__(int(Role), int(ROLE_Authority)), __NFUN_145__(bInit)))
	{
		SetProjectorState(nInit, true);
	}
	bInit = true;
	cyl = dnKotHGameReplicationInfo(Level.GRI).Cylinder;
	cyl.__NFUN_645__(__NFUN_238__(OriginalLocation, CylinderOffset));
	cyl.__NFUN_591__(CylinderDrawScale);
	cyl.__NFUN_590__(false);
	return;
}

simulated function PostBeginPlay()
{
	super(InteractiveActor).PostBeginPlay();
	// End:0x3E
	if(__NFUN_173__(int(Role), int(ROLE_Authority)))
	{
		// End:0x3E
		if(__NFUN_174__(int(dnMultiplayer(Level.Game).GameType), int(4)))
		{
			__NFUN_614__();
		}
	}
	// End:0x57
	if(__NFUN_173__(int(Role), int(ROLE_Authority)))
	{
		OriginalLocation = Location;
	}
	__NFUN_590__(true);
	return;
}

simulated event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	return;
}

noexport simulated delegate SetProjectorState(int stateIndex, optional bool bForced)
{
	local dnKingOfTheHill_Projector Projector;

	LastProjectorState = stateIndex;
	// End:0x24
	if(__NFUN_173__(int(Role), int(ROLE_Authority)))
	{
		nInit = stateIndex;
	}
	Projector = dnKotHGameReplicationInfo(Level.GRI).GetProjector();
	// End:0x57
	if(__NFUN_339__(Projector, none))
	{
		return;
	}
	Projector.SetProjectorState(stateIndex, bForced);
	// End:0xC5
	if(__NFUN_340__(dnKotHGameReplicationInfo(Level.GRI).Cylinder, none))
	{
		dnKotHGameReplicationInfo(Level.GRI).Cylinder.SetCylinderState(stateIndex);
	}
	return;
}

simulated function PostNetInitial()
{
	super(RenderActor).PostNetInitial();
	return;
}

simulated function Destroyed()
{
	super(InteractiveActor).Destroyed();
	return;
}

function bool InCylinder(Pawn P)
{
	local Vector PLoc, OLoc;

	PLoc = P.Location;
	OLoc = OriginalLocation;
	PLoc.Z = 0;
	OLoc.Z = 0;
	// End:0x8D
	if(__NFUN_200__(__NFUN_252__(__NFUN_239__(PLoc, OLoc)), __NFUN_195__(CollisionRadius, CollisionRadius)))
	{
		// End:0x8D
		if(__NFUN_200__(__NFUN_211__(__NFUN_199__(P.Location.Z, OriginalLocation.Z)), CollisionHeight))
		{
			return true;
		}
	}
	return false;
	return;
}

simulated function Tick(float Delta)
{
	local dnKotHPlayer tempPlayer;
	local Pawn P;
	local int TeamMembers[2];
	local array<dnKotHPlayer> Players;
	local int i;
	local float targetTime;
	local Rotator spin;

	spin = Rotation;
	__NFUN_180__(spin.Yaw, int(__NFUN_195__(float(24000), Delta)));
	__NFUN_652__(spin);
	// End:0x3B
	if(__NFUN_169__(int(Role), int(ROLE_Authority)))
	{
		return;
	}
	// End:0x48
	if(__NFUN_145__(bActive))
	{
		return;
	}
	// End:0x7C
	if(__NFUN_148__(__NFUN_173__(int(Role), int(ROLE_Authority)), dnMultiplayer(Level.Game).IsAlone()))
	{
		return;
	}
	P = Level.PawnList;
	J0x91:

	// End:0x197 [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0xF3
		if(__NFUN_340__(dnKotHPlayer(P), none))
		{
			dnKotHPlayer(P).YouAreTheKing = false;
			dnKotHPlayer(P).Capturing = false;
			dnKotHPlayer(P).HTTKState = 0;
		}
		// End:0x17F
		if(__NFUN_148__(__NFUN_340__(dnKotHPlayer(P), none), __NFUN_145__(dnKotHPlayer(P).IsDead())))
		{
			// End:0x17F
			if(InCylinder(P))
			{
				__NFUN_184__(TeamMembers[int(P.PlayerReplicationInfo.Team)]);
				dnKotHPlayer(P).Capturing = true;
				Players[Players.Add(1)] = dnKotHPlayer(P);
			}
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x91;
	}
	// End:0x225
	if(__NFUN_148__(__NFUN_170__(TeamMembers[0], 0), __NFUN_170__(TeamMembers[1], 0)))
	{
		ResetCaptureTime();
		// End:0x1D3
		if(__NFUN_174__(Fresh, -1))
		{
			Fresh = -1;
		}
		// End:0x1E7
		if(__NFUN_174__(LastProjectorState, 2))
		{
			SetProjectorState(2);
		}
		i = 0;
		J0x1EE:

		// End:0x220 [Loop If]
		if(__NFUN_169__(i, string(Players)))
		{
			Players[i].HTTKState = 1;
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0x1EE;
		}
		return;		
	}
	else
	{
		// End:0x26B
		if(__NFUN_148__(__NFUN_173__(TeamMembers[0], 0), __NFUN_173__(TeamMembers[1], 0)))
		{
			ResetCaptureTime();
			// End:0x25B
			if(__NFUN_174__(LastProjectorState, 2))
			{
				SetProjectorState(2);
			}
			Fresh = default.Fresh;
			return;			
		}
		else
		{
			i = 0;
			J0x272:

			// End:0x2BF [Loop If]
			if(__NFUN_169__(i, string(Players)))
			{
				Players[i].TeamInCurrentActiveHTTKMarker(Players);
				Players[i].HTTKState = 2;
				__NFUN_184__(i);
				// [Loop Continue]
				goto J0x272;
			}
			i = 0;
			J0x2C6:

			// End:0x4F8 [Loop If]
			if(__NFUN_169__(i, string(Players)))
			{
				Players[i].YouAreTheKing = true;
				// End:0x336
				if(__NFUN_174__(LastProjectorState, int(Players[0].PlayerReplicationInfo.Team)))
				{
					SetProjectorState(int(Players[0].PlayerReplicationInfo.Team));
				}
				__NFUN_209__(Players[i].CurrentCaptureTime, Delta);
				targetTime = __NFUN_199__(2, __NFUN_195__(float(__NFUN_166__(string(Players), 1)), 0.2));
				// End:0x4EE
				if(__NFUN_203__(Players[i].CurrentCaptureTime, targetTime))
				{
					dnMultiplayer(Level.Game).ScorePoint(Players[i]);
					// End:0x440
					if(__NFUN_148__(__NFUN_169__(Fresh, 0), __NFUN_174__(Fresh, int(Players[i].PlayerReplicationInfo.Team))))
					{
						i = 0;
						J0x3F7:

						// End:0x440 [Loop If]
						if(__NFUN_169__(i, string(Players)))
						{
							// End:0x436
							if(__NFUN_173__(Fresh, -1))
							{
								Players[i].PlayerProgress.Stat_HTTKCaptureChange();
							}
							__NFUN_184__(i);
							// [Loop Continue]
							goto J0x3F7;
						}
					}
					Fresh = int(Players[0].PlayerReplicationInfo.Team);
					i = 0;
					J0x469:

					// End:0x4EB [Loop If]
					if(__NFUN_169__(i, string(Players)))
					{
						Players[i].CurrentCaptureTime = 0;
						__NFUN_180__(Players[i].iOwnage, 1);
						Players[i].PlayerReplicationInfo.Score = Players[i].iOwnage;
						__NFUN_184__(i);
						// [Loop Continue]
						goto J0x469;
					}
					// [Explicit Break]
					goto J0x4F8;
				}
				__NFUN_184__(i);
				// [Loop Continue]
				goto J0x2C6;
			}
		}
	}
	J0x4F8:

	ResetCaptureTime();
	return;
}

function ResetCaptureTime()
{
	local Pawn P;

	P = Level.PawnList;
	J0x15:

	// End:0x80 [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0x68
		if(__NFUN_148__(__NFUN_340__(dnKotHPlayer(P), none), __NFUN_145__(dnKotHPlayer(P).YouAreTheKing)))
		{
			dnKotHPlayer(P).CurrentCaptureTime = 0;
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x15;
	}
	return;
}

simulated function SetActive(bool B)
{
	// End:0xC1
	if(__NFUN_148__(DukeMultiPlayer(Level.__NFUN_1161__()).bSpawnShrunk, __NFUN_204__(DesiredLocation[0].Target.Z, default.DesiredLocation[0].Target.Z)))
	{
		DesiredLocation[0].Target.Z = __NFUN_195__(DesiredLocation[0].Target.Z, Level.__NFUN_1161__().DrawScale);
		DesiredLocation[1].Target.Z = __NFUN_195__(DesiredLocation[1].Target.Z, Level.__NFUN_1161__().DrawScale);
	}
	// End:0xDD
	if(__NFUN_148__(B, __NFUN_145__(bKeyFrameLoopSet)))
	{
		GoToNextKey();
	}
	bActive = B;
	Fresh = default.Fresh;
	__NFUN_590__(__NFUN_145__(B));
	// End:0x10F
	if(B)
	{
		InitProjector();
	}
	return;
}

simulated function GoToNextKey()
{
	bKeyFrameLoopSet = true;
	// End:0x21
	if(__NFUN_173__(currentLocIndex, 0))
	{
		__NFUN_646__(__NFUN_184__(currentLocIndex), true);		
	}
	else
	{
		// End:0x37
		if(__NFUN_173__(currentLocIndex, 1))
		{
			__NFUN_646__(__NFUN_185__(currentLocIndex), true);
		}
	}
	return;
}

defaultproperties
{
	FOV=45
	MaxTraceDistance=150
	MaxViewDistance=3500
	bProjectBSP=true
	bProjectStaticMesh=true
	bProjectActor=true
	bProjectPawn=true
	bProjectOwner=true
	bClipBSP=true
	ProjectorScaleX=0.5
	ProjectorScaleY=0.5
	ProjectorOpacity=1
	CylinderDrawScale=0.3
	Fresh=-2
	LastProjectorState=-1
	nInit=2
	bNoDamage=true
	bTraceShootable=false
	bHidden=true
	bIsProjector=true
	bAlwaysVisible=true
	bCastStencilShadows=false
	bDontHardwareOcclude=true
	bDoOverlayEffect=true
	bAlwaysRelevant=true
	bDontSimulateMotion=true
	bDirectional=true
	CollisionRadius=200
	CollisionHeight=100
	DesiredLocation=/* Array type was not detected. */
}
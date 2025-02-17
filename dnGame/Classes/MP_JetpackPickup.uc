/*******************************************************************************
 * MP_JetpackPickup generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_JetpackPickup extends JetpackPickup
	collapsecategories;

var() noexport bool bDeathMatch "Only usable in deathmatch";
var() noexport bool bTeamDeathMatch "Only usable in team deathmatch";
var() noexport bool bCaptureTheBabe "Only usable in capture the babe";
var() noexport bool bKingOfTheHill "Only usable in KOTH";

simulated function bool CanBeUsedBy(Pawn User)
{
	return false;
	return;
}

simulated event PostBeginPlay()
{
	local dnMultiplayer GameType;

	super.PostBeginPlay();
	// End:0x1B
	if(IsMP())
	{
		__NFUN_642__(0);
		__NFUN_621__(,,, false);
	}
	GameType = dnMultiplayer(Level.Game);
	// End:0xEA
	if(__NFUN_340__(GameType, none))
	{
		// End:0x6C
		if(__NFUN_148__(__NFUN_173__(int(GameType.GameType), int(2)), __NFUN_145__(bCaptureTheBabe)))
		{
			__NFUN_614__();			
		}
		else
		{
			// End:0x97
			if(__NFUN_148__(__NFUN_173__(int(GameType.GameType), int(3)), __NFUN_145__(bTeamDeathMatch)))
			{
				__NFUN_614__();				
			}
			else
			{
				// End:0xC2
				if(__NFUN_148__(__NFUN_173__(int(GameType.GameType), int(1)), __NFUN_145__(bDeathMatch)))
				{
					__NFUN_614__();					
				}
				else
				{
					// End:0xEA
					if(__NFUN_148__(__NFUN_173__(int(GameType.GameType), int(4)), __NFUN_145__(bKingOfTheHill)))
					{
						__NFUN_614__();
					}
				}
			}
		}
	}
	return;
}

defaultproperties
{
	InventoryType='MP_Jetpack'
	RespawnMarkerClass='dnRespawnMarker'
	bDoOverlayEffect=true
	CollisionHeight=6
	OverlayMaterial='dt_Effects_mp.OverlayMaterial.OverlayMaterial_MP'
	StaticMesh='SM_Multiplayer.Duke_Jetpack.Duke_Jetpack'
}
/*******************************************************************************
 * dnJizzBombFX_Impact_HUDFX generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnJizzBombFX_Impact_HUDFX extends dnHUDEffects_Splatters
	collapsecategories;

simulated function InRangeCallback(PlayerPawn Player)
{
	// End:0x25
	if(__NFUN_340__(Player, Instigator))
	{
		DukePlayer(Player).NoteJizzedOn();
	}
	super(dnHUDEffects).InRangeCallback(Player);
	return;
}

defaultproperties
{
	EffectName=JizzBombSplatter
	SpawnCountVariance=2
	Lifetime=4.5
	bInverse=true
	Textures(0)=ObjectProperty'dnUsableSomething.User'
	Textures(1)='dt_effects.liquids.JizzBomb_FB'
	Textures(2)='dt_effects.liquids.Jizzbomb_B_FB'
	Textures(3)='dt_effects.liquids.Jizzbomb_C_FB'
	Textures(4)=ObjectProperty'dnTeamGameScoreboard.DrawVictoryConditions.GRI'
	Textures(5)=ObjectProperty'dnControl_CameraViewer_Fullscreen.CurrentCamera'
	Textures(6)=none
	X=64
	Y=64
	Z=0
}
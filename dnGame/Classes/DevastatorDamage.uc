/*******************************************************************************
 * DevastatorDamage generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DevastatorDamage extends ExplosionDamage
	abstract;

static function bool InstagibCorpses()
{
	return true;
	return;
}

defaultproperties
{
	DamageName="<?int?dnGame.DevastatorDamage.DamageName?>"
	DeathMessage="<?int?dnGame.DevastatorDamage.DeathMessage?>"
	SuicideDeathMessage="<?int?dnGame.DevastatorDamage.SuicideDeathMessage?>"
	Icon="dt_hud.ingame_hud.kill_devastator"
	bIgnoreShrunkDamageScaling=true
}
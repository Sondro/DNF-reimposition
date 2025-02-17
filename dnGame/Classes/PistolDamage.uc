/*******************************************************************************
 * PistolDamage generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PistolDamage extends BulletDamage
	abstract;

defaultproperties
{
	DamageName="<?int?dnGame.PistolDamage.DamageName?>"
	DeathMessage="<?int?dnGame.PistolDamage.DeathMessage?>"
	SuicideDeathMessage="<?int?dnGame.PistolDamage.SuicideDeathMessage?>"
	MomentumTransfer=500
	Icon="dt_hud.ingame_hud.kill_deserteagle"
	DeathMomentumScale=4
	DeathLiftScale=0.15
	DamageScaleMap[1]=4
	DamageScaleMap[19]=4
}
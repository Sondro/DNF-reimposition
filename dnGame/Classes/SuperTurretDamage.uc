/*******************************************************************************
 * SuperTurretDamage generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SuperTurretDamage extends ExplosionDamage
	abstract;

static function bool CanGibCorpses()
{
	return true;
	return;
}

static function bool InstagibCorpses()
{
	return true;
	return;
}

defaultproperties
{
	DamageName="<?int?dnGame.SuperTurretDamage.DamageName?>"
	DeathMessage="<?int?dnGame.SuperTurretDamage.DeathMessage?>"
	SuicideDeathMessage="<?int?dnGame.SuperTurretDamage.SuicideDeathMessage?>"
	MomentumTransfer=50000
}
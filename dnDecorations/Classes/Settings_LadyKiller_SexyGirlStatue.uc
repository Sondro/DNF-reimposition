/*******************************************************************************
 * Settings_LadyKiller_SexyGirlStatue generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_LadyKiller_SexyGirlStatue extends Settings_LadyKiller
	abstract
	collapsecategories;

var array<Settings_LadyKiller_SexyGirlStatue_Gib> Gibs;

function float GetSpawnOnDestroyedDelay()
{
	return 0;
	return;
}

function HurtRadiusActivity(Actor DamageInstigator, float DamageAmount, Vector DamageOrigin, float DamageRadius, float DamageFalloffStart, class<DamageType> DamageType, Vector DamageStart, optional bool bIgnoreDrawScale, optional float RelativeScale)
{
	local int i;
	local bool bIsDead;

	bIsDead = DecorationIsDead();
	super(KarmaActor).HurtRadiusActivity(DamageInstigator, DamageAmount, DamageOrigin, DamageRadius, DamageFalloffStart, DamageType, DamageStart, bIgnoreDrawScale, RelativeScale);
	// End:0xBC
	if(__NFUN_148__(__NFUN_145__(bIsDead), DecorationIsDead()))
	{
		i = 0;
		J0x5E:

		// End:0xBC [Loop If]
		if(__NFUN_169__(i, string(Gibs)))
		{
			Gibs[i].HurtRadiusActivity(DamageInstigator, DamageAmount, DamageOrigin, DamageRadius, DamageFalloffStart, DamageType, DamageStart, bIgnoreDrawScale, RelativeScale);
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0x5E;
		}
	}
	return;
}

defaultproperties
{
	bSurviveDeath=true
	HealthPrefab=5
	Health=15
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Stone'
	PhysicsMassType=3
	bAITransparent=true
}
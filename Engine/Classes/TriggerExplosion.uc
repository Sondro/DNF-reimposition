/*******************************************************************************
 * TriggerExplosion generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerExplosion extends Triggers
	collapsecategories
	notplaceable
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound,Advanced,Display,Editor,Object,Collision,Interactivity,Karma,Lighting,Sound,Tick,TickRules,Filter,Networking,Interpolation);

var() array< class<dnFriendFX_Spawners> > EffectSpawners;
var() noexport class<Actor> AffectClass "Class of Actor we are able to damage.";
var() noexport float Damage "How much damage to issue.";
var() noexport float Radius "How far out to issue the damage.";
var() noexport float DamageFalloffStart "How far out before the damage starts to falloff to 0";
var() noexport class<DamageType> DamageType "Type of damage class to use when we take damage (negative HealthChange).";
var() noexport float PlayerDamageScale "We scale the damage to player pawns by this amount.";
var() noexport bool bDontScale "Don't scale the damage and distance values by the DrawScale of the instigator.";

event Trigger(Actor Other, Pawn EventInstigator)
{
	local dnFriendFX_Spawners Spawner;
	local int i;

	i = 0;
	J0x07:

	// End:0xAA [Loop If]
	if(__NFUN_169__(i, string(EffectSpawners)))
	{
		// End:0x2C
		if(__NFUN_339__(EffectSpawners[i], none))
		{
			// [Explicit Continue]
			goto J0xA0;
		}
		Spawner = FindFriendSpawner(EffectSpawners[i]);
		// End:0xA0
		if(__NFUN_340__(Spawner, none))
		{
			Spawner.__NFUN_645__(Location);
			Spawner.__NFUN_652__(Rotation);
			Spawner.SystemSizeScale = __NFUN_196__(DrawScale, default.DrawScale);
			Spawner.ExecuteEffect(true);
		}
		J0xA0:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	HurtRadiusAffectClass = AffectClass;
	// End:0x101
	if(__NFUN_148__(__NFUN_201__(Radius, 0), __NFUN_340__(DamageType, none)))
	{
		HurtRadius(Damage, Location, Radius, DamageFalloffStart, DamageType, Location, PlayerDamageScale, bDontScale);
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local int i;

	PrecacheIndex.__NFUN_1279__(DamageType);
	i = __NFUN_166__(string(EffectSpawners), 1);
	J0x21:

	// End:0x4E [Loop If]
	if(__NFUN_172__(i, 0))
	{
		PrecacheIndex.__NFUN_1266__(EffectSpawners[i]);
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x21;
	}
	return;
}

defaultproperties
{
	AffectClass='Actor'
	Damage=50
	Radius=384
	DamageFalloffStart=128
	DamageType='ExplosionDamage'
	PlayerDamageScale=1
}
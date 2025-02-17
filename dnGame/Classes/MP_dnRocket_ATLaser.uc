/*******************************************************************************
 * MP_dnRocket_ATLaser generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_dnRocket_ATLaser extends dnRocket_ATLaser
	collapsecategories;

simulated event PostNetInitial()
{
	// End:0x0B
	if(bIgnoreSpawn)
	{
		return;
	}
	super(RenderActor).PostNetInitial();
	SetHiddenProjectileActor();
	return;
}

simulated event PostVerifySelf()
{
	return;
}

simulated function ExecutePostVerifySelf()
{
	PostVerifySelf();
	return;
}

simulated function Explode(Vector HitLocation, optional Vector HitNormal, optional Actor HitActor)
{
	DoDamage(HitLocation, HitActor);
	SetHiddenProjectileActor();
	PostExplode();
	return;
}

defaultproperties
{
	PoolLifeSpan=10
	Speed=5000
	MaxSpeed=10000
	Damage=50
	DamageRadius=8
	bHidden=true
	bIsProjectilePool=true
	bNetTemporary=false
	TickStyle=0
	LifeSpan=0
	RemoteRole=0
}
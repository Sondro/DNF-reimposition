/*******************************************************************************
 * Settings_DukeBurger_DukeSauceJar_Gib generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_DukeBurger_DukeSauceJar_Gib extends Settings_DukeBurger
	collapsecategories;

simulated function PostBeginPlay()
{
	// End:0x23
	if(__NFUN_340__(Settings_DukeBurger_DukeSauceJar(Owner), none))
	{
		__NFUN_741__(0, Owner.__NFUN_740__(0));
	}
	// End:0x73
	if(__NFUN_174__(int(Level.NetMode), int(NM_Standalone)))
	{
		bTickOnlyWhenPhysicsAwake = false;
		TickStyle = 1;
		LifeSpan = 6;
		LifeSpanVariance = 2;
		LifeSpan = __NFUN_226__(LifeSpan, LifeSpanVariance);
	}
	super(dnDecoration).PostBeginPlay();
	return;
}

defaultproperties
{
	HealthPrefab=0
	bTickOnlyWhenPhysicsAwake=true
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Glass'
	PhysicsEntityGroup=DukeSauceJarGibsPET
	Physics=18
	bAITransparent=true
	bIsDestroyedActorPool=true
	bSilentDestroy=true
	bGibActor=true
	bCollideWorld=false
	bDontUseMeqonPhysics=true
	CollisionRadius=1
	CollisionHeight=1
	Mass=15
	TickStyle=1
	RemoteRole=0
}
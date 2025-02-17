/*******************************************************************************
 * dnShipThrusterEffect generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnShipThrusterEffect extends dnDecoration
	collapsecategories;

var float MaxSpeed;
var float MinXScale;
var float MaxXScale;
var float YZScale;

event Tick(float DeltaSeconds)
{
	local float Speed, Scale;

	super(Actor).Tick(DeltaSeconds);
	// End:0x69
	if(__NFUN_340__(MountParent, none))
	{
		Speed = __NFUN_251__(MountParent.Velocity);
		Scale = __NFUN_224__(__NFUN_225__(__NFUN_196__(Speed, __NFUN_195__(MaxSpeed, 0.5)), MinXScale), MaxXScale);
		__NFUN_592__(__NFUN_232__(Scale, YZScale, YZScale));
	}
	return;
}

defaultproperties
{
	MaxSpeed=1
	MinXScale=0.25
	MaxXScale=2
	YZScale=1
	HealthPrefab=0
	bCollisionAssumeValid=true
	bTickOnlyZoneRecent=false
	bNoFailMountedMovement=true
	bNoTransparentFog=true
	bCollideActors=false
	bCollideWorld=false
	DrawType=8
	StaticMesh='sm_class_effects.AttackShip_Thrusters.AttackShip_Thrusters_01'
}
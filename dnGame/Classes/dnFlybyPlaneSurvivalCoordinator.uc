/*******************************************************************************
 * dnFlybyPlaneSurvivalCoordinator generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnFlybyPlaneSurvivalCoordinator extends InfoActor
	collapsecategories;

struct FlybyPlane_FighterInfo
{
	var bool bArmed;
	var int OriginalHealth;
	var int DamageTaken;
};

var() noexport float RespawnTime "Amount of time it takes for a plane to respawn.";
var() noexport array<name> StartingPoints "Tags of spawners that the surviving planes can respawn from.";
var array<FlybyPlane_FighterInfo> PlaneQueue;
var array<TriggerSpawnFlybyPlane_Fighter> StartingPointActors;

event PostBeginPlay()
{
	local int i;
	local TriggerSpawnFlybyPlane_Fighter Spawner;

	i = 0;
	J0x07:

	// End:0x70 [Loop If]
	if(__NFUN_169__(i, string(StartingPoints)))
	{
		Spawner = TriggerSpawnFlybyPlane_Fighter(FindActor(class'TriggerSpawnFlybyPlane_Fighter', StartingPoints[i]));
		// End:0x66
		if(__NFUN_340__(Spawner, none))
		{
			StartingPointActors.Insert(string(StartingPointActors), 1);
			StartingPointActors[__NFUN_166__(string(StartingPointActors), 1)] = Spawner;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	StartingPoints.Empty();
	return;
}

final function RequestRespawn(bool bArmed, int OriginalHealth, int DamageTaken)
{
	PlaneQueue.Insert(string(PlaneQueue), 1);
	PlaneQueue[__NFUN_166__(string(PlaneQueue), 1)].bArmed = bArmed;
	PlaneQueue[__NFUN_166__(string(PlaneQueue), 1)].OriginalHealth = OriginalHealth;
	PlaneQueue[__NFUN_166__(string(PlaneQueue), 1)].DamageTaken = DamageTaken;
	__NFUN_605__(RespawnTime, false, 'PerformRespawn', false, true);
	return;
}

final function PerformRespawn()
{
	local int i;

	i = __NFUN_187__(string(StartingPointActors));
	// End:0x81
	if(__NFUN_340__(StartingPointActors[i], none))
	{
		StartingPointActors[i].PlaneHealth = float(PlaneQueue[0].OriginalHealth);
		StartingPointActors[i].InitialDamage = float(PlaneQueue[0].DamageTaken);
		StartingPointActors[i].Trigger(none, none);		
	}
	else
	{
		__NFUN_355__(__NFUN_302__(__NFUN_302__(__NFUN_302__("Warning: ", string(self)), " tried to respawn a plane at an invalid point. Index="), string(i)));
	}
	PlaneQueue.Remove(0, 1);
	return;
}

defaultproperties
{
	RespawnTime=5
	bHidden=true
}
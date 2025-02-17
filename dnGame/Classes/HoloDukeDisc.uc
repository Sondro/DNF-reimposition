/*******************************************************************************
 * HoloDukeDisc generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class HoloDukeDisc extends RenderActor;

var Pawn HDInstigator;
var float PhysicsTotalTime;
var float PhysicsTime;
var Vector StartVel;
var Vector StartLoc;
var Vector TargetLoc;
var Vector SpawnLoc;
var class<Actor> HDClass;
var float SpawnHeight;

event Tick(float DeltaSeconds)
{
	local Vector EndVel;

	super(Actor).Tick(DeltaSeconds);
	__NFUN_209__(PhysicsTime, DeltaSeconds);
	// End:0x65
	if(__NFUN_200__(PhysicsTime, PhysicsTotalTime))
	{
		EndVel = __NFUN_238__(StartVel, __NFUN_235__(PhysicsTime, __NFUN_640__()));
		__NFUN_645__(__NFUN_238__(StartLoc, __NFUN_235__(__NFUN_195__(PhysicsTime, 0.5), __NFUN_238__(StartVel, EndVel))), true);		
	}
	else
	{
		FindAndPlaySound('HoloDuke_Land');
		__NFUN_645__(TargetLoc, true);
		__NFUN_607__(0.5, false, 'SpawnHoloDuke');
		TickStyle = 0;
	}
	return;
}

final function SpawnHoloDuke()
{
	local DukePlayer Duke;
	local Vector SpawnLocation;

	// End:0x2FA
	if(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_340__(HDClass, none), __NFUN_340__(HDClass, none)), __NFUN_340__(HDInstigator, none)), __NFUN_339__(HDInstigator.ActiveHoloDuke, self)))
	{
		SpawnLocation = __NFUN_238__(Location, __NFUN_232__(0, 0, __NFUN_195__(__NFUN_198__(HDClass.default.CollisionHeight, SpawnHeight), DrawScale)));
		// End:0x1CE
		if(IsMP())
		{
			// End:0xB7
			if(__NFUN_200__(DrawScale, default.DrawScale))
			{
				HDInstigator.ActiveHoloDuke = __NFUN_615__(HDClass, none,, SpawnLocation, Rotation,, true);				
			}
			else
			{
				HDInstigator.ActiveHoloDuke = __NFUN_615__(HDClass, none,, SpawnLocation, Rotation);
				// End:0x1AF
				if(__NFUN_145__(HDInstigator.ActiveHoloDuke.__NFUN_645__(HDInstigator.ActiveHoloDuke.Location)))
				{
					__NFUN_355__("DESTROYING HOLODUKE DUE TO SPAWNING WITHIN SOMETHING - RETURNING DISC BACK INTO INVENTORY");
					Level.Game.GiveInventoryTo(HDInstigator, class'MP_Holoduke', true);
					HDInstigator.ActiveHoloDuke.__NFUN_614__();
					__NFUN_614__();
					return;
				}
			}
			HDInstigator.ActiveHoloDuke.__NFUN_641__(Owner);			
		}
		else
		{
			HDInstigator.ActiveHoloDuke = __NFUN_615__(HDClass, Owner,, SpawnLocation, Rotation);
		}
		// End:0x294
		if(__NFUN_340__(HDInstigator.ActiveHoloDuke, none))
		{
			// End:0x284
			if(__NFUN_200__(DrawScale, default.DrawScale))
			{
				// End:0x284
				if(HDInstigator.ActiveHoloDuke.bIsPawn)
				{
					Pawn(HDInstigator.ActiveHoloDuke).ShrinkPawn(0, true, true, false);
					// End:0x284
					if(IsMP())
					{
						HDInstigator.ActiveHoloDuke.__NFUN_645__(SpawnLocation);
					}
				}
			}
			FindAndPlaySound('HoloDuke_Appear', 3);			
		}
		else
		{
			Duke = DukePlayer(HDInstigator);
			// End:0x2FA
			if(__NFUN_340__(Duke, none))
			{
				Level.Game.GiveInventoryTo(Duke, Duke.HoloDukeClass, true);
				FindAndPlaySound('Pickup');
				Duke.HoloDukeSpawnFailed();
			}
		}
	}
	__NFUN_614__();
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(Actor).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'HoloDuke_Land');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'HoloDuke_Appear');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Pickup');
	return;
}

defaultproperties
{
	SpawnHeight=18
	bBlockActors=true
	bCollideActors=true
	bCollideWorld=true
	CollisionRadius=8
	CollisionHeight=1
	TickStyle=3
	DrawType=8
	StaticMesh='sm_class_dukeitems.HoloDukeDisc.HoloDukeDisc'
	RemoteRole=1
	VoicePack='SoundConfig.Inventory.VoicePack_HoloDuke'
}
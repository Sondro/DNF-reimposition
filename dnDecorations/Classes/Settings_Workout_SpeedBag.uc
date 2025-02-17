/*******************************************************************************
 * Settings_Workout_SpeedBag generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_Workout_SpeedBag extends Settings_Workout
	collapsecategories;

var bool bDestroyedComponent;

function ShowComponents()
{
	local int i;

	// End:0x3B
	if(bDestroyedComponent)
	{
		i = __NFUN_166__(string(default.MountOnSpawn), 1);
		J0x18:

		// End:0x3B [Loop If]
		if(__NFUN_172__(i, 0))
		{
			__NFUN_837__(default.MountOnSpawn[i]);
			__NFUN_185__(i);
			// [Loop Continue]
			goto J0x18;
		}
	}
	return;
}

function HideComponents()
{
	local Settings_Workout_SpeedBag_Bag bag;

	// End:0x3C
	foreach __NFUN_747__(class'Settings_Workout_SpeedBag_Bag', bag)
	{
		// End:0x3B
		if(__NFUN_339__(bag.Owner, self))
		{
			bDestroyedComponent = true;
			bag.__NFUN_614__();
		}		
	}	
	return;
}

defaultproperties
{
	HealthPrefab=0
	MountOnSpawn=/* Array type was not detected. */
	SpawnClass='Settings_Workout_SpeedBag_Bag'
	SpawnChance=0
	MountPrefab=(bDontActuallyMount=true,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=-14.5)
	RenderObject=none
	DrawScale=0
}
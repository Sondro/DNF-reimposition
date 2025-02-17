/*******************************************************************************
 * dnControlHelper_WorkoutBench_Bar generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControlHelper_WorkoutBench_Bar extends dnDecoration
	collapsecategories;

const kMaxWeightPerSide = 5;
const kMaxWeight = 10;
const kWeightThickness = 3.0f;

var SMountPrefab WeightAttachMountPrefab;
var float BarAttachOffset;
var array<Settings_Workout_BarWeight_100lbs> LeftWeights;
var array<Settings_Workout_BarWeight_100lbs> RightWeights;

final function Settings_Workout_BarWeight_100lbs GetCarriedWeight(Pawn Carrier)
{
	// End:0x29
	if(__NFUN_150__(__NFUN_339__(Carrier, none), __NFUN_339__(Carrier.CarriedActor, none)))
	{
		return none;		
	}
	else
	{
		return Settings_Workout_BarWeight_100lbs(Carrier.CarriedActor);
	}
	return;
}

final function bool RoomForWeight()
{
	return __NFUN_169__(__NFUN_165__(string(RightWeights), string(LeftWeights)), 10);
	return;
}

final function float GetTotalWeight()
{
	return __NFUN_195__(100, float(__NFUN_165__(string(RightWeights), string(LeftWeights))));
	return;
}

final function bool IsBalanced()
{
	return __NFUN_173__(string(RightWeights), string(LeftWeights));
	return;
}

final function AttachWeightToBar(Settings_Workout_BarWeight_100lbs Weight)
{
	// End:0x0E
	if(__NFUN_339__(Weight, none))
	{
		return;
	}
	// End:0x5A
	if(__NFUN_169__(string(RightWeights), string(LeftWeights)))
	{
		WeightAttachMountPrefab.MountOrigin.Y = __NFUN_198__(BarAttachOffset, __NFUN_195__(float(string(RightWeights)), 3));
		RightWeights[RightWeights.Add(1)] = Weight;		
	}
	else
	{
		WeightAttachMountPrefab.MountOrigin.Y = __NFUN_199__(__NFUN_194__(BarAttachOffset), __NFUN_195__(float(string(LeftWeights)), 3));
		LeftWeights[LeftWeights.Add(1)] = Weight;
	}
	Weight.__NFUN_642__(9);
	Weight.__NFUN_633__(WeightAttachMountPrefab, self);
	Weight.StoreCollision();
	Weight.__NFUN_621__(, false, false);
	bUsable = true;
	bDrawUsePhrase = true;
	Weight.bGrabbable = false;
	Weight.bMimicOwner = true;
	Weight.bPassUseToOwner = true;
	Weight.MimicOwner(self);
	return;
}

final function Settings_Workout_BarWeight_100lbs RemoveWeightFromList(out array<Settings_Workout_BarWeight_100lbs> Weights)
{
	local Settings_Workout_BarWeight_100lbs Weight;

	// End:0x31
	if(__NFUN_170__(string(Weights), 0))
	{
		Weight = Weights[__NFUN_166__(string(Weights), 1)];
		Weights.Remove(__NFUN_166__(string(Weights), 1), 1);
	}
	return Weight;
	return;
}

final function GrabWeightFromBar(Pawn User)
{
	local Settings_Workout_BarWeight_100lbs Weight;

	// End:0x0E
	if(__NFUN_339__(User, none))
	{
		return;
	}
	// End:0x33
	if(__NFUN_173__(string(RightWeights), string(LeftWeights)))
	{
		Weight = RemoveWeightFromList(RightWeights);		
	}
	else
	{
		Weight = RemoveWeightFromList(LeftWeights);
	}
	// End:0x52
	if(__NFUN_339__(Weight, none))
	{
		return;
	}
	Weight.__NFUN_631__();
	Weight.RestoreCollision();
	Weight.__NFUN_642__(9);
	Weight.bGrabbable = true;
	Weight.bMimicOwner = false;
	Weight.bPassUseToOwner = false;
	Weight.UnMimicOwner();
	User.Grab(Weight);
	return;
}

final function bool CanPlaceWeight(Pawn User)
{
	local Settings_Workout_BarWeight_100lbs CarriedWeight;

	// End:0x0E
	if(__NFUN_339__(User, none))
	{
		return false;
	}
	CarriedWeight = GetCarriedWeight(User);
	// End:0x2D
	if(__NFUN_339__(CarriedWeight, none))
	{
		return false;
	}
	return RoomForWeight();
	return;
}

final function bool CanGrabWeight(Pawn User)
{
	local bool bRightSide;

	// End:0x2F
	if(__NFUN_150__(__NFUN_339__(User, none), __NFUN_340__(User.CarriedActor, none)))
	{
		bUsable = false;		
	}
	else
	{
		bUsable = __NFUN_150__(__NFUN_170__(string(RightWeights), 0), __NFUN_170__(string(LeftWeights), 0));
	}
	bDrawUsePhrase = bUsable;
	return bUsable;
	return;
}

simulated event bool ShouldDrawHUDInfoUsePhrase(Pawn TestPawn)
{
	// End:0x32
	if(__NFUN_148__(__NFUN_340__(TestPawn.CarriedActor, none), CanGrabUseCombine(TestPawn.CarriedActor)))
	{
		return false;
	}
	return super(InteractiveActor).ShouldDrawHUDInfoUsePhrase(TestPawn);
	return;
}

simulated function bool CanGrabUseCombine(InteractiveActor Combinee)
{
	return CanPlaceWeight(Combinee.CarriedBy);
	return;
}

simulated function bool CanBeUsedBy(Pawn User)
{
	return __NFUN_150__(CanPlaceWeight(User), CanGrabWeight(User));
	return;
}

event Used(Actor Other, Pawn EventInstigator)
{
	local Settings_Workout_BarWeight_100lbs CarriedWeight;

	super.Used(Other, EventInstigator);
	// End:0x1E
	if(__NFUN_339__(EventInstigator, none))
	{
		return;
	}
	CarriedWeight = GetCarriedWeight(EventInstigator);
	// End:0x5E
	if(__NFUN_340__(CarriedWeight, none))
	{
		EventInstigator.DropCarriedActor(, true,,, true);
		AttachWeightToBar(CarriedWeight);		
	}
	else
	{
		// End:0x7F
		if(__NFUN_339__(EventInstigator.CarriedActor, none))
		{
			GrabWeightFromBar(EventInstigator);
		}
	}
	return;
}

defaultproperties
{
	WeightAttachMountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	BarAttachOffset=40
	HealthPrefab=0
	bDrawUsePhrase=false
	bForceUsePhrase=true
	UsePhrase="<?int?dnDecorations.dnControlHelper_WorkoutBench_Bar.UsePhrase?>"
	GrabUseCombinePhrase="<?int?dnDecorations.dnControlHelper_WorkoutBench_Bar.GrabUseCombinePhrase?>"
	bBlockActors=false
	bBlockPlayers=false
	bBlockKarma=true
	bCollideWorld=false
	CollisionRadius=39
	CollisionHeight=3
	TickStyle=0
	DrawType=8
	StaticMesh='sm_class_decorations.WorkoutWeights.BenchPressBar'
}
/*******************************************************************************
 * Mutator generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Mutator extends Info
	native
	collapsecategories
	notplaceable
	hidecategories(movement,Collision,Lighting,LightColor);

cpptext
{
// Stripped
}

var Mutator NextMutator;
var localized string MutatorName;

function bool VerifySelf()
{
	return true;
	return;
}

simulated event PostRender(Canvas Canvas)
{
	return;
}

function ModifyPlayer(Pawn Other)
{
	// End:0x21
	if(__NFUN_340__(NextMutator, none))
	{
		NextMutator.ModifyPlayer(Other);
	}
	return;
}

function ScoreKill(Pawn Killer, Pawn Other)
{
	// End:0x26
	if(__NFUN_340__(NextMutator, none))
	{
		NextMutator.ScoreKill(Killer, Other);
	}
	return;
}

function MutatorAdded()
{
	return;
}

function AddMutator(Mutator m)
{
	// End:0x46
	if(__NFUN_339__(NextMutator, none))
	{
		__NFUN_355__(__NFUN_303__("Adding Mutator", string(m)));
		NextMutator = m;
		NextMutator.MutatorAdded();		
	}
	else
	{
		NextMutator.AddMutator(m);
	}
	return;
}

function bool AlwaysKeep(Actor Other)
{
	// End:0x22
	if(__NFUN_340__(NextMutator, none))
	{
		return NextMutator.AlwaysKeep(Other);
	}
	return false;
	return;
}

function bool IsRelevant(Actor Other, out byte bSuperRelevant)
{
	local bool bResult;

	bResult = CheckReplacement(Other, bSuperRelevant);
	// End:0x4F
	if(__NFUN_148__(bResult, __NFUN_340__(NextMutator, none)))
	{
		bResult = NextMutator.IsRelevant(Other, bSuperRelevant);
	}
	return bResult;
	return;
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	return true;
	return;
}

function Mutate(string MutateString, PlayerPawn Sender)
{
	// End:0x26
	if(__NFUN_340__(NextMutator, none))
	{
		NextMutator.Mutate(MutateString, Sender);
	}
	return;
}

function MutatorTakeDamage(out float ActualDamage, Pawn Victim, Pawn InstigatedBy, out Vector HitLocation, out Vector HitDirection, class<DamageType> DamageType, name HitBoneName)
{
	// End:0x3F
	if(__NFUN_340__(NextMutator, none))
	{
		NextMutator.MutatorTakeDamage(ActualDamage, Victim, InstigatedBy, HitLocation, HitDirection, DamageType, HitBoneName);
	}
	return;
}

function ModifyDefaultInventory(class<GameInfo> GameType, out array< class<Inventory> > DefaultInventory)
{
	// End:0x26
	if(__NFUN_340__(NextMutator, none))
	{
		NextMutator.ModifyDefaultInventory(GameType, DefaultInventory);
	}
	return;
}

function InitGame(string Options, out string Error)
{
	// End:0x26
	if(__NFUN_340__(NextMutator, none))
	{
		NextMutator.InitGame(Options, Error);
	}
	return;
}

function MutatePhysics(PhysicsVolume vol)
{
	return;
}

// Export UMutator::execAllowPickup(FFrame&, void* const)
native function bool AllowPickup(Pawn Other, class<Inventory> InvClass)
{
	//native.Other;
	//native.InvClass;	
}

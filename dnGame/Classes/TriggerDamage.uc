/*******************************************************************************
 * TriggerDamage generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerDamage extends Triggers
	collapsecategories
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

var() noexport bool bTrackCulprit "When true, the instigator of this trigger will be passed down into damage code and will be responsible for causing the damage. Set this to false to damage a friendly with a trigger instigated by duke without causing duke to take negative ego.";
var() noexport bool bDamageResponsible "When this is true, then damage the actor responsible for instigating the Trigger call (the 'Other' paramter in Trigger()).";
var() noexport bool DontSpawnDestroyTrash "Don't spawn the debris when destroying items (RenderActors only), but do everything else from Destroy() if this damage destroys the target.";
var() noexport float DamageAmount "Amount to damage the Event by. If there is nothing in Event then it will simply damage the EventInstigator.";
var() noexport float DamageVariance "Amount to vary the damage by.";
var() noexport class<DamageType> DamageTypeClass "Type of damage to inflict on the object.";

function bool VerifySelf()
{
	// End:0x1A
	if(__NFUN_200__(DamageAmount, 0))
	{
		DamageAmount = 0;
	}
	// End:0x34
	if(__NFUN_200__(DamageVariance, 0))
	{
		DamageVariance = 0;
	}
	return super(Actor).VerifySelf();
	return;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
	local Actor A;

	super(Actor).Trigger(Other, EventInstigator);
	// End:0x2C
	if(bDamageResponsible)
	{
		TriggerDamageActor(Other, EventInstigator);		
	}
	else
	{
		// End:0x66
		if(__NFUN_342__(Event, 'None'))
		{
			// End:0x62
			foreach __NFUN_747__(class'Actor', A, Event)
			{
				TriggerDamageActor(A, EventInstigator);				
			}						
		}
		else
		{
			// End:0x82
			if(__NFUN_340__(EventInstigator, none))
			{
				TriggerDamageActor(EventInstigator, EventInstigator);
			}
		}
	}
	return;
}

final function TriggerDamageActor(Actor HurtActor, Pawn EventInstigator)
{
	local RenderActor RA;
	local Pawn HurtPawn;
	local dnControl HurtControl;
	local bool bSpawnOnDestroyedStored;
	local Pawn Instigator;

	// End:0x76
	if(HurtActor.bIsPawn)
	{
		HurtPawn = Pawn(HurtActor);
		HurtControl = dnControl(HurtPawn.InteractiveDecoration);
		// End:0x76
		if(__NFUN_148__(__NFUN_340__(HurtControl, none), __NFUN_340__(HurtControl.DamageTrigger, none)))
		{
			HurtActor = HurtControl.DamageTrigger;
		}
	}
	// End:0xB8
	if(DontSpawnDestroyTrash)
	{
		RA = RenderActor(HurtActor);
		bSpawnOnDestroyedStored = RA.bSpawnOnDestroyed;
		RA.bSpawnOnDestroyed = false;
	}
	// End:0xCC
	if(bTrackCulprit)
	{
		Instigator = EventInstigator;
	}
	HurtActor.TakeDamage(Instigator, __NFUN_226__(DamageAmount, DamageVariance), HurtActor.Location, __NFUN_232__(0, 0, 1), DamageTypeClass,, Location);
	// End:0x146
	if(__NFUN_148__(DontSpawnDestroyTrash, __NFUN_340__(RA, none)))
	{
		RA.bSpawnOnDestroyed = bSpawnOnDestroyedStored;
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	PrecacheIndex.__NFUN_1279__(DamageTypeClass);
	return;
}

defaultproperties
{
	bTrackCulprit=true
	DamageTypeClass='Engine.CrushingDamage'
	Texture='Engine.S_TriggerDestroy'
}
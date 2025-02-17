/*******************************************************************************
 * TriggerHeal generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerHeal extends Triggers
	collapsecategories
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

var() noexport int HealAmount "Amount to heal the actor by. If there is nothing in Event then it will simply heal the EventInstigator.";
var() noexport int HealVariance "Amount to vary the healing touch by (will lower the amount, so HealAmount is the max.";
var() noexport int HealMaxAmount "Maximum amount to allow the target object to be healed to. If 0 then no limit.";

function bool VerifySelf()
{
	// End:0x12
	if(__NFUN_169__(HealAmount, 0))
	{
		HealAmount = 0;
	}
	// End:0x24
	if(__NFUN_169__(HealVariance, 0))
	{
		HealVariance = 0;
	}
	// End:0x36
	if(__NFUN_169__(HealMaxAmount, 0))
	{
		HealMaxAmount = 0;
	}
	return super(Actor).VerifySelf();
	return;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
	local RenderActor RA;

	super(Actor).Trigger(Other, EventInstigator);
	// End:0x45
	if(__NFUN_342__(Event, 'None'))
	{
		// End:0x41
		foreach __NFUN_747__(class'RenderActor', RA, Event)
		{
			ApplyGodsHealingHandTo(RA);			
		}				
	}
	else
	{
		// End:0x5C
		if(__NFUN_340__(EventInstigator, none))
		{
			ApplyGodsHealingHandTo(EventInstigator);
		}
	}
	return;
}

final function ApplyGodsHealingHandTo(RenderActor HealedActor)
{
	local int TotalHeal;

	// End:0x0E
	if(__NFUN_339__(HealedActor, none))
	{
		return;
	}
	// End:0x37
	if(__NFUN_148__(__NFUN_174__(HealMaxAmount, 0), __NFUN_203__(HealedActor.Health, float(HealMaxAmount))))
	{
		return;
	}
	TotalHeal = __NFUN_190__(HealAmount, HealVariance, true);
	// End:0x7B
	if(__NFUN_174__(HealMaxAmount, 0))
	{
		TotalHeal = __NFUN_191__(TotalHeal, 0, int(__NFUN_199__(float(HealMaxAmount), HealedActor.Health)));
	}
	HealedActor.ModifyHealth(float(TotalHeal), Location);
	return;
}

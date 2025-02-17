/*******************************************************************************
 * TriggerAssignLimitedRangeMover generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerAssignLimitedRangeMover extends TriggerAssign
	collapsecategories
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound,Collision,Interpolation,movement);

var() noexport Engine.Object.EIntModifier NewStateIndexMod "How you want to modify the Index of the LimitedRangeMover.";
var() noexport int NewStateIndex "StateIndex you want to update the LimitedRangeMover (aka Valves) to.";

function DoAssign(Actor A)
{
	local dnControl_LimitedRangeMover LRM;

	super.DoAssign(A);
	LRM = dnControl_LimitedRangeMover(A);
	// End:0x53
	if(__NFUN_340__(LRM, none))
	{
		LRM.ForceInternalState(__NFUN_347__(NewStateIndexMod, LRM.stateIndex, NewStateIndex));
	}
	return;
}

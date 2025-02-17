/*******************************************************************************
 * dnControl_FinishingMove generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_FinishingMove extends dnControl_Execution;

simulated function AttachPawnSuccess(Pawn Attachee, optional bool bForced)
{
	// End:0x28
	if(__NFUN_340__(AIActor(ExecutionVictim), none))
	{
		AIActor(ExecutionVictim).WasExecuted = true;
	}
	super.AttachPawnSuccess(Attachee, bForced);
	return;
}

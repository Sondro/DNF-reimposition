/*******************************************************************************
 * Settings_Construction_Jersey_Barrier_Chunk generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_Construction_Jersey_Barrier_Chunk extends Pillars_Destructible_Chunk;

event Destroyed()
{
	super.Destroyed();
	__NFUN_812__(7);
	return;
}

defaultproperties
{
	DynamicInteractionClassification=0
}
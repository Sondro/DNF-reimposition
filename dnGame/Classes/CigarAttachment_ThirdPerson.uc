/*******************************************************************************
 * CigarAttachment_ThirdPerson generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class CigarAttachment_ThirdPerson extends dnDecoration
	collapsecategories;

simulated event bool ShouldShowHoloDukeEffect()
{
	return true;
	return;
}

defaultproperties
{
	AnimationControllerClass='acCigar'
	bDumbMesh=false
	bDontSimulateMotion=true
	bCollideActors=false
	CollisionRadius=0
	CollisionHeight=0
	TickStyle=3
	DrawScale=0.8
	Mesh='c_dukeitems.Cigar'
	OwnerSeeStyle=2
	ActorColorList=/* Array type was not detected. */
	Y=0
	Z=0
}
/*******************************************************************************
 * Details_Generic_Tampon generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_Tampon extends Details_Generic_VendItem
	collapsecategories;

function DoVendTransition()
{
	super.DoVendTransition();
	__NFUN_658__(0, true);
	__NFUN_646__(0, true);
	return;
}

defaultproperties
{
	ThrowPhysics=18
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Plastic'
	Physics=18
	CollisionRadius=2.1
	CollisionHeight=0.43
	DesiredLocation=/* Array type was not detected. */
}
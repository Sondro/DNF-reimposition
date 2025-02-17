/*******************************************************************************
 * Settings_FoodService_TechFreezer_Door generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_FoodService_TechFreezer_Door extends Settings_FoodService_DoorBase;

var DecoGlass_TechFreezer Glass;

function PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	Glass = DecoGlass_TechFreezer(FindMountedActor(, class'DecoGlass_TechFreezer'));
	__NFUN_354__(__NFUN_340__(Glass, none));
	Glass.MimicOwner(self);
	return;
}

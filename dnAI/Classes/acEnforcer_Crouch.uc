/*******************************************************************************
 * acEnforcer_Crouch generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class acEnforcer_Crouch extends AIAnimationControllerEx;

defaultproperties
{
	DeathAnims[0]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[1]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[2]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[3]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[4]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[5]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[6]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[7]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[8]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[9]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[10]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[11]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[12]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[13]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[14]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[15]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[16]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[17]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[18]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	DeathAnims[19]=(Front=Anim_DieFinishMe,Back=Anim_DieFinishMe,FinishMeFront=Anim_FinishMeIdle,FinishMeBack=Anim_FinishMeIdle,ReviveMeFront=Anim_FinishRevival,ReviveMeBack=Anim_FinishRevival,FinishMeFrontTimeOut=8,FinishMeBackTimeOut=8)
	bUseSimplePain=true
	bNonDirectionalPains=true
	MuzzleAimerContraints=(MinViewPitchOffset=-16000,MaxViewPitchOffset=16000,IgnoreThresholdPitch=6000,MinViewYawOffset=-6000,MaxViewYawOffset=6000,IgnoreThresholdYaw=3000,SmerpOn=0,SmerpOff=0,Acceleration=0.5,AccelerationReset=0.1,Velocity=5000,VelocityReset=2500)
	WeaponAimerContraints=(MinViewPitchOffset=-8000,MaxViewPitchOffset=16000,IgnoreThresholdPitch=3000,MinViewYawOffset=-16000,MaxViewYawOffset=16000,IgnoreThresholdYaw=3000,SmerpOn=0,SmerpOff=0,Acceleration=0.5,AccelerationReset=0.1,Velocity=5000,VelocityReset=2500)
}
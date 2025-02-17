/*******************************************************************************
 * acAlienQueen generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class acAlienQueen extends AIAnimationControllerEx
	dependson(AlienQueen);

function bool GetPainAnimName(Engine.Object.EPawnBodyPart Part, class<DamageType> DamageType, int Damage, Vector Dir, out name AnimName, out Engine.BaseAI.EAIAnimController NextAnimCtrl, out Engine.Object.EPawnBodyPart WoundedPart, out Engine.BaseAI.EAIArcSector WoundSector)
{
	local AlienQueen QueenOwner;

	QueenOwner = AlienQueen(RenderOwner);
	// End:0x48
	if(__NFUN_150__(QueenOwner.bStunned, __NFUN_145__(QueenOwner.bDefending)))
	{
		AnimName = 'Anim_PainStunned';		
	}
	else
	{
		AnimName = 'Anim_PainDefend';
	}
	return true;
	return;
}

function bool GetDeathAnimName(Engine.Object.EPawnBodyPart Part, int Damage, Vector Dir, out name AnimName, out name FinishMeAnimName, out name FinishMeReviveAnimName, out float FinishMeTimeout, out int UseExactAnimName)
{
	local AlienQueen A;

	A = AlienQueen(RenderOwner);
	// End:0xA6
	if(__NFUN_148__(__NFUN_340__(A, none), __NFUN_340__(A.FinishMeControlType, none)))
	{
		A.Level.FinishingMoveGate = A.Level.GameTimeSeconds;
		AnimName = 'Anim_Finish_Stun';
		FinishMeAnimName = 'Anim_Finish_StunIdle';
		FinishMeReviveAnimName = 'Anim_Finish_StunRecover';
		FinishMeTimeout = A.StrengthTapIdleTime;
		UseExactAnimName = 1;
		return true;
	}
	return false;
	return;
}

defaultproperties
{
	WeaponAimerContraints=(MinViewPitchOffset=0,MaxViewPitchOffset=0,IgnoreThresholdPitch=342000,MinViewYawOffset=-11192,MaxViewYawOffset=11192,IgnoreThresholdYaw=1820,SmerpOn=0,SmerpOff=0,Acceleration=0.5,AccelerationReset=0.1,Velocity=5000,VelocityReset=2500)
}
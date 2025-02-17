/*******************************************************************************
 * PointTracker generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PointTracker extends Object
	native;

var private float m_fMaxRate;
var private float m_fNextRate;
var private Quat m_qCurRot;
var private Vector m_vConstraints;

// Export UPointTracker::execUpdate(FFrame&, void* const)
native final function Update(Vector vOrigin, Vector vFocus, Vector vCurFwd, Vector vCurUp, Vector vCurRight, Vector vBiasPoint, float fDeltaTime)
{
	//native.vOrigin;
	//native.vFocus;
	//native.vCurFwd;
	//native.vCurUp;
	//native.vCurRight;
	//native.vBiasPoint;
	//native.fDeltaTime;	
}

event SetConstraints(float fPitchDegrees, float fYawDegrees, float fRollDegrees)
{
	m_vConstraints.X = __NFUN_195__(fPitchDegrees, __NFUN_196__(3.141593, 180));
	m_vConstraints.Y = __NFUN_195__(fYawDegrees, __NFUN_196__(3.141593, 180));
	m_vConstraints.Z = __NFUN_195__(fRollDegrees, __NFUN_196__(3.141593, 180));
	return;
}

function Vector GetConstraints()
{
	return m_vConstraints;
	return;
}

function DelayedSetMaxRate(float fNewRate)
{
	m_fNextRate = fNewRate;
	return;
}

function SetMaxRate(float fRate)
{
	m_fMaxRate = fRate;
	m_fNextRate = fRate;
	return;
}

function float GetMaxRate()
{
	return m_fMaxRate;
	return;
}

event Vector GetDirection()
{
	return __NFUN_297__(m_qCurRot);
	return;
}

function GetDirectionAxes(out Vector vFwd, out Vector vUp, out Vector vRight)
{
	__NFUN_296__(m_qCurRot, vFwd, vUp, vRight);
	return;
}

function SetDirection(Rotator rCur)
{
	m_qCurRot = __NFUN_293__(rCur);
	return;
}

defaultproperties
{
	m_fMaxRate=6.2832
	m_fNextRate=6.2832
	m_vConstraints=(X=2.456724E-29,Y=3.778469E-17,Z=3.1416)
}
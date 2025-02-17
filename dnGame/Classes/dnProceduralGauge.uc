/*******************************************************************************
 * dnProceduralGauge generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnProceduralGauge extends dnGauge
	abstract
	collapsecategories;

var(dnGauge) noexport int MaxValue "Maximum value of the gauge.";
var(dnGauge) noexport int StartAngle "Angle of needle corresponding to zero on the gauge.";
var(dnGauge) noexport int EndAngle "Angle of needle corresponding to the maximum value on the gauge.";
var(dnGauge) name NeedleBoneName;
var int Angle;
var int DesiredAngle;
var private bool bStartup;
var private int StepAngle;
var private float AngleDelta;
var private float MaxAngleDelta;
var private float SpringStrength;
var private float TimeScaleStrength;

event PostBeginPlay()
{
	super(dnDecoration).PostBeginPlay();
	bStartup = true;
	StepAngle = __NFUN_163__(__NFUN_166__(EndAngle, StartAngle), MaxValue);
	AdjustGaugeState(GaugeStartState);
	return;
}

event Tick(float DeltaTime)
{
	local float diff;

	super(Actor).Tick(DeltaTime);
	// End:0x32
	if(bStartup)
	{
		bStartup = false;
		AngleDelta = float(__NFUN_166__(DesiredAngle, Angle));		
	}
	else
	{
		diff = float(__NFUN_166__(DesiredAngle, Angle));
		AngleDelta = __NFUN_195__(diff, SpringStrength);
		// End:0x79
		if(__NFUN_206__(TimeScaleStrength, 0))
		{
			__NFUN_207__(AngleDelta, __NFUN_195__(TimeScaleStrength, DeltaTime));
		}
		AngleDelta = __NFUN_227__(AngleDelta, __NFUN_194__(MaxAngleDelta), MaxAngleDelta);
	}
	return;
}

simulated event bool OnEvalBonesHelper()
{
	__NFUN_568__().__NFUN_538__(NeedleBoneName, __NFUN_265__(0, 0, int(__NFUN_194__(AngleDelta))), false, true);
	__NFUN_180__(Angle, int(AngleDelta));
	return true;
	return;
}

function HandleGaugeLeft()
{
	// End:0x17
	if(bInverseGauge)
	{
		AdjustGaugeState(-1);		
	}
	else
	{
		AdjustGaugeState(1);
	}
	return;
}

function HandleGaugeRight()
{
	// End:0x13
	if(bInverseGauge)
	{
		AdjustGaugeState(1);		
	}
	else
	{
		AdjustGaugeState(-1);
	}
	return;
}

function SetGaugeState(int NewGaugeState)
{
	GaugeState = __NFUN_191__(NewGaugeState, 0, MaxValue);
	DesiredAngle = __NFUN_165__(StartAngle, __NFUN_162__(GaugeState, StepAngle));
	return;
}

function AdjustGaugeState(int GaugeStateAdjustment)
{
	SetGaugeState(__NFUN_165__(GaugeState, GaugeStateAdjustment));
	return;
}

defaultproperties
{
	MaxValue=6
	StartAngle=-24576
	EndAngle=24576
	NeedleBoneName=Needle
	MaxAngleDelta=5000
	SpringStrength=0.9
	TimeScaleStrength=1
	GaugeStartState=0
	MountOnSpawn=/* Array type was not detected. */
	AnimationName=/* Unknown default property type! */
	bSurviveDismount=true
	bDontScaleByDrawScale=false
	bScaleByDrawScaleNonDefault=false
	bTransformDrawScale3DChange=false
	bTakeParentTag=false
	bTransferToCorpse=false
	bDontSetOwner=false
	MountParentTag=None
	DrawScaleOverride=0
	AppendToTag=None
	ForceTag=None
	ForceEvent=None
	MountMeshItem=None
	MountOrigin=(X=1.292418E-41,Y=2.95443E-17,Z=0)
	MountOriginVariance=(X=1.292418E-41,Y=2.94903E-17,Z=0)
	MountAngles=(Pitch=8741,Yaw=572915712,Roll=0)
	MountAnglesVariance=(Pitch=8741,Yaw=572915712,Roll=0)
	MountType=0
	DismountPhysics=0
}
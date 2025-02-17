/*******************************************************************************
 * UDukeNormalCheckBox generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeNormalCheckBox extends UWindowDialogControl;

var float CheckX;
var float CheckY;
var float CheckWidth;
var Region OverRegion;
var Region CheckRegion;
var Region OpenCheckRegion;
var Region OverCheckRegion;
var bool bChecked;
var SSoundInfo SoundCheckboxInfo;

function Created()
{
	super.Created();
	CancelAcceptsFocus();
	return;
}

simulated function Click(float X, float Y)
{
	Notify(2);
	bChecked = __NFUN_145__(bChecked);
	GetPlayerOwner().PlaySoundInfo(0, SoundCheckboxInfo);
	Notify(1);
	return;
}

function BeforePaint(Canvas C, float X, float Y)
{
	local float XL, YL;

	super.BeforePaint(C, X, Y);
	C.Font = C.BlockFontSmall;
	return;
}

function Paint(Canvas C, float X, float Y)
{
	C.DrawColor = WhiteColor;
	// End:0x76
	if(bChecked)
	{
		DrawStretchedTextureSegment(C, 0, 0, WinWidth, WinHeight, float(CheckRegion.X), float(CheckRegion.Y), float(CheckRegion.W), float(CheckRegion.h), class'Backdrop', 1);		
	}
	else
	{
		DrawStretchedTextureSegment(C, 0, 0, WinWidth, WinHeight, float(OpenCheckRegion.X), float(OpenCheckRegion.Y), float(OpenCheckRegion.W), float(OpenCheckRegion.h), class'Backdrop', 1);
	}
	return;
}

defaultproperties
{
	OverRegion=(X=0,Y=16,W=486,h=40)
	CheckRegion=(X=72,Y=66,W=53,h=50)
	OpenCheckRegion=(X=13,Y=66,W=53,h=50)
	OverCheckRegion=(X=132,Y=66,W=53,h=50)
	SoundCheckboxInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=/* Array type was not detected. */,Y[97]=/* Unknown default property type! */,Y=0,VolumePrefab=0,Slots=/* Array type was not detected. */,Y=/* Unknown default property type! */,Volume=0.5,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
}
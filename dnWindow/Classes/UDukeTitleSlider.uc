/*******************************************************************************
 * UDukeTitleSlider generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeTitleSlider extends UDukeListSlider;

var int ActiveIndex;
var Color GoldColor;
var SSoundInfo SoundSelectInfo;

function Paint(Canvas C, float X, float Y)
{
	local float TextXL, TextYL;

	C.DrawColor = DrawColor;
	C.Font = C.TallFont;
	TextSize(C, Text, TextXL, TextYL, __NFUN_195__(TextScaleX, TextScaleXMod), __NFUN_195__(TextScaleY, TextScaleYMod));
	ClipText(C, TextX, TextY, Text,, __NFUN_195__(TextScaleX, TextScaleXMod), __NFUN_195__(TextScaleY, TextScaleYMod),, 2);
	// End:0xC7
	if(__NFUN_173__(GetSelectedIndex(), ActiveIndex))
	{
		C.DrawColor = GoldColor;		
	}
	else
	{
		C.DrawColor = class'UWindowScene'.default.GreyColor;
	}
	// End:0x14D
	if(__NFUN_150__(bDisabled, __NFUN_339__(SelectedItem, none)))
	{
		ClipText(C, SelectedTextX, SelectedTextY, DisabledText,, __NFUN_195__(class'UWindowScene'.default.TTFontScale, TextScaleXMod), __NFUN_195__(class'UWindowScene'.default.TTFontScale, TextScaleYMod),, 2);		
	}
	else
	{
		ClipText(C, SelectedTextX, SelectedTextY, SelectedItem.Text,, __NFUN_195__(class'UWindowScene'.default.TTFontScale, TextScaleXMod), __NFUN_195__(class'UWindowScene'.default.TTFontScale, TextScaleYMod),, 2);
	}
	// End:0x219
	if(__NFUN_148__(__NFUN_339__(ParentWindow.ChildInFocus, self), __NFUN_145__(SelectionIconDisabled)))
	{
		class'UWindowScene'.static.DrawSelectionIcon(C, __NFUN_195__(-8, C.FixedScale), __NFUN_198__(TextY, __NFUN_195__(0.5, TextYL)), C.FixedScale, 1);
	}
	C.DrawColor = DrawColor;
	super(UWindowWindow).Paint(C, X, Y);
	return;
}

function Click(float X, float Y)
{
	super.Click(X, Y);
	Notify(2);
	return;
}

function Notify(byte E)
{
	super(UWindowDialogControl).Notify(E);
	// End:0x5B
	if(__NFUN_150__(__NFUN_173__(int(E), 2), __NFUN_173__(int(E), 2)))
	{
		// End:0x5B
		if(__NFUN_174__(ActiveIndex, GetSelectedIndex()))
		{
			GetPlayerOwner().PlaySoundInfo(0, SoundSelectInfo);
			ActiveIndex = GetSelectedIndex();
		}
	}
	return;
}

function SetActiveIndex(int Idx)
{
	ActiveIndex = Idx;
	return;
}

function int GetActiveIndex()
{
	return ActiveIndex;
	return;
}

defaultproperties
{
	GoldColor=(B=36,G=1,R=252,A=37)
	SoundSelectInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=/* Array type was not detected. */,Y=/* Unknown default property type! */,VolumePrefab=0,Slots=/* Array type was not detected. */,Y=/* Unknown default property type! */,Volume=0.3,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
}
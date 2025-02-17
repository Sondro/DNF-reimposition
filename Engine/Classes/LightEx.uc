/*******************************************************************************
 * LightEx generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class LightEx extends RenderActor
	native
	collapsecategories
	notplaceable
	hidecategories(Collision,Filter,HeatVision,Interactivity,Karma,KarmaObject,KarmaOverride,Networking,SpawnOnDestroyed);

cpptext
{
// Stripped
}

enum ELightFlickerString
{
	FLICKERSTR_None,
	FLICKERSTR_String1,
	FLICKERSTR_String2,
	FLICKERSTR_String3,
	FLICKERSTR_String4
};

enum EFogType
{
	FOG_None,
	FOG_Volume,
	FOG_Height
};

enum EFogMode
{
	FMODE_Normal,
	FMODE_Add
};

enum EAttenMode
{
	ATTEN_Radial,
	ATTEN_Box
};

enum ELightTagStyle
{
	LIGHTTAG_NoRespect,
	LIGHTTAG_NoRespectByUser,
	LIGHTTAG_Respectful
};

enum ELightFlickerType
{
	FLICKER_HighRange,
	FLICKER_LowRange,
	FLICKER_FullRange,
	FLICKER_Static
};

var() noexport Object.ELightExStyle LightStyle "Style of the light (blinking, string, etc)";
var() noexport float LightRadius "The radius of the light, in world units.";
var() noexport float LightIntensity "Color multiplier.";
var() noexport edfindable Vector LightRadius3D "The 3d radius of the light, in world units.";
var() noexport edfindable Color LightColor "The color of the light.";
var() noexport deprecated name LightShadowSourceTag "Throw shadows as if they were coming from the actor with this tag (when changed will force LightShadowSource to update).";
var() noexport deprecated Actor LightShadowSource "Throw shadows as if they were coming from this actor.";
var() noexport bool bRelativeShadowSource "If true, the shadow source will be fixed relative to each shadow casting actor, in the same way it is relative to the light.";
var Vector LightLastShadowCastLocation;
var Object.ELightExStyle LightStyleSave;
var() noexport float ShadowOpacity "How dark/transparent the shadows are.  A cheap way to fake ambient lighting.";
var(SpotLight) noexport bool bSpotLight "When true, light will only cast in the direction that this actor is rotated.";
var(SpotLight) noexport bool bLightShaft "When true, a volumetric light shaft will be attached to this actor.";
var(SpotLight) noexport bool bLightShaftShadows "When true, the volumentric light shaft will have shadows.  Ignored if bLightShaft is false.";
var(SpotLight) bool bUseCookieTexture;
var() noexport Cubemap LightCubeMap "Cubemap used to filter the light when bSpotlight is false.";
var() bool bUseSpecularCubemap;
var() noexport Cubemap SpecularCubeMap "Cubemap that is used to filter specular light.";
var() Vector SpecularCubeIntensity;
var() Vector LightCubeScale;
var(SpotLight) noexport float LightFOV "The angle of the penumbra of the spotlight.";
var(SpotLight) noexport float LightAspectW "Scale FOV along the width.";
var(SpotLight) noexport float LightAspectH "Scale FOV along the height.";
var(SpotLight) noexport Texture SpotLightTexture "Texture to used to filter the light when bSpotLight is set to true.";
var(SpotLight) noexport Texture LightShaftTexture "Texture to project volumetrically within the light shaft.  Will use SpotLightTexture if this is not set.  Ignored if bLightShaft is false.";
var(SpotLight) noexport Texture CookieTexture "Texture to used to filter the lightshaft texture with.  Will use SpotLightTexture if this is not set. Ignored if bUseCookieTexture is false.";
var(SpotLight) noexport float LightShaftStart "Distance from the light actor that the light shaft will start.  Ignored if bLightShaft is false.";
var(SpotLight) noexport float LightShaftEndScale "Percentage of the LightRadius that defines the end of the light shaft.  Ignored if bLightShaft is false.";
var(SpotLight) noexport float LightShaftBrightness "Light shaft brightness.  Ignored if bLightShaft is false.";
var(SpotLight) noexport int MaxLightShaftSlices "Maximum number of slices to use for the light shaft.  Ignored if bLightShaft is false.";
var(SpotLight) noexport float SliceSpacing "Distance between light shaft slices.  Ignored if bLightShaft is false.";
var(SpotLight) noexport float ShaftEdgeFadeDist "Distance from edges at which light shafts will smoothly fade in.";
var(SpotLight) float ShaftPanXSpeed;
var(SpotLight) float ShaftPanYSpeed;
var() LightEx.EAttenMode AttenuationMode;
var() Texture AttenuationMap;
var() LightEx.EFogType FogType;
var() LightEx.EFogMode FogMode;
var() float FogDist;
var() float FogHeight;
var() noexport float DirShadowMapDist "Distance directional shadows from this light will cast.";
var() noexport bool bCastStencilShadows "If true, this light is allowed to cast stencil shadows.";
var() noexport bool bStaticShadows "Only cast shadows from static actors.";
var() noexport bool bDecalLight "If true, light will be forced to draw in 2d decal mode. Useful for large outdoor lights.";
var() noexport bool bAmbientLight "If true, light will ignore normal visibility rules.";
var() noexport bool bDirectionalLight "If true, light will cast shadows and light from a direction, rather than a point.";
var() noexport bool bSkipVisibilityUpdate "If true, light will not do any attachment, cannot cast shadows, and will not light translucent objects.  Deferred renderer only!  bAlwaysVisble must be true for it to render, unless visibility can be tied to another Actor.";
var() byte LightPeriod;
var() byte LightPhase;
var() noexport string LightString "Light string to use when LSTYLE_String is set. a=0, z=26";
var() string LightStringRed;
var() string LightStringGreen;
var() string LightStringBlue;
var() bool bLightStringLoop;
var() noexport float fFlickerMinBrightness "Minimum brightness when flickering.  This scales the color, so the valid range is 0 to 1.";
var() noexport float fFlickerMaxBrightness "Maximum brightness when flickering.  This scales the color, so the valid range is 0 to 1.";
var() noexport float fFlickerStaticMinTime "Minimum time a flickering light will stay in a static state.";
var() noexport float fFlickerStaticMaxTime "Minimum time a flickering light will stay in a static state.";
var() noexport LightEx.ELightTagStyle RespectLightingTags "If this is false, than any actor with a LightTag or ShadowTag property will be ignored and the light will attached to it anyways.";
var() LightEx.ELightFlickerString LightFlickerString;
var(LightEx_Sound) noexport name LightAmbientSoundName "VoicePack entry to use as AmbientSound for this light.  Volume will fluctuate with the color of the light.";
var(LightEx_Sound) noexport float LightAmbientSoundMinScale "Amount to scale volume by when light is at zero brightness.";
var(LightEx_Sound) noexport float LightAmbientSoundMaxScale "Amount to scale volume by when light is at full brightness.";
var const transient int InternalData;
var string LightScaleString;
var float LightStringStartTime;
var float LightScaleStringStartTime;
var transient float fNextFlickerTime;
var transient float fLastBrightness;
var transient float fFlickerTypeChangeTime;
var transient float fCurFlickerScale;
var transient float fLastFlickerScale;
var transient float fFlickerInterval;
var Vector FinalColorScale;
var Texture SlaveSprite;
var LightEx.ELightFlickerType LightFlickerType;

replication
{
	// Pos:0x000
	reliable if(__NFUN_148__(__NFUN_148__(__NFUN_173__(int(Role), int(ROLE_Authority)), bNetInitial), __NFUN_145__(bStatic)))
		AttenuationMap, AttenuationMode, 
		FogDist, FogHeight, 
		FogMode, FogType, 
		LightCubeMap, LightCubeScale, 
		LightPeriod, LightPhase, 
		LightShadowSource, LightShadowSourceTag, 
		LightString, LightStringBlue, 
		LightStringGreen, LightStringRed, 
		bCastStencilShadows, bLightStringLoop, 
		bSpotLight, fFlickerMaxBrightness, 
		fFlickerMinBrightness, fFlickerStaticMaxTime, 
		fFlickerStaticMinTime;

	// Pos:0x023
	reliable if(__NFUN_148__(__NFUN_173__(int(Role), int(ROLE_Authority)), __NFUN_145__(bStatic)))
		LightColor, LightFlickerString, 
		LightIntensity, LightRadius, 
		LightRadius3D, LightStyle;
}

// Export ULightEx::execMarkDirty(FFrame&, void* const)
native(1089) simulated function MarkDirty();

// Export ULightEx::execGetCurrentColor(FFrame&, void* const)
native(1090) simulated function Vector GetCurrentColor();

simulated function PostNetInitial()
{
	MarkDirty();
	LightStringStartTime = Level.GameTimeSeconds;
	LightScaleStringStartTime = Level.GameTimeSeconds;
	// End:0x52
	if(__NFUN_339__(LightShadowSource, none))
	{
		LightShadowSource = FindActor(class'Actor', LightShadowSourceTag);
	}
	// End:0x6D
	if(__NFUN_342__(LightAmbientSoundName, 'None'))
	{
		FindAndPlaySound(LightAmbientSoundName);
	}
	return;
}

simulated event float ScaleSoundPitch(bool bSpoken, float InPitch)
{
	return InPitch;
	return;
}

simulated event float ScaleSoundVolume(bool bSpoken, float InVolume)
{
	local Vector CurrentColor;
	local float X, Y, Z, Brightness, Div;

	// End:0x21E
	if(__NFUN_342__(LightAmbientSoundName, 'None'))
	{
		switch(LightStyle)
		{
			// End:0x23
			case 0:
				return 0;
			// End:0x2E
			case 1:
				return InVolume;
			// End:0xD7
			case 7:
				CurrentColor = GetCurrentColor();
				// End:0x5C
				if(__NFUN_201__(CurrentColor.X, float(0)))
				{
					__NFUN_209__(Div, 1);
				}
				// End:0x79
				if(__NFUN_201__(CurrentColor.Y, float(0)))
				{
					__NFUN_209__(Div, 1);
				}
				// End:0x96
				if(__NFUN_201__(CurrentColor.Z, float(0)))
				{
					__NFUN_209__(Div, 1);
				}
				// End:0xD4
				if(__NFUN_201__(Div, 0))
				{
					Brightness = __NFUN_196__(__NFUN_198__(__NFUN_198__(CurrentColor.X, CurrentColor.Y), CurrentColor.Z), Div);
				}
				// End:0x1F4
				break;
			// End:0xDC
			case 2:
			// End:0xE1
			case 3:
			// End:0xE6
			case 4:
			// End:0xEB
			case 5:
			// End:0x1F1
			case 6:
				CurrentColor = GetCurrentColor();
				// End:0x13D
				if(__NFUN_170__(int(LightColor.R), 0))
				{
					__NFUN_209__(Div, 1);
					X = __NFUN_196__(__NFUN_195__(255, CurrentColor.X), float(LightColor.R));
				}
				// End:0x17E
				if(__NFUN_170__(int(LightColor.G), 0))
				{
					__NFUN_209__(Div, 1);
					Y = __NFUN_196__(__NFUN_195__(255, CurrentColor.Y), float(LightColor.G));
				}
				// End:0x1BF
				if(__NFUN_170__(int(LightColor.B), 0))
				{
					__NFUN_209__(Div, 1);
					Z = __NFUN_196__(__NFUN_195__(255, CurrentColor.Z), float(LightColor.B));
				}
				// End:0x1EE
				if(__NFUN_201__(Div, 0))
				{
					Brightness = __NFUN_196__(__NFUN_198__(__NFUN_198__(X, Y), Z), Div);
				}
				// End:0x1F4
				break;
			// End:0xFFFF
			default:
				break;
		}
		__NFUN_207__(InVolume, __NFUN_228__(Brightness, LightAmbientSoundMinScale, LightAmbientSoundMaxScale));
		return __NFUN_227__(InVolume, 0, 1);
	}
	return super(Actor).ScaleSoundVolume(bSpoken, InVolume);
	return;
}

defaultproperties
{
	LightStyle=1
	LightRadius=450
	LightIntensity=2
	LightRadius3D=(X=1.293258E-41,Y=3.084513E-17,Z=1)
	LightColor=(B=6,G=1,R=255,A=7)
	ShadowOpacity=1
	bUseCookieTexture=true
	SpecularCubeIntensity=(X=1.293258E-41,Y=3.084555E-17,Z=2)
	LightCubeScale=(X=1.293258E-41,Y=3.084513E-17,Z=1)
	LightFOV=60
	LightAspectW=1
	LightAspectH=1
	SpotLightTexture=Texture'S_SpotLight'
	LightShaftTexture=Texture'S_LightShaftSmoke'
	LightShaftStart=10
	LightShaftEndScale=0.75
	LightShaftBrightness=2
	MaxLightShaftSlices=32
	SliceSpacing=4
	ShaftPanXSpeed=0.2
	ShaftPanYSpeed=0.1
	AttenuationMap=Texture'Default_AttenuationMap'
	FogDist=600
	FogHeight=500
	DirShadowMapDist=2048
	bCastStencilShadows=true
	LightPeriod=10
	bLightStringLoop=true
	fFlickerMaxBrightness=1
	fFlickerStaticMinTime=0.1
	fFlickerStaticMaxTime=0.75
	LightAmbientSoundMaxScale=1
	FinalColorScale=(X=1.293258E-41,Y=3.084513E-17,Z=1)
	SlaveSprite=Texture'S_SlaveLight'
	LightFlickerType=3
	bCollisionAssumeValid=true
	bHidden=true
	bIsLightEx=true
	bNoNativeTick=true
	bUpdateMountParentRenderTime=true
	bAcceptsProjectors=false
	bAcceptsDecalProjectors=false
	bAlwaysRelevant=true
	TickStyle=0
	Sprite=Texture'S_Light'
	Texture=Texture'S_Light'
	VoicePack='SoundConfig.Effects.VoicePack_Lights'
}
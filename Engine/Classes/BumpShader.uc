/*******************************************************************************
 * BumpShader generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class BumpShader extends RenderedMaterial
	native
	hidecategories(Object);

cpptext
{
// Stripped
}

var() MaterialEx DiffuseMap;
var() MaterialEx EmissiveMap;
var() Texture ParallaxMap;
var() float ParallaxScale;
var() MaterialEx NormalMap;
var() Texture HeightMap;
var() float BumpScale;
var() int NumSmoothPasses;
var() bool bInvertBumps;
var() int DiffuseStream;
var() int NormalMapStream;
var() int EmissiveStream;
var() Texture SpecularMap;
var() float SpecularScale;
var() Color EmissiveBloomTint;
var() float RT_SpecularExp;
var() float RT_SpecularScale;
var() BumpShader DetailBumpShader;
var() MaterialEx DetailAlpha;
var() float DetailScaleX;
var() float DetailScaleY;
var() float DetailShiftX;
var() float DetailShiftY;
var(RimLight) noexport bool bRimLightEnabled "If true, a fake rim light effect will be applied to the geometry.";
var(RimLight) noexport bool bRimLightUseAlpha "If true, rim light effect will be multipled by final diffuse alpha.";
var(RimLight) noexport MaterialEx RimLightAlphaMap "Used in place of the final diffuse alpha if not None when bRimLightUseAlpha is true.";
var(RimLight) noexport MaterialEx RimLightColorMap "Optional color map to modulate with RimLightColor.";
var(RimLight) noexport Color RimLightColor "Color of rim light effect.";
var(RimLight) noexport float RimLightIntensity "Rim light intensity scale.";
var(RimLight) noexport float RimLightPower "Exponential power of rim light.  Bigger numbers means tighter effect.";
var(RimLight) noexport float RimLightFalloff "Exponential falloff of rim light effect.  Bigger numbers mean faster, more abrupt falloff.";

simulated function class<Material> GetCurrentMaterial()
{
	// End:0x12
	if(__NFUN_340__(MaterialClass, none))
	{
		return MaterialClass;
	}
	// End:0x2F
	if(__NFUN_340__(DiffuseMap, none))
	{
		return DiffuseMap.GetCurrentMaterial();
	}
	return super(MaterialEx).GetCurrentMaterial();
	return;
}

defaultproperties
{
	ParallaxScale=0.06
	BumpScale=1
	SpecularScale=1
	EmissiveBloomTint=(B=6,G=1,R=255,A=7)
	RT_SpecularScale=1
	DetailScaleX=0.1
	DetailScaleY=0.1
	RimLightColor=(B=6,G=1,R=255,A=7)
	RimLightIntensity=1
	RimLightPower=3
	RimLightFalloff=2
	bBumpShader=true
}
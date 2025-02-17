/*******************************************************************************
 * Texture generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Texture extends Bitmap
	native
	noexport
	safereplace
	hidecategories(Object);

enum ECompressionMode
{
	COMP_None,
	COMP_Auto,
	COMP_DXT1,
	COMP_DXT3,
	COMP_DXT5
};

enum ELODSet
{
	LODSET_None,
	LODSET_World,
	LODSET_Effects,
	LODSET_Characters,
	LODSET_Weapons,
	LODSET_Vehicles,
	LODSET_Sky,
	LODSET_Terrain,
	LODSET_UI
};

var(BumpShaderProxy) Texture BumpMap;
var(BumpShaderProxy) Texture SpecularMap;
var(BumpShaderProxy) Texture EmissiveMap;
var(BumpShaderProxy) Texture NormalMap;
var(BumpShaderProxy) float SpecularScale;
var(BumpShaderProxy) float BumpScale;
var(BumpShaderProxy) int BumpSmoothPasses;
var(BumpShaderProxy) float RT_SpecularExp;
var bool bInvisible;
var(Surface) bool bMasked;
var(Surface) bool bTransparent;
var bool bNotSolid;
var bool bEnvironment;
var bool bSemisolid;
var(Surface) bool bModulate;
var(Surface) bool bFakeBackdrop;
var(Surface) bool bTwoSided;
var bool bAutoUPan;
var bool bAutoVPan;
var bool bNoSmooth;
var bool bBigWavy;
var bool bSmallWavy;
var bool bWaterWavy;
var bool bLowShadowDetail;
var bool bNoMerge;
var bool bCloudWavy;
var bool bDirtyShadows;
var bool bHighLedge;
var bool bSpecialLit;
var bool bGouraud;
var(Surface) bool bUnlit;
var bool bHighShadowDetail;
var bool bPortal;
var bool bMirrored;
var bool PolyFlags27;
var bool PolyFlags28;
var bool PolyFlags29;
var bool PolyFlags30;
var bool PolyFlags31;
var bool PolyFlags32;
var(BumpShaderProxy) bool bInvertBumps;
var(Quality) private bool bHighColorQuality;
var(Quality) private bool bHighTextureQuality;
var private bool bRealtime;
var private bool bParametric;
var private transient bool bRealtimeChanged;
var private bool bHasComp;
var bool bDynamic;
var(Surface) bool bNoCutdown;
var(Quality) Texture.ELODSet LODSet;
var(Quality) noexport byte XboxLODBiasAdjust "# of mips to drop when cooking for 360.  A value of 255 will eliminate this texture entirely from 360 content.";
var(Quality) noexport byte PS3LODBiasAdjust "# of mips to drop when cooking for PS3.  A value of 255 will eliminate this texture entirely from PS3 content.";
var(Animation) Texture AnimNext;
var(Animation) transient Texture AnimCurrent;
var(Animation) byte PrimeCount;
var transient byte PrimeCurrent;
var(Animation) float MinFrameRate;
var(Animation) float MaxFrameRate;
var transient float Accumulator;
var native const array<int> Mips;
var native const array<int> CompMips;
var const Bitmap.ETextureFormat CompFormat;
var(Surface) bool bAlphaMap;
var bool bClip;
var bool bDepthFog;
var bool bFlatShade;
var(Surface) bool bLightenModulate;
var(Surface) bool bDarkenModulate;
var(Surface) bool bTranslucent2;
var bool PolyFlagsEx8;
var bool PolyFlagsEx9;
var bool PolyFlagsEx10;
var bool PolyFlagsEx11;
var bool PolyFlagsEx12;
var bool PolyFlagsEx13;
var bool PolyFlagsEx14;
var bool PolyFlagsEx15;
var bool PolyFlagsEx16;
var bool PolyFlagsEx17;
var bool PolyFlagsEx18;
var bool PolyFlagsEx19;
var bool PolyFlagsEx20;
var bool PolyFlagsEx21;
var bool PolyFlagsEx22;
var bool PolyFlagsEx23;
var bool PolyFlagsEx24;
var bool PolyFlagsEx25;
var bool PolyFlagsEx26;
var bool PolyFlagsEx27;
var bool PolyFlagsEx28;
var bool PolyFlagsEx29;
var bool PolyFlagsEx30;
var bool PolyFlagsEx31;
var bool PolyFlagsEx32;
var() Texture.ECompressionMode CompressionMode;
var int CRC;
var const transient int TextureAnimController;
var const transient int RenderInterface;
var const transient int CompressedInterface;

// Export UTexture::execCollisionCheck(FFrame&, void* const)
native(1194) final function bool CollisionCheck(int X, int Y, Texture Other, int oX, int oY)
{
	//native.X;
	//native.Y;
	//native.Other;
	//native.oX;
	//native.oY;	
}

// Export UTexture::execGetPixel(FFrame&, void* const)
native(1195) final function byte GetPixel(int X, int Y)
{
	//native.X;
	//native.Y;	
}

// Export UTexture::execLoadTexture(FFrame&, void* const)
native(1196) final function LoadTexture(int firstMip)
{
	//native.firstMip;	
}

// Export UTexture::execUnloadTexture(FFrame&, void* const)
native(1197) final function UnloadTexture();

defaultproperties
{
	SpecularScale=1
	BumpScale=1
	LODSet=1
	CompressionMode=1
	bTexture=true
}
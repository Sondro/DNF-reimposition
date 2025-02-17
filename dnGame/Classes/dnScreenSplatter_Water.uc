/*******************************************************************************
 * dnScreenSplatter_Water generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnScreenSplatter_Water extends dnScreenSplatters;

defaultproperties
{
	bIgnoreLimit=true
	EffectRadius=128
	EffectViewAngleFull=0
	EffectViewAngleNone=0
	SpawnCount=1
	Lifetime=2.5
	LifetimeVariance=0
	UnderwaterTimescale=6400
	bFullScreen=true
	bInverse=false
	Textures(0)='DukeMultiPlayer'
	Textures(1)='dt_Effects3.HUDEffects.HudEffect_WaterExit_FB'
	Textures(2)=ObjectProperty'dnCTBHUD.droppedWarning'
	Y=1
	ScaleXRampMid=1
	bUseScaleYRamp=false
	ScaleYMid=4
	ScaleYEnd=1
	ScaleYRampMid=2
	RotationInitialVariance=0
	LocationInitial=(X=1.292418E-41,Y=2.94903E-17,Z=0)
	LocationInitialVariance=(X=1.292418E-41,Y=2.94903E-17,Z=0)
	VelocityInitial=(X=1.292418E-41,Y=2.94903E-17,Z=0)
	AccelerationInitial=(X=1.292418E-41,Y=2.94903E-17,Z=75)
	AccelerationInitialVariance=(X=1.292418E-41,Y=2.94903E-17,Z=25)
}
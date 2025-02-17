/*******************************************************************************
 * ParticleSystemTimer_Sparks_Small generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ParticleSystemTimer_Sparks_Small extends ParticleSystemTimer_Sparks_Large
	collapsecategories
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Actor,Collision,Display,HeatVision,Interpolation,Material,Tick,TickTules,ParticleSystemTimer_Display,ParticleSystemTimer_Sound);

defaultproperties
{
	ParticleSystemClass='p_environment.Sparks.SparksSmall_Main'
	SoundName=Spark_Sm
	DamageRadius=16
	DamagePerTimeUnit=2
}
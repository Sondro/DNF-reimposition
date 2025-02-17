/*******************************************************************************
 * ParticleSystemTimer_Steam generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ParticleSystemTimer_Steam extends ParticleSystemTimer
	collapsecategories
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Actor,Collision,Display,HeatVision,Interpolation,Material,Tick,TickTules,ParticleSystemTimer_Display,ParticleSystemTimer_Sound);

defaultproperties
{
	ParticleSystemClass='p_environment.Damaging.hazardoussteam_Main'
	bEffectActive=true
	Delay=2
	DelayVariance=0.75
	Duration=3
	DurationVariance=0.5
	SoundName=Steam
	SoundFadeOutTime=0.75
	DamageRadius=64
	DamagePerTimeUnit=1
	DamageTimeInterval=0.1
	DamageTypeDealt='Engine.SteamDamage'
}
/*******************************************************************************
 * ProximityBeamSystem generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ProximityBeamSystem extends BeamSystem
	collapsecategories
	hidecategories(Filter,HeatVision,Interactivity,Karma,KarmaObject,KarmaOverride,Lighting,Networking,ParticleSystemBase,ParticleTextureInfo,SoftParticleSystem,Sound,SpawnOnDestroyed);

var array<ProximityBeamAnchor> BeamAnchors;
var float EffectStartDistance;
var float UpdateTime;
var bool bStopUpdate;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	__NFUN_607__(UpdateTime, true, 'UpdateAnchors');
	return;
}

simulated function SetBeamAnchors(array<ProximityBeamAnchor> ba, float esd)
{
	__NFUN_355__(__NFUN_302__("setting beam anchors ", string(string(BeamAnchors))));
	BeamAnchors = ba;
	EffectStartDistance = esd;
	return;
}

simulated function UpdateAnchors()
{
	local int ii, countConnected;
	local float DistSq, minDistSq;
	local ProximityBeamAnchor ClosestBa;

	// End:0x0B
	if(bStopUpdate)
	{
		return;
	}
	EmptyControlPoints();
	minDistSq = __NFUN_195__(300, float(300));
	J0x22:

	// End:0xBF [Loop If]
	if(__NFUN_169__(ii, string(BeamAnchors)))
	{
		DistSq = __NFUN_252__(__NFUN_239__(Owner.Location, BeamAnchors[ii].Location));
		// End:0xB5
		if(__NFUN_173__(int(DukeMultiPlayer(Owner).PostureStateEx), int(8)))
		{
			// End:0xB5
			if(__NFUN_200__(DistSq, __NFUN_195__(EffectStartDistance, EffectStartDistance)))
			{
				__NFUN_184__(countConnected);
				AddSegmentActor(none, BeamAnchors[ii], __NFUN_195__(__NFUN_222__(), UpdateTime));
			}
		}
		__NFUN_184__(ii);
		// [Loop Continue]
		goto J0x22;
	}
	return;
}

defaultproperties
{
	UpdateTime=0.3
	BeamStartWidth=3
	BeamEndWidth=3
	AlphaAnimStart=0.05
	AlphaAnimMid=0.25
	AlphaAnimEnd=0.15
	ColorAnimStart=(B=121,G=2,R=1,A=228)
	ColorAnimMid=(B=121,G=2,R=1,A=228)
	MaxAmplitude=32
	MaxFrequency=5E-05
	BeamTexture='dt_Effects2.Beams.Lightning_01_Comb'
	BeamTextureRotate=90
	bBeamOnlyCheckDynamicShootable=true
	bBeamOnlyCheckPawns=true
	BeamBrokenWhen=1
	BeamBrokenAction=2
	Event='
	Style=6
}
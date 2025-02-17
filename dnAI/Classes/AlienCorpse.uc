/*******************************************************************************
 * AlienCorpse generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AlienCorpse extends AICorpse;

var float FadeDelay;
var bool bFading;
var float TimeToFade;
var Color EndColor;
var Color StartColor;
var bool bActorColorFade;
var name ActorColorToFade;

function bool CreateAnimatedCorpse(InteractiveActor aOther)
{
	local bool bRet;

	bRet = super(CorpseBase).CreateAnimatedCorpse(aOther);
	// End:0x4F
	if(__NFUN_342__(ActorColorToFade, 'None'))
	{
		StartColor = __NFUN_603__(ActorColorToFade);
		// End:0x4F
		if(bActorColorFade)
		{
			TickStyle = 3;
			__NFUN_605__(FadeDelay, false, 'StartFading');
		}
	}
	return;
}

function StartFading()
{
	bFading = true;
	return;
}

event Tick(float DeltaSeconds)
{
	local Color MyColor;
	local float PCT;

	super(CorpseBase).Tick(DeltaSeconds);
	// End:0x29
	if(__NFUN_150__(__NFUN_145__(bFading), __NFUN_202__(TimeToFade, 0)))
	{
		return;
	}
	TimeToFade = __NFUN_225__(__NFUN_199__(TimeToFade, DeltaSeconds), 0);
	PCT = __NFUN_196__(TimeToFade, default.TimeToFade);
	MyColor.R = byte(__NFUN_229__(PCT, float(EndColor.R), float(StartColor.R)));
	MyColor.G = byte(__NFUN_229__(PCT, float(EndColor.G), float(StartColor.G)));
	MyColor.B = byte(__NFUN_229__(PCT, float(EndColor.B), float(StartColor.B)));
	MyColor.A = byte(__NFUN_229__(PCT, float(EndColor.A), float(StartColor.A)));
	__NFUN_601__(ActorColorToFade, MyColor);
	// End:0x11F
	if(__NFUN_202__(TimeToFade, 0))
	{
		TickStyle = default.TickStyle;
	}
	return;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
	super(Actor).Trigger(Other, EventInstigator);
	TimeToFade = default.TimeToFade;
	TickStyle = 3;
	return;
}

/*******************************************************************************
 * dnRadio generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnRadio extends Actor
	collapsecategories
	notplaceable
	dependson(dnRadioTower);

var() noexport float InitialFrequency "Initial station.";
var() noexport float ChangeChannelTime "Amount of time it takes to switch stations.  Radio will play static during this time.";
var float CurrFreq;
var dnRadioTower RadioTower;

event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x1A
	foreach __NFUN_747__(class'dnRadioTower', RadioTower)
	{
		// End:0x1A
		break;		
	}	
	// End:0x41
	if(__NFUN_339__(RadioTower, none))
	{
		RadioTower = __NFUN_615__(class'dnRadioTower');
		__NFUN_354__(__NFUN_340__(RadioTower, none));
	}
	// End:0x66
	if(__NFUN_145__(RadioTower.bInitialized))
	{
		RadioTower.InitializeTower();
	}
	HandleInitialStation(InitialFrequency);
	return;
}

final function InitializeFrom(Actor Other)
{
	__NFUN_354__(__NFUN_340__(Other, none));
	AmbientMusicInnerRadius = Other.AmbientMusicInnerRadius;
	AmbientMusicRadius = Other.AmbientMusicRadius;
	AmbientMusicVolume = Other.AmbientMusicVolume;
	SoundNoOcclude = Other.SoundNoOcclude;
	SoundNoDoppler = Other.SoundNoDoppler;
	SoundOcclusionScale = Other.SoundOcclusionScale;
	SoundRadius = Other.SoundRadius;
	SoundInnerRadius = Other.SoundInnerRadius;
	SoundVolume = Other.SoundVolume;
	SoundPitch = Other.SoundPitch;
	return;
}

final function HandleInitialStation(float Frequency)
{
	__NFUN_354__(__NFUN_340__(RadioTower, none));
	// End:0x39
	if(__NFUN_204__(Frequency, 0))
	{
		CurrFreq = RadioTower.SeekNextStation(0);		
	}
	else
	{
		CurrFreq = Frequency;
	}
	HandleNewStation();
	return;
}

final function TuneNextStation()
{
	__NFUN_354__(__NFUN_340__(RadioTower, none));
	CurrFreq = RadioTower.SeekNextStation(CurrFreq);
	HandleNewStation();
	return;
}

final function TunePrevStation()
{
	__NFUN_354__(__NFUN_340__(RadioTower, none));
	CurrFreq = RadioTower.SeekPrevStation(CurrFreq);
	HandleNewStation();
	return;
}

final function HandleNewStation()
{
	// End:0x18
	if(__NFUN_204__(CurrFreq, 0))
	{
		TurnOff();		
	}
	else
	{
		// End:0x30
		if(__NFUN_201__(ChangeChannelTime, 0))
		{
			PreTuneStation();			
		}
		else
		{
			TuneStation();
		}
	}
	return;
}

final function PreTuneStation()
{
	__NFUN_354__(__NFUN_340__(RadioTower, none));
	RadioTower.UntuneStation(self);
	__NFUN_607__(ChangeChannelTime, false, 'TuneStation');
	return;
}

final function TuneStation()
{
	local float ReTuneTime;

	__NFUN_354__(__NFUN_206__(CurrFreq, 0));
	__NFUN_354__(__NFUN_340__(RadioTower, none));
	ReTuneTime = RadioTower.TuneStationByFrequency(self, CurrFreq);
	// End:0x5A
	if(__NFUN_204__(ReTuneTime, -1))
	{
		CurrFreq = 0;
		TurnOff();		
	}
	else
	{
		// End:0x74
		if(__NFUN_204__(ReTuneTime, 0))
		{
			ReTuneTime = 0.001;
		}
		__NFUN_607__(ReTuneTime, false, 'TuneStation');
	}
	return;
}

final function TurnOff()
{
	__NFUN_354__(__NFUN_340__(RadioTower, none));
	__NFUN_702__("");
	CurrFreq = 0;
	__NFUN_608__('TuneStation');
	return;
}

final function string GetStationName()
{
	__NFUN_354__(__NFUN_340__(RadioTower, none));
	return RadioTower.super(dnRadio).GetStationName(CurrFreq);
	return;
}

defaultproperties
{
	ChangeChannelTime=0.4
	bHidden=true
	bNoNativeTick=true
	TickStyle=0
	AmbientMusicVolume=0.75
	AmbientMusicEarlyEndTime=0
	AmbientMusicInnerRadius=256
	AmbientMusicRadius=512
	AmbientMusicCrossfadeTime=0
}
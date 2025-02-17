/*******************************************************************************
 * TriggerDialog generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerDialog extends TriggerSound
	collapsecategories
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking);

var() bool bAllowUnderwater;
var() localized string DialogText;

event Trigger(Actor Other, Pawn EventInstigator)
{
	local PlayerPawn Player;
	local Pawn PlaySoundPawn;
	local float SubtitleTime;

	Player = Level.__NFUN_1161__();
	UpdatePlaySoundActor();
	// End:0x98
	if(PlaySoundActor.bIsPawn)
	{
		PlaySoundPawn = Pawn(PlaySoundActor);
		// End:0x54
		if(PlaySoundPawn.IsDead())
		{
			return;			
		}
		else
		{
			// End:0x98
			if(__NFUN_148__(__NFUN_148__(__NFUN_145__(bAllowUnderwater), __NFUN_340__(PlaySoundPawn.HeadVolume, none)), PlaySoundPawn.HeadVolume.bWaterVolume))
			{
				return;
			}
		}
	}
	PlaySoundActor.__NFUN_695__(PlaySlot);
	super.Trigger(Other, EventInstigator);
	SubtitleTime = __NFUN_196__(TimeUntilSoundEnd, SoundInfo.Pitch);
	// End:0x11E
	if(__NFUN_202__(SubtitleTime, 0))
	{
		SubtitleTime = Player.MyHUD.HUDMessages[Player.MyHUD.5].HoldTime;		
	}
	else
	{
		__NFUN_209__(SubtitleTime, 0.1);
	}
	// End:0x1E8
	if(__NFUN_309__(DialogText, ""))
	{
		Player.MyHUD.HUDMessages[Player.MyHUD.5].TargetAlpha = 1;
		Player.MyHUD.HUDMessages[Player.MyHUD.5].HoldTimer = SubtitleTime;
		Player.MyHUD.HUDMessages[Player.MyHUD.5].Message = DialogText;
	}
	return;
}

defaultproperties
{
	PlayNoOverride=true
	PlayAsDialog=true
	PlayNoReverb=true
	PlayEnableVis=true
	PlayVolume=1
	PlayRadius=2048
	PlayInnerRadius=192
	PlaySlot=5
	MixerGroupOverride=Voice
	SoundLocationOverride=1
}
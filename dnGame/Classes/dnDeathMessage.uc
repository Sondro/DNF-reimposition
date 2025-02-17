/*******************************************************************************
 * dnDeathMessage generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnDeathMessage extends LocalMessage
	collapsecategories
	hidecategories(movement,Collision,Lighting,LightColor);

var localized string KilledString;
var localized string KilledSelfMessage;
var localized string MaleGenderName;
var localized string FemaleGenderName;
var float MultiKillTime;

static function string GetString(optional int Switch, optional PlayerReplicationInfo KillerPRI, optional PlayerReplicationInfo VictimPRI, optional Object OptionalObject, optional Class OptionalClass)
{
	local string GenderName;

	switch(VictimPRI.Gender)
	{
		// End:0x25
		case 0:
			GenderName = default.MaleGenderName;
			// End:0x4E
			break;
		// End:0x38
		case 1:
			GenderName = default.FemaleGenderName;
			// End:0x4E
			break;
		// End:0x4B
		case 2:
			GenderName = default.MaleGenderName;
			// End:0x4E
			break;
		// End:0xFFFF
		default:
			break;
	}
	switch(Switch)
	{
		// End:0x11F
		case 0:
			// End:0x69
			if(__NFUN_339__(KillerPRI, none))
			{
				return "";
			}
			// End:0x83
			if(__NFUN_308__(KillerPRI.PlayerName, ""))
			{
				return "";
			}
			// End:0x92
			if(__NFUN_339__(VictimPRI, none))
			{
				return "";
			}
			// End:0xAC
			if(__NFUN_308__(VictimPRI.PlayerName, ""))
			{
				return "";
			}
			// End:0xC0
			if(__NFUN_339__(class<DamageType>(OptionalClass), none))
			{
				return "";
			}
			return class'GameInfo'.static.ParseKillMessage(KillerPRI.PlayerName, VictimPRI.PlayerName, class<DamageType>(OptionalClass).default.DamageName, class<DamageType>(OptionalClass).default.DeathMessage, GenderName);
			// End:0x1BF
			break;
		// End:0x1BC
		case 1:
			// End:0x132
			if(__NFUN_339__(VictimPRI, none))
			{
				return "";
			}
			// End:0x14C
			if(__NFUN_308__(VictimPRI.PlayerName, ""))
			{
				return "";
			}
			// End:0x160
			if(__NFUN_339__(class<DamageType>(OptionalClass), none))
			{
				return "";
			}
			return class'GameInfo'.static.ParseKillMessage(KillerPRI.PlayerName, VictimPRI.PlayerName, class<DamageType>(OptionalClass).default.DamageName, class<DamageType>(OptionalClass).default.SuicideDeathMessage, GenderName);
		// End:0xFFFF
		default:
			break;
	}
	return;
}

static function ClientReceive(PlayerPawn P, optional int Switch, optional PlayerReplicationInfo KillerPRI, optional PlayerReplicationInfo VictimPRI, optional Object OptionalObject, optional Class OptionalClass)
{
	local DukePlayer D;

	D = DukePlayer(P);
	// End:0x54
	if(__NFUN_340__(D.MyHUD, none))
	{
		D.MyHUD.AddDeathEvent(KillerPRI, VictimPRI, class<DamageType>(OptionalClass));
	}
	// End:0x116
	if(__NFUN_339__(VictimPRI, P.PlayerReplicationInfo))
	{
		// End:0x116
		if(__NFUN_148__(__NFUN_340__(KillerPRI, none), __NFUN_309__(KillerPRI.PlayerName, "")))
		{
			D.LastKilledByPlayerName = KillerPRI.PlayerName;
			D.LastKilledByPlayerIcon = KillerPRI.Icon;
			// End:0x104
			if(__NFUN_340__(OptionalClass, none))
			{
				D.LastKilledByDamageName = class<DamageType>(OptionalClass).default.DamageName;				
			}
			else
			{
				D.LastKilledByDamageName = "";
			}
		}
	}
	// End:0x239
	if(__NFUN_339__(KillerPRI, P.PlayerReplicationInfo))
	{
		// End:0x228
		if(__NFUN_148__(__NFUN_148__(__NFUN_340__(KillerPRI, VictimPRI), __NFUN_340__(VictimPRI, none)), __NFUN_145__(__NFUN_148__(P.GameReplicationInfo.bTeamGame, __NFUN_173__(int(KillerPRI.Team), int(VictimPRI.Team))))))
		{
			// End:0x1EB
			if(__NFUN_148__(__NFUN_200__(__NFUN_199__(P.Level.GameTimeSeconds, P.LastKillTime), default.MultiKillTime), __NFUN_174__(Switch, 1)))
			{
				__NFUN_184__(P.MultiKillLevel);				
			}
			else
			{
				P.MultiKillLevel = 0;
			}
			P.LastKillTime = P.Level.GameTimeSeconds;			
		}
		else
		{
			P.MultiKillLevel = 0;
		}
	}
	// End:0x2BD
	if(default.bIsConsoleMessage)
	{
		// End:0x2BD
		if(__NFUN_148__(__NFUN_340__(P.Player, none), __NFUN_340__(P.Player.Console, none)))
		{
			P.Player.Console.AddString(GetString(Switch, KillerPRI, VictimPRI, OptionalObject, OptionalClass));
		}
	}
	return;
}

defaultproperties
{
	KilledSelfMessage="<?int?dnGame.dnDeathMessage.KilledSelfMessage?>"
	MaleGenderName="<?int?dnGame.dnDeathMessage.MaleGenderName?>"
	FemaleGenderName="<?int?dnGame.dnDeathMessage.FemaleGenderName?>"
	MultiKillTime=4
	bIsConsoleMessage=true
}
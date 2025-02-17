/*******************************************************************************
 * dnFirstBloodMessage generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnFirstBloodMessage extends CriticalEventMessage
	collapsecategories
	hidecategories(movement,Collision,Lighting,LightColor);

var localized string FirstBloodString;
var Sound FirstBloodSound;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional Class OptionalClass)
{
	// End:0x0F
	if(__NFUN_339__(RelatedPRI_1, none))
	{
		return "";
	}
	// End:0x29
	if(__NFUN_308__(RelatedPRI_1.PlayerName, ""))
	{
		return "";
	}
	return __NFUN_303__(RelatedPRI_1.PlayerName, default.FirstBloodString);
	return;
}

static simulated function ClientReceive(PlayerPawn P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional Class OptionalClass)
{
	super(LocalMessage).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	// End:0x3B
	if(__NFUN_340__(RelatedPRI_1, P.PlayerReplicationInfo))
	{
		return;
	}
	P.__NFUN_697__(0, default.FirstBloodSound);
	return;
}

defaultproperties
{
	FirstBloodString="<?int?dnGame.dnFirstBloodMessage.FirstBloodString?>"
	bBeep=false
	DrawColor=(B=121,G=2,R=1,A=255)
	YPos=146
}
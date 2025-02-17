/*******************************************************************************
 * dnSpectatorSayMessage generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnSpectatorSayMessage extends LocalMessage
	collapsecategories
	hidecategories(movement,Collision,Lighting,LightColor);

static function string AssembleString(HUD MyHUD, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional string MessageString)
{
	// End:0x16
	if(RelatedPRI_1.bSquelch)
	{
		return "";
	}
	// End:0x25
	if(__NFUN_339__(RelatedPRI_1, none))
	{
		return "";
	}
	// End:0x3F
	if(__NFUN_308__(RelatedPRI_1.PlayerName, ""))
	{
		return "";
	}
	return __NFUN_303__(__NFUN_302__(RelatedPRI_1.PlayerName, " (SPECTATOR): "), MessageString);
	return;
}

static function float GetOffset(int Switch, float YL, float ClipY)
{
	return __NFUN_195__(__NFUN_196__(default.YPos, float(768)), ClipY);
	return;
}

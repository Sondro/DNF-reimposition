/*******************************************************************************
 * UDukeKickMessageBox generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeKickMessageBox extends UDukeSuperMessageBox;

function setPlayerName(string sName)
{
	local int i, nameLen;
	local string shortName;

	i = __NFUN_315__(MessageText, "<PlayerName>");
	// End:0x9F
	if(__NFUN_174__(i, -1))
	{
		shortName = sName;
		nameLen = __NFUN_314__(sName);
		// End:0x68
		if(__NFUN_170__(nameLen, 17))
		{
			shortName = __NFUN_302__(__NFUN_317__(sName, 17), "...");
		}
		MessageText = __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_317__(MessageText, i), __NFUN_321__(13)), shortName), __NFUN_316__(MessageText, __NFUN_165__(i, 12)));
	}
	return;
}

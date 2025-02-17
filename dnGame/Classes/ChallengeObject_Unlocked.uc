/*******************************************************************************
 * ChallengeObject_Unlocked generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ChallengeObject_Unlocked extends ChallengeObject;

function SetChallIdx(int Idx)
{
	local string strChallState;

	super.SetChallIdx(Idx);
	strChallState = ParseOption(__NFUN_320__(ExtraOptions), "default");
	switch(strChallState)
	{
		// End:0x44
		case "show":
			DefaultState = 3;
			// End:0x84
			break;
		// End:0x58
		case "hide":
			DefaultState = 2;
			// End:0x84
			break;
		// End:0x6B
		case "new":
			DefaultState = 1;
			// End:0x84
			break;
		// End:0x76
		case "locked":
		// End:0xFFFF
		default:
			DefaultState = 0;
			// End:0x84
			break;
			break;
	}
	return;
}

simulated event bool CheckChallenge(Info PlayerProgress)
{
	return true;
	return;
}

event Engine.Object.EChallengeStatus GetDefaultStatus()
{
	return DefaultState;
	return;
}

defaultproperties
{
	bHasDefaultStatus=true
}
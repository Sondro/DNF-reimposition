/*******************************************************************************
 * dnCaptureTheBabe_Single generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnCaptureTheBabe_Single extends dnCaptureTheBabe
	config(Multiplayer)
	collapsecategories
	hidecategories(movement,Collision,Lighting,LightColor);

function PostBeginPlay()
{
	super.PostBeginPlay();
	return;
}

defaultproperties
{
	GameName="<?int?dnGame.dnCaptureTheBabe_Single.GameName?>"
}
/*******************************************************************************
 * SkyZoneInfo generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SkyZoneInfo extends ZoneInfo
	native
	collapsecategories
	notplaceable
	hidecategories(Lighting,LightColor,Filter,Interactivity,Karma,Networking,Sound);

var(HDR) float UnlitHDRScale;

defaultproperties
{
	UnlitHDRScale=1
	bZonePhysicsCollision=false
	RemoteRole=2
}
/*******************************************************************************
 * GeoWaterBobPoint generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GeoWaterBobPoint extends InfoActor
	collapsecategories
	hidecategories(Collision,Filter,Interactivity,Karma,Lighting,Networking,Sound);

var float PrevZ;

final function Vector Sample(GeoWater Water)
{
	local float Height, move;
	local Vector Result;

	Height = Water.__NFUN_1116__(Location);
	move = __NFUN_199__(Height, PrevZ);
	Result = __NFUN_232__(Location.X, Location.Y, __NFUN_194__(__NFUN_198__(PrevZ, move)));
	PrevZ = __NFUN_198__(PrevZ, move);
	return Result;
	return;
}

defaultproperties
{
	bHidden=true
	Texture='dt_editor.Icons.GeoWaterBobPoint'
}
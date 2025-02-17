/*******************************************************************************
 * ScriptMethod_GotoAndPlaceTripMine generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_GotoAndPlaceTripMine extends ScriptMethod_GotoBase
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport deprecated name PlaceTargetActorTag "Tag of the actor to place mine on.";
var() noexport float RangeFromPlaceTarget "How far to stand away from the place target.";
var() noexport class<Weapon> TripMineClass "New tripmine class to select.";
var() noexport bool Run "Run or walk to the item?";

event string GetMethodString()
{
	return __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("GotoAndPlaceTripMine (", string(PlaceTargetActorTag)), ", "), string(RangeFromPlaceTarget)), ", "), string(TripMineClass)), ", "), string(Run)), ")");
	return;
}

defaultproperties
{
	RangeFromPlaceTarget=15
	TripMineClass='dnGame.TripMine'
	Latent=true
}
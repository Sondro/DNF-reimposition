/*******************************************************************************
 * ScriptMethod_PlayAmbientSound generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_PlayAmbientSound extends ScriptMethod
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport SAmbientSoundInfo MySoundInfo "SoundInfo to play.";
var() noexport bool ClearSound "If true, clear ambient sound, else play sound.";

event string GetMethodString()
{
	return "PlayAmbientSound (...)";
	return;
}

defaultproperties
{
	MySoundInfo=(bNoScale=false,MixerGroupOverride=None,AmbientSounds=/* Array type was not detected. */)
}
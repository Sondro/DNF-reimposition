/*******************************************************************************
 * DecoActivities_Sound generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DecoActivities_Sound extends DecoActivities
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport array<Engine.Object.ESoundSlot> SoundStopSlots "Slots to stop sound from currently playing on. Nothing happens if left as SLOT_None.";
var() noexport array<Engine.Object.EStopSoundRule> SoundStopRules "Rule to use for matching SoundStopSlot.";
var() noexport array<name> SoundNames "Array of VoicePack entries to play when this activity occurs.";
var() noexport SSoundInfo SoundNormal "Normal style sound to play when this activity occurs.";
var() noexport SAmbientSoundInfo SoundAmbient "Contains all the info for creating a new ambient sound.";
var() noexport bool bClearAmbientSound "Set to true to force the decoration to clear the ambient sound out (for when you want to stop playing an ambient noise.";

defaultproperties
{
	SoundNormal=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=/* Array type was not detected. */)
	SoundAmbient=(bNoScale=false,MixerGroupOverride=None,AmbientSounds=/* Array type was not detected. */)
}
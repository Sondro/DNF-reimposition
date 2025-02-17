/*******************************************************************************
 * DecoGlass_Case_FireExtinguisher generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DecoGlass_Case_FireExtinguisher extends dnBreakableGlass_DecoGlass
	collapsecategories;

var Actor TreasureBehind;

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	// End:0x43
	if(__NFUN_357__(DamageType, class'ExplosionDamage'))
	{
		TreasureBehind.TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	}
	super(InteractiveActor).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	return;
}

event Used(Actor Other, Pawn EventInstigator)
{
	super(dnBreakableGlass).Used(Other, EventInstigator);
	__NFUN_1080__(Location);
	__NFUN_1086__();
	return;
}

defaultproperties
{
	ParticleSize=3
	bRandomTextureRotation=false
	bAlignTextureOnBreak=false
	bStaticEdgePieces=false
	bForceUsePhrase=true
	bMimicOwner=false
	bPassUseToOwner=false
	DrawScale3D=(X=1.291717E-41,Y=2.802768E-17,Z=28)
	Skins=/* Array type was not detected. */
	Roll[1]=
/* Exception thrown while deserializing Roll
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.FillBuffer(Int32 numBytes)
   at System.IO.BinaryReader.ReadSingle()
   at UELib.UObjectStream.ReadFloat() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 672
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 486 */
}
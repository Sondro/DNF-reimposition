/*******************************************************************************
 * dnBombMessage generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnBombMessage extends CriticalEventMessage
	collapsecategories
	hidecategories(movement,Collision,Lighting,LightColor);

var localized string BombPlantedString;
var localized string BombDroppedString;
var localized string CantPlantBombString;
var localized string DroppedTheBombString;
var localized string PlantedTheBombString;
var localized string BombDetonatedMessage;
var localized string Detonate10SecondWarning;
var localized string CouldntPlantBombHere;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional Class OptionalClass)
{
	switch(Switch)
	{
		// End:0x3C
		case 0:
			// End:0x21
			if(__NFUN_339__(RelatedPRI_1, none))
			{
				return default.BombPlantedString;				
			}
			else
			{
				return __NFUN_303__(RelatedPRI_1.PlayerName, default.PlantedTheBombString);
			}
			// End:0xB1
			break;
		// End:0x49
		case 1:
			return default.CantPlantBombString;
			// End:0xB1
			break;
		// End:0x7E
		case 2:
			// End:0x63
			if(__NFUN_339__(RelatedPRI_1, none))
			{
				return default.BombDroppedString;				
			}
			else
			{
				return __NFUN_303__(RelatedPRI_1.PlayerName, default.DroppedTheBombString);
			}
			// End:0xB1
			break;
		// End:0x8C
		case 3:
			return default.BombDetonatedMessage;
			// End:0xB1
			break;
		// End:0x9A
		case 4:
			return default.Detonate10SecondWarning;
			// End:0xB1
			break;
		// End:0xA8
		case 5:
			return default.CouldntPlantBombHere;
			// End:0xB1
			break;
		// End:0xFFFF
		default:
			return "";
			break;
	}	
	// Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\ByteCodeDecompiler.cs:line 1864
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\ByteCodeDecompiler.cs:line 1725
	// 1 & Type:Switch Position:0x0B1
	return;
	// Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\ByteCodeDecompiler.cs:line 1864
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\ByteCodeDecompiler.cs:line 1725
	// 1 & Type:Switch Position:0x0B1
	// Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\ByteCodeDecompiler.cs:line 1864
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\ByteCodeDecompiler.cs:line 1745
	// 1 & Type:Switch Position:0x0B1
}

defaultproperties
{
	BombPlantedString="<?int?dnGame.dnBombMessage.BombPlantedString?>"
	CantPlantBombString="<?int?dnGame.dnBombMessage.CantPlantBombString?>"
	DroppedTheBombString="<?int?dnGame.dnBombMessage.DroppedTheBombString?>"
	PlantedTheBombString="<?int?dnGame.dnBombMessage.PlantedTheBombString?>"
	Detonate10SecondWarning="<?int?dnGame.dnBombMessage.Detonate10SecondWarning?>"
	CouldntPlantBombHere="<?int?dnGame.dnBombMessage.CouldntPlantBombHere?>"
	bIsConsoleMessage=true
	DrawColor=(B=121,G=2,R=1,A=255)
	YPos=225
}
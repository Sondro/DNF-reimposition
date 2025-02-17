/*******************************************************************************
 * Destructible_WaterTower generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Destructible_WaterTower extends dnDestructibleBuildingDefinition within dnDestructibleBuilding;

defaultproperties
{
	Parts(0)=NameProperty='DukeHUD',
/* Exception thrown while deserializing Parts
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.UnrealStreamImplementations.ReadNameReference(IUnrealStream stream) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 838
   at UELib.Core.UDefaultProperty.DeserializeTagUE1() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 204
   at UELib.Core.UDefaultProperty.DeserializeNextTag() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 193
   at UELib.Core.UDefaultProperty.Deserialize() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 169
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 767 */
	Parts(1)=(Location=(X=1.292418E-41,Y=2.954451E-17,Z=77.23917),Z=178.2856)
	Parts(2)=(Rotation=(Pitch=-187867,Yaw=572915712,Roll=49153),Roll=16380)
	Parts(3)=(Scale=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Parts(4)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=0,PhysicsMaterial=none,bDefaultInteractionClass=false)
	Parts(5)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_2x4_short',Location=(X=1.292418E-41,Y=2.94903E-17,Z=107.2392),Z=-129.7144)
	Parts(6)=(Rotation=(Pitch=-187867,Yaw=572915712,Roll=49153),Roll=49085)
	Parts(7)=(Scale=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=1.3)
	Parts(8)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=0,PhysicsMaterial=none,bDefaultInteractionClass=false)
	Parts(9)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_4x4_long',Location=(X=-3.254514E-18,Y=2.954679E-17,Z=81.63174),Z=26.74854)
	Parts(10)=(Rotation=(Pitch=-66575835,Yaw=572915712,Roll=32643),Roll=33798)
	Parts(11)=(Scale=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Parts(12)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=100,PhysicsMaterial=none,bDefaultInteractionClass=true)
	Parts(13)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_4x4_long',Location=(X=-524864.4,Y=2.965521E-17,Z=81.55655),Z=26.74854)
	Parts(14)=(Rotation=(Pitch=-66510299,Yaw=572915712,Roll=49013),Roll=33797)
	Parts(15)=(Scale=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Parts(16)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=100,PhysicsMaterial=none,bDefaultInteractionClass=true)
	Parts(17)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_2x4_long',Location=(X=1.292418E-41,Y=2.965409E-17,Z=91.23917),Z=36.28564)
	Parts(18)=(Rotation=(Pitch=-67034587,Yaw=572915712,Roll=49153),Roll=6112)
	Parts(19)=(Scale=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Parts(20)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=100,PhysicsMaterial=none,bDefaultInteractionClass=true)
	Parts(21)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_2x4_short',Location=(X=1.292418E-41,Y=2.965293E-17,Z=-90.76083),Z=178.2856)
	Parts(22)=(Rotation=(Pitch=-187867,Yaw=572915712,Roll=16384),Roll=16380)
	Parts(23)=(Scale=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Parts(24)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=0,PhysicsMaterial=none,bDefaultInteractionClass=false)
	Parts(25)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_2x4_short',Location=(X=1.292418E-41,Y=2.94903E-17,Z=-120.7608),Z=-129.7144)
	Parts(26)=(Rotation=(Pitch=-187867,Yaw=572915712,Roll=16384),Roll=49085)
	Parts(27)=(Scale=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=1.3)
	Parts(28)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=0,PhysicsMaterial=none,bDefaultInteractionClass=false)
	Parts(29)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_4x4_long',Location=(X=-3.473261E-18,Y=2.965521E-17,Z=-95.15439),Z=26.74854)
	Parts(30)=(Rotation=(Pitch=-66510299,Yaw=572915712,Roll=65409),Roll=33797)
	Parts(31)=(Scale=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Parts(32)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=100,PhysicsMaterial=none,bDefaultInteractionClass=true)
	Parts(33)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_4x4_long',Location=(X=-426272.2,Y=2.954679E-17,Z=-95.07724),Z=26.74854)
	Parts(34)=(Rotation=(Pitch=-66510299,Yaw=572915712,Roll=16244),Roll=33797)
	Parts(35)=(Scale=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Parts(36)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=100,PhysicsMaterial=none,bDefaultInteractionClass=true)
}
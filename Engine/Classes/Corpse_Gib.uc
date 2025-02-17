/*******************************************************************************
 * Corpse_Gib generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Corpse_Gib extends Corpse
	collapsecategories
	notplaceable
	dependson(MeshInstance);

var float SmallImpulseMass;
var float LargeImpulseMass;
var float SmallImpulseScale;
var float GibletScale;

function PostBeginPlay()
{
	super(InteractiveActor).PostBeginPlay();
	__NFUN_607__(1E-05, false, 'EnableDamage');
	__NFUN_607__(__NFUN_226__(0.5, 0.25), false, 'CheckBonesInWorld');
	// End:0x5E
	if(__NFUN_174__(int(Level.NetMode), int(NM_Standalone)))
	{
		TickStyle = 1;
		__NFUN_607__(__NFUN_226__(10, 2), false, 'HideDestroy');
	}
	return;
}

function HideDestroy()
{
	__NFUN_614__();
	return;
}

simulated function EnableDamage()
{
	bNoDamage = false;
	return;
}

function CopyFrozenStatus(Corpse_Gib Gib)
{
	Gib.bNoNativeTick = bNoNativeTick;
	Gib.FrozenPercent = FrozenPercent;
	Gib.TargetFrozenPercent = TargetFrozenPercent;
	Gib.DefaultFriction = DefaultFriction;
	Gib.bOverlayBumpShader = bOverlayBumpShader;
	Gib.OverlayBumpShaderInfo = OverlayBumpShaderInfo;
	return;
}

function Destroyed()
{
	local dnFriendFX_Spawners blood;
	local Corpse_Gib gib1, gib2, gib3, gib4, gib5;

	super(CorpseBase).Destroyed();
	// End:0x11
	if(bSilentDestroy)
	{
		return;
	}
	// End:0x1F
	if(__NFUN_203__(Health, float(0)))
	{
		return;
	}
	// End:0x2A
	if(IsMP())
	{
		return;
	}
	// End:0x64
	if(__NFUN_145__(IsFrozen()))
	{
		blood = FindFriendSpawner(class'Blood_BodyExplode_Spawner');
		// End:0x64
		if(__NFUN_340__(blood, none))
		{
			blood.__NFUN_645__(Location);
		}
	}
	// End:0xA1
	if(__NFUN_200__(Mass, 1))
	{
		// End:0x9E
		if(__NFUN_148__(__NFUN_145__(IsFrozen()), __NFUN_340__(blood, none)))
		{
			blood.__NFUN_591__(0.1);
		}		
	}
	else
	{
		// End:0xEF
		if(__NFUN_148__(__NFUN_203__(Mass, 1), __NFUN_202__(Mass, SmallImpulseMass)))
		{
			// End:0xEC
			if(__NFUN_148__(__NFUN_145__(IsFrozen()), __NFUN_340__(blood, none)))
			{
				blood.__NFUN_591__(0.45);
			}			
		}
		else
		{
			// End:0x25D
			if(__NFUN_202__(Mass, LargeImpulseMass))
			{
				gib1 = __NFUN_615__(class'Corpse_Gib', self,, Location);
				gib1.__NFUN_595__(class'General_Meat');
				gib1.bCanDie = true;
				gib1.Mass = __NFUN_199__(SmallImpulseMass, 2);
				gib1.__NFUN_591__(__NFUN_195__(__NFUN_195__(2, GibletScale), DrawScale));
				gib1.__NFUN_621__(true, true, true, true, true);
				gib1.__NFUN_642__(18);
				gib1.__NFUN_817__();
				CopyFrozenStatus(gib1);
				gib2 = __NFUN_615__(class'Corpse_Gib', self,, Location);
				gib2.__NFUN_595__(class'commonA_Gib');
				gib2.bCanDie = true;
				gib2.Mass = __NFUN_199__(SmallImpulseMass, 2);
				gib2.__NFUN_591__(__NFUN_195__(__NFUN_195__(0.4, GibletScale), DrawScale));
				gib2.__NFUN_621__(true, true, true, true, true);
				gib2.__NFUN_642__(18);
				gib2.__NFUN_817__();
				CopyFrozenStatus(gib2);				
			}
			else
			{
				// End:0x27B
				if(__NFUN_340__(blood, none))
				{
					blood.__NFUN_591__(2);
				}
				gib1 = __NFUN_615__(class'Corpse_Gib', self,, Location);
				gib1.bCanDie = true;
				gib1.__NFUN_595__(class'commonA_Gib');
				gib1.__NFUN_591__(__NFUN_195__(__NFUN_195__(0.4, GibletScale), DrawScale));
				gib1.Mass = __NFUN_199__(SmallImpulseMass, 2);
				gib1.__NFUN_621__(true, true, true, true, true);
				gib1.__NFUN_642__(18);
				gib1.__NFUN_817__();
				CopyFrozenStatus(gib1);
				gib2 = __NFUN_615__(class'Corpse_Gib', self,, Location);
				gib2.bCanDie = true;
				gib2.__NFUN_595__(class'commonB_Gib');
				gib2.__NFUN_591__(__NFUN_195__(__NFUN_195__(0.4, GibletScale), DrawScale));
				gib2.Mass = __NFUN_199__(SmallImpulseMass, 2);
				gib2.__NFUN_621__(true, true, true, true, true);
				gib2.__NFUN_642__(18);
				gib2.__NFUN_817__();
				CopyFrozenStatus(gib2);
				gib3 = __NFUN_615__(class'Corpse_Gib', self,, Location);
				gib3.bCanDie = true;
				gib3.__NFUN_595__(class'General_Meat');
				gib3.__NFUN_591__(__NFUN_195__(__NFUN_195__(2, GibletScale), DrawScale));
				gib3.Mass = __NFUN_199__(SmallImpulseMass, 2);
				gib3.__NFUN_621__(true, true, true, true, true);
				gib3.__NFUN_642__(18);
				gib3.__NFUN_817__();
				CopyFrozenStatus(gib3);
				gib4 = __NFUN_615__(class'Corpse_Gib', self,, Location);
				gib4.bCanDie = true;
				gib4.__NFUN_595__(class'commonC_Gib');
				gib4.__NFUN_591__(__NFUN_195__(__NFUN_195__(0.4, GibletScale), DrawScale));
				gib4.Mass = __NFUN_199__(SmallImpulseMass, 2);
				gib4.__NFUN_621__(true, true, true, true, true);
				gib4.__NFUN_642__(18);
				gib4.__NFUN_817__();
				CopyFrozenStatus(gib4);
			}
		}
	}
	// End:0x568
	if(__NFUN_145__(IsFrozen()))
	{
		// End:0x55B
		if(__NFUN_340__(blood, none))
		{
			blood.ExecuteEffect(true);
		}
		__NFUN_1029__(Location, DrawScale);
	}
	return;
}

function ModifyHealthActivity(float DeltaHealth, Vector ModifiedFrom)
{
	// End:0x18
	if(__NFUN_150__(bNoDamage, __NFUN_145__(bCanDie)))
	{
		return;
	}
	__NFUN_832__(__NFUN_199__(Health, DeltaHealth));
	// End:0x39
	if(__NFUN_202__(Health, 0))
	{
		__NFUN_614__();
	}
	return;
}

simulated function float GetDamageMomentumPostScale(class<DamageType> DamageType)
{
	local float Alpha;

	// End:0x1D
	if(__NFUN_202__(Mass, SmallImpulseMass))
	{
		Alpha = 0;		
	}
	else
	{
		// End:0x4F
		if(__NFUN_202__(Mass, LargeImpulseMass))
		{
			Alpha = __NFUN_196__(__NFUN_199__(Mass, SmallImpulseScale), __NFUN_199__(LargeImpulseMass, SmallImpulseMass));			
		}
		else
		{
			Alpha = 1;
		}
	}
	return __NFUN_195__(super(CorpseBase).GetDamageMomentumPostScale(DamageType), __NFUN_228__(Alpha, SmallImpulseScale, 1));
	return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	super(CorpseBase).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	// End:0x3B
	if(__NFUN_357__(DamageType, class'ColdDamage'))
	{
		return;
	}
	ModifyHealthActivity(Damage, DamageOrigin);
	return;
}

function CheckBonesInWorld()
{
	local int BoneCount, i;
	local PointRegion BoneRegion;
	local name BoneName;
	local Vector BoneLoc;

	// End:0x0C
	if(__NFUN_339__(__NFUN_568__(), none))
	{
		return;
	}
	BoneCount = __NFUN_568__().__NFUN_523__();
	i = 0;
	J0x24:

	// End:0x91 [Loop If]
	if(__NFUN_169__(i, BoneCount))
	{
		BoneName = __NFUN_568__().__NFUN_524__(i);
		BoneLoc = __NFUN_568__().__NFUN_533__(BoneName, true);
		BoneRegion = __NFUN_729__(BoneLoc);
		// End:0x87
		if(__NFUN_173__(BoneRegion.iLeaf, -1))
		{
			__NFUN_614__();
			return;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x24;
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(CorpseBase).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(class'Blood_BodyExplode_Spawner');
	PrecacheIndex.__NFUN_1267__(class'General_Meat');
	PrecacheIndex.__NFUN_1267__(class'commonA_Gib');
	PrecacheIndex.__NFUN_1267__(class'commonA_Gib');
	PrecacheIndex.__NFUN_1267__(class'commonB_Gib');
	PrecacheIndex.__NFUN_1267__(class'General_Meat');
	PrecacheIndex.__NFUN_1267__(class'commonC_Gib');
	return;
}

defaultproperties
{
	SmallImpulseMass=15
	LargeImpulseMass=25
	SmallImpulseScale=0.06
	GibletScale=1
	Health=15
	bNoDamage=true
	ImpactSoundTimer=0.75
	KAngularDamping=8
	PhysicsSoundOverrides(0)=(Color=(Engine=/* Unknown default property type! */,OtherMaterialTypes=(none,class'DrawScaleRatio',class'Instigator',class'Yaw',none,class'Scene',class'Jetpack',class'Instigator',class'Level',class'BodyPart_01',class'BodyPart_02',class'BodyPart_03',class'BodyPart_04',class'HUD',class'TriggerWhenClassCarried',class'Level',class'Wins',class'Pawn',class'GeneratePatternList',class'Vector',class'Game',class'aOther',class'Inventory',none,none,none,class'bTraceTexture',class'Vector',class'Inventory',none,none,
/* Exception thrown while deserializing OtherMaterialTypes
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.UnrealPackage.GetIndexObject(Int32 objectIndex) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealPackage.cs:line 1821
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 559 */,class'ReturnValue'),OutputPitchRange=(Min=0.75,Max=1.125),OutputVolumeRange=(Min=0.25,Max=1)),bDisableSoundInWater=true)
}
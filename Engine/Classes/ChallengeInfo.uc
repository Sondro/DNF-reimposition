/*******************************************************************************
 * ChallengeInfo generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ChallengeInfo extends Info
	abstract
	native
	config(ChallengeInfo)
	collapsecategories
	notplaceable
	hidecategories(movement,Collision,Lighting,LightColor);

cpptext
{
// Stripped
}

struct ChallengeInfoStruct
{
	var int ChallengeID;
	var string ChallObjClass;
	var transient ChallengeObject ChallObj;
	var array<int> ChallDependencies;
	var Object.EMPStatistics StatDependency;
	var string ExtraOptions;
	var string Name;
	var string Description;
	var string HelpText;
	var int EXPBonus;
	var name SearchTag;
	var string AttachMesh;
	var name AttachBone;
	var string image;
	var int LockedImageIdx;
	var Object.EChallengeCustomizeCategory Category;
	var int ShirtColorIdx;
	var int TitleIdx;
	var string AMName;
	var bool IsPurchased;
};

struct PreorderGroupStruct
{
	var Object.EPreorderGroup Group;
	var array<int> IDs;
	var bool bUnlockDBP;
};

struct TitleValues
{
	var int id;
	var string Tag;
};

struct LevelingStatXPValues
{
	var Object.EMPStatistics Stat;
	var int XPAmount;
	var string LocTag;
};

var config array<ChallengeInfoStruct> ChallengesArray;
var int NoDLCChallengeArraySize;
var int PlainShirtId;
var int NoHadId;
var int DefaultGlassesId;
var int WhiteColourId;
var int NoTitleID;
var int EndofDefaultUnlocks;
var bool bInit;
var config array<PreorderGroupStruct> PreorderGroups;
var config int DeveloperGroupIdx;
var config array<TitleValues> PlayerTitles;
var config array<LevelingStatXPValues> LevelingInfo;
var config array<int> XPToLevel;

// Export UChallengeInfo::execStaticInit(FFrame&, void* const)
native(1168) static final function StaticInit();

// Export UChallengeInfo::execGetChallengeIdxFromID(FFrame&, void* const)
native(1169) static final function int GetChallengeIdxFromID(int id)
{
	//native.id;	
}

static simulated function int GetTitleIdxFromID(int id)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x55 [Loop If]
	if(__NFUN_169__(i, string(class'ChallengeInfo'.default.PlayerTitles)))
	{
		// End:0x4B
		if(__NFUN_173__(class'ChallengeInfo'.default.PlayerTitles[i].id, id))
		{
			return i;
		}
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x07;
	}
	return -1;
	return;
}

// Export UChallengeInfo::execIsEnterBonusCodeMenuItemEnabled(FFrame&, void* const)
native(1170) static final function bool IsEnterBonusCodeMenuItemEnabled();

// Export UChallengeInfo::execTryBonusCode(FFrame&, void* const)
native(1171) static final function bool TryBonusCode(string in_Code, out string out_Title, out string out_Description)
{
	//native.in_Code;
	//native.out_Title;
	//native.out_Description;	
}

// Export UChallengeInfo::execUnlockPreorderGroupIncludesDBP(FFrame&, void* const)
native(1172) static final function bool UnlockPreorderGroupIncludesDBP(Object.EPreorderGroup in_POG)
{
	//native.in_POG;	
}

// Export UChallengeInfo::execUnlockPreorderBonuses(FFrame&, void* const)
native(1173) static final function UnlockPreorderBonuses(Object.EPreorderGroup in_POG)
{
	//native.in_POG;	
}

// Export UChallengeInfo::execUnlockPreorderGroup(FFrame&, void* const)
native(1174) static final function UnlockPreorderGroup(Object.EPreorderGroup in_POG)
{
	//native.in_POG;	
}

static final event CodeUnlockedPreorderGroup(Object.EPreorderGroup in_POG, out string out_Title, out string out_Description)
{
	out_Title = "";
	out_Description = __NFUN_356__("PreorderUnlocks", __NFUN_302__(__NFUN_302__("ShirtName[", string(__NFUN_365__(Enum'EPreorderGroup', int(in_POG)))), "]"), "dnWindow");
	// End:0x71
	if(__NFUN_170__(__NFUN_314__(out_Description), 0))
	{
		out_Description = __NFUN_302__(out_Description, " \\n");
	}
	out_Description = __NFUN_302__(out_Description, __NFUN_356__("PreorderUnlocks", "DeveloperShirtsList", "dnWindow"));
	// End:0x106
	if(__NFUN_1172__(in_POG))
	{
		out_Description = __NFUN_302__(__NFUN_302__(out_Description, " \\n"), __NFUN_356__("PreorderUnlocks", "DukesBigPackageList", "dnWindow"));
	}
	__NFUN_1173__(in_POG);
	return;
}

defaultproperties
{
	ChallengesArray=none
}
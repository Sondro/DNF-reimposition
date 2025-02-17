class Object
	native
	noexport;

const RF_Transactional = 0x00000001;
const RF_Unreachable = 0x00000002;
const RF_Public = 0x00000004;
const RF_TagImp = 0x00000008;
const RF_TagExp = 0x00000010;
const RF_SourceModified = 0x00000020;
const RF_TagGarbage = 0x00000040;
const RF_Final = 0x00000080;
const RF_EnteredSafeMode = 0x00000100;
const RF_NeedLoad = 0x00000200;
const RF_HighlightedName = 0x00000400;
const RF_EliminateObject = 0x00000400;
const RF_InstanceObject = 0x00000800;
const RF_Suppress = 0x00001000;
const RF_StateChanged = 0x00001000;
const RF_InEndState = 0x00002000;
const RF_Transient = 0x00004000;
const RF_Preloading = 0x00008000;
const RF_LoadForClient = 0x00010000;
const RF_LoadForServer = 0x00020000;
const RF_LoadForEdit = 0x00040000;
const RF_Standalone = 0x00080000;
const RF_NotForClient = 0x00100000;
const RF_NotForServer = 0x00200000;
const RF_NotForEdit = 0x00400000;
const RF_Destroyed = 0x00800000;
const RF_NeedPostLoad = 0x01000000;
const RF_HasStack = 0x02000000;
const RF_Native = 0x04000000;
const RF_Marked = 0x08000000;
const RF_ErrorShutdown = 0x10000000;
const RF_DebugPostLoad = 0x20000000;
const RF_DebugSerialize = 0x40000000;
const RF_DebugDestroy = 0x80000000;
const kAnimationGroup_MaxSubChannels = 24;
const kSoundVolumePrefabCount = 9;
const kVehiclePhysicsMotorConstants = 6;
const MaxInt = 0x7fffffff;
const Pi = 3.1415926535897932;
const kMaxAbsXY45 = 0.707107f;
const kOneMinusMaxAbsXY45 = 0.292893f;
const kMaxNumPlayers = 8;
const kMaxTeamSize = 4;
const kMaxNumTeams = 4;

enum EMGametype
{
	GT_INVALID,
	GT_DEATHMATCH,
	GT_CAPTURETHEBABE,
	GT_TEAMDEATHMATCH,
	GT_HAILTOTHEKING,
	GT_DLCGAMETYPE0,
	GT_DLCGAMETYPE1,
	GT_DLCGAMETYPE2,
	GT_DLCGAMETYPE3,
	GT_DLCGAMETYPE4,
	GT_DLCGAMETYPE5,
	GT_DLCGAMETYPE6,
	GT_DLCGAMETYPE7,
	GT_DLCGAMETYPE8,
	GT_DLCGAMETYPE9,
	GT_MYDIGS
};

enum ECompare
{
	COMPARE_Fail,
	COMPARE_Succeed,
	COMPARE_Equals,
	COMPARE_LessThan,
	COMPARE_LessThanOrEquals,
	COMPARE_GreaterThan,
	COMPARE_GreaterThanOrEquals,
	COMPARE_Approximately,
	COMPARE_NotApproximately
};

enum EColorOperation
{
	CO_Add,
	CO_AddSmooth,
	CO_Modulate,
	CO_Modulate2X,
	CO_Modulate4X,
	CO_Subtract,
	CO_AlphaBlend,
	CO_Dot3Biased,
	CO_Dot3,
	CO_AddSigned2X,
	CO_Max,
	CO_Min,
	CO_Exp,
	CO_Cross,
	CO_Use_Material1,
	CO_Use_Material2,
	CO_Add_PreMult_Diff_Alpha,
	CO_Modulate_With_Alpha,
	CO_Modulate2X_With_Alpha
};

enum EAlphaOperation
{
	AO_Add,
	AO_Modulate,
	AO_Use_Material1,
	AO_Use_Material2,
	AO_Use_Material3
};

enum EFrameBufferBlending
{
	FB_Overwrite,
	FB_Modulate,
	FB_AlphaBlend,
	FB_AlphaModulate,
	FB_Translucent,
	FB_Darken,
	FB_Brighten,
	FB_Invisible
};

enum EColorFadeType
{
	FC_Linear,
	FC_Sinusoidal,
	FC_Once,
	FC_OnceBackwards,
	FC_Constant1,
	FC_Constant2,
	FC_Flicker,
	FC_String
};

enum ETexClampMode
{
	TC_Wrap,
	TC_Clamp,
	TC_Border
};

enum ETexCoordSrc
{
	TCS_Stream0,
	TCS_Stream1,
	TCS_Stream2,
	TCS_Stream3,
	TCS_Stream4,
	TCS_Stream5,
	TCS_Stream6,
	TCS_Stream7,
	TCS_WorldCoords,
	TCS_CameraCoords,
	TCS_WorldEnvMapCoords,
	TCS_CameraEnvMapCoords,
	TCS_ProjectorCoords,
	TCS_NoChange
};

enum ETexCoordCount
{
	TCN_2DCoords,
	TCN_3DCoords,
	TCN_4DCoords
};

enum ESaveType
{
	SAVE_Normal,
	SAVE_Quick,
	SAVE_Auto,
	SAVE_Restart,
	SAVE_AutoFinal
};

enum EBitModifier
{
	BM_Ignore,
	BM_Set,
	BM_Clear,
	BM_Toggle
};

enum EFloatModifier
{
	FM_Ignore,
	FM_Replace,
	FM_Scale,
	FM_Add,
	FM_Min,
	FM_Max
};

enum EIntModifier
{
	IM_Ignore,
	IM_Replace,
	IM_Scale,
	IM_Add,
	IM_Min,
	IM_Max
};

enum EVectModifier
{
	VM_Ignore,
	VM_Replace,
	VM_Scale,
	VM_Add,
	VM_Min,
	VM_Max
};

enum ERotModifier
{
	RM_Ignore,
	RM_Replace,
	RM_Scale,
	RM_Add
};

enum EColorModifier
{
	CM_Ignore,
	CM_Replace,
	CM_Add,
	CM_Subtract,
	CM_Multiply,
	CM_Divide,
	CM_Min,
	CM_Max
};

enum ENameModifier
{
	NMM_Ignore,
	NMM_Replace,
	NMM_Prepend,
	NMM_Append
};

enum EStrModifier
{
	STRM_Ignore,
	STRM_Replace,
	STRM_Prepend,
	STRM_Append
};

enum EAnimationBlendMode
{
	BLEND_Replace,
	BLEND_ReplaceBlend,
	BLEND_Blend,
	BLEND_Add,
	BLEND_Subtract
};

enum EAnimationControllerBlockBlend
{
	ACBBLEND_Linear,
	ACBBLEND_Cubic
};

enum EPawnBodyPart
{
	BODYPART_Default,
	BODYPART_Head,
	BODYPART_Neck,
	BODYPART_Chest,
	BODYPART_Stomach,
	BODYPART_Crotch,
	BODYPART_ShoulderLeft,
	BODYPART_ShoulderRight,
	BODYPART_ArmLeft,
	BODYPART_ArmRight,
	BODYPART_HandLeft,
	BODYPART_HandRight,
	BODYPART_ThighLeft,
	BODYPART_ThighRight,
	BODYPART_KneeLeft,
	BODYPART_KneeRight,
	BODYPART_FootLeft,
	BODYPART_FootRight,
	BODYPART_Tail,
	BODYPART_Eye
};

enum EPawnDamageDir
{
	DAMAGEDIR_Front,
	DAMAGEDIR_Back,
	DAMAGEDIR_Left,
	DAMAGEDIR_Right
};

enum EDoorOpenAnimationStyle
{
	DOAS_Random,
	DOAS_PoundOnly,
	DOAS_KickOnly,
	DOAS_MeleeOnly,
	DOAS_HandOnly,
	DOAS_HandsAndMelee
};

enum EDialog
{
	DIALOG_Scripted,
	DIALOG_FireInTheHole,
	DIALOG_TakeCover,
	DIALOG_LowHealth,
	DIALOG_ConfirmKill,
	DIALOG_ConfirmKillPigCop,
	DIALOG_ConfirmKillAT,
	DIALOG_ManDown,
	DIALOG_FriendlyFire,
	DIALOG_Reloading,
	DIALOG_EnemySpotted,
	DIALOG_FlyingATSpotted,
	DIALOG_EnemySpotted_Car,
	DIALOG_EnemySpotted_CopCar,
	DIALOG_EnemySpotted_Taxi,
	DIALOG_EnemySpotted_Bus,
	DIALOG_EnemySpotted_Wall,
	DIALOG_EnemySpotted_Pillar,
	DIALOG_EnemySpotted_Crate,
	DIALOG_ConfirmKillDukeBot,
	DIALOG_ConfirmKillDukeClone,
	DIALOG_DukeRobotSpotted,
	DIALOG_EnemySpotted_Fence,
	DIALOG_EnemySpotted_Sandbags,
	DIALOG_EnemySpotted_Truck,
	DIALOG_EnemySpotted_Barrier
};

enum EFaction
{
	FACTION_Human,
	FACTION_Alien,
	FACTION_Robot
};

enum ELeaderBoardUpdateState
{
	LBU_NONE,
	LBU_PLAYER,
	LBU_LIST,
	LBU_UPLOADED,
	LBU_ERROR
};

enum ESaveDataResult
{
	SDR_OK,
	SDR_INTERNAL,
	SDR_NOSPACE,
	SDR_CORRUPT,
	SDR_FAILURE,
	SDR_BUSY
};

enum EPawnGender
{
	GENDER_HumanMale,
	GENDER_HumanFemale,
	GENDER_Misc
};

enum EVisionType
{
	VISION_Normal,
	VISION_Rebreather,
	VISION_Thermal
};

enum EEgoAwardID
{
	EGOAWARD_Toilet,
	EGOAWARD_PokerWin,
	EGOAWARD_SlotsWin,
	EGOAWARD_WorkoutBench,
	EGOAWARD_WorkoutBenchMaxLift,
	EGOAWARD_AirHockeyWin,
	EGOAWARD_PayBinoculars,
	EGOAWARD_CopyMachine,
	EGOAWARD_GloryHole,
	EGOAWARD_PinballHighScore,
	EGOAWARD_HandWeight,
	EGOAWARD_Calendar,
	EGOAWARD_PaperAirPlane,
	EGOAWARD_Frisbee,
	EGOAWARD_PornMagazineA,
	EGOAWARD_PornMagazineB,
	EGOAWARD_PornMagazineC,
	EGOAWARD_SmokeCigar,
	EGOAWARD_PunchingBag,
	EGOAWARD_SpeedBag,
	EGOAWARD_WallBoobs,
	EGOAWARD_Mirror,
	EGOAWARD_Microwave,
	EGOAWARD_PoolWin,
	EGOAWARD_BasketBall,
	EGOAWARD_ComputerPorn,
	EGOAWARD_BookSigning,
	EGOAWARD_DefeatBattlelord1,
	EGOAWARD_DefeatAlienQueen,
	EGOAWARD_AlienAbortion,
	EGOAWARD_DukePorno,
	EGOAWARD_TipStripper,
	EGOAWARD_DefeatBattlelord2,
	EGOAWARD_DefeatOctaking,
	EGOAWARD_DefeatLeech
};

enum EExpEventID
{
	EID_Kill,
	EID_Suicide,
	EID_BabeCap,
	EID_Piss,
	EID_KillBabeCarrier,
	EID_BabeReturned,
	EID_MultiKill,
	EID_JetPackKill,
	EID_Assist,
	EID_OverdriveHitBonus
};

enum EFootstepCategory
{
	FOOTSTEP_Default,
	FOOTSTEP_Boss,
	FOOTSTEP_Insectoid_Standard,
	FOOTSTEP_Cycloid,
	FOOTSTEP_Animal_Heavy,
	FOOTSTEP_Pigcop_Standard,
	FOOTSTEP_Human_Standard,
	FOOTSTEP_Barefoot,
	FOOTSTEP_None
};

enum EFootprintType
{
	FOOTPRINT_Material,
	FOOTPRINT_Bloody,
	FOOTPRINT_Wet,
	FOOTPRINT_Muddy,
	FOOTPRINT_Flaming,
	FOOTPRINT_Radioactive,
	FOOTPRINT_None
};

enum EPhysicsImpactType
{
	PHYSIMPACT_Crash,
	PHYSIMPACT_Roll,
	PHYSIMPACT_Slide,
	PHYSIMPACT_Bounce,
	PHYSIMPACT_TireSkid
};

enum EPhysicsMaterialType
{
	PHYSMATERIAL_Generic,
	PHYSMATERIAL_Metal_Solid,
	PHYSMATERIAL_Metal_Hollow,
	PHYSMATERIAL_PlasticCeramic,
	PHYSMATERIAL_Glass,
	PHYSMATERIAL_Carpet,
	PHYSMATERIAL_Cardboard,
	PHYSMATERIAL_Rubber,
	PHYSMATERIAL_Gibs,
	PHYSMATERIAL_Flesh,
	PHYSMATERIAL_Wood_Solid,
	PHYSMATERIAL_Wood_Hollow,
	PHYSMATERIAL_Dirt,
	PHYSMATERIAL_Stone,
	PHYSMATERIAL_GravelSand,
	PHYSMATERIAL_Concrete,
	PHYSMATERIAL_Ice,
	PHYSMATERIAL_Snow,
	PHYSMATERIAL_Reserved1,
	PHYSMATERIAL_Reserved2,
	PHYSMATERIAL_Reserved3,
	PHYSMATERIAL_Reserved4,
	PHYSMATERIAL_Reserved5,
	PHYSMATERIAL_Custom
};

enum EPhysicsMassType
{
	PHYSMASS_Light,
	PHYSMASS_Standard,
	PHYSMASS_Heavy,
	PHYSMASS_Static
};

enum ELightExStyle
{
	LSTYLE_None,
	LSTYLE_Steady,
	LSTYLE_Pulse,
	LSTYLE_Blink,
	LSTYLE_Flicker,
	LSTYLE_Strobe,
	LSTYLE_SubtlePulse,
	LSTYLE_String
};

enum EPhysicsQuality
{
	PHYSQUAL_Low,
	PHYSQUAL_High
};

enum ERenderStyle
{
	STY_None,
	STY_Normal,
	STY_Masked,
	STY_Translucent,
	STY_Modulated,
	STY_Translucent2,
	STY_LightenModulate,
	STY_DarkenModulate,
	STY_AlphaBlend,
	STY_Unset
};

enum EOwnerSeeStyle
{
	OSS_Default,
	OSS_FirstPersonOnly,
	OSS_ThirdPersonOnly
};

enum ETickStyle
{
	TICK_Never,
	TICK_Always,
	TICK_Normal,
	TICK_NoRules,
	TICK_Menu
};

enum ESoundLocationOverride
{
	SNDOVERRIDE_None,
	SNDOVERRIDE_Relative,
	SNDOVERRIDE_Absolute,
	SNDOVERRIDE_RelativeToSoundActor
};

enum ESoundSlot
{
	SLOT_None,
	SLOT_Misc,
	SLOT_Pain,
	SLOT_Interact,
	SLOT_Ambient,
	SLOT_Talk,
	SLOT_Interface,
	SLOT_Constant,
	SLOT_PhysicsImpact1,
	SLOT_PhysicsImpact2,
	SLOT_PhysicsImpact3,
	SLOT_PhysicsImpact4,
	SLOT_PhysicsSlide,
	SLOT_PhysicsRoll,
	SLOT_CodeReserved1,
	SLOT_CodeReserved2,
	SLOT_CodeReserved3,
	SLOT_CodeReserved4,
	SLOT_CodeReserved5,
	SLOT_CodeReserved6,
	SLOT_CodeReserved7,
	SLOT_CodeReserved8,
	SLOT_VehicleEngine1,
	SLOT_VehicleEngine2,
	SLOT_VehicleSkid,
	SLOT_Music
};

enum EStopSoundRule
{
	STOPSOUND_Immediate,
	STOPSOUND_FinishLoop,
	STOPSOUND_JumpToLoopStart,
	STOPSOUND_JumpToLoopEnd
};

enum ESoundVolumePrefab
{
	SOUNDVOLUME_None,
	SOUNDVOLUME_WeaponFire,
	SOUNDVOLUME_WeaponMisc,
	SOUNDVOLUME_PlayerVoice,
	SOUNDVOLUME_Voice,
	SOUNDVOLUME_Creature,
	SOUNDVOLUME_Ambient,
	SOUNDVOLUME_Vehicle,
	SOUNDVOLUME_Interact
};

enum ESoundFilter
{
	SOUNDFILTER_AllPass,
	SOUNDFILTER_BandPass,
	SOUNDFILTER_Chorus,
	SOUNDFILTER_Compressor,
	SOUNDFILTER_Delay,
	SOUNDFILTER_Flange,
	SOUNDFILTER_GainBlock,
	SOUNDFILTER_HighPass,
	SOUNDFILTER_LowPass,
	SOUNDFILTER_ParametricEQ,
	SOUNDFILTER_Phaser,
	SOUNDFILTER_Resonator,
	SOUNDFILTER_ShelvingEQ,
	SOUNDFILTER_VolumeRamp
};

enum EPhysics
{
	PHYS_None,
	PHYS_Walking,
	PHYS_Falling,
	PHYS_Swimming_Deprecated,
	PHYS_Flying,
	PHYS_Rotating,
	PHYS_Projectile,
	PHYS_Rolling_Deprecated,
	PHYS_Interpolating,
	PHYS_MovingBrush,
	PHYS_Spider_Deprecated,
	PHYS_Null,
	PHYS_Rope_Deprecated,
	PHYS_WheeledVehicle_Deprecated,
	PHYS_Jetpack_Deprecated,
	PHYS_Karma_Deprecated,
	PHYS_KarmaRagDoll_Deprecated,
	PHYS_Ladder_Deprecated,
	PHYS_Meqon
};

enum EMountType
{
	MOUNT_Actor,
	MOUNT_MeshSurface,
	MOUNT_MeshBone,
	MOUNT_ActorLocationOnly,
	MOUNT_PlayerView
};

enum EDesiredStyle
{
	DESIRED_Linear,
	DESIRED_Smooth,
	DESIRED_Parabolic,
	DESIRED_YoYo_Smooth,
	DESIRED_YoYo_Parabolic,
	DESIRED_Rate
};

enum EDesiredStopStyle
{
	DESIREDSTOP_Ignore,
	DESIREDSTOP_Wait,
	DESIREDSTOP_Abort
};

enum EDesiredRotationStopStyle
{
	DESIREDROTSTOP_Ignore,
	DESIREDROTSTOP_Wait,
	DESIREDROTSTOP_Abort
};

enum ECrushStyle
{
	CRUSH_None,
	CRUSH_KillPawns,
	CRUSH_HurtPawns,
	CRUSH_HurtAll
};

enum EViewShakeStyle
{
	SHAKE_Pitch,
	SHAKE_Yaw,
	SHAKE_Roll,
	SHAKE_PitchYaw,
	SHAKE_PitchRoll,
	SHAKE_YawRoll,
	SHAKE_All
};

enum EViewShakeFunction
{
	SHAKEFUNC_Random,
	SHAKEFUNC_Maximum,
	SHAKEFUNC_Positive,
	SHAKEFUNC_Negative,
	SHAKEFUNC_MaxPositive,
	SHAKEFUNC_MaxNegative
};

enum EScreenFlash
{
	SFLASH_Once,
	SFLASH_Loop,
	SFLASH_Hold
};

enum EInputAction
{
	IST_None,
	IST_Press,
	IST_Hold,
	IST_Release,
	IST_Axis
};

enum EInputKey
{
	IK_None,
	IK_LeftMouse,
	IK_RightMouse,
	IK_Cancel,
	IK_MiddleMouse,
	IK_Mouse4,
	IK_Mouse5,
	IK_Mouse6,
	IK_Backspace,
	IK_Tab,
	IK_Unknown0A,
	IK_Unknown0B,
	IK_NumMid,
	IK_Enter,
	IK_Unknown0E,
	IK_Unknown0F,
	IK_Shift,
	IK_Ctrl,
	IK_Alt,
	IK_Pause,
	IK_CapsLock,
	IK_Unknown15,
	IK_Unknown16,
	IK_Unknown17,
	IK_Unknown18,
	IK_Unknown19,
	IK_Unknown1A,
	IK_Escape,
	IK_Unknown1C,
	IK_Unknown1D,
	IK_Unknown1E,
	IK_Unknown1F,
	IK_Space,
	IK_PageUp,
	IK_PageDown,
	IK_End,
	IK_Home,
	IK_Left,
	IK_Up,
	IK_Right,
	IK_Down,
	IK_Select,
	IK_Print,
	IK_Execute,
	IK_PrintScrn,
	IK_Insert,
	IK_Delete,
	IK_Help,
	IK_0,
	IK_1,
	IK_2,
	IK_3,
	IK_4,
	IK_5,
	IK_6,
	IK_7,
	IK_8,
	IK_9,
	IK_Mouse7,
	IK_Mouse8,
	IK_Unknown3C,
	IK_Unknown3D,
	IK_Unknown3E,
	IK_Unknown3F,
	IK_Unknown40,
	IK_A,
	IK_B,
	IK_C,
	IK_D,
	IK_E,
	IK_F,
	IK_G,
	IK_H,
	IK_I,
	IK_J,
	IK_K,
	IK_L,
	IK_M,
	IK_N,
	IK_O,
	IK_P,
	IK_Q,
	IK_R,
	IK_S,
	IK_T,
	IK_U,
	IK_V,
	IK_W,
	IK_X,
	IK_Y,
	IK_Z,
	IK_LWindows,
	IK_RWindows,
	IK_Application,
	IK_Unknown5E,
	IK_Unknown5F,
	IK_NumPad0,
	IK_NumPad1,
	IK_NumPad2,
	IK_NumPad3,
	IK_NumPad4,
	IK_NumPad5,
	IK_NumPad6,
	IK_NumPad7,
	IK_NumPad8,
	IK_NumPad9,
	IK_NumPadStar,
	IK_NumPadPlus,
	IK_Separator,
	IK_NumPadMinus,
	IK_NumPadPeriod,
	IK_NumPadSlash,
	IK_F1,
	IK_F2,
	IK_F3,
	IK_F4,
	IK_F5,
	IK_F6,
	IK_F7,
	IK_F8,
	IK_F9,
	IK_F10,
	IK_F11,
	IK_F12,
	IK_F13,
	IK_F14,
	IK_F15,
	IK_F16,
	IK_F17,
	IK_F18,
	IK_F19,
	IK_F20,
	IK_F21,
	IK_F22,
	IK_F23,
	IK_F24,
	IK_Unknown88,
	IK_Unknown89,
	IK_Unknown8A,
	IK_Unknown8B,
	IK_Unknown8C,
	IK_Unknown8D,
	IK_Unknown8E,
	IK_Unknown8F,
	IK_NumLock,
	IK_ScrollLock,
	IK_Unknown92,
	IK_Unknown93,
	IK_Unknown94,
	IK_Unknown95,
	IK_Unknown96,
	IK_Unknown97,
	IK_Unknown98,
	IK_Unknown99,
	IK_Unknown9A,
	IK_Unknown9B,
	IK_Unknown9C,
	IK_Unknown9D,
	IK_Unknown9E,
	IK_Unknown9F,
	IK_LShift,
	IK_RShift,
	IK_LControl,
	IK_RControl,
	IK_UnknownA4,
	IK_UnknownA5,
	IK_UnknownA6,
	IK_UnknownA7,
	IK_UnknownA8,
	IK_UnknownA9,
	IK_UnknownAA,
	IK_UnknownAB,
	IK_UnknownAC,
	IK_UnknownAD,
	IK_UnknownAE,
	IK_UnknownAF,
	IK_UnknownB0,
	IK_UnknownB1,
	IK_UnknownB2,
	IK_UnknownB3,
	IK_UnknownB4,
	IK_UnknownB5,
	IK_UnknownB6,
	IK_UnknownB7,
	IK_UnknownB8,
	IK_UnknownB9,
	IK_Semicolon,
	IK_Equals,
	IK_Comma,
	IK_Minus,
	IK_Period,
	IK_Slash,
	IK_Tilde,
	IK_UnknownC1,
	IK_UnknownC2,
	IK_UnknownC3,
	IK_JoyRUp,
	IK_JoyRRight,
	IK_JoyRDown,
	IK_JoyRLeft,
	IK_Joy1,
	IK_Joy2,
	IK_Joy3,
	IK_Joy4,
	IK_Joy5,
	IK_Joy6,
	IK_Joy7,
	IK_Joy8,
	IK_Joy9,
	IK_Joy10,
	IK_Joy11,
	IK_Joy12,
	IK_Joy13,
	IK_Joy14,
	IK_Joy15,
	IK_Joy16,
	IK_UnknownD8,
	IK_UnknownD9,
	IK_UnknownDA,
	IK_LeftBracket,
	IK_Backslash,
	IK_RightBracket,
	IK_SingleQuote,
	IK_UnknownDF,
	IK_JoyX,
	IK_JoyY,
	IK_JoyZ,
	IK_JoyR,
	IK_MouseX,
	IK_MouseY,
	IK_MouseZ,
	IK_MouseW,
	IK_JoyU,
	IK_JoyV,
	IK_UnknownEA,
	IK_UnknownEB,
	IK_MouseWheelUp,
	IK_MouseWheelDown,
	IK_Unknown10E,
	UK_Unknown10F,
	IK_JoyPovUp,
	IK_JoyPovDown,
	IK_JoyPovLeft,
	IK_JoyPovRight,
	IK_UnknownF4,
	IK_UnknownF5,
	IK_Attn,
	IK_CrSel,
	IK_ExSel,
	IK_ErEof,
	IK_Play,
	IK_Zoom,
	IK_NoName,
	IK_PA1,
	IK_OEMClear
};

enum ESpecialKeys
{
	SK_None,
	SK_Use,
	SK_Zoom,
	SK_Heat,
	SK_Sprint,
	SK_TurnLeft,
	SK_TurnRight,
	SK_StrafeLeft,
	SK_StrafeRight,
	SK_MoveForward,
	SK_MoveBackward,
	SK_Fire,
	SK_Melee,
	SK_Jump,
	SK_Duck,
	SK_Deprecated1,
	SK_Deprecated2,
	SK_Jetpack,
	SK_Reload,
	SK_VehicleHandBrake,
	SK_VehicleBoost,
	SK_VehicleFire,
	SK_VehicleViewChange,
	SK_VehicleRadioChange,
	SK_VehicleUpAction,
	SK_VehicleDownAction,
	SK_DnControlFire,
	SK_DnControlMelee,
	SK_Deprecated3,
	SK_DnControlDuck,
	SK_Deprecated4,
	SK_UsePipeBomb,
	SK_UseTripMine,
	SK_UseDukeVision,
	SK_UseHoloDuke,
	SK_UseSteroids,
	SK_UseBeer,
	SK_SwapWeapons,
	SK_Digs,
	SK_DigsChar,
	SK_DoTaunt,
	SK_DigsMoreInfoMenu,
	SK_SwapWeaponBank,
	SK_SelectWeapon1,
	SK_SelectWeapon2,
	SK_SelectWeapon3,
	SK_SelectWeapon4,
	SK_DoVoIP,
	SK_SelectNextWeapon
};

enum EPlayerViewRotationMode
{
	PLAYERVIEW_Default,
	PLAYERVIEW_PitchOnly,
	PLAYERVIEW_YawOnly
};

enum ESkewPitchStyle
{
	SPitch_None,
	SPitch_XZ,
	SPitch_ZX
};

enum ESkewYawRule
{
	SYaw_None,
	SYaw_XY,
	SYaw_YX
};

enum ESkewRollRule
{
	SRoll_None,
	SRoll_YZ,
	SRoll_ZY
};

enum EVoIP_State
{
	VoIP_Disabled,
	VoIP_Muted,
	VoIP_Talking,
	VoIP_Silent
};

enum EConsole_Dialog
{
	ECD_None,
	ECD_Test,
	ECD_Custom,
	ECD_PleaseWait,
	ECD_WaitingForResponse,
	ECD_SignedOut,
	ECD_DeviceRemoved,
	ECD_DLCDeviceRemoved,
	ECD_ControllerDisconnected,
	ECD_NetworkLost,
	ECD_DeviceInsufficientSpace,
	ECD_NoDevice,
	ECD_NoProfile,
	ECD_CorruptFile,
	ECD_ReachedLVL40,
	ECD_OverdriveScrewYou,
	ECD_OverdriveGood,
	ECD_Overdrive,
	ECD_ChatRestrict,
	ECD_QuitGameConfirm,
	ECD_QuitGameConfirmHost,
	ECD_QuitGameConfirmMP,
	ECD_QuitGameConfirmHostMP,
	ECD_KickGameConfirm,
	ECD_CouldNotChangeTeam,
	ECD_GameBrowserFilterType,
	ECD_GameBrowserNoServers,
	ECD_LeaderboardError,
	ECD_JoinRoomFailedReason_RoomFull,
	ECD_JoinRoomFailedReason_NoSuchRoom,
	ECD_JoinRoomFailedReason_RejectedByHost,
	ECD_JoinRoomFailedReason_HostTimedOut,
	ECD_JoinRoomFailedReason_Unknown,
	ECD_JoinRoomFailedReason_Blocked,
	ECD_JoinRoomFailedReason_VersionMismatch,
	ECD_JoinRoomFailedReason_AlreadyInRoom,
	ECD_JoinRoomFailedReason_DlcMapNotFound,
	ECD_ShutdownReason_Kickedout,
	ECD_ShutdownReason_RoomDestroyed,
	ECD_ShutdownReason_Disconnected,
	ECD_ShutdownReason_DisconnectedPoorConnection,
	ECD_ShutdownReason_NetworkError,
	ECD_ShutdownReason_OutOfMemory,
	ECD_ShutdownReason_TimedOut,
	ECD_ShutdownReason_ConnectionTimedOut,
	ECD_ShutdownReason_ContentError,
	ECD_ShutdownReason_UserChanged,
	ECD_ShutdownReason_NotSignedIn,
	ECD_ShutdownReason_NotSignedInLeaderboard,
	ECD_ShutdownReason_NotPermittedOnline,
	ECD_ShutdownReason_SignedOut,
	ECD_ShutdownReason_SignedOutOfLIVE,
	ECD_ShutdownReason_SigningInFailed,
	ECD_ShutdownReason_ParentalControlRestrictions,
	ECD_ShutdownReason_FailedToHost,
	ECD_ShutdownReason_NoService,
	ECD_ShutdownReason_Rejoining,
	ECD_ShutdownReason_VersionMismatch,
	ECD_ShutdownReason_VACBanned,
	ECD_DirtyCustomization,
	ECD_ReturnToMultiMenu,
	ECD_PrivilegeChanged,
	ECD_CorruptDLC,
	ECD_CheatConfirm,
	ECD_NewExtrasUnlocked,
	ECD_CorruptContinueNoSave,
	ECD_NewDlcInstalled,
	ECD_GuestProfile,
	ECD_DlcSaveGameMapNotFound,
	ECD_PSNStoreQuitConfirm,
	ECD_ShutdownReason_DlcMapNotFound,
	ECD_DeviceRemovedFatal,
	ECD_DLCDownloadNotifcation,
	ECD_DLCRemovedNotifcation,
	ECD_FOVChangeWarning
};

enum ELeadboardSortType
{
	LST_All,
	LST_Friends,
	LST_Neighbourhood
};

enum EMatchResult
{
	MR_WIN,
	MR_TIE,
	MR_LOSE,
	MR_FAIL
};

enum EMPStatistics
{
	S_NONE,
	S_CHALLENGE,
	S_KILLS,
	S_DEATHS,
	S_SUICIDE,
	S_MELEEKILLS,
	S_KILLSTREAK,
	S_MULTIKILL,
	S_HIGHESTCOMBOKILL,
	S_DEATHMATCHWINS,
	S_DEATHMATCHLOSSES,
	S_TEAMDEATHMATCHWINS,
	S_TEAMDEATHMATCHLOSSES,
	S_CTBWINS,
	S_CTBLOSSES,
	S_CTBCAPTURES,
	S_CTBDEATHWITHBABE,
	S_CTBKILLSOFBABECARRIER,
	S_HOLODUKEUSE,
	S_HEADSHOT,
	S_HEADSHOTAGAINST,
	S_HEADSHOTKILL,
	S_HEADSHOTSKILLAGAINST,
	S_KILLATCAPTAINLASER,
	S_KILLATLASER,
	S_KILLDEVASTATOR,
	S_KILLENFORCER,
	S_KILLMACHINEGUN,
	S_KILLNUKE,
	S_KILLPIPEBOMB,
	S_KILLPISTOL,
	S_KILLRAILGUN,
	S_KILLRPG,
	S_KILLSHOTGUN,
	S_KILLMIGHTYFOOT,
	S_KILLFISTS,
	S_KILLTRIPMINE,
	S_KILLEXECUTION,
	S_AERIALKILLS,
	S_SECONDSINAIR,
	S_FALLINGDISTANCE,
	S_BEERCONSUMED,
	S_STEROIDSTAKEN,
	S_PISSESTAKEN,
	S_FROZEN,
	S_SHRUNK,
	S_DUKEVISION,
	S_SHOTATCAPTAINLASER,
	S_SHOTATLASER,
	S_SHOTPIPEBOMB,
	S_SHOTDEVASTATOR,
	S_SHOTPISTOL,
	S_SHOTENFORCERGUN,
	S_SHOTFREEZER,
	S_SHOTTRIPMINE,
	S_SHOTRIPPER,
	S_SHOTNUKE,
	S_SHOTRAILGUN,
	S_SHOTRPG,
	S_SHOTSHOTGUN,
	S_SHOTSHRINKER,
	S_KILLHEADATCAPTAINLASER,
	S_KILLHEADATLASER,
	S_KILLHEADDEVASTATOR,
	S_KILLHEADENFORCER,
	S_KILLHEADMACHINEGUN,
	S_KILLHEADNUKE,
	S_KILLHEADPIPEBOMB,
	S_KILLHEADPISTOL,
	S_KILLHEADRAILGUN,
	S_KILLHEADRPG,
	S_KILLHEADSHOTGUN,
	S_KILLHEADMIGHTYFOOT,
	S_KILLHEADFISTS,
	S_KILLHEADTRIPMINE,
	S_KILLHEADEXECUTION,
	S_FROZESOMEONE,
	S_FROZENEXECUTION,
	S_SHRANKSOMEONE,
	S_SQUISHEXECUTION,
	S_MULTIKILLPIPEBOMB,
	S_MULTIKILLTRIPMINE,
	S_DUKEVISIONTIME,
	S_SPRINTTIME,
	S_SPRINTEDDISTANCE,
	S_JUMP,
	S_DUCKTIME,
	S_JETPACKTIME,
	S_CIGAR,
	S_GROWN,
	S_UNFROZEN,
	S_FROZENDEATHMELEE,
	S_SQUISHED,
	S_SUICIDEFALL,
	S_SUICIDERPG,
	S_SUICIDEPIPEBOMB,
	S_SUICIDEDEVASTATOR,
	S_SUICIDETRIPMINE,
	S_DMKILLS,
	S_DMDEATHS,
	S_DMLAST,
	S_DMSUICIDE,
	S_TDMKILLS,
	S_TDMDEATHS,
	S_TDMTOPWINNER,
	S_TDMBOTTOMWINNER,
	S_TDMTOPLOSER,
	S_TDMBOTTOMLOSER,
	S_TDMSUICIDE,
	S_HTTKWINS,
	S_HTTKLOSSES,
	S_HTTKKILLS,
	S_HTTKDEATHS,
	S_KILLEDWHILEPISSING,
	S_KILLEDPISSER,
	S_CTBKILLS,
	S_CTBDEATHS,
	S_STEROIDKILLS,
	S_AIRKILLS,
	S_BEERCONSUMEDHTTK,
	S_NODEATHS,
	S_DUKEVISIONKILL,
	S_CTBSUICIDE,
	S_CTBKILLSWITHBABE,
	S_CTBFROZENWITHBABE,
	S_CTBSHRUNKWITHBABE,
	S_MOSTCAPTURESINMATCH,
	S_WINNINGCAPTURES,
	S_BABERETURNS,
	S_DIEDWHILEDRINKINGBEER,
	S_DOWEIGHTS,
	S_KILLASSIST,
	S_ROCKETJUMP,
	S_EGOAWARDS,
	S_LOCKEDONKILLS,
	S_DISMEMBERMENTKILLS,
	S_FAKE,
	S_EXPLODEDJETPACKS,
	S_SHOTFISTS,
	S_SHOTBABEGUN,
	S_LEVELBUFFEREXP,
	S_TEABAG,
	S_UNIQUEHEADSHOTS,
	S_SUICIDEWITHBABE,
	S_DISTANCETRAVELLED,
	S_HTTKTOPLOSER,
	S_HTTKBOTTOMLOSER,
	S_HTTKPOINTS,
	S_HTTKMOSTPOINTS,
	S_HTTKMOSTSPECIALPOINTS,
	S_HTTKTAKEHILLFROMENEMY,
	S_HTTKCONTROLKILLS,
	S_TDMMOSTKILLS,
	S_DMPLAYTIME,
	S_TDMPLAYTIME,
	S_HTTKPLAYTIME,
	S_CTBPLAYTIME,
	S_KILL5MELEEINMATCH,
	S_KILL5STEROIDSINMATCH,
	S_KILL4RPG,
	S_KILL5TRIPMINEINMATCH,
	S_KILL5PIPEBOMBINMATCH,
	S_EXPLODINGBARRELKILLS,
	S_DISHWASHER,
	S_MICROWAVE,
	S_DOUBLEMICROWAVE,
	S_TAUNT,
	S_HOLOKILL,
	S_KILLHOLO,
	S_INVINCIBILITYKILL,
	S_DOUBLEDAMAGEKILL,
	S_SUBSTANCEABUSE,
	S_DOUBLEDAMAGEINVINCIBILITY,
	S_KILLSTREAK5,
	S_JUMPPADKILL,
	S_SHRUNKENSHRUNKKILL,
	S_JUMPOVERRPG,
	S_LIMBO,
	S_JUMPPADUSE,
	S_TEAMKILL,
	S_KILLEVERYONE,
	S_SUICIDEENFORCER,
	S_SUICIDEBARREL,
	S_GROWFAIL,
	S_ELECTROCUTION,
	S_SUICIDESTOVE,
	S_NOFUELSUICIDE,
	S_FROZENEXPLODINGBARRELKILLS,
	S_OUTMANEUVERENFORCERROCKETS,
	S_SHOTGUNKILLSOMEONEINJUMPPADFLIGHT,
	S_BEERTOUGHNESS,
	S_MIDAIRFREEZE,
	S_MIDAIRSHRINK,
	S_RAILGUNKILLSOMEONEINJUMPPADFLIGHT,
	S_RAILGUNKILLSHRUNK,
	S_KILLPISTOLMORNINGWOOD,
	S_DMWINSHIRT,
	S_DRUNKENFLYING,
	S_HOLLYWOODKILLS,
	S_200FOOTPIPEBOMBKILL,
	S_OVERKILL,
	S_JETPACKMELEE,
	S_KILLWHENDEAD,
	S_SAFARI,
	S_RUNNINGMAN,
	S_CONDIMENTS,
	S_THAWEDKILL,
	S_HTTKDANCE,
	S_HOTPOTATOE,
	S_KILLGIANT,
	S_RPGMASTER,
	S_HTTKORGE,
	S_REVENGE,
	S_SECRETMAP0,
	S_SECRETMAP1,
	S_SECRETMAP2,
	S_SECRETMAP3,
	S_SECRETMAP4,
	S_SECRETMAP5,
	S_SECRETMAP6,
	S_SECRETMAP7,
	S_SECRETMAP8,
	S_SECRETMAP9,
	S_SECRETMAP10,
	S_GRAFFIMAP0,
	S_GRAFFIMAP1,
	S_GRAFFIMAP2,
	S_GRAFFIMAP3,
	S_GRAFFIMAP4,
	S_GRAFFIMAP5,
	S_GRAFFIMAP6,
	S_GRAFFIMAP7,
	S_GRAFFIMAP8,
	S_GRAFFIMAP9,
	S_GRAFFIMAP10,
	S_STICKMINEKILLS,
	S_HTTKCONTROLKILL,
	S_KILLASSISTTDM,
	S_TEAMCHANGESUICIDE,
	S_LEVEL,
	S_DLCSTAT0,
	S_DLCSTAT1,
	S_DLCSTAT2,
	S_DLCSTAT3,
	S_DLCSTAT4,
	S_DLCSTAT5,
	S_DLCSTAT6,
	S_DLCSTAT7,
	S_DLCSTAT8,
	S_DLCSTAT9
};

enum EChallengeStatus
{
	CS_Unknown,
	CS_New,
	CS_Hide,
	CS_Show
};

enum EChallengeCustomizeCategory
{
	CCC_None,
	CCC_Digs,
	CCC_Hat,
	CCC_Sunglasses,
	CCC_Shirt,
	CCC_ShirtLogo,
	CCC_ShirtColour,
	CCC_Title
};

enum EPreorderGroup
{
	POG_All,
	POG_Developers,
	POG_Gamestop_USA,
	POG_Stripper_Other
};

enum EPatchEditMode
{
	PEM_Normal,
	PEM_Pipe,
	PEM_Terrain
};

struct Vector2D
{
	var() config float X;
	var() config float Y;
};

struct Vector
{
	var() config float X;
	var() config float Y;
	var() config float Z;
};

struct Plane
{
	var() config float X;
	var() config float Y;
	var() config float Z;
	var() config float W;
};

struct Range
{
	var() config float Min;
	var() config float Max;
};

struct RangeVector
{
	var() config Range X;
	var() config Range Y;
	var() config Range Z;
};

struct Matrix
{
	var() Plane XPlane;
	var() Plane YPlane;
	var() Plane ZPlane;
	var() Plane WPlane;
};

struct Rotator
{
	var() config int Pitch;
	var() config int Yaw;
	var() config int Roll;
};

struct Coords
{
	var() config Vector Origin;
	var() config Vector XAxis;
	var() config Vector YAxis;
	var() config Vector ZAxis;
};

struct Quat
{
	var() config float X;
	var() config float Y;
	var() config float Z;
	var() config float W;
};

struct Scale
{
	enum ESheerAxis
	{
		SHEER_None,
		SHEER_XY,
		SHEER_XZ,
		SHEER_YX,
		SHEER_YZ,
		SHEER_ZX,
		SHEER_ZY
	};

	var() config Vector Scale;
	var() config float SheerRate;
	var() config Object.Scale.ESheerAxis SheerAxis;
};

struct Color
{
	var() config byte R;
	var() config byte G;
	var() config byte B;
	var() config byte A;
};

struct Box
{
	var Vector Min;
	var Vector Max;
	var byte IsValid;
};

struct SSmackerState
{
	var() const noexport string Filename "Path of movie, relative to ..\\Textures\\bik\\";
	var() noexport float FrameDelay "Seconds to delay between frames. 0 = Use Smacker settings";
	var() float _Time;
	var() const noexport float Volume "Volume of the audio for this movie (0.0 to 1.0).";
	var() const noexport int CurrentFrame "Current frame index the Smacker is on";
	var() bool bRestartOnLoad;
	var() noexport bool bSpool "Spool from disk?";
	var() noexport bool bLoop "Loop Smacker?";
	var() noexport bool bPause "Is the Smacker currently paused?";
	var() noexport bool bUseAlpha "Use alpha if available.";
	var() noexport bool bUpdateWhenNotVisible "If true, smacker will update even when it is not being rendered.";
	var bool _bInterlaced;
	var bool _bDoubled;
	var bool _bCentered;
	var() noexport bool bMenuSmack "Never pause in menus?";
	var bool _bYFlipped;
};

struct SAnimFlags
{
	var() bool bLoop;
	var() bool bNoLoopEnd;
	var() bool bFade;
	var() bool bNoRemove;
	var() bool bLoopMovement;
	var() bool bInterrupt;
	var() bool bEarlyEnd;
	var() bool bAdjustStart;
};

struct SAnimInfo
{
	var() noexport SAnimFlags Flags "Various extra properties that can be applied to the animation.";
	var() noexport name Animation "The specific animation to play. If left blank, will stop animation on the specified channel.";
	var() noexport int Channel "The channel to play the animation on. 0 is default.";
	var() noexport float Rate "Rate to play the animation at. If left as 0.0, will default to 1.0";
	var() noexport float TweenTime "Tween time to use to transition from the previous anim to this one. 0.0 will instantly snap to the new animation.";
};

struct AnimChanInfo
{
	var() bool bValid;
	var() bool bLoop;
	var() bool bTween;
	var() bool bIsGroup;
	var() bool bEventEnabled;
	var() int id;
	var() int RefId;
	var() name Sequence;
	var() name NodeName;
	var() float Rate;
	var() int BlendOp;
	var() float Blend;
	var() float FrameScale;
};

struct EventInfo
{
	var() string EventString;
	var() name EventAnim;
};

struct SAnimEndInfo
{
	var int Channel;
	var name AnimName;
	var int RefId;
	var name GroupName;
};

struct STraceHitResult
{
	var Actor Actor;
	var Vector Location;
	var Vector Normal;
	var int BSPSurfIndex;
	var name MeshBone;
	var MaterialEx Texture;
	var Vector UV;
	var float Time;
};

struct SHUDEffect
{
	var name Name;
	var MaterialEx Texture;
	var bool bFullScreen;
	var bool bUseAlphaGraph;
	var bool bUseAlphaRamp;
	var bool bUseAlphaWave;
	var bool bUseScaleXRamp;
	var bool bUseScaleYRamp;
	var bool bCenter;
	var bool bMaintainAspectRatio;
	var bool bTiled;
	var bool bFlipInMirrorMode;
	var bool bAlwaysFirst;
	var bool bLimited;
	var bool bClampAgeScale;
	var bool bUseViewportDims;
	var float MaxLife;
	var float UnderwaterTimescale;
	var float Lifetime;
	var float AlphaStart;
	var float AlphaEnd;
	var float AlphaMid;
	var float AlphaRampMid;
	var float AlphaGraph[10];
	var float AlphaGraphTime[10];
	var int AlphaGraphCount;
	var float AlphaWaveFreq;
	var float AlphaWaveAmp;
	var float AlphaWaveYOffset;
	var float Alpha;
	var float ScaleXStart;
	var float ScaleXEnd;
	var float ScaleXMid;
	var float ScaleXRampMid;
	var float ScaleX;
	var float ScaleYStart;
	var float ScaleYEnd;
	var float ScaleYMid;
	var float ScaleYRampMid;
	var float ScaleY;
	var float Rotation;
	var float RotationVelocity;
	var float RotationAcceleration;
	var float Depth;
	var float DepthScaleFar;
	var float DepthScaleNear;
	var Vector Location;
	var Vector Velocity;
	var Vector Acceleration;
	var float x1;
	var float y1;
	var float x2;
	var float y2;
	var array<Object.EVisionType> IgnoredVisionTypes;
};

struct SHUDPickupEventIcon
{
	var() noexport MaterialEx Success "Icon to display when pickup succeeds.";
	var() noexport MaterialEx Fail "Icon to display when pickup fails.";
};

struct SHUDAmmoClipIcon
{
	var() MaterialEx AmmoClip;
	var() float PixelsPerBullet;
};

struct SActorColor
{
	var() noexport Color ActorColor "Use this color by default for any ActorColor materials rendered on this actor matching this index.";
	var() noexport deprecated LightEx ActorColor_LightEx "If set, overrides ActorColor with the LightEx's current color.";
	var() noexport Vector ActorColor_LightExScale "R=X G=Y B=Z - Scales the resulting color from the ActorColor_lightEx by this amount (clamped from 0-255)";
	var() name id;
};

struct SActorColorID
{
	var() noexport SActorColor ActorColorItem "ActorColor information to be applied to the Index specified.";
	var() noexport int Index "Index in the ActorColorList array this should be applied to.";
};

struct SUpdateMaterialEx
{
	var() noexport int Index "The Index of the section to update.";
	var() noexport MaterialEx NewMaterialEx "Material to update in skin slot = Index.";
};

struct SSoundFilterProperty
{
	var() noexport string Name "Name of property to modify.";
	var() noexport float Value "Value to assign to property.";
};

struct SSoundFilter
{
	var() noexport Object.ESoundFilter Type "Type of filter to use.";
	var() noexport array<SSoundFilterProperty> Properties "Properties to use for filter.";
};

struct SSoundVolumePrefabEntry
{
	var() float Volume;
	var() float VolumeVariance;
};

struct SSoundFlags
{
	var() noexport bool bNoOverride "Whether this sound can be overridden if another sound on the same actor tries to play on the same channel.";
	var() bool bMenuSound;
	var() bool bNoFilter;
	var() noexport bool bNoOcclude "Whether this sound should be occluded or not.";
	var() noexport bool bNoAIHear "AI-controlled pawns are not able to hear this sound (and thus aren't alerted by them.";
	var() noexport bool bNoScale "Don't scale this sound (radius, pitch, volume).";
	var() noexport bool bSpoken "This sound was spoken. (Spoken sounds have the option to scale differently than non-spoken sounds.";
	var() noexport bool bPlayThroughListener "If set, this sound will played in the sound system by the person who heard it. For best effect, this should be used with the forced location override sound properties to spatialize in the world.";
	var() noexport bool bNoDoppler "If true, this sound will not doppler.";
	var() noexport bool bDialogSound "If true, this sound will scale it's volume by DialogVolume slider instead of SoundVolume slider.";
	var() noexport bool bNoReverb "If true, this sound will not use reverb.";
	var() noexport bool bEnableVis "If true, the visualization filter will be applied for spectral analysis.";
	var() noexport bool bSkipFlangePrevention "If true, flange prevention system will be circumvented, allowing a single sound to be played more than once in a single frame.";
	var() noexport bool bSkipSoundRadiusTest "If true, sound will play even if listener is outside of the sound radius.";
	var() noexport bool bIgnoreTimeDilation "If true, sound pitch will not change based on Level.TimeDilation";
};

struct SSoundFadeInfo
{
	var() noexport float FadeInDuration "Time in seconds that this sound should take to fade in to desired Volume.";
	var() noexport float FadeOutStartTime "Time in seconds at which this sound should start fading out to 0.0 volume.";
	var() noexport float FadeOutDuration "Time in seconds that it should take for this sound to fade out to 0.0 volume.";
	var() deprecated name FadeInEndCallback;
	var() deprecated name FadeOutEndCallback;
};

struct SSoundLocationOverride
{
	var() noexport bool bMakeRelativeForLocalPlayer "Change the OverrideType to SNDOVERRIDE_Relative if the sound player is a PlayerPawn.";
	var() noexport bool bMakeAbsoluteForActor "Change the OverrideType to SNDOVERRIDE_Absolute and Location3D to the sound actor's current location.";
	var() Object.ESoundLocationOverride OverrideType;
	var() Vector Location3D;
	var() Vector Velocity3D;
};

struct SAmbientSoundInfo
{
	var() noexport bool bNoScale "Don't scale this sound (radius, pitch, volume)";
	var() noexport name MixerGroupOverride "If not None, will be used as the Mixer group for ambient sounds played from this SAmbientSoundInfo.  If None, will use Ambience as the mixer group.";
	var() noexport array<Sound> AmbientSounds "Ambient sound to use when this activity occurs.";
	var() noexport int InnerRadius "Radius where the Ambient Sound will start falling off.";
	var() noexport int InnerRadiusVariance "Amount to vary inner radius by.";
	var() noexport int Radius "Radius to apply to the Ambient Sound. Specifies world units. Left as 0, will use current actor settings.";
	var() noexport int RadiusVariance "Amount to vary the radius by.";
	var() noexport Object.ESoundVolumePrefab VolumePrefab "Used in place of Volume/VolumeVariance when not set to SOUNDVOLUME_None";
	var() noexport byte Volume "Volume to play the Ambient Sound at. 128 is default. Left as 0, will use current actor settings.";
	var() noexport byte VolumeVariance "Amount to vary the volume by.";
	var() noexport byte Pitch "Pitch to play the Ambient Sound at. 64 is default. Left as 0, will use current actor settings.";
	var() noexport byte PitchVariance "Amount to vary the Pitch by.";
	var() noexport Object.EBitModifier SoundNoOccludeModifier "How to modify the SoundNoOcclude flag.";
	var() noexport Object.EBitModifier SoundNoDopplerModifier "How to modify the SoundNoDoppler flag.";
};

struct SSoundInfo
{
	var() noexport bool bAllowRepeats "If this is false, all sounds in the Sounds array will play before repeating a single one.";
	var() noexport bool bPlayAsAmbient "If this is true, the Slots array will be ignored and the sound will be played using AmbientSound.";
	var() noexport name MixerGroupOverride "If not None, will be used at the Mixer group for sounds played from this SSoundInfo.  If None, will use SoundFX or Ambience depending on the state of bPlayAsAmbient.";
	var() Sound SimpleSingleSound;
	var() noexport array<Sound> Sounds "List of sounds to play.";
	var() noexport byte SlotPriority "Higher priority will override lower priority sounds on this slot.";
	var() noexport Object.ESoundVolumePrefab VolumePrefab "Prefab volume group to use for this SoundInfo.  If SOUNDVOLUME_None, will use Volume & VolumeVariance.";
	var() noexport array<Object.ESoundSlot> Slots "Slots to choose from to play the sound in. Defeats the purpose if you have two slots that are the same.";
	var() noexport float Volume "Volume to play the sound at. (0.0 uses TransientSoundVolume. Value from 0-1).";
	var() noexport float VolumeVariance "Amount to vary the volume by.";
	var() noexport float InnerRadius "Radius where sound whill start falling off. (0.0 uses TransientSoundInnerRadius).";
	var() noexport float InnerRadiusVariance "Amount to vary the inner radius by.";
	var() noexport float Radius "Radius to play the sound in. Specifies world units. (0.0 uses TransientSoundRadius).";
	var() noexport float RadiusVariance "Amount to vary the radius by.";
	var() noexport float Pitch "Pitch to play the sound at. (0.0 uses TransientSoundPitch. 1.0 is default. <1.0 lowers pitch, >1.0 raises pitch.";
	var() noexport float PitchVariance "Amount to vary the pitch by.";
	var() SSoundFlags Flags;
	var() noexport SSoundLocationOverride SoundLocationOverride "Override spatialization of this sound?";
	var() noexport int Offset "Offset in bytes at which to start playback.";
	var() noexport float Delay "Time in seconds to delay before starting the sound.";
	var int SlotIndex;
	var int ForcedIndex;
	var() noexport SSoundFadeInfo SoundFadeInfo "How to fade this sound.";
	var() name SoundEndCallback;
	var array<Sound> PlayedSounds;
	var() noexport array<SSoundFilter> Filters "Filters to apply to this sound.";
};

struct SAmbientMusicInfo
{
	var() noexport string MusicFilename "Music to play.";
	var() noexport bool bLoop "Should this music automatically loop?";
	var() noexport float Volume "0.0 - 1.0.  Volume of the music.";
	var() noexport float CrossfadeTime "Time in seconds it takes to transition to this song if one is already playing.";
	var() noexport float Radius "Audible radius of the music.";
	var() noexport float StartTime "Offset in seconds to start.";
	var float EarlyEndTime;
	var() noexport deprecated name EndEvent "Event to trigger when this song ends.  bLoop must be set to false in order for this to work.";
};

struct SSoundVisData
{
	var const int Count;
	var const int Ptr;
};

struct SStreamInfo
{
	var bool bStereo;
	var bool b16bit;
	var float Volume;
	var float Pan;
	var float OffsetSeconds;
	var float LengthSeconds;
	var int DefaultPlaybackRate;
	var int PlaybackRate;
	var SSoundVisData VisData;
};

struct SCharacterSoundInfo
{
	var() noexport bool bAllowAnimRepeats "Only used in conjunction with AnimControllerEntries.  See bAllowRepeats on SSoundInfo for a description.";
	var() noexport name GroupName "Unique ID that identifies this CharacterVoicePack entry. This is what is you call for when you want to play a sound.";
	var() noexport name AffiliationName "ID to apply to this CharacterVoicePack entry that will associate it with other entries when doing ReplayThrottle checks. Allows you to have 3 stages of 'Gasp!', but throttle them all together.";
	var() noexport array<name> AnimControllerEntries "Entry in the character AnimationController used instead of SoundInfo if valid. Primarily for Dialog, where the anim controls the sound, but could be used for anything. For non-dynamic throttling, entry must match the literal animation name.";
	var() noexport SSoundInfo SoundInfo "The actual sound in the entry.";
	var() noexport float ReplayThrottle "Amount of time that must pass before this sound or it's affiliates can be played again. Setting to any negative value throttles by the duration of the sound played + the absolute value of the variable. -1.5 = duration of sound + 1.5 seconds.";
	var array<name> UsedAnimControllerEntries;
};

struct SMountPrefab
{
	var() noexport bool bDontActuallyMount "This will do all MountOnSpawnActivity except the mounting aspects (Set the tags, scale by drawscale, etc). MountOrigin and MountAngle will be used as offsets for the initial spawning location instead.";
	var() noexport bool bHideable "Allows the actor's bHidden flag to be toggled when the parent actor is triggered.";
	var() noexport bool bIndependentRotation "This actor doesn't follow the parent's rotation.";
	var() noexport bool bIndependentLocation "This actor doesn't follow the parent's location.";
	var() noexport bool bMatchParentLocation "If true, then match our parent's current location.";
	var() noexport bool bMatchParentRotation "If true, then match our parent's current rotation.";
	var() noexport bool bSurviveDismount "If actors can live through a dismount.";
	var() noexport bool bDontScaleByDrawScale "If the actor size should be adjusted by the Drawscale of the parent.";
	var() noexport bool bScaleByDrawScaleNonDefault "If true, this will scale the drawscale by the absolute DrawScale/3D of the parent, not the amount that the parent is drawscaled relative to *its* default. Requires bScaleByDrawScale to bet set.";
	var() noexport bool bTransformDrawScale3DChange "If true, the DrawScale3D of the parent will be transformed to this actor's rotation before applying.  Use at your own risk!!  This can cause weird skewing errors!!";
	var() noexport bool bTakeParentTag "Take the tag of the parent as its own.";
	var() noexport bool bTransferToCorpse "Only used when MountParent is a pawn.  Should this mounted actor be transfered to the Corpse?";
	var() noexport bool bDontSetOwner "When true, this Actor Owner will not be changed on Mount, otherwise we will set Owner to be MountParent.";
	var() noexport deprecated name MountParentTag "Tag of the parent to mount to. Usually used by an actor mounted on spawn.";
	var() noexport float DrawScaleOverride "If non zero, we'll use this at the mounted actors draw scale.";
	var() noexport name AppendToTag "If not none, additional name to append to object's current tag.";
	var() noexport name ForceTag "Force actor to have this tag.";
	var() noexport name ForceEvent "Force actor to have this event.";
	var() noexport name MountMeshItem "Item to mount to on the parent.";
	var() noexport Vector MountOrigin "Mount origin offset from our initial location.";
	var() noexport Vector MountOriginVariance "Amount to vary the origin offset by.";
	var() noexport Rotator MountAngles "Mount angles offset from our original rotation.";
	var() noexport Rotator MountAnglesVariance "Amount to vary the mount angles by.";
	var() noexport Object.EMountType MountType "Method of mounting to the parent.";
	var() noexport Object.EPhysics DismountPhysics "Physics to use when dismounted.";
};

struct SMountedActorPrefab
{
	var() noexport bool bSkipVerifySelf "Tell this actor not to verify itself upon spawning.";
	var() noexport class<Actor> SpawnClass "Class of the actor to mount. If this is blank, then just mount itself instead. Will require a MountParentTag to succeed.";
	var() noexport float SpawnChance "Percentage of chance that this actor will spawn. 0.0 is converted to 1.0 at startup. Anything less than 0.0 results in 0% chance.";
	var() noexport SMountPrefab MountPrefab "Settings for how this actor should be mounted.";
	var() noexport Object RenderObject "If this is not None, SetRenderObject will be called on the SpawnClass when spawned.";
	var() noexport float DrawScale "Set the drawScale of the spawned Actor";
};

struct SSpawnActorPrefab
{
	var() noexport class<Actor> SpawnClass "Class of actor to spawn.";
	var() noexport Object RenderObject "If this is not None, SetRenderObject will be called on the SpawnClass when spawned.";
	var() noexport float DrawScale "Set the drawScale of the spawned Actor";
	var() noexport float DrawScaleVariance "If something other than 0, the DrawScale will be varied by this amount";
	var() noexport Vector DrawScale3D "Set the DrawScale3D of the spawned Actor";
	var() noexport float SpawnChance "Percentage chance to spawn. 0.0 is converted to 1.0 at startup.";
	var() noexport int SpawnCopies "Number of times to spawn this type of actor. 0 is converted to 1 at startup.";
	var() noexport int SpawnCopiesVariance "Amount to vary the number of copies generated.";
	var() noexport bool bIgnorePawnAirCushion "If true the class spawned will be forced to ignore any pawn's air cloud.  If false, the class will use its default behavior.";
	var() noexport bool bDontScaleByDrawScale "If the actor size and offsets should be adjusted by the Drawscale of the parent.";
	var() noexport bool bScaleByDrawScaleNonDefault "If true, this will scale the drawscale by the absolute DrawScale/3D of the parent, not the amount that the parent is drawscaled relative to *its* default. Requires bScaleByDrawScale to bet set.";
	var() noexport bool bNoCollision "Turn off all collision.";
	var() noexport bool bFindSpot "If this is false, the spawned actor will NOT try to find a valid spot before spawning.  This is the default behavior";
	var() noexport bool bIgnoreParentRotation "Take the parent's rotation into account when setting rotation.";
	var() noexport bool bTakeParentCollisionSize "Take the collision size of actor spawning us.";
	var() noexport bool bTakeParentMounting "Copies mount information of parent to this actor.";
	var() noexport bool bTakeParentActorColors "Copies the actor color of parent to this actor.";
	var() noexport bool bTakeParentSkins "Copies the skins of the parent to this actor.";
	var() noexport Vector Offset "Amount to offset from the center of parent.";
	var() noexport Vector OffsetVariance "Amount to vary to offset from the center of the parent.";
	var() noexport Rotator Rotation "Initial rotation to give to this actor.";
	var() noexport Rotator RotationVariance "Amount to vary the initial rotation.";
	var() noexport name BoneName "If not None, Actor will be spawned relative to this bone.";
	var() noexport MotionPrefab MotionInfo "Information on the motion to apply to the actor(s) that are spawned.  If None, will be set to DefaultMotionPrefab on Actor.";
};

struct SPhysicsEffectSoundInfo
{
	var() Range InputRange;
	var() Range OutputPitchRange;
	var() Range OutputVolumeRange;
};

struct SMeshBoneToPartMapping
{
	var() name BoneName;
	var() Object.EPawnBodyPart Part;
	var() name BoneNameForDestroy;
};

struct SCorpseDestroyableBone
{
	var() name BoneName;
	var bool bAddToLimbCount;
	var() class<Corpse_LimbCap> LimbCapClass;
	var() SMountPrefab LimbCapMountInfo;
	var() class<dnHitFX_Spawners> DestroyedEffect;
	var() class<dnFriendFX_Spawners> FrozenDestroyedEffect;
	var() name ExplodeSound;
	var() name FrozenExplodeSound;
};

struct SCorpseGib
{
	var() name BoneName;
	var() array<name> ReqBones;
	var() Object RenderObject;
	var() float DrawScale;
	var() float DrawScaleVariance;
	var() Vector LocOffset;
	var() Rotator RotOffset;
	var() float Mass;
	var() float GibChance;
	var() bool bKDNoPawnInteractions;
	var() bool bExplodeOut;
	var() bool bNoBloodyMess;
	var() bool bIgnorePawnAirCushion;
	var() bool bStaticGib;
	var() class<SoftParticleSystem> GibBloodyMess;
};

struct SCorpseGibEffect
{
	var() class<SoftParticleSystem> ParticleEffect;
	var() name BoneName;
	var() Vector LocOffset;
	var() Rotator RotOffset;
};

struct SFloatVariance
{
	var() noexport float Value "The basic value which the variance is applied around.";
	var() noexport float Variance "Total amount of variance that can be applied around value. This is +/- half of this value on each side (EX: Variance=10... result is from -5 to 5).";
};

struct SIntVariance
{
	var() noexport int Value "The basic value which the variance is applied around.";
	var() noexport int Variance "Total amount of variance that can be applied around value. This is +/- half of this value on each side (EX: Variance=10... result is from -5 to 5).";
};

struct SDesiredCrush
{
	var() noexport Object.ECrushStyle DamageHow "Specifies who and how you want to issue damage to when crushing is being inflicted.";
	var() noexport SFloatVariance Damage "How much damage you want to inflict on an actor that is being crushed.";
	var() noexport SFloatVariance Rate "How frequently you want the damage to be inflicted once it's started.";
	var float Timer;
};

struct SViewShakeInfo
{
	var() noexport bool bNoLerp "If bNoLerp is true, then the view will snap to the new place, otherwise it will smoothly transition between them.";
	var() noexport bool bToggleSign "When true, this shake will always pick a negative value after picking a positive for the last update.. and vice versa.";
	var() noexport Object.EViewShakeStyle Style "Style of this shake.";
	var() noexport Object.EViewShakeFunction Function "Function for picking shake offset.";
	var() noexport deprecated Actor FalloffActor "Actor defining location for falloff calculations.";
	var() noexport float FalloffDistance "Max distance from FalloffActor for this shake to be noticeable.";
	var() noexport float ShakeDuration "Total time for this shake to exist.  Less than 0 means infinite.";
	var() noexport float ShakeFrequency "Amount of time between shake updates.";
	var() noexport int ShakeMagnitude "Maximum offset along desired rotation axis for this shake." "Values under 6000 recommended.";
	var() noexport int ShakeFullMagnitude "True maximum offset along desired rotation.  ShakeMagnitude will interpolate to this over time if ShakeFullMagnitudeTime is greater than zero.";
	var() noexport float ShakeFullMagnitudeTime "Time it takes for ShakeMagnitude to interpolate to ShakeFullMagnitude.";
	var() noexport name ShakeName "Friendly identifier for later lookup.";
};

struct SActiveViewShake
{
	var Actor FalloffActor;
	var float FalloffDistance;
	var name ShakeName;
	var int Flags;
	var float Duration;
	var float Frequency;
	var int Magnitude;
	var int FullMagnitude;
	var int Limit;
	var Rotator Result;
	var float Scalar;
	var float ScalarDelta;
	var float CenterScalar;
	var float CenterScalarDelta;
	var float FullMagnitudeAlpha;
	var float FullMagnitudeDelta;
};

struct SRumbleInfo
{
	var() name RumbleName;
	var() float RumbleDuration;
	var() noexport float RumbleLeftMagnitude "Low frequency motor intensity. 0 - 1";
	var() noexport float RumbleRightMagnitude "High frequency motor intensity. 0 - 1";
	var() deprecated Actor FalloffActor;
	var() float FalloffDistance;
};

struct SDistanceFog
{
	var() noexport Color Color "Color to use for distance fog.";
	var() noexport float Start "How far into the screen (in world units) the fog begins";
	var() noexport float End "How far into the screen (in world units) where the fog will be fully opaque";
	var() noexport float Opacity "Fog thickness when objects are at or near Fog End. 0 - 1.";
};

struct SGlobalHeightFog
{
	var() noexport Color Color "Color to use for height fog.";
	var() noexport float Top "Dist from origin for top of height fog plane.";
	var() noexport float DistToFullDensity "Distance at which fog is full density.";
	var() noexport float DepthToFullDensity "Depth at which fog is full density.";
};

struct SDistanceFogOverride
{
	var name OverrideGroupID;
	var SDistanceFog OverrideFog;
	var name OverrideModifier;
	var SDistanceFog DesiredFog;
	var name DesiredModifier;
};

struct SDesiredLocation
{
	var const bool bTemporal;
	var const bool bComplete;
	var() noexport bool bRelativeMotion "When true, the motion will be relative to the rotation of the actor. When mounted, uses MountAngles, otherwise simply the rotation of the actor." "NOTE: Incompatible with KeyframeDispatch. Use built in functionality of that class instead.";
	var() noexport Vector Target "Desired location to move to.";
	var() noexport Vector TargetVariance "Amount of random variance to apply to this target when we set it for real.";
	var const Vector RealTarget;
	var const Vector Start;
	var() noexport SFloatVariance Speed "When the Value parameter in this is > 0, then calculate TimeTotal based on the distance we need to go, and use TimeMid as a scaling value instead of a literal value. TimeTotal is completely ignored.";
	var() noexport Vector Rate "How fast to move to the desired location (use in place of specifying a time).";
	var() noexport float Exponent "Exponent value to use with DESIRED_Parabolic. 0-1 gives a bowl shape, 1+ gives a hill shape.";
	var() noexport float TimeTotal "How long to perform the DesiredLocation move.  if <= 0, will teleport instead of move.";
	var() noexport float TimeMid "Indicates what time is the 'middle' of the DesiredLocation time period. Used with Parabolic. When using Speed, this should be a value from 0-1 instead of a literal time.";
	var const float RealTimeMid;
	var const float Timer;
	var() noexport Object.EDesiredStyle Style "What method of movement to use when doing a DesiredLocation movement. Read KeyframeDispatch.UC for full description of Styles.";
	var() noexport Object.EDesiredStopStyle StyleStopped "How you want the actor doing this movement to react if it gets blocked by something in the middle of a move.";
	var() noexport SDesiredCrush CrushDamage "Crushing damage to inflict on anything being blocked by this actor during a move.";
	var() noexport deprecated name Event "Event you want to fire when this DesiredLocation finishes moving. This only happens when the move successfully completes.";
	var() noexport deprecated name EventAbort "Event you want to fire when this DesiredLocation aborts moving. This only happens when the move is aborted via the StleStopped methods.";
	var() noexport name FunctionComplete "Function to call when the movement is completed properly. Like a CallbackTimer, no parameters allowed. This is highly unlikely to be useful to non-programmers.";
	var() noexport name FunctionAbort "Function to call when the movement is aborted. Like a CallbackTimer, no paramters allowed. This is highly unlikely to be useful to non-programmers.";
};

struct SDesiredRotationAll
{
	var() noexport bool bShortestDist "Use shortest distance logic?  Stuff like -32760 to 32760 will only rotate 18 units instead of 65518.";
	var() noexport Rotator Target "Desired rotation to rotate to.";
	var() noexport Rotator Rate "Rate to move towards the DesiredRotation(use in place of specifying a time).";
	var() noexport float Exponent "Exponent value to use with DESIRED_Parabolic. 0-1 gives a bowl shape, 1+ gives a hill shape.";
	var() noexport float TimeTotal "How long to perform the DesiredRotation move.";
	var() noexport float TimeMid "Indicates what time is the 'middle' of the DesiredRotation time period. Used with Parabolic.";
	var() noexport Object.EDesiredStyle Style "What method of movement to use when doing a DesiredRotation movement. Read KeyframeDispatch.UC for full description of Styles and their effects. READ IT!! NOW!!";
	var() noexport Object.EDesiredRotationStopStyle StyleStopped "How you want the actor doing this movement to react if it gets blocked by something in the middle of a move.";
	var() noexport SDesiredCrush CrushDamage "Crushing damage to inflict on anything being blocked by this actor during a move.";
	var() noexport deprecated name Event "Event you want to fire when this DesiredRotation finishes moving. This only happens when the move successfully completes. This gets applied to the *yaw* only. If you need finer control, assign each axis individually.";
	var() noexport name FunctionComplete "Function to call when the movement is completed properly. Like a CallbackTimer, no parameters allowed. This is highly unlikely to be useful to non-programmers. This gets applied to the *yaw* only.";
	var() noexport deprecated name EventAbort "Event you want to fire when this DesiredRotation aborts moving.  This only happens when the StyleStopped == DESIREDSTOP_Abort and the Actor is blocked during the move. This gets applied to the *yaw* only.";
	var() noexport name FunctionAbort "Function to call when the movement is aborted. Like a CallbackTimer, no paramters allowed. This is highly unlikely to be useful to non-programmers. This gets applied to the *yaw* only.";
};

struct SDesiredRotationAxis
{
	var const bool bTemporal;
	var const bool bComplete;
	var const bool bLinked;
	var() const bool bShortestDist;
	var() noexport int Target "Desired rotation axis value to rotate to.";
	var const int RealTarget;
	var const int Start;
	var const int Delta;
	var() noexport int Rate "Rate to move towards the DesiredRotation(use in place of specifying a time).";
	var() noexport float Exponent "Exponent value to use with DESIRED_Parabolic. 0-1 gives a bowl shape, 1+ gives a hill shape.";
	var() noexport float TimeTotal "How long to perform the DesiredRotation move.";
	var() noexport float TimeMid "Indicates what time is the 'middle' of the DesiredRotation time period. Used with Parabolic.";
	var const float Timer;
	var() noexport Object.EDesiredStyle Style "What method of movement to use when doing a DesiredRotation movement. Read KeyframeDispatch.UC for full description of Styles. READ IT!! NOW!!";
	var() noexport Object.EDesiredRotationStopStyle StyleStopped "How you want the actor doing this movement to react if it gets blocked by something in the middle of a move.";
	var() noexport SDesiredCrush CrushDamage "Crushing damage to inflict on anything being blocked by this actor during a move.";
	var() noexport deprecated name Event "Event you want to fire when this DesiredRotation finishes moving. This only happens when the move successfully completes.";
	var() noexport name FunctionComplete "Function to call when the movement is completed properly. Like a CallbackTimer, no parameters allowed. This is highly unlikely to be useful to non-programmers.";
	var() noexport deprecated name EventAbort "Event you want to fire when this DesiredRotation aborts moving.  This only happens when the StyleStopped == DESIREDSTOP_Abort and the Actor is blocked during the move.";
	var() noexport name FunctionAbort "Function to call when the movement is aborted. Like a CallbackTimer, no paramters allowed. This is highly unlikely to be useful to non-programmers.";
};

struct SVehicleGearSounds
{
	var() noexport bool bStopOnFootOff "Set this to true if you want to stop the upshift/downshift sound when playing one of the footoff sounds.";
	var() noexport Object.EStopSoundRule StopOnFootOffRule "Stop sound rule to use for stopping sounds when bStopOnFootOff is true.";
	var() noexport name UpshiftLoopName "VoicePack entry to play when we up shift into this gear.";
	var() noexport name DownshiftLoopName "VoicePack entry to play when we down shift into this gear.";
	var() noexport name FootOffSlowName "VoicePack entry to play when we release the gas during the low-end of the gear.";
	var() noexport name FootOffFastName "VoicePack entry to play when we release the gas during the high-end of the gear.";
};

struct SVehiclePhysicsMotorProperties
{
	var() float MotorConstants[6];
};

struct SVehiclePhysicsAxleProperties
{
	var() float MomentOfInertia;
};

struct SVehiclePhysicsGearboxProperties
{
	var() array<float> GearRatios;
	var() float EngagedClutch;
	var() float DisengagedClutch;
};

struct SVehiclePhysicsWheelProperties
{
	var() float SteerRatio;
	var() float BrakeRatio;
	var() float HandbrakeRatio;
	var() float FrictionStatic;
	var() float FrictionDynamic;
	var() float FrictionRolling;
	var() float StiffnessLateral;
	var() float StiffnessLongitudinal;
	var() float Restitution;
	var() float SuspensionSpringLength;
	var() float SuspensionSpringDamping;
	var() float SuspensionSpringStiffness;
	var() float Radius;
	var() float Mass;
	var() class<Actor> WheelClass;
};

struct SScreenFlash
{
	var() noexport bool bAlwaysTick "By default flashes won't update if the game is currently paused. If TRUE, this flash will continue even in a paused game.";
	var() noexport bool bOnlyReplace "This flash will only allow itself to be added if it's replacing an existing one.";
	var() noexport bool bResumeFlash "When true, the flash will set it's start color to the current color of the Flash it's replacing. Nothing is done if it's not replacing anything.";
	var() noexport int Priority "Specifies the priority of a flash. In order of increasing importance, thus drawing higher values 'last'.";
	var() noexport int ReplaceMin "Flashes must have a ReplaceMin >= to the current flashes's ReplaceMin in order to replace the current flash. If 0, it will automatically replace";
	var() noexport name FlashID "Unique ID so you can access this flash directly (for removal, etc).";
	var() noexport Object.EScreenFlash FlashType "If the flash has a liftime, dictates what it does once the lifetime has exprired.";
	var() noexport Object.ERenderStyle FlashStyle "Drawing style to use for the screenflash. If a style is unsupported, it defaults to Alpha.";
	var() noexport Color ColorStart "Initial Color of the flash when applied.";
	var() noexport Color ColorMid "Color of the flash when it's reached the midpoint in it's lifetime.";
	var() noexport Color ColorEnd "Color of the flash when it's reached the end of it's lifetime.";
	var() noexport float Lifetime "How long the color takes to flash.";
	var() noexport float LifetimeMid "Midpoint time of the lifetime. If 0.0, ColorMid is ignored.";
	var float LifetimeCurrent;
	var Color ColorCurrent;
	var() noexport deprecated name FlashEvent "Event to trigger when the flash reaches the end of it's lifetime properly.";
	var() noexport name FlashFunction "Function to call when the flash reaches the end of it's lifetime properly.";
	var() noexport deprecated Actor FlashFuncActor "Actor to call the FlashFunction on. Defaults to the player if no actor specified.";
};

struct SSpecialKeyInfo
{
	var noexport string Command "Command associated with this special key.";
	var noexport array<int> BoundKeys "Indeces of the keys that are bound to this SpecialKey.  Initialized on HUD creation and when exiting the control options menu.";
};

struct SMuzzleInfo
{
	var() name MuzzleFireStartAnim;
	var() name MuzzleFireAnim;
	var() name MuzzleFireStopAnim;
	var() class<SoftParticleSystem> MuzzleFlashClass;
	var() name MuzzleBoneName;
	var() Rotator MuzzleMountAngles;
	var name ShellEjectionBoneName;
	var Vector ShellEjectionDir;
	var Vector ShellEjectionVariance;
	var float ShellEjectionForce;
};

struct SFireProjectile
{
	var float Time;
	var Vector Location;
	var int PitchYaw;
};

struct SNukeCountdownInfo
{
	var name SoundName;
	var BumpShader Material;
	var SmackerTexture Smacker;
};

struct STraceFlags
{
	var() bool bTraceActors;
	var() bool bMeshAccurate;
	var() bool bShotTrace;
	var() bool bUseTrace;
	var() bool bTraceTexture;
	var() bool bAbortFirstHit;
	var() bool bPawnsOnly;
	var() bool bNoFudge;
	var() bool bKarmaOnly;
	var() bool bNoParticles;
	var() bool bOnlyDynamic;
	var() bool bOnlyBlocking;
	var() bool bCameraTrace;
	var() bool bIgnoreAITransparent;
	var() bool bBeamTrace;
	var() bool bAntiMeqon;
	var() bool bIgnoreWorld;
	var() bool bIgnoreOthers;
};

struct SDamageCategoryEffect
{
	var() noexport bool bMountHitFX "If true we will mount the hitFX. Note that the hitFX can not be a friend system.";
	var() noexport class<SoftParticleSystem> Effect "Effect to spawn when this material is shot by a bullet.";
	var() noexport float EffectScale "If greater than 0, this will be used to scale SystemSizeScale of the Effect.";
	var() noexport float FakeLightIntensity "Control the fake light intensity for this particle system and its friends";
	var() noexport float LifetimeOverride "Particle system lifetime override";
	var() noexport class<PhysicsAction> Action "Spawn physics action. Think explosive barrels.";
	var() noexport class<dnDecal_Delayed> EffectDecal "Decal to apply when the surface is shot.";
	var() SSoundInfo Sound;
};

struct SDestructibleBuildingPart
{
	var() StaticMesh StaticMesh;
	var() Vector Location;
	var() Rotator Rotation;
	var() Vector Scale;
	var() Object.ESkewPitchStyle SkewPitch;
	var() Object.ESkewYawRule SkewYaw;
	var() Object.ESkewRollRule SkewRoll;
	var() int RandomSeed;
	var() float OverrideSurvivalChance;
	var() float OverrideCollisionChance;
	var() float OverrideDensity;
	var() float Mass;
	var() class<PhysicsMaterial> PhysicsMaterial;
	var() bool bDefaultInteractionClass;
};

struct SDestructibleBuildingParticleEffect
{
	var() class<dnFriendFX_Spawners> SpawnerClass;
	var() Vector LocationOffset;
	var() Rotator RotationOffset;
	var() float Scale;
};

struct SDestructibleBuildingHUDEffect
{
	var() class<HUDEffects> EffectClass;
	var() Vector LocationOffset;
	var() float Scale;
};

struct MapEntry
{
	var string MapName;
	var string Mutator;
	var string GameType;
};

struct PlayListEntry
{
	var string EntryName;
	var array<MapEntry> Entry;
	var int id;
	var bool IsInfinite;
	var int MaxPlayers;
	var bool IsRandom;
};

struct AvailableMaps
{
	var int id;
	var bool IsDLC;
	var string MapName;
	var array<string> SupportedGameTypes;
};

struct AvailableGameTypes
{
	var int id;
	var string EntryName;
	var int PlayerStep;
	var bool bUseWinCondition;
	var int WinConditionMin;
	var int WinConditionMax;
	var int WinConditionStep;
	var int WinConditionDefault;
	var string WinConditionText;
	var string WinConditionOptionName;
	var array<string> ExcludedMutators;
	var bool bUIExclude;
};

struct AvailableMutators
{
	var int id;
	var string EntryName;
};

struct SAgentAccountId
{
	var int LowInt;
	var int HighInt;
};

struct SAgentCreateGameOptions
{
	var PlayListEntry Playlist;
	var bool IsPrivate;
};

struct SAgentSearchGameOptions
{
	var int Map;
	var int Mutator;
	var int GameType;
	var int Playlist;
	var int PlayerCount;
};

struct SAgentSearchGameResult
{
	var int Ping;
	var int Map;
	var int Mutator;
	var int GameType;
	var int Playlist;
	var int PlayerCount;
};

struct SAgentPlayer
{
	var string PlayerName;
	var int PlayerRef;
	var bool IsReady;
	var int Team;
	var Object.EVoIP_State VoipState;
	var int HostPing;
};

struct SFoliageDef
{
	var MaterialEx Material;
	var float SizeScale;
	var float AnimateSpeed;
	var float FadeDist1;
	var float FadeDist2;
	var float NormalAlpha;
	var float SelfShadow;
	var float AlphaRef;
	var float FoliageSize1;
	var float FoliageSize2;
	var float PaintRateScale;
	var bool bMultiSelected;
};

struct OverlayBumpShaderInfo
{
	var() noexport BumpShader Shader "Overlay BumpShader.";
	var() MaterialEx Cube;
	var() noexport Vector UVScale "xy are uv scale; z is overall (programmatic) weight for effect.";
};

struct SAnimationEnumeration
{
	var() name Animation;
	var() Mesh Mesh;
};

var private native const int ObjectInternal[6];
var() native const editconst Object Outer;
var native const int ObjectFlags;
var() native const editconst name Name;
var() native const editconst Class Class;

static final function AddAnimationEnumeration(out array<SAnimationEnumeration> References, name Animation, Mesh Mesh)
{
	local int i;

	i = References.Add(1);
	References[i].Animation = Animation;
	References[i].Mesh = Mesh;
	return;
}

// Export UObject::execNot_PreBool(FFrame&, void* const)
native(145) static final preoperator bool !(bool A)
{
	//native.A;	
}

// Export UObject::execEqualEqual_BoolBool(FFrame&, void* const)
native(146) static final operator(24) bool ==(bool A, bool B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execNotEqual_BoolBool(FFrame&, void* const)
native(147) static final operator(26) bool !=(bool A, bool B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAndAnd_BoolBool(FFrame&, void* const)
native(148) static final operator(30) bool &&(bool A, skip bool B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execXorXor_BoolBool(FFrame&, void* const)
native(149) static final operator(30) bool ^^(bool A, bool B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execOrOr_BoolBool(FFrame&, void* const)
native(150) static final operator(32) bool ||(bool A, skip bool B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execMultiplyEqual_ByteByte(FFrame&, void* const)
native(151) static final operator(34) byte *=(out byte A, byte B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execDivideEqual_ByteByte(FFrame&, void* const)
native(152) static final operator(34) byte /=(out byte A, byte B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAddEqual_ByteByte(FFrame&, void* const)
native(153) static final operator(34) byte +=(out byte A, byte B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execSubtractEqual_ByteByte(FFrame&, void* const)
native(154) static final operator(34) byte -=(out byte A, byte B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAddAdd_PreByte(FFrame&, void* const)
native(155) static final preoperator byte ++(out byte A)
{
	//native.A;	
}

// Export UObject::execSubtractSubtract_PreByte(FFrame&, void* const)
native(156) static final preoperator byte --(out byte A)
{
	//native.A;	
}

// Export UObject::execAddAdd_Byte(FFrame&, void* const)
native(157) static final postoperator byte ++(out byte A)
{
	//native.A;	
}

// Export UObject::execSubtractSubtract_Byte(FFrame&, void* const)
native(158) static final postoperator byte --(out byte A)
{
	//native.A;	
}

// Export UObject::execBVar(FFrame&, void* const)
native(159) static final function byte BVar(byte Value, byte Variance, optional bool bLimitValue)
{
	//native.Value;
	//native.Variance;
	//native.bLimitValue;	
}

// Export UObject::execComplement_PreInt(FFrame&, void* const)
native(160) static final preoperator int ~(int A)
{
	//native.A;	
}

// Export UObject::execSubtract_PreInt(FFrame&, void* const)
native(161) static final preoperator int -(int A)
{
	//native.A;	
}

// Export UObject::execMultiply_IntInt(FFrame&, void* const)
native(162) static final operator(16) int *(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execDivide_IntInt(FFrame&, void* const)
native(163) static final operator(16) int /(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execPercent_IntInt(FFrame&, void* const)
native(164) static final operator(16) int %(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAdd_IntInt(FFrame&, void* const)
native(165) static final operator(20) int +(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execSubtract_IntInt(FFrame&, void* const)
native(166) static final operator(20) int -(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execLessLess_IntInt(FFrame&, void* const)
native(167) static final operator(22) int <<(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execGreaterGreater_IntInt(FFrame&, void* const)
native(168) static final operator(22) int >>(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execLess_IntInt(FFrame&, void* const)
native(169) static final operator(24) bool <(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execGreater_IntInt(FFrame&, void* const)
native(170) static final operator(24) bool >(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execLessEqual_IntInt(FFrame&, void* const)
native(171) static final operator(24) bool <=(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execGreaterEqual_IntInt(FFrame&, void* const)
native(172) static final operator(24) bool >=(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execEqualEqual_IntInt(FFrame&, void* const)
native(173) static final operator(24) bool ==(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execNotEqual_IntInt(FFrame&, void* const)
native(174) static final operator(26) bool !=(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAnd_IntInt(FFrame&, void* const)
native(175) static final operator(28) int &(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execXor_IntInt(FFrame&, void* const)
native(176) static final operator(28) int ^(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execOr_IntInt(FFrame&, void* const)
native(177) static final operator(28) int |(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execMultiplyEqual_IntFloat(FFrame&, void* const)
native(178) static final operator(34) int *=(out int A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execDivideEqual_IntFloat(FFrame&, void* const)
native(179) static final operator(34) int /=(out int A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAddEqual_IntInt(FFrame&, void* const)
native(180) static final operator(34) int +=(out int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execSubtractEqual_IntInt(FFrame&, void* const)
native(181) static final operator(34) int -=(out int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAddAdd_PreInt(FFrame&, void* const)
native(182) static final preoperator int ++(out int A)
{
	//native.A;	
}

// Export UObject::execSubtractSubtract_PreInt(FFrame&, void* const)
native(183) static final preoperator int --(out int A)
{
	//native.A;	
}

// Export UObject::execAddAdd_Int(FFrame&, void* const)
native(184) static final postoperator int ++(out int A)
{
	//native.A;	
}

// Export UObject::execSubtractSubtract_Int(FFrame&, void* const)
native(185) static final postoperator int --(out int A)
{
	//native.A;	
}

// Export UObject::execSeed(FFrame&, void* const)
native(186) static final function int Seed(int Seed)
{
	//native.Seed;	
}

// Export UObject::execRand(FFrame&, void* const)
native(187) static final function int Rand(int Max)
{
	//native.Max;	
}

// Export UObject::execMin(FFrame&, void* const)
native(188) static final function int Min(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execMax(FFrame&, void* const)
native(189) static final function int Max(int A, int B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execIVar(FFrame&, void* const)
native(190) static final function int IVar(int Value, int Variance, optional bool bLimitValue)
{
	//native.Value;
	//native.Variance;
	//native.bLimitValue;	
}

// Export UObject::execClamp(FFrame&, void* const)
native(191) static final function int Clamp(int V, int A, int B)
{
	//native.V;
	//native.A;
	//native.B;	
}

// Export UObject::execRound(FFrame&, void* const)
native(192) static final function int Round(float A)
{
	//native.A;	
}

// Export UObject::execCeil(FFrame&, void* const)
native(193) static final function int Ceil(float A)
{
	//native.A;	
}

// Export UObject::execSubtract_PreFloat(FFrame&, void* const)
native(194) static final preoperator float -(float A)
{
	//native.A;	
}

// Export UObject::execMultiply_FloatFloat(FFrame&, void* const)
native(195) static final operator(16) float *(float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execDivide_FloatFloat(FFrame&, void* const)
native(196) static final operator(16) float /(float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execPercent_FloatFloat(FFrame&, void* const)
native(197) static final operator(18) float %(float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAdd_FloatFloat(FFrame&, void* const)
native(198) static final operator(20) float +(float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execSubtract_FloatFloat(FFrame&, void* const)
native(199) static final operator(20) float -(float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execLess_FloatFloat(FFrame&, void* const)
native(200) static final operator(24) bool <(float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execGreater_FloatFloat(FFrame&, void* const)
native(201) static final operator(24) bool >(float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execLessEqual_FloatFloat(FFrame&, void* const)
native(202) static final operator(24) bool <=(float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execGreaterEqual_FloatFloat(FFrame&, void* const)
native(203) static final operator(24) bool >=(float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execEqualEqual_FloatFloat(FFrame&, void* const)
native(204) static final operator(24) bool ==(float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execComplementEqual_FloatFloat(FFrame&, void* const)
native(205) static final operator(24) bool ~=(float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execNotEqual_FloatFloat(FFrame&, void* const)
native(206) static final operator(26) bool !=(float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execMultiplyEqual_FloatFloat(FFrame&, void* const)
native(207) static final operator(34) float *=(out float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execDivideEqual_FloatFloat(FFrame&, void* const)
native(208) static final operator(34) float /=(out float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAddEqual_FloatFloat(FFrame&, void* const)
native(209) static final operator(34) float +=(out float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execSubtractEqual_FloatFloat(FFrame&, void* const)
native(210) static final operator(34) float -=(out float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAbs(FFrame&, void* const)
native(211) static final function float Abs(float A)
{
	//native.A;	
}

// Export UObject::execSin(FFrame&, void* const)
native(212) static final function float Sin(float A)
{
	//native.A;	
}

// Export UObject::execCos(FFrame&, void* const)
native(213) static final function float Cos(float A)
{
	//native.A;	
}

// Export UObject::execAcos(FFrame&, void* const)
native(214) static final function float Acos(float A)
{
	//native.A;	
}

// Export UObject::execTan(FFrame&, void* const)
native(215) static final function float Tan(float A)
{
	//native.A;	
}

// Export UObject::execAtan(FFrame&, void* const)
native(216) static final function float Atan(float A)
{
	//native.A;	
}

// Export UObject::execAtan2(FFrame&, void* const)
native(217) static final function float Atan2(float Y, float X)
{
	//native.Y;
	//native.X;	
}

// Export UObject::execExp(FFrame&, void* const)
native(218) static final function float Exp(float A)
{
	//native.A;	
}

// Export UObject::execLoge(FFrame&, void* const)
native(219) static final function float Loge(float A)
{
	//native.A;	
}

// Export UObject::execSqrt(FFrame&, void* const)
native(220) static final function float Sqrt(float A)
{
	//native.A;	
}

// Export UObject::execSquare(FFrame&, void* const)
native(221) static final function float Square(float A)
{
	//native.A;	
}

// Export UObject::execFRand(FFrame&, void* const)
native(222) static final function float FRand();

// Export UObject::execRandRange(FFrame&, void* const)
native(223) static final function float RandRange(float Min, float Max)
{
	//native.Min;
	//native.Max;	
}

// Export UObject::execFMin(FFrame&, void* const)
native(224) static final function float FMin(float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execFMax(FFrame&, void* const)
native(225) static final function float FMax(float A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execFVar(FFrame&, void* const)
native(226) static final function float FVar(float Value, float Variance)
{
	//native.Value;
	//native.Variance;	
}

// Export UObject::execFClamp(FFrame&, void* const)
native(227) static final function float FClamp(float V, float A, float B)
{
	//native.V;
	//native.A;
	//native.B;	
}

// Export UObject::execLerp(FFrame&, void* const)
native(228) static final function float Lerp(float Alpha, float A, float B)
{
	//native.Alpha;
	//native.A;
	//native.B;	
}

// Export UObject::execSmerp(FFrame&, void* const)
native(229) static final function float Smerp(float Alpha, float A, float B)
{
	//native.Alpha;
	//native.A;
	//native.B;	
}

// Export UObject::execPow(FFrame&, void* const)
native(230) static final function float Pow(float X, float Y)
{
	//native.X;
	//native.Y;	
}

// Export UObject::execAsin(FFrame&, void* const)
native(231) static final function float Asin(float A)
{
	//native.A;	
}

// Export UObject::execVect(FFrame&, void* const)
native(232) static final function Vector Vect(optional float X, optional float Y, optional float Z)
{
	//native.X;
	//native.Y;
	//native.Z;	
}

// Export UObject::execSubtract_PreVector(FFrame&, void* const)
native(233) static final preoperator Vector -(Vector A)
{
	//native.A;	
}

// Export UObject::execMultiply_VectorFloat(FFrame&, void* const)
native(234) static final operator(16) Vector *(Vector A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execMultiply_FloatVector(FFrame&, void* const)
native(235) static final operator(16) Vector *(float A, Vector B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execMultiply_VectorVector(FFrame&, void* const)
native(236) static final operator(16) Vector *(Vector A, Vector B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execDivide_VectorFloat(FFrame&, void* const)
native(237) static final operator(16) Vector /(Vector A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAdd_VectorVector(FFrame&, void* const)
native(238) static final operator(20) Vector +(Vector A, Vector B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execSubtract_VectorVector(FFrame&, void* const)
native(239) static final operator(20) Vector -(Vector A, Vector B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execLessLess_VectorRotator(FFrame&, void* const)
native(240) static final operator(22) Vector <<(Vector A, Rotator B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execGreaterGreater_VectorRotator(FFrame&, void* const)
native(241) static final operator(22) Vector >>(Vector A, Rotator B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execEqualEqual_VectorVector(FFrame&, void* const)
native(242) static final operator(24) bool ==(Vector A, Vector B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execNotEqual_VectorVector(FFrame&, void* const)
native(243) static final operator(26) bool !=(Vector A, Vector B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execDot_VectorVector(FFrame&, void* const)
native(244) static final operator(16) float Dot(Vector A, Vector B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execCross_VectorVector(FFrame&, void* const)
native(245) static final operator(16) Vector Cross(Vector A, Vector B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execMultiplyEqual_VectorFloat(FFrame&, void* const)
native(246) static final operator(34) Vector *=(out Vector A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execMultiplyEqual_VectorVector(FFrame&, void* const)
native(247) static final operator(34) Vector *=(out Vector A, Vector B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execDivideEqual_VectorFloat(FFrame&, void* const)
native(248) static final operator(34) Vector /=(out Vector A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAddEqual_VectorVector(FFrame&, void* const)
native(249) static final operator(34) Vector +=(out Vector A, Vector B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execSubtractEqual_VectorVector(FFrame&, void* const)
native(250) static final operator(34) Vector -=(out Vector A, Vector B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execVSize(FFrame&, void* const)
native(251) static final function float VSize(Vector A)
{
	//native.A;	
}

// Export UObject::execVSizeSquared(FFrame&, void* const)
native(252) static final function float VSizeSquared(Vector A)
{
	//native.A;	
}

// Export UObject::execNormal(FFrame&, void* const)
native(253) static final function Vector Normal(Vector A)
{
	//native.A;	
}

// Export UObject::execInvert(FFrame&, void* const)
native(254) static final function Invert(out Vector X, out Vector Y, out Vector Z)
{
	//native.X;
	//native.Y;
	//native.Z;	
}

// Export UObject::execVRand(FFrame&, void* const)
native(255) static final function Vector VRand();

// Export UObject::execVVar(FFrame&, void* const)
native(256) static final function Vector VVar(Vector A, Vector Variance)
{
	//native.A;
	//native.Variance;	
}

// Export UObject::execMirrorVectorByNormal(FFrame&, void* const)
native(257) static final function Vector MirrorVectorByNormal(Vector Vect, Vector Normal)
{
	//native.Vect;
	//native.Normal;	
}

// Export UObject::execVLerp(FFrame&, void* const)
native(258) static final function Vector VLerp(float Alpha, Vector A, Vector B)
{
	//native.Alpha;
	//native.A;
	//native.B;	
}

// Export UObject::execVHermiteInterp(FFrame&, void* const)
native(259) static final function Vector VHermiteInterp(float Alpha, Vector Start, Vector StartTangent, Vector End, Vector EndTangent)
{
	//native.Alpha;
	//native.Start;
	//native.StartTangent;
	//native.End;
	//native.EndTangent;	
}

// Export UObject::execVMin(FFrame&, void* const)
native(260) static final function Vector VMin(Vector A, Vector B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execVMax(FFrame&, void* const)
native(261) static final function Vector VMax(Vector A, Vector B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execRotateAroundAxis(FFrame&, void* const)
native(262) static final function Vector RotateAroundAxis(Vector Fwd, Vector Axis, int Angle)
{
	//native.Fwd;
	//native.Axis;
	//native.Angle;	
}

// Export UObject::execTransformVectorByRot(FFrame&, void* const)
native(263) static final function Vector TransformVectorByRot(Vector Vect, Rotator Rot)
{
	//native.Vect;
	//native.Rot;	
}

// Export UObject::execGetClosestPointToSegment(FFrame&, void* const)
native(264) static final function float GetClosestPointToSegment(Vector A, Vector B, Vector TestPoint, out Vector ClosestPoint)
{
	//native.A;
	//native.B;
	//native.TestPoint;
	//native.ClosestPoint;	
}

final function Vector StripVectorComponent(Vector SourceVector, Vector StripNormal)
{
	return __NFUN_239__(SourceVector, __NFUN_234__(StripNormal, __NFUN_244__(SourceVector, StripNormal)));
	return;
}

final function Vector StripPositiveVectorComponent(Vector SourceVector, Vector StripNormal)
{
	local float Dot;

	Dot = __NFUN_244__(SourceVector, StripNormal);
	// End:0x27
	if(__NFUN_202__(Dot, 0))
	{
		return SourceVector;
	}
	return __NFUN_239__(SourceVector, __NFUN_234__(StripNormal, Dot));
	return;
}

// Export UObject::execRot(FFrame&, void* const)
native(265) static final function Rotator Rot(optional int Pitch, optional int Yaw, optional int Roll)
{
	//native.Pitch;
	//native.Yaw;
	//native.Roll;	
}

// Export UObject::execMultiply_RotatorFloat(FFrame&, void* const)
native(266) static final operator(16) Rotator *(Rotator A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execMultiply_FloatRotator(FFrame&, void* const)
native(267) static final operator(16) Rotator *(float A, Rotator B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execDivide_RotatorFloat(FFrame&, void* const)
native(268) static final operator(16) Rotator /(Rotator A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execGreaterGreater_RotatorRotator(FFrame&, void* const)
native(269) static final operator(22) Rotator >>(Rotator A, Rotator B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execLessLess_RotatorRotator(FFrame&, void* const)
native(270) static final operator(22) Rotator <<(Rotator A, Rotator B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execEqualEqual_RotatorRotator(FFrame&, void* const)
native(271) static final operator(24) bool ==(Rotator A, Rotator B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execNotEqual_RotatorRotator(FFrame&, void* const)
native(272) static final operator(26) bool !=(Rotator A, Rotator B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execMultiplyEqual_RotatorFloat(FFrame&, void* const)
native(273) static final operator(34) Rotator *=(out Rotator A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execDivideEqual_RotatorFloat(FFrame&, void* const)
native(274) static final operator(34) Rotator /=(out Rotator A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAdd_RotatorRotator(FFrame&, void* const)
native(275) static final operator(20) Rotator +(Rotator A, Rotator B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execSubtract_RotatorRotator(FFrame&, void* const)
native(276) static final operator(20) Rotator -(Rotator A, Rotator B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAddEqual_RotatorRotator(FFrame&, void* const)
native(277) static final operator(34) Rotator +=(out Rotator A, Rotator B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execSubtractEqual_RotatorRotator(FFrame&, void* const)
native(278) static final operator(34) Rotator -=(out Rotator A, Rotator B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execGetAxes(FFrame&, void* const)
native(279) static final function GetAxes(Rotator A, out Vector X, out Vector Y, out Vector Z)
{
	//native.A;
	//native.X;
	//native.Y;
	//native.Z;	
}

// Export UObject::execGetUnAxes(FFrame&, void* const)
native(280) static final function GetUnAxes(Rotator A, out Vector X, out Vector Y, out Vector Z)
{
	//native.A;
	//native.X;
	//native.Y;
	//native.Z;	
}

// Export UObject::execRotRand(FFrame&, void* const)
native(281) static final function Rotator RotRand(optional bool bRoll)
{
	//native.bRoll;	
}

// Export UObject::execOrthoRotation(FFrame&, void* const)
native(282) static final function Rotator OrthoRotation(Vector X, Vector Y, Vector Z)
{
	//native.X;
	//native.Y;
	//native.Z;	
}

// Export UObject::execNormalize(FFrame&, void* const)
native(283) static final function Rotator Normalize(Rotator Rot)
{
	//native.Rot;	
}

// Export UObject::execRVar(FFrame&, void* const)
native(284) static final function Rotator RVar(Rotator A, Rotator Variance, optional bool bLimitValue)
{
	//native.A;
	//native.Variance;
	//native.bLimitValue;	
}

// Export UObject::execFixedTurn(FFrame&, void* const)
native(285) static final function int FixedTurn(int Current, int Desired, int Delta)
{
	//native.Current;
	//native.Desired;
	//native.Delta;	
}

// Export UObject::execFixedTurnDelta(FFrame&, void* const)
native(286) static final function int FixedTurnDelta(int Current, int Desired, int Delta)
{
	//native.Current;
	//native.Desired;
	//native.Delta;	
}

// Export UObject::execSlerp(FFrame&, void* const)
native(287) static final function Rotator Slerp(float Alpha, Rotator A, Rotator B)
{
	//native.Alpha;
	//native.A;
	//native.B;	
}

// Export UObject::execQuatProduct(FFrame&, void* const)
native(288) static final function Quat QuatProduct(Quat A, Quat B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execQuatInvert(FFrame&, void* const)
native(289) static final function Quat QuatInvert(Quat A)
{
	//native.A;	
}

// Export UObject::execQuatRotateVector(FFrame&, void* const)
native(290) static final function Vector QuatRotateVector(Quat A, Vector B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execQuatFindBetween(FFrame&, void* const)
native(291) static final function Quat QuatFindBetween(Vector A, Vector B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execQuatFromAxisAndAngle(FFrame&, void* const)
native(292) static final function Quat QuatFromAxisAndAngle(Vector Axis, float Angle)
{
	//native.Axis;
	//native.Angle;	
}

// Export UObject::execQuatFromRotator(FFrame&, void* const)
native(293) static final function Quat QuatFromRotator(Rotator A)
{
	//native.A;	
}

// Export UObject::execQuatToRotator(FFrame&, void* const)
native(294) static final function Rotator QuatToRotator(Quat A)
{
	//native.A;	
}

// Export UObject::execQuatRotateRotator(FFrame&, void* const)
native(295) static final function Rotator QuatRotateRotator(Rotator A, Rotator Delta)
{
	//native.A;
	//native.Delta;	
}

// Export UObject::execQuatGetAxes(FFrame&, void* const)
native(296) static final function QuatGetAxes(Quat In, out Vector vFwd, out Vector vUp, out Vector vRight)
{
	//native.In;
	//native.vFwd;
	//native.vUp;
	//native.vRight;	
}

// Export UObject::execQuatGetForward(FFrame&, void* const)
native(297) static final function Vector QuatGetForward(Quat In)
{
	//native.In;	
}

// Export UObject::execQuatGetUp(FFrame&, void* const)
native(298) static final function Vector QuatGetUp(Quat In)
{
	//native.In;	
}

// Export UObject::execQuatGetRight(FFrame&, void* const)
native(299) static final function Vector QuatGetRight(Quat In)
{
	//native.In;	
}

// Export UObject::execQuatFromAxes(FFrame&, void* const)
native(300) static final function Quat QuatFromAxes(Vector vFwd, Vector vUp, Vector vRight)
{
	//native.vFwd;
	//native.vUp;
	//native.vRight;	
}

// Export UObject::execCylinderLineSegmentIntersection(FFrame&, void* const)
native(301) static final simulated function bool CylinderLineSegmentIntersection(Vector CylinderOrigin, float CylinderRadius, float CylinderHeight, Vector SegmentOrigin, Vector SegmentEndpoint, out float IntersectionTime, out Vector IntersectionLocation)
{
	//native.CylinderOrigin;
	//native.CylinderRadius;
	//native.CylinderHeight;
	//native.SegmentOrigin;
	//native.SegmentEndpoint;
	//native.IntersectionTime;
	//native.IntersectionLocation;	
}

// Export UObject::execConcat_StrStr(FFrame&, void* const)
native(302) static final operator(40) string $(coerce string A, coerce string B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAt_StrStr(FFrame&, void* const)
native(303) static final operator(40) string @(coerce string A, coerce string B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execLess_StrStr(FFrame&, void* const)
native(304) static final operator(24) bool <(string A, string B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execGreater_StrStr(FFrame&, void* const)
native(305) static final operator(24) bool >(string A, string B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execLessEqual_StrStr(FFrame&, void* const)
native(306) static final operator(24) bool <=(string A, string B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execGreaterEqual_StrStr(FFrame&, void* const)
native(307) static final operator(24) bool >=(string A, string B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execEqualEqual_StrStr(FFrame&, void* const)
native(308) static final operator(24) bool ==(string A, string B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execNotEqual_StrStr(FFrame&, void* const)
native(309) static final operator(26) bool !=(string A, string B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execComplementEqual_StrStr(FFrame&, void* const)
native(310) static final operator(24) bool ~=(string A, string B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execConcatEqual_StrStr(FFrame&, void* const)
native(311) static final operator(40) string $=(out string A, coerce string B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAtEqual_StrStr(FFrame&, void* const)
native(312) static final operator(44) string @=(out string A, coerce string B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execSubtractEqual_StrStr(FFrame&, void* const)
native(313) static final operator(45) string -=(out string A, coerce string B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execLen(FFrame&, void* const)
native(314) static final function int Len(coerce string S)
{
	//native.S;	
}

// Export UObject::execInStr(FFrame&, void* const)
native(315) static final function int InStr(coerce string S, coerce string t)
{
	//native.S;
	//native.t;	
}

// Export UObject::execMid(FFrame&, void* const)
native(316) static final function string Mid(coerce string S, int i, optional int j)
{
	//native.S;
	//native.i;
	//native.j;	
}

// Export UObject::execLeft(FFrame&, void* const)
native(317) static final function string Left(coerce string S, int i)
{
	//native.S;
	//native.i;	
}

// Export UObject::execRight(FFrame&, void* const)
native(318) static final function string Right(coerce string S, int i)
{
	//native.S;
	//native.i;	
}

// Export UObject::execCaps(FFrame&, void* const)
native(319) static final function string Caps(coerce string S)
{
	//native.S;	
}

// Export UObject::execLower(FFrame&, void* const)
native(320) static final function string Lower(coerce string S)
{
	//native.S;	
}

// Export UObject::execChr(FFrame&, void* const)
native(321) static final function string Chr(int i)
{
	//native.i;	
}

// Export UObject::execAsc(FFrame&, void* const)
native(322) static final function int Asc(string S)
{
	//native.S;	
}

// Export UObject::execStrGetChar(FFrame&, void* const)
native(323) static final function int StrGetChar(out string S, int i)
{
	//native.S;
	//native.i;	
}

// Export UObject::execDivide(FFrame&, void* const)
native(324) static final function bool Divide(coerce string Src, string Divider, out string LeftPart, out string RightPart)
{
	//native.Src;
	//native.Divider;
	//native.LeftPart;
	//native.RightPart;	
}

// Export UObject::execSplit(FFrame&, void* const)
native(325) static final function int Split(coerce string Src, string Divider, out array<string> Parts)
{
	//native.Src;
	//native.Divider;
	//native.Parts;	
}

// Export UObject::execJoinStringArray(FFrame&, void* const)
native(326) static final function string JoinStringArray(array<string> Parts, int Start, int End, string Divider)
{
	//native.Parts;
	//native.Start;
	//native.End;
	//native.Divider;	
}

// Export UObject::execStripWhitespace(FFrame&, void* const)
native(327) static final function string StripWhitespace(coerce string Src, optional bool bStripLeading, optional bool bStripTrailing)
{
	//native.Src;
	//native.bStripLeading;
	//native.bStripTrailing;	
}

// Export UObject::execFormatString(FFrame&, void* const)
native(328) static final function string FormatString(string Format, array<string> ellipses)
{
	//native.Format;
	//native.ellipses;	
}

// Export UObject::execFormatTimeString(FFrame&, void* const)
native(329) static final function string FormatTimeString(int seconds)
{
	//native.seconds;	
}

// Export UObject::execGenerateColorFromChar(FFrame&, void* const)
native(330) static final function byte GenerateColorFromChar(int Char)
{
	//native.Char;	
}

// Export UObject::execMultiply_FloatColor(FFrame&, void* const)
native(331) static final operator(16) Color *(float A, Color B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execMultiply_ColorFloat(FFrame&, void* const)
native(332) static final operator(16) Color *(Color A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execDivide_ColorFloat(FFrame&, void* const)
native(333) static final operator(16) Color /(Color A, float B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execSubtract_ColorColor(FFrame&, void* const)
native(334) static final operator(20) Color -(Color A, Color B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execAdd_ColorColor(FFrame&, void* const)
native(335) static final operator(20) Color +(Color A, Color B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execEqualEqual_ColorColor(FFrame&, void* const)
native(336) static final operator(24) bool ==(Color A, Color B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execNotEqual_ColorColor(FFrame&, void* const)
native(337) static final operator(26) bool !=(Color A, Color B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execCLerp(FFrame&, void* const)
native(338) static final function Color CLerp(float Alpha, Color A, Color B)
{
	//native.Alpha;
	//native.A;
	//native.B;	
}

// Export UObject::execEqualEqual_ObjectObject(FFrame&, void* const)
native(339) static final operator(24) bool ==(Object A, Object B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execNotEqual_ObjectObject(FFrame&, void* const)
native(340) static final operator(26) bool !=(Object A, Object B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execEqualEqual_NameName(FFrame&, void* const)
native(341) static final operator(24) bool ==(name A, name B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execNotEqual_NameName(FFrame&, void* const)
native(342) static final operator(26) bool !=(name A, name B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execNameForString(FFrame&, void* const)
native(343) static final simulated function name NameForString(string S)
{
	//native.S;	
}

// Export UObject::execCompositeNames(FFrame&, void* const)
native(344) static final simulated function name CompositeNames(name A, name B)
{
	//native.A;
	//native.B;	
}

// Export UObject::execEvaluateCompare(FFrame&, void* const)
native(345) static final function bool EvaluateCompare(Object.ECompare CompareType, coerce float A, coerce float B)
{
	//native.CompareType;
	//native.A;
	//native.B;	
}

// Export UObject::execHandleBitModifier(FFrame&, void* const)
native(346) static final function bool HandleBitModifier(Object.EBitModifier Modifier, bool bSourceBool)
{
	//native.Modifier;
	//native.bSourceBool;	
}

// Export UObject::execHandleIntModifier(FFrame&, void* const)
native(347) static final function int HandleIntModifier(Object.EIntModifier Modifier, int SourceInt, optional int ModifierInt)
{
	//native.Modifier;
	//native.SourceInt;
	//native.ModifierInt;	
}

// Export UObject::execHandleFloatModifier(FFrame&, void* const)
native(348) static final function float HandleFloatModifier(Object.EFloatModifier Modifier, float SourceFloat, optional float ModifierFloat)
{
	//native.Modifier;
	//native.SourceFloat;
	//native.ModifierFloat;	
}

// Export UObject::execHandleVectModifier(FFrame&, void* const)
native(349) static final function Vector HandleVectModifier(Object.EVectModifier Modifier, Vector SourceVect, optional Vector ModifierVect)
{
	//native.Modifier;
	//native.SourceVect;
	//native.ModifierVect;	
}

// Export UObject::execHandleRotModifier(FFrame&, void* const)
native(350) static final function Rotator HandleRotModifier(Object.ERotModifier Modifier, Rotator SourceRot, optional Rotator ModifierRot)
{
	//native.Modifier;
	//native.SourceRot;
	//native.ModifierRot;	
}

// Export UObject::execHandleNameModifier(FFrame&, void* const)
native(351) static final function name HandleNameModifier(Object.ENameModifier Modifier, name SourceName, name ModifierName)
{
	//native.Modifier;
	//native.SourceName;
	//native.ModifierName;	
}

// Export UObject::execHandleStringModifier(FFrame&, void* const)
native(352) static final function string HandleStringModifier(Object.EStrModifier Modifier, coerce string SourceString, coerce string ModifierString)
{
	//native.Modifier;
	//native.SourceString;
	//native.ModifierString;	
}

// Export UObject::execHandleColorModifier(FFrame&, void* const)
native(353) static final function Color HandleColorModifier(Object.EColorModifier Modifier, Color SourceRot, optional Color ModifierRot)
{
	//native.Modifier;
	//native.SourceRot;
	//native.ModifierRot;	
}

// Export UObject::execcheck(FFrame&, void* const)
native(354) static final function check(coerce bool bAssertionValue, optional string Description)
{
	//native.bAssertionValue;
	//native.Description;	
}

// Export UObject::execLog(FFrame&, void* const)
native(355) static final function Log(coerce string S, optional name Tag)
{
	//native.S;
	//native.Tag;	
}

// Export UObject::execLocalize(FFrame&, void* const)
native(356) static final function string Localize(string SectionName, string KeyName, string PackageName)
{
	//native.SectionName;
	//native.KeyName;
	//native.PackageName;	
}

// Export UObject::execClassIsChildOf(FFrame&, void* const)
native(357) static final function bool ClassIsChildOf(Class TestClass, Class ParentClass)
{
	//native.TestClass;
	//native.ParentClass;	
}

// Export UObject::execIsA(FFrame&, void* const)
native(358) final function bool IsA(name ClassName)
{
	//native.ClassName;	
}

// Export UObject::execClassForName(FFrame&, void* const)
native(359) static final function Class ClassForName(name ClassName)
{
	//native.ClassName;	
}

// Export UObject::execCallingFunction(FFrame&, void* const)
native(360) final function name CallingFunction();

// Export UObject::execEnable(FFrame&, void* const)
native(361) final simulated function Enable(name ProbeFunc)
{
	//native.ProbeFunc;	
}

// Export UObject::execDisable(FFrame&, void* const)
native(362) final simulated function Disable(name ProbeFunc)
{
	//native.ProbeFunc;	
}

// Export UObject::execGetPropertyText(FFrame&, void* const)
native(363) final function string GetPropertyText(string PropName, optional int Index)
{
	//native.PropName;
	//native.Index;	
}

// Export UObject::execSetPropertyText(FFrame&, void* const)
native(364) final function SetPropertyText(string PropName, string PropValue, optional int Index, optional bool bGlobal)
{
	//native.PropName;
	//native.PropValue;
	//native.Index;
	//native.bGlobal;	
}

// Export UObject::execGetEnum(FFrame&, void* const)
native(365) static final function name GetEnum(Object E, int i)
{
	//native.E;
	//native.i;	
}

// Export UObject::execDynamicLoadObject(FFrame&, void* const)
native(366) static final function Object DynamicLoadObject(coerce string ObjectName, Class ObjectClass, optional bool bMayFail)
{
	//native.ObjectName;
	//native.ObjectClass;
	//native.bMayFail;	
}

// Export UObject::execSaveConfigFile(FFrame&, void* const)
native(367) static final function SaveConfigFile(string Filename)
{
	//native.Filename;	
}

// Export UObject::execSaveConfig(FFrame&, void* const)
native(368) final function SaveConfig();

// Export UObject::execStaticSaveConfig(FFrame&, void* const)
native(369) static final function StaticSaveConfig();

// Export UObject::execStaticSaveAudioConfig(FFrame&, void* const)
native(370) static final function StaticSaveAudioConfig();

// Export UObject::execStaticSaveVideoConfig(FFrame&, void* const)
native(371) static final function StaticSaveVideoConfig();

// Export UObject::execResetConfig(FFrame&, void* const)
native(372) static final function ResetConfig();

// Export UObject::execResetConfigByName(FFrame&, void* const)
native(373) static final function ResetConfigByName(string ClassName)
{
	//native.ClassName;	
}

// Export UObject::execLogStackTrace(FFrame&, void* const)
native(374) static final function LogStackTrace();

// Export UObject::execGetConfigInt(FFrame&, void* const)
native(375) static final function bool GetConfigInt(string Section, string Key, out int Value, string Filename)
{
	//native.Section;
	//native.Key;
	//native.Value;
	//native.Filename;	
}

// Export UObject::execGetConfigFloat(FFrame&, void* const)
native(376) static final function bool GetConfigFloat(string Section, string Key, out float Value, string Filename)
{
	//native.Section;
	//native.Key;
	//native.Value;
	//native.Filename;	
}

// Export UObject::execGetConfigString(FFrame&, void* const)
native(377) static final function bool GetConfigString(string Section, string Key, out string Value, string Filename)
{
	//native.Section;
	//native.Key;
	//native.Value;
	//native.Filename;	
}

// Export UObject::execGetConfigBool(FFrame&, void* const)
native(378) static final function bool GetConfigBool(string Section, string Key, out int Value, string Filename)
{
	//native.Section;
	//native.Key;
	//native.Value;
	//native.Filename;	
}

// Export UObject::execGetConfigColor(FFrame&, void* const)
native(379) static final function bool GetConfigColor(string Section, string Key, out Color Value, string Filename)
{
	//native.Section;
	//native.Key;
	//native.Value;
	//native.Filename;	
}

// Export UObject::execSetConfigInt(FFrame&, void* const)
native(380) static final function SetConfigInt(string Section, string Key, int Value, string Filename)
{
	//native.Section;
	//native.Key;
	//native.Value;
	//native.Filename;	
}

// Export UObject::execSetConfigFloat(FFrame&, void* const)
native(381) static final function SetConfigFloat(string Section, string Key, float Value, string Filename)
{
	//native.Section;
	//native.Key;
	//native.Value;
	//native.Filename;	
}

// Export UObject::execSetConfigString(FFrame&, void* const)
native(382) static final function SetConfigString(string Section, string Key, string Value, string Filename)
{
	//native.Section;
	//native.Key;
	//native.Value;
	//native.Filename;	
}

// Export UObject::execSetConfigBool(FFrame&, void* const)
native(383) static final function SetConfigBool(string Section, string Key, bool Value, string Filename)
{
	//native.Section;
	//native.Key;
	//native.Value;
	//native.Filename;	
}

// Export UObject::execSetConfigColor(FFrame&, void* const)
native(384) static final function SetConfigColor(string Section, string Key, Color Value, string Filename)
{
	//native.Section;
	//native.Key;
	//native.Value;
	//native.Filename;	
}

// Export UObject::execClockStat(FFrame&, void* const)
native(385) static final function ClockStat(string StatCategory, string StatName)
{
	//native.StatCategory;
	//native.StatName;	
}

// Export UObject::execUnclockStat(FFrame&, void* const)
native(386) static final function UnclockStat(string StatCategory, string StatName)
{
	//native.StatCategory;
	//native.StatName;	
}

// Export UObject::execClock(FFrame&, void* const)
native(387) static final function Clock(out int Time)
{
	//native.Time;	
}

// Export UObject::execUnclock(FFrame&, void* const)
native(388) static final function Unclock(out int Time)
{
	//native.Time;	
}

// Export UObject::execFormatClockTime(FFrame&, void* const)
native(389) static final function string FormatClockTime(int Time)
{
	//native.Time;	
}

// Export UObject::execGetFileCountForDirectory(FFrame&, void* const)
native(390) static final function int GetFileCountForDirectory(coerce string RelativePath, string FileMask)
{
	//native.RelativePath;
	//native.FileMask;	
}

// Export UObject::execGetFilenameForDirectory(FFrame&, void* const)
native(391) static final function string GetFilenameForDirectory(coerce string RelativePath, string FileMask, int FileID)
{
	//native.RelativePath;
	//native.FileMask;
	//native.FileID;	
}

// Export UObject::execGetWorldMax(FFrame&, void* const)
native(392) final function float GetWorldMax();

// Export UObject::execUnrealToInches(FFrame&, void* const)
native(393) static final function UnrealToInches(float UnrealDistance, out float Inches)
{
	//native.UnrealDistance;
	//native.Inches;	
}

// Export UObject::execUnrealToFeetInches(FFrame&, void* const)
native(394) static final function UnrealToFeetInches(float UnrealDistance, out int Feet, out float Inches)
{
	//native.UnrealDistance;
	//native.Feet;
	//native.Inches;	
}

// Export UObject::execUnrealToMeters(FFrame&, void* const)
native(395) static final function UnrealToMeters(float UnrealDistance, out float Meters)
{
	//native.UnrealDistance;
	//native.Meters;	
}

// Export UObject::execSplitObjectPath(FFrame&, void* const)
native(396) static final function SplitObjectPath(out string Path, out string PackageName, out string GroupName, out string DLCPackage)
{
	//native.Path;
	//native.PackageName;
	//native.GroupName;
	//native.DLCPackage;	
}

// Export UObject::execGotoState(FFrame&, void* const)
native(397) final simulated function GotoState(optional name NewState, optional name Label)
{
	//native.NewState;
	//native.Label;	
}

// Export UObject::execIsInState(FFrame&, void* const)
native(398) final simulated function bool IsInState(name TestState)
{
	//native.TestState;	
}

// Export UObject::execGetStateName(FFrame&, void* const)
native(399) final simulated function name GetStateName();

final simulated function ForceState(optional name NewState, optional name Label)
{
	__NFUN_397__('None');
	__NFUN_397__(NewState, Label);
	return;
}

event BeginState()
{
	return;
}

event EndState()
{
	return;
}

static final function SetSmackerTextureState(SmackerTexture Smacker, bool bPause, int Frame)
{
	// End:0x0E
	if(__NFUN_339__(Smacker, none))
	{
		return;
	}
	// End:0x3F
	if(__NFUN_147__(Smacker.GetPause(), bPause))
	{
		Smacker.SetPause(bPause);
	}
	// End:0x6E
	if(__NFUN_174__(Smacker.GetFrame(), Frame))
	{
		Smacker.SetFrame(Frame);
	}
	return;
}

// Export UObject::execIsNotFinal(FFrame&, void* const)
native(400) static final simulated function bool IsNotFinal();

// Export UObject::execIsXbox(FFrame&, void* const)
native(401) static final function bool IsXbox();

// Export UObject::execIsPS3(FFrame&, void* const)
native(402) static final function bool IsPS3();

// Export UObject::execObjectIsDestroyed(FFrame&, void* const)
native(403) static final function bool ObjectIsDestroyed(Object Object)
{
	//native.Object;	
}

// Export UObject::execGetGearboxEngineGlobals(FFrame&, void* const)
native(404) static final function GearboxEngineGlobals GetGearboxEngineGlobals();

// Export UObject::execGetLCDHelper(FFrame&, void* const)
native(405) static final function LCDHelper GetLCDHelper();

// Export UObject::execIsPS3InstallNeeded(FFrame&, void* const)
native(406) static final function bool IsPS3InstallNeeded();

// Export UObject::execInstallPS3Data(FFrame&, void* const)
native(407) static final function InstallPS3Data();

// Export UObject::execInstallIsCompleted(FFrame&, void* const)
native(408) static final function bool InstallIsCompleted();

// Export UObject::execGetInstallPct(FFrame&, void* const)
native(409) static final function float GetInstallPct();

// Export UObject::execEnoughRoom_GD(FFrame&, void* const)
native(410) static final function bool EnoughRoom_GD();

// Export UObject::execEnoughRoom_SD(FFrame&, void* const)
native(411) static final function bool EnoughRoom_SD();

// Export UObject::execEnoughRoom_TD(FFrame&, void* const)
native(412) static final function bool EnoughRoom_TD();

// Export UObject::execQuitPS3Game(FFrame&, void* const)
native(413) static final function QuitPS3Game();

// Export UObject::execIsConsole(FFrame&, void* const)
native(414) static final function bool IsConsole();

// Export UObject::execIsDemo(FFrame&, void* const)
native(415) static final function bool IsDemo();

function string FloatToString(float In, optional int precision)
{
	local string f;
	local int decimal;

	f = string(In);
	decimal = __NFUN_315__(f, ".");
	// End:0x66
	if(__NFUN_172__(decimal, 0))
	{
		// End:0x53
		if(__NFUN_170__(precision, 0))
		{
			f = __NFUN_317__(f, __NFUN_165__(__NFUN_165__(decimal, precision), 1));			
		}
		else
		{
			f = __NFUN_317__(f, decimal);
		}
	}
	return f;
	return;
}

// Export UObject::execObjectDestroy(FFrame&, void* const)
native(416) static final function ObjectDestroy(Object obj)
{
	//native.obj;	
}

// Export UObject::execObjectDeferredDestroy(FFrame&, void* const)
native(417) static final function ObjectDeferredDestroy(Object obj)
{
	//native.obj;	
}

// Export UObject::execGetCountryCode(FFrame&, void* const)
native(418) static final function string GetCountryCode();

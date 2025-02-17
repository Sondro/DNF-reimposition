/*******************************************************************************
 * MP_Nuke generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_Nuke extends MP_Weapon;

const NUKE_WS_PreIdle = 16;

var class<NukeWeaponSubConfig> NukeSubConfig;
var int CountdownIndex;
var float NukeArmTime;
var bool bFinishedPreIdle;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		rClientCountdown;
}

simulated event ScriptGetActorColor()
{
	// End:0x29
	if(__NFUN_200__(NukeArmTime, 0))
	{
		__NFUN_601__('Generic0', NukeSubConfig.default.NukeUnarmedColor);		
	}
	else
	{
		__NFUN_601__('Generic0', __NFUN_338__(__NFUN_227__(__NFUN_196__(__NFUN_199__(Level.GameTimeSeconds, NukeArmTime), NukeSubConfig.default.NukeArmColorTransitionTime), 0, 1), NukeSubConfig.default.NukeUnarmedColor, NukeSubConfig.default.NukeArmedColor));
	}
	super(Actor).ScriptGetActorColor();
	return;
}

simulated function name GetWeaponAnimReq(byte WeaponStateReq, optional out byte byForceReset)
{
	// End:0x13
	if(__NFUN_173__(int(WeaponStateReq), 16))
	{
		return 'PreIdle';
	}
	return super(Weapon).GetWeaponAnimReq(WeaponStateReq, byForceReset);
	return;
}

simulated function WpnPreIdle()
{
	SetWeaponState(16);
	return;
}

simulated function bool CanFire()
{
	return __NFUN_148__(super.CanFire(), IsCountdownComplete());
	return;
}

simulated function FireSuccess(bool bContinueFire)
{
	DisableCountdownPanel();
	super(Weapon).FireSuccess(bContinueFire);
	return;
}

simulated function rClientCountdown(int NewCountdownIndex)
{
	NukeSubConfig.default.CountdownInfo[NewCountdownIndex].Smacker.SetFrame(0);
	__NFUN_741__(NukeSubConfig.default.CountdownMaterialIndex, NukeSubConfig.default.CountdownInfo[NewCountdownIndex].Material);
	CountdownIndex = NewCountdownIndex;
	return;
}

function CountDown()
{
	local int Index;

	__NFUN_184__(CountdownIndex);
	rClientCountdown(CountdownIndex);
	// End:0xAD
	if(FindSoundIndex(NukeSubConfig.default.CountdownInfo[CountdownIndex].SoundName, Index))
	{
		VoicePack.default.CharacterSounds[Index].SoundInfo.SoundLocationOverride.OverrideType = 2;
		VoicePack.default.CharacterSounds[Index].SoundInfo.SoundLocationOverride.Location3D = Location;
		PlaySoundInfo(3, VoicePack.default.CharacterSounds[Index].SoundInfo);
	}
	// End:0xBE
	if(IsCountdownComplete())
	{
		__NFUN_606__('CountDown');
	}
	return;
}

simulated function DisableCountdownPanel()
{
	__NFUN_741__(NukeSubConfig.default.CountdownMaterialIndex, NukeSubConfig.default.PanelOffMaterial);
	return;
}

function SetInitialCountdownState()
{
	CountdownIndex = -1;
	CountDown();
	__NFUN_605__(NukeSubConfig.default.CountDownTimer, true, 'CountDown');
	return;
}

simulated function bool IsCountdownComplete()
{
	return __NFUN_172__(CountdownIndex, __NFUN_166__(string(NukeSubConfig.default.CountdownInfo), 1));
	return;
}

k2call simulated function SwitchRocket()
{
	NukeArmTime = -1;
	return;
}

k2call simulated function TapRocket()
{
	NukeArmTime = Level.GameTimeSeconds;
	return;
}

simulated function ResetProjectileMeshes()
{
	// End:0x2D
	if(__NFUN_340__(InsertingClip, none))
	{
		InsertingClip.__NFUN_633__(WeaponClipMount, self);
		InsertingClip.__NFUN_590__(true);
	}
	// End:0x5F
	if(__NFUN_340__(EjectingClip, none))
	{
		EjectingClip.__NFUN_633__(WeaponClipMount, self);
		EjectingClip.__NFUN_590__(bHidden);
	}
	return;
}

k2call simulated function Remove_Rocket(optional EventInfo AnimEventInfo)
{
	// End:0x65
	if(__NFUN_148__(__NFUN_340__(EjectingClip, none), Instigator.bIsPlayerPawn))
	{
		EjectingClip.__NFUN_590__(false);
		EjectingClip.DestroyOnDismount = false;
		EjectingClip.__NFUN_631__();
		EjectingClip.__NFUN_633__(UserInsertClipMount, Instigator);
	}
	return;
}

k2call simulated function Mount_Nuke_Player(optional EventInfo AnimEventInfo)
{
	// End:0x4E
	if(__NFUN_148__(__NFUN_340__(EjectingClip, none), Instigator.bIsPlayerPawn))
	{
		EjectingClip.__NFUN_590__(true);
		EjectingClip.DestroyOnDismount = false;
		EjectingClip.__NFUN_631__();
	}
	// End:0xB3
	if(__NFUN_148__(__NFUN_340__(InsertingClip, none), Instigator.bIsPlayerPawn))
	{
		InsertingClip.__NFUN_590__(false);
		InsertingClip.DestroyOnDismount = false;
		InsertingClip.__NFUN_631__();
		InsertingClip.__NFUN_633__(UserInsertClipMount, Instigator);
	}
	return;
}

k2call simulated function Mount_Nuke_Weapon(optional EventInfo AnimEventInfo)
{
	// End:0x3E
	if(__NFUN_340__(InsertingClip, none))
	{
		InsertingClip.DestroyOnDismount = false;
		InsertingClip.__NFUN_631__();
		InsertingClip.__NFUN_633__(WeaponClipMount, self);
	}
	return;
}

simulated event int GetLoadedAmmo()
{
	return 1;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local int i;

	super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1283__('PreIdle', AnimationControllerClass, Mesh);
	PrecacheIndex.__NFUN_1281__(__NFUN_344__(WeaponConfig.default.WeaponAnimName, 'PreIdle'));
	// End:0xF4
	if(__NFUN_340__(NukeSubConfig, none))
	{
		PrecacheIndex.__NFUN_1269__(NukeSubConfig.default.PanelOffMaterial);
		i = __NFUN_166__(string(NukeSubConfig.default.CountdownInfo), 1);
		J0x8C:

		// End:0xF4 [Loop If]
		if(__NFUN_172__(i, 0))
		{
			PrecacheIndex.__NFUN_1277__(VoicePack, NukeSubConfig.default.CountdownInfo[i].SoundName);
			PrecacheIndex.__NFUN_1269__(NukeSubConfig.default.CountdownInfo[i].Material);
			__NFUN_185__(i);
			// [Loop Continue]
			goto J0x8C;
		}
	}
	return;
}

state PreIdle
{
	simulated event BeginState()
	{
		WpnPreIdle();
		return;
	}

	simulated function EndState()
	{
		bFinishedPreIdle = true;
		return;
	}

	k2call simulated function WeaponCallback_AnimEnd()
	{
		TryState('idle');
		return;
	}
	stop;
}

state idle
{
	simulated event BeginState()
	{
		super.BeginState();
		// End:0x1D
		if(bFinishedPreIdle)
		{
			SetInitialCountdownState();
			bFinishedPreIdle = false;
		}
		return;
	}
	stop;
}

state Activating
{
	simulated function BeginState()
	{
		DisableCountdownPanel();
		ResetProjectileMeshes();
		super.BeginState();
		return;
	}
	stop;
}

state Deactivating
{
	simulated event BeginState()
	{
		__NFUN_606__('CountDown');
		ResetProjectileMeshes();
		super.BeginState();
		return;
	}
	stop;
}

defaultproperties
{
	NukeSubConfig='NukeWeaponSubConfig'
	WeaponConfig='MP_NukeWeaponConfig'
	HUDAmmoClipIcon=6
	FullClipRenderObject='sm_class_dukeitems.rpg_Nuke.rpg_Nuke'
	EmptyClipRenderObject='sm_class_dukeitems.rpg_rocket.rpg_rocket'
	UserInsertClipMount=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_handleft,MountOrigin=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	WeaponClipMount=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=misile_shaft,MountOrigin=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	dnInventoryCategory=4
	dnCategoryPriority=2
	CommandAlias="UseWeapon dnGame.MP_Nuke"
	InventoryReferenceClass='MP_Nuke'
	PickupClass='MP_NukePickup'
	bIsPrimaryWeapon=true
	HUDPickupEventIcon=5
	AutoRegisterIKClasses=/* Array type was not detected. */
}
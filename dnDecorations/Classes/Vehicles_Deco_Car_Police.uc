/*******************************************************************************
 * Vehicles_Deco_Car_Police generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Vehicles_Deco_Car_Police extends Vehicles_Deco_Car_Standard_Base
	collapsecategories;

var bool bLightBarUp;

function PostVerifySelf()
{
	super.PostVerifySelf();
	__NFUN_605__(0.05, true, 'LightBarAction');
	return;
}

function LightBarAction()
{
	local int Speed;

	Speed = 15;
	// End:0xCB
	if(bLightBarUp)
	{
		__NFUN_153__(ActorColorList[0].ActorColor.R, byte(Speed));
		__NFUN_153__(ActorColorList[0].ActorColor.G, byte(Speed));
		__NFUN_153__(ActorColorList[0].ActorColor.B, byte(Speed));
		__NFUN_154__(ActorColorList[1].ActorColor.R, byte(Speed));
		__NFUN_154__(ActorColorList[1].ActorColor.G, byte(Speed));
		__NFUN_154__(ActorColorList[1].ActorColor.B, byte(Speed));
		// End:0xC8
		if(__NFUN_172__(int(ActorColorList[0].ActorColor.R), 225))
		{
			bLightBarUp = false;
		}		
	}
	else
	{
		__NFUN_154__(ActorColorList[0].ActorColor.R, byte(Speed));
		__NFUN_154__(ActorColorList[0].ActorColor.G, byte(Speed));
		__NFUN_154__(ActorColorList[0].ActorColor.B, byte(Speed));
		__NFUN_153__(ActorColorList[1].ActorColor.R, byte(Speed));
		__NFUN_153__(ActorColorList[1].ActorColor.G, byte(Speed));
		__NFUN_153__(ActorColorList[1].ActorColor.B, byte(Speed));
		// End:0x182
		if(__NFUN_171__(int(ActorColorList[0].ActorColor.R), 25))
		{
			bLightBarUp = true;
		}
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1267__(class'CrownVic_Wheel_Brnt');
	return;
}

defaultproperties
{
	CarColor=6
	VehicleParts(0)=(ByteProperty==Engine,bCanBlowOff=false,bDestroyOnExplosion=true,VehiclePartID=Window_Front,VehiclePartStyle=0,VehiclePartActor=none)
}
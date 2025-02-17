/*******************************************************************************
 * dnRocket_Gunship generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnRocket_Gunship extends dnRocket_AssaultCommander
	collapsecategories;

simulated function InitializeMotion()
{
	Velocity = __NFUN_235__(__NFUN_198__(Speed, __NFUN_251__(Owner.Velocity)), Vector(Rotation));
	Acceleration = __NFUN_235__(AccelerationScaler, Vector(Rotation));
	return;
}

defaultproperties
{
	MaxSpeed=1E+08
	ExplosionClass='p_Vehicles.Alien_Gunship_Attack.Alien_Gunship_Rocket_Spawner'
	ExplosionLight='dnExplosionLight_Rocket_Gunship'
}
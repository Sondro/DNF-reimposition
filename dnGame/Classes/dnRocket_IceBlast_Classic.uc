/*******************************************************************************
 * dnRocket_IceBlast_Classic generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnRocket_IceBlast_Classic extends dnRocket_IceBlast
	collapsecategories;

simulated event PostVerifySelf()
{
	local int i;

	super(Projectile).PostVerifySelf();
	i = __NFUN_166__(string(MountedActorList), 1);
	J0x15:

	// End:0x65 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x5B
		if(MountedActorList[i].MountedActor.bIsSoftParticleSystem)
		{
			MountedActorList[i].MountedActor.bTickOnlyZoneRecent = false;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x15;
	}
	return;
}

defaultproperties
{
	NumBounces=2
	LifeSpan=0
}
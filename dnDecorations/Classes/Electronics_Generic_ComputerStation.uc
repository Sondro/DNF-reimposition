/*******************************************************************************
 * Electronics_Generic_ComputerStation generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_ComputerStation extends Electronics_Generic
	collapsecategories;

var int BodyTexIdx;
var array<MaterialEx> BodyTextures;
var array<MaterialEx> DestroyedBodyTextures;
var int PanelTexIdx_Left;
var int PanelTexIdx_Right;
var array<MaterialEx> PanelTextures;
var array<MaterialEx> DestroyedPanelTextures;

function PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	FindTextureIndices();
	return;
}

final function FindTextureIndices()
{
	local int i;

	BodyTexIdx = -1;
	i = __NFUN_166__(string(BodyTextures), 1);
	J0x1A:

	// End:0x52 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x48
		if(__NFUN_339__(BodyTextures[i], __NFUN_740__(0)))
		{
			BodyTexIdx = i;
			// [Explicit Break]
			goto J0x52;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x1A;
	}
	J0x52:

	PanelTexIdx_Left = -1;
	i = __NFUN_166__(string(PanelTextures), 1);
	J0x6C:

	// End:0xA4 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x9A
		if(__NFUN_339__(PanelTextures[i], __NFUN_740__(1)))
		{
			PanelTexIdx_Left = i;
			// [Explicit Break]
			goto J0xA4;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x6C;
	}
	J0xA4:

	PanelTexIdx_Right = -1;
	i = __NFUN_166__(string(PanelTextures), 1);
	J0xBE:

	// End:0xF7 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0xED
		if(__NFUN_339__(PanelTextures[i], __NFUN_740__(2)))
		{
			PanelTexIdx_Right = i;
			// [Explicit Break]
			goto J0xF7;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0xBE;
	}
	J0xF7:

	return;
}

function Destroyed()
{
	super(dnDecoration).Destroyed();
	// End:0x24
	if(__NFUN_174__(BodyTexIdx, -1))
	{
		__NFUN_741__(0, DestroyedBodyTextures[BodyTexIdx]);
	}
	// End:0x42
	if(__NFUN_174__(PanelTexIdx_Left, -1))
	{
		__NFUN_741__(1, DestroyedPanelTextures[PanelTexIdx_Left]);
	}
	// End:0x61
	if(__NFUN_174__(PanelTexIdx_Right, -1))
	{
		__NFUN_741__(2, DestroyedPanelTextures[PanelTexIdx_Right]);
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	FindTextureIndices();
	// End:0x38
	if(__NFUN_174__(BodyTexIdx, -1))
	{
		PrecacheIndex.__NFUN_1269__(DestroyedBodyTextures[BodyTexIdx]);
	}
	// End:0x5F
	if(__NFUN_174__(PanelTexIdx_Left, -1))
	{
		PrecacheIndex.__NFUN_1269__(DestroyedPanelTextures[PanelTexIdx_Left]);
	}
	// End:0x86
	if(__NFUN_174__(PanelTexIdx_Right, -1))
	{
		PrecacheIndex.__NFUN_1269__(DestroyedPanelTextures[PanelTexIdx_Right]);
	}
	return;
}

defaultproperties
{
	StartupActivities=/* Array type was not detected. */
}
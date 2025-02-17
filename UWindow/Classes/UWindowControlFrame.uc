/*******************************************************************************
 * UWindowControlFrame generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowControlFrame extends UWindowWindow;

var UWindowWindow Framed;

function SetFrame(UWindowWindow W)
{
	Framed = W;
	W.SetParent(self);
	return;
}

function BeforePaint(Canvas C, float X, float Y)
{
	// End:0x22
	if(__NFUN_340__(Framed, none))
	{
		LookAndFeel.ControlFrame_SetupSizes(self, C);
	}
	return;
}

function Paint(Canvas C, float X, float Y)
{
	LookAndFeel.ControlFrame_Draw(self, C);
	return;
}

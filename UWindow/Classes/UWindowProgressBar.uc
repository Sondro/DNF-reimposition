/*******************************************************************************
 * UWindowProgressBar generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowProgressBar extends UWindowWindow;

const BlockWidth = 7;

var float Percent;

function SetPercent(float NewPercent)
{
	Percent = NewPercent;
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local float bLockX, BlockW;
	local Texture Tex;

	Tex = LookAndFeel.Misc;
	// End:0x2D
	if(__NFUN_339__(Tex, none))
	{
		Tex = GetLookAndFeelTexture();
	}
	DrawMiscBevel(C, 0, 0, WinWidth, WinHeight, Tex, 2);
	C.DrawColor.R = 192;
	C.DrawColor.G = 192;
	C.DrawColor.B = 192;
	DrawStretchedTextureSegment(C, float(LookAndFeel.MiscBevelL[2].W), float(LookAndFeel.MiscBevelT[2].h), __NFUN_199__(__NFUN_199__(WinWidth, float(LookAndFeel.MiscBevelL[2].W)), float(LookAndFeel.MiscBevelR[2].W)), __NFUN_199__(__NFUN_199__(WinHeight, float(LookAndFeel.MiscBevelT[2].h)), float(LookAndFeel.MiscBevelB[2].h)), 0, 0, 1, 1, class'WhiteTexture');
	C.DrawColor.R = 0;
	C.DrawColor.G = 0;
	C.DrawColor.B = 255;
	bLockX = float(__NFUN_165__(LookAndFeel.MiscBevelL[2].W, 1));
	J0x1C4:

	// End:0x301 [Loop If]
	if(__NFUN_200__(bLockX, __NFUN_198__(float(__NFUN_165__(1, LookAndFeel.MiscBevelL[2].W)), __NFUN_196__(__NFUN_195__(Percent, __NFUN_199__(__NFUN_199__(__NFUN_199__(WinWidth, float(LookAndFeel.MiscBevelL[2].W)), float(LookAndFeel.MiscBevelR[2].W)), float(2))), float(100)))))
	{
		BlockW = float(__NFUN_188__(7, int(__NFUN_199__(__NFUN_199__(__NFUN_199__(WinWidth, float(LookAndFeel.MiscBevelR[2].W)), bLockX), float(1)))));
		DrawStretchedTextureSegment(C, bLockX, float(__NFUN_165__(LookAndFeel.MiscBevelT[2].h, 1)), BlockW, __NFUN_199__(__NFUN_199__(__NFUN_199__(WinHeight, float(LookAndFeel.MiscBevelT[2].h)), float(LookAndFeel.MiscBevelB[2].h)), float(1)), 0, 0, 1, 1, class'WhiteTexture');
		__NFUN_209__(bLockX, float(__NFUN_165__(7, 1)));
		// [Loop Continue]
		goto J0x1C4;
	}
	C.DrawColor.R = 255;
	C.DrawColor.G = 255;
	C.DrawColor.B = 255;
	return;
}

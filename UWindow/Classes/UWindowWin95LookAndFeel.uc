/*******************************************************************************
 * UWindowWin95LookAndFeel generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowWin95LookAndFeel extends UWindowLookAndFeel;

const SIZEBORDER = 3;
const BRSIZEBORDER = 15;

var() Region FrameSBL;
var() Region FrameSB;
var() Region FrameSBR;
var() Region CloseBoxUp;
var() Region CloseBoxDown;
var() int CloseBoxOffsetX;
var() int CloseBoxOffsetY;

function FW_DrawWindowFrame(UWindowFramedWindow W, Canvas C)
{
	local Texture t;
	local Region R, temp;

	C.DrawColor.R = 255;
	C.DrawColor.G = 255;
	C.DrawColor.B = 255;
	t = W.GetLookAndFeelTexture();
	R = FrameTL;
	W.DrawStretchedTextureSegment(C, 0, 0, float(R.W), float(R.h), float(R.X), float(R.Y), float(R.W), float(R.h), t);
	R = FrameT;
	W.DrawStretchedTextureSegment(C, float(FrameTL.W), 0, __NFUN_199__(__NFUN_199__(W.WinWidth, float(FrameTL.W)), float(FrameTR.W)), float(R.h), float(R.X), float(R.Y), float(R.W), float(R.h), t);
	R = FrameTR;
	W.DrawStretchedTextureSegment(C, __NFUN_199__(W.WinWidth, float(R.W)), 0, float(R.W), float(R.h), float(R.X), float(R.Y), float(R.W), float(R.h), t);
	// End:0x20A
	if(W.bStatusBar)
	{
		temp = FrameSBL;		
	}
	else
	{
		temp = FrameBL;
	}
	R = FrameL;
	W.DrawStretchedTextureSegment(C, 0, float(FrameTL.h), float(R.W), __NFUN_199__(__NFUN_199__(W.WinHeight, float(FrameTL.h)), float(temp.h)), float(R.X), float(R.Y), float(R.W), float(R.h), t);
	R = FrameR;
	W.DrawStretchedTextureSegment(C, __NFUN_199__(W.WinWidth, float(R.W)), float(FrameTL.h), float(R.W), __NFUN_199__(__NFUN_199__(W.WinHeight, float(FrameTL.h)), float(temp.h)), float(R.X), float(R.Y), float(R.W), float(R.h), t);
	// End:0x377
	if(W.bStatusBar)
	{
		R = FrameSBL;		
	}
	else
	{
		R = FrameBL;
	}
	W.DrawStretchedTextureSegment(C, 0, __NFUN_199__(W.WinHeight, float(R.h)), float(R.W), float(R.h), float(R.X), float(R.Y), float(R.W), float(R.h), t);
	// End:0x4C1
	if(W.bStatusBar)
	{
		R = FrameSB;
		W.DrawStretchedTextureSegment(C, float(FrameBL.W), __NFUN_199__(W.WinHeight, float(R.h)), __NFUN_199__(__NFUN_199__(W.WinWidth, float(FrameSBL.W)), float(FrameSBR.W)), float(R.h), float(R.X), float(R.Y), float(R.W), float(R.h), t);		
	}
	else
	{
		R = FrameB;
		W.DrawStretchedTextureSegment(C, float(FrameBL.W), __NFUN_199__(W.WinHeight, float(R.h)), __NFUN_199__(__NFUN_199__(W.WinWidth, float(FrameBL.W)), float(FrameBR.W)), float(R.h), float(R.X), float(R.Y), float(R.W), float(R.h), t);
	}
	// End:0x58E
	if(W.bStatusBar)
	{
		R = FrameSBR;		
	}
	else
	{
		R = FrameBR;
	}
	W.DrawStretchedTextureSegment(C, __NFUN_199__(W.WinWidth, float(R.W)), __NFUN_199__(W.WinHeight, float(R.h)), float(R.W), float(R.h), float(R.X), float(R.Y), float(R.W), float(R.h), t);
	C.Font = C.TallFont;
	// End:0x688
	if(__NFUN_339__(W.ParentWindow.ActiveWindow, W))
	{
		C.DrawColor = FrameActiveTitleColor;		
	}
	else
	{
		C.DrawColor = FrameInactiveTitleColor;
	}
	W.ClipText(C, float(FrameTitleX), float(FrameTitleY), W.WindowTitle);
	// End:0x7A7
	if(W.bStatusBar)
	{
		C.DrawColor.R = 0;
		C.DrawColor.G = 0;
		C.DrawColor.B = 0;
		W.ClipText(C, 6, __NFUN_199__(W.WinHeight, float(13)), W.StatusBarText);
		C.DrawColor.R = 255;
		C.DrawColor.G = 255;
		C.DrawColor.B = 255;
	}
	return;
}

function FW_SetupFrameButtons(UWindowFramedWindow W, Canvas C)
{
	local Texture t;

	t = W.GetLookAndFeelTexture();
	W.CloseBox.WinLeft = __NFUN_199__(__NFUN_199__(W.WinWidth, float(CloseBoxOffsetX)), float(CloseBoxUp.W));
	W.CloseBox.WinTop = float(CloseBoxOffsetY);
	W.CloseBox.SetSize(float(CloseBoxUp.W), float(CloseBoxUp.h));
	W.CloseBox.bUseRegion = true;
	W.CloseBox.UpTexture = t;
	W.CloseBox.DownTexture = t;
	W.CloseBox.OverTexture = t;
	W.CloseBox.DisabledTexture = t;
	W.CloseBox.UpRegion = CloseBoxUp;
	W.CloseBox.DownRegion = CloseBoxDown;
	W.CloseBox.OverRegion = CloseBoxUp;
	W.CloseBox.DisabledRegion = CloseBoxUp;
	return;
}

function Region FW_GetClientArea(UWindowFramedWindow W)
{
	local Region R;

	R.X = FrameL.W;
	R.Y = FrameT.h;
	R.W = int(__NFUN_199__(W.WinWidth, float(__NFUN_165__(FrameL.W, FrameR.W))));
	// End:0xA8
	if(W.bStatusBar)
	{
		R.h = int(__NFUN_199__(W.WinHeight, float(__NFUN_165__(FrameT.h, FrameSB.h))));		
	}
	else
	{
		R.h = int(__NFUN_199__(W.WinHeight, float(__NFUN_165__(FrameT.h, FrameB.h))));
	}
	return R;
	return;
}

function UWindowBase.FrameHitTest FW_HitTest(UWindowFramedWindow W, float X, float Y)
{
	// End:0x4E
	if(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_203__(X, float(3)), __NFUN_202__(X, __NFUN_199__(W.WinWidth, float(3)))), __NFUN_203__(Y, float(3))), __NFUN_202__(Y, float(14))))
	{
		return 8;
	}
	// End:0x8B
	if(__NFUN_150__(__NFUN_148__(__NFUN_200__(X, float(15)), __NFUN_200__(Y, float(3))), __NFUN_148__(__NFUN_200__(X, float(3)), __NFUN_200__(Y, float(15)))))
	{
		return 0;
	}
	// End:0xEA
	if(__NFUN_150__(__NFUN_148__(__NFUN_201__(X, __NFUN_199__(W.WinWidth, float(3))), __NFUN_200__(Y, float(15))), __NFUN_148__(__NFUN_201__(X, __NFUN_199__(W.WinWidth, float(15))), __NFUN_200__(Y, float(3)))))
	{
		return 2;
	}
	// End:0x149
	if(__NFUN_150__(__NFUN_148__(__NFUN_200__(X, float(15)), __NFUN_201__(Y, __NFUN_199__(W.WinHeight, float(3)))), __NFUN_148__(__NFUN_200__(X, float(3)), __NFUN_201__(Y, __NFUN_199__(W.WinHeight, float(15))))))
	{
		return 5;
	}
	// End:0x18A
	if(__NFUN_148__(__NFUN_201__(X, __NFUN_199__(W.WinWidth, float(15))), __NFUN_201__(Y, __NFUN_199__(W.WinHeight, float(15)))))
	{
		return 7;
	}
	// End:0x19A
	if(__NFUN_200__(Y, float(3)))
	{
		return 1;
	}
	// End:0x1BB
	if(__NFUN_201__(Y, __NFUN_199__(W.WinHeight, float(3))))
	{
		return 6;
	}
	// End:0x1CB
	if(__NFUN_200__(X, float(3)))
	{
		return 3;
	}
	// End:0x1EC
	if(__NFUN_201__(X, __NFUN_199__(W.WinWidth, float(3))))
	{
		return 4;
	}
	return 10;
	return;
}

function DrawClientArea(UWindowWindow W, Canvas C)
{
	W.DrawStretchedTexture(C, 0, 0, W.WinWidth, W.WinHeight, class'BlackTexture');
	return;
}

function ComboList_DrawBackground(UWindowComboList W, Canvas C)
{
	W.DrawClippedTexture(C, 0, 0, Texture'MenuTL');
	W.DrawStretchedTexture(C, 4, 0, __NFUN_199__(W.WinWidth, float(8)), 4, Texture'MenuT');
	W.DrawClippedTexture(C, __NFUN_199__(W.WinWidth, float(4)), 0, Texture'MenuTR');
	W.DrawClippedTexture(C, 0, __NFUN_199__(W.WinHeight, float(4)), Texture'MenuBL');
	W.DrawStretchedTexture(C, 4, __NFUN_199__(W.WinHeight, float(4)), __NFUN_199__(W.WinWidth, float(8)), 4, Texture'MenuB');
	W.DrawClippedTexture(C, __NFUN_199__(W.WinWidth, float(4)), __NFUN_199__(W.WinHeight, float(4)), Texture'MenuBR');
	W.DrawStretchedTexture(C, 0, 4, 4, __NFUN_199__(W.WinHeight, float(8)), Texture'MenuL');
	W.DrawStretchedTexture(C, __NFUN_199__(W.WinWidth, float(4)), 4, 4, __NFUN_199__(W.WinHeight, float(8)), Texture'MenuR');
	W.DrawStretchedTexture(C, 4, 4, __NFUN_199__(W.WinWidth, float(8)), __NFUN_199__(W.WinHeight, float(8)), Texture'MenuArea');
	return;
}

function ComboList_DrawItem(UWindowComboList Combo, Canvas C, float X, float Y, float W, float h, string Text, bool bSelected)
{
	C.DrawColor.R = 255;
	C.DrawColor.G = 255;
	C.DrawColor.B = 255;
	// End:0xC4
	if(bSelected)
	{
		Combo.DrawStretchedTexture(C, X, Y, W, h, Texture'MenuHighlight');
		C.DrawColor.R = 0;
		C.DrawColor.G = 0;
		C.DrawColor.B = 0;		
	}
	else
	{
		C.DrawColor.R = 0;
		C.DrawColor.G = 0;
		C.DrawColor.B = 0;
	}
	Combo.ClipText(C, __NFUN_198__(__NFUN_198__(X, float(Combo.TextBorder)), float(2)), __NFUN_198__(Y, float(3)), Text);
	return;
}

function Checkbox_SetupSizes(UWindowCheckbox W, Canvas C)
{
	super.Checkbox_SetupSizes(W, C);
	// End:0x7A
	if(W.bChecked)
	{
		W.UpTexture = Texture'ChkChecked';
		W.DownTexture = Texture'ChkChecked';
		W.OverTexture = Texture'ChkChecked';
		W.DisabledTexture = Texture'ChkCheckedDisabled';		
	}
	else
	{
		W.UpTexture = Texture'ChkUnchecked';
		W.DownTexture = Texture'ChkUnchecked';
		W.OverTexture = Texture'ChkUnchecked';
		W.DisabledTexture = Texture'ChkUncheckedDisabled';
	}
	return;
}

function Combo_GetButtonBitmaps(UWindowComboButton W)
{
	local Texture t;

	t = W.GetLookAndFeelTexture();
	W.bUseRegion = true;
	W.UpTexture = t;
	W.DownTexture = t;
	W.OverTexture = t;
	W.DisabledTexture = t;
	W.UpRegion = ComboBtnUp;
	W.DownRegion = ComboBtnDown;
	W.OverRegion = ComboBtnUp;
	W.DisabledRegion = ComboBtnDisabled;
	return;
}

function Editbox_Draw(UWindowEditControl W, Canvas C)
{
	W.DrawMiscBevel(C, W.EditAreaDrawX, 0, W.EditBoxWidth, W.WinHeight, Misc, EditBoxBevel);
	super.Editbox_Draw(W, C);
	return;
}

function Tab_DrawTab(UWindowTabControlTabArea Tab, Canvas C, bool bActiveTab, bool bLeftmostTab, float X, float Y, float W, float h, string Text, bool bShowText)
{
	local Region R;
	local Texture t;
	local float tW, tH;

	C.DrawColor.R = 255;
	C.DrawColor.G = 255;
	C.DrawColor.B = 255;
	t = Tab.GetLookAndFeelTexture();
	// End:0x2BD
	if(bActiveTab)
	{
		R = TabSelectedL;
		Tab.DrawStretchedTextureSegment(C, X, Y, float(R.W), float(R.h), float(R.X), float(R.Y), float(R.W), float(R.h), t);
		R = TabSelectedM;
		Tab.DrawStretchedTextureSegment(C, __NFUN_198__(X, float(TabSelectedL.W)), Y, __NFUN_199__(__NFUN_199__(W, float(TabSelectedL.W)), float(TabSelectedR.W)), float(R.h), float(R.X), float(R.Y), float(R.W), float(R.h), t);
		R = TabSelectedR;
		Tab.DrawStretchedTextureSegment(C, __NFUN_199__(__NFUN_198__(X, W), float(R.W)), Y, float(R.W), float(R.h), float(R.X), float(R.Y), float(R.W), float(R.h), t);
		C.Font = C.TallFont;
		C.DrawColor.R = 0;
		C.DrawColor.G = 0;
		C.DrawColor.B = 0;
		// End:0x2BA
		if(bShowText)
		{
			Tab.TextSize(C, Text, tW, tH);
			Tab.ClipText(C, __NFUN_198__(X, __NFUN_196__(__NFUN_199__(W, tW), float(2))), __NFUN_198__(Y, float(3)), Text, true);
		}		
	}
	else
	{
		R = TabUnselectedL;
		Tab.DrawStretchedTextureSegment(C, X, Y, float(R.W), float(R.h), float(R.X), float(R.Y), float(R.W), float(R.h), t);
		R = TabUnselectedM;
		Tab.DrawStretchedTextureSegment(C, __NFUN_198__(X, float(TabUnselectedL.W)), Y, __NFUN_199__(__NFUN_199__(W, float(TabUnselectedL.W)), float(TabUnselectedR.W)), float(R.h), float(R.X), float(R.Y), float(R.W), float(R.h), t);
		R = TabUnselectedR;
		Tab.DrawStretchedTextureSegment(C, __NFUN_199__(__NFUN_198__(X, W), float(R.W)), Y, float(R.W), float(R.h), float(R.X), float(R.Y), float(R.W), float(R.h), t);
		C.Font = C.TallFont;
		C.DrawColor.R = 0;
		C.DrawColor.G = 0;
		C.DrawColor.B = 0;
		// End:0x513
		if(bShowText)
		{
			Tab.TextSize(C, Text, tW, tH);
			Tab.ClipText(C, __NFUN_198__(X, __NFUN_196__(__NFUN_199__(W, tW), float(2))), __NFUN_198__(Y, float(4)), Text, true);
		}
	}
	return;
}

function SB_SetupUpButton(UWindowSBUpButton W)
{
	local Texture t;

	t = W.GetLookAndFeelTexture();
	W.bUseRegion = true;
	W.UpTexture = t;
	W.DownTexture = t;
	W.OverTexture = t;
	W.DisabledTexture = t;
	W.UpRegion = SBUpUp;
	W.DownRegion = SBUpDown;
	W.OverRegion = SBUpUp;
	W.DisabledRegion = SBUpDisabled;
	return;
}

function SB_SetupDownButton(UWindowSBDownButton W)
{
	local Texture t;

	t = W.GetLookAndFeelTexture();
	W.bUseRegion = true;
	W.UpTexture = t;
	W.DownTexture = t;
	W.OverTexture = t;
	W.DisabledTexture = t;
	W.UpRegion = SBDownUp;
	W.DownRegion = SBDownDown;
	W.OverRegion = SBDownUp;
	W.DisabledRegion = SBDownDisabled;
	return;
}

function SB_SetupLeftButton(UWindowSBLeftButton W)
{
	local Texture t;

	t = W.GetLookAndFeelTexture();
	W.bUseRegion = true;
	W.UpTexture = t;
	W.DownTexture = t;
	W.OverTexture = t;
	W.DisabledTexture = t;
	W.UpRegion = SBLeftUp;
	W.DownRegion = SBLeftDown;
	W.OverRegion = SBLeftUp;
	W.DisabledRegion = SBLeftDisabled;
	return;
}

function SB_SetupRightButton(UWindowSBRightButton W)
{
	local Texture t;

	t = W.GetLookAndFeelTexture();
	W.bUseRegion = true;
	W.UpTexture = t;
	W.DownTexture = t;
	W.OverTexture = t;
	W.DisabledTexture = t;
	W.UpRegion = SBRightUp;
	W.DownRegion = SBRightDown;
	W.OverRegion = SBRightUp;
	W.DisabledRegion = SBRightDisabled;
	return;
}

function SB_VDraw(UWindowVScrollbar W, Canvas C)
{
	local Region R;
	local Texture t;

	t = W.GetLookAndFeelTexture();
	R = SBBackground;
	W.DrawStretchedTextureSegment(C, 0, 0, W.WinWidth, W.WinHeight, float(R.X), float(R.Y), float(R.W), float(R.h), t);
	// End:0xEC
	if(__NFUN_145__(W.bDisabled))
	{
		W.DrawUpBevel(C, 0, W.ThumbStart, float(SBPosIndicator.W), W.ThumbHeight, t);
	}
	return;
}

function SB_HDraw(UWindowHScrollbar W, Canvas C)
{
	local Region R;
	local Texture t;

	t = W.GetLookAndFeelTexture();
	R = SBBackground;
	W.DrawStretchedTextureSegment(C, 0, 0, W.WinWidth, W.WinHeight, float(R.X), float(R.Y), float(R.W), float(R.h), t);
	// End:0xEC
	if(__NFUN_145__(W.bDisabled))
	{
		W.DrawUpBevel(C, W.ThumbStart, 0, W.ThumbWidth, float(SBPosIndicator.h), t);
	}
	return;
}

function Tab_SetupLeftButton(UWindowTabControlLeftButton W)
{
	local Texture t;

	t = W.GetLookAndFeelTexture();
	W.WinWidth = float(SBPosIndicator.W);
	W.WinHeight = float(SBPosIndicator.h);
	W.WinTop = __NFUN_199__(Size_TabAreaHeight, W.WinHeight);
	W.WinLeft = __NFUN_199__(W.ParentWindow.WinWidth, __NFUN_195__(float(2), W.WinWidth));
	W.bUseRegion = true;
	W.UpTexture = t;
	W.DownTexture = t;
	W.OverTexture = t;
	W.DisabledTexture = t;
	W.UpRegion = SBLeftUp;
	W.DownRegion = SBLeftDown;
	W.OverRegion = SBLeftUp;
	W.DisabledRegion = SBLeftDisabled;
	return;
}

function Tab_SetupRightButton(UWindowTabControlRightButton W)
{
	local Texture t;

	t = W.GetLookAndFeelTexture();
	W.WinWidth = float(SBPosIndicator.W);
	W.WinHeight = float(SBPosIndicator.h);
	W.WinTop = __NFUN_199__(float(SBPosIndicator.h), W.WinHeight);
	W.WinLeft = __NFUN_199__(W.ParentWindow.WinWidth, W.WinWidth);
	W.bUseRegion = true;
	W.UpTexture = t;
	W.DownTexture = t;
	W.OverTexture = t;
	W.DisabledTexture = t;
	W.UpRegion = SBRightUp;
	W.DownRegion = SBRightDown;
	W.OverRegion = SBRightUp;
	W.DisabledRegion = SBRightDisabled;
	return;
}

function Tab_SetTabPageSize(UWindowPageControl W, UWindowPageWindow P)
{
	P.WinLeft = 2;
	P.WinTop = __NFUN_198__(__NFUN_199__(W.TabArea.WinHeight, float(__NFUN_166__(TabSelectedM.h, TabUnselectedM.h))), float(3));
	P.SetSize(__NFUN_199__(W.WinWidth, float(4)), __NFUN_199__(__NFUN_199__(W.WinHeight, __NFUN_199__(W.TabArea.WinHeight, float(__NFUN_166__(TabSelectedM.h, TabUnselectedM.h)))), float(6)));
	return;
}

function Tab_DrawTabPageArea(UWindowPageControl W, Canvas C, UWindowPageWindow P)
{
	W.DrawUpBevel(C, 0, Size_TabAreaHeight, W.WinWidth, __NFUN_199__(W.WinHeight, Size_TabAreaHeight), W.GetLookAndFeelTexture());
	return;
}

function Tab_GetTabSize(UWindowTabControlTabArea Tab, Canvas C, string Text, out float W, out float h)
{
	local float tW, tH;

	C.Font = C.TallFont;
	Tab.TextSize(C, Text, tW, tH);
	W = __NFUN_198__(tW, Size_TabSpacing);
	h = tH;
	return;
}

function Menu_DrawMenuBar(UWindowMenuBar W, Canvas C)
{
	W.DrawStretchedTexture(C, 16, 0, __NFUN_199__(W.WinWidth, float(32)), 16, Texture'MenuBar');
	return;
}

function Menu_DrawMenuBarItem(UWindowMenuBar B, UWindowMenuBarItem i, float X, float Y, float W, float h, Canvas C)
{
	// End:0xA4
	if(__NFUN_339__(B.Selected, i))
	{
		B.DrawClippedTexture(C, X, 1, Texture'MenuHighlightL');
		B.DrawClippedTexture(C, __NFUN_199__(__NFUN_198__(X, W), float(1)), 1, Texture'MenuHighlightR');
		B.DrawStretchedTexture(C, __NFUN_198__(X, float(1)), 1, __NFUN_199__(W, float(2)), 16, Texture'MenuHighlightM');
	}
	C.Font = C.TallFont;
	C.DrawColor.R = 0;
	C.DrawColor.G = 0;
	C.DrawColor.B = 0;
	B.ClipText(C, __NFUN_198__(X, float(__NFUN_163__(B.Spacing, 2))), 2, i.Caption, true);
	return;
}

function Menu_DrawPulldownMenuBackground(UWindowPulldownMenu W, Canvas C)
{
	W.DrawClippedTexture(C, 0, 0, Texture'MenuTL');
	W.DrawStretchedTexture(C, 2, 0, __NFUN_199__(W.WinWidth, float(4)), 2, Texture'MenuT');
	W.DrawClippedTexture(C, __NFUN_199__(W.WinWidth, float(2)), 0, Texture'MenuTR');
	W.DrawClippedTexture(C, 0, __NFUN_199__(W.WinHeight, float(2)), Texture'MenuBL');
	W.DrawStretchedTexture(C, 2, __NFUN_199__(W.WinHeight, float(2)), __NFUN_199__(W.WinWidth, float(4)), 2, Texture'MenuB');
	W.DrawClippedTexture(C, __NFUN_199__(W.WinWidth, float(2)), __NFUN_199__(W.WinHeight, float(2)), Texture'MenuBR');
	W.DrawStretchedTexture(C, 0, 2, 2, __NFUN_199__(W.WinHeight, float(4)), Texture'MenuL');
	W.DrawStretchedTexture(C, __NFUN_199__(W.WinWidth, float(2)), 2, 2, __NFUN_199__(W.WinHeight, float(4)), Texture'MenuR');
	W.DrawStretchedTexture(C, 2, 2, __NFUN_199__(W.WinWidth, float(4)), __NFUN_199__(W.WinHeight, float(4)), Texture'MenuArea');
	return;
}

function Menu_DrawPulldownMenuItem(UWindowPulldownMenu m, UWindowPulldownMenuItem Item, Canvas C, float X, float Y, float W, float h, bool bSelected)
{
	C.DrawColor.R = 255;
	C.DrawColor.G = 255;
	C.DrawColor.B = 255;
	Item.ItemTop = __NFUN_198__(Y, m.WinTop);
	// End:0xFD
	if(__NFUN_308__(Item.Caption, "-"))
	{
		C.DrawColor.R = 255;
		C.DrawColor.G = 255;
		C.DrawColor.B = 255;
		m.DrawStretchedTexture(C, X, __NFUN_198__(Y, float(5)), W, 2, Texture'MenuDivider');
		return;
	}
	C.Font = C.TallFont;
	// End:0x153
	if(bSelected)
	{
		m.DrawStretchedTexture(C, X, Y, W, h, Texture'MenuHighlight');
	}
	// End:0x1AE
	if(Item.bDisabled)
	{
		C.DrawColor.R = 96;
		C.DrawColor.G = 96;
		C.DrawColor.B = 96;		
	}
	else
	{
		C.DrawColor.R = 0;
		C.DrawColor.G = 0;
		C.DrawColor.B = 0;
	}
	// End:0x233
	if(Item.bChecked)
	{
		m.DrawClippedTexture(C, __NFUN_198__(X, float(1)), __NFUN_198__(Y, float(3)), Texture'MenuTick');
	}
	// End:0x27E
	if(__NFUN_340__(Item.SubMenu, none))
	{
		m.DrawClippedTexture(C, __NFUN_199__(__NFUN_198__(X, W), float(9)), __NFUN_198__(Y, float(3)), Texture'MenuSubArrow');
	}
	m.ClipText(C, __NFUN_198__(__NFUN_198__(X, float(m.TextBorder)), float(2)), __NFUN_198__(Y, float(3)), Item.Caption, true);
	return;
}

defaultproperties
{
	FrameSBL=(X=0,Y=112,W=2,h=16)
	FrameSB=(X=32,Y=112,W=1,h=16)
	FrameSBR=(X=112,Y=112,W=16,h=16)
	CloseBoxUp=(X=4,Y=32,W=11,h=11)
	CloseBoxDown=(X=4,Y=43,W=11,h=11)
	CloseBoxOffsetX=3
	CloseBoxOffsetY=5
	Active=Texture'Icons.ActiveFrame'
	Misc=Texture'Icons.Misc'
	FrameTL=(X=0,Y=0,W=2,h=16)
	FrameT=(X=32,Y=0,W=1,h=16)
	FrameTR=(X=126,Y=0,W=2,h=16)
	FrameL=(X=0,Y=32,W=2,h=1)
	FrameR=(X=126,Y=32,W=2,h=1)
	FrameBL=(X=0,Y=125,W=2,h=3)
	FrameB=(X=32,Y=125,W=1,h=3)
	FrameBR=(X=126,Y=125,W=2,h=3)
	FrameActiveTitleColor=(B=13,G=1,R=255,A=12)
	FrameInactiveTitleColor=(B=13,G=1,R=255,A=12)
	FrameTitleX=6
	FrameTitleY=4
	BevelUpTL=(X=4,Y=16,W=2,h=2)
	BevelUpT=(X=10,Y=16,W=1,h=2)
	BevelUpTR=(X=18,Y=16,W=2,h=2)
	BevelUpL=(X=4,Y=20,W=2,h=1)
	BevelUpR=(X=18,Y=20,W=2,h=1)
	BevelUpBL=(X=4,Y=30,W=2,h=2)
	BevelUpB=(X=10,Y=30,W=1,h=2)
	BevelUpBR=(X=18,Y=30,W=2,h=2)
	BevelUpArea=(X=8,Y=20,W=1,h=1)
	MiscBevelTL[0]=(X=0,Y=17,W=3,h=3)
	MiscBevelTL[1]=(X=0,Y=0,W=3,h=3)
	MiscBevelTL[2]=(X=0,Y=33,W=2,h=2)
	MiscBevelT[0]=(X=3,Y=17,W=116,h=3)
	MiscBevelT[1]=(X=3,Y=0,W=116,h=3)
	MiscBevelT[2]=(X=2,Y=33,W=1,h=2)
	MiscBevelTR[0]=(X=119,Y=17,W=3,h=3)
	MiscBevelTR[1]=(X=119,Y=0,W=3,h=3)
	MiscBevelTR[2]=(X=11,Y=33,W=2,h=2)
	MiscBevelL[0]=(X=0,Y=20,W=3,h=10)
	MiscBevelL[1]=(X=0,Y=3,W=3,h=10)
	MiscBevelL[2]=(X=0,Y=36,W=2,h=1)
	MiscBevelR[0]=(X=119,Y=20,W=3,h=10)
	MiscBevelR[1]=(X=119,Y=3,W=3,h=10)
	MiscBevelR[2]=(X=11,Y=36,W=2,h=1)
	MiscBevelBL[0]=(X=0,Y=30,W=3,h=3)
	MiscBevelBL[1]=(X=0,Y=14,W=3,h=3)
	MiscBevelBL[2]=(X=0,Y=44,W=2,h=2)
	MiscBevelB[0]=(X=3,Y=30,W=116,h=3)
	MiscBevelB[1]=(X=3,Y=14,W=116,h=3)
	MiscBevelB[2]=(X=2,Y=44,W=1,h=2)
	MiscBevelBR[0]=(X=119,Y=30,W=3,h=3)
	MiscBevelBR[1]=(X=119,Y=14,W=3,h=3)
	MiscBevelBR[2]=(X=11,Y=44,W=2,h=2)
	MiscBevelArea[0]=(X=3,Y=20,W=116,h=10)
	MiscBevelArea[1]=(X=3,Y=3,W=116,h=10)
	MiscBevelArea[2]=(X=2,Y=35,W=9,h=9)
	ComboBtnUp=(X=20,Y=60,W=12,h=12)
	ComboBtnDown=(X=32,Y=60,W=12,h=12)
	ComboBtnDisabled=(X=44,Y=60,W=12,h=12)
	ColumnHeadingHeight=13
	HLine=(X=5,Y=78,W=1,h=2)
	TabSelectedL=(X=4,Y=80,W=3,h=17)
	TabSelectedM=(X=7,Y=80,W=1,h=17)
	TabSelectedR=(X=55,Y=80,W=2,h=17)
	TabUnselectedL=(X=57,Y=80,W=3,h=15)
	TabUnselectedM=(X=60,Y=80,W=1,h=15)
	TabUnselectedR=(X=109,Y=80,W=2,h=15)
	TabBackground=(X=4,Y=79,W=1,h=1)
	SliderBarBox=(X=4,Y=16,W=16,h=16)
	SBUpUp=(X=20,Y=16,W=12,h=10)
	SBUpDown=(X=32,Y=16,W=12,h=10)
	SBUpDisabled=(X=44,Y=16,W=12,h=10)
	SBDownUp=(X=20,Y=26,W=12,h=10)
	SBDownDown=(X=32,Y=26,W=12,h=10)
	SBDownDisabled=(X=44,Y=26,W=12,h=10)
	SBLeftUp=(X=20,Y=48,W=10,h=12)
	SBLeftDown=(X=30,Y=48,W=10,h=12)
	SBLeftDisabled=(X=40,Y=48,W=10,h=12)
	SBRightUp=(X=20,Y=36,W=10,h=12)
	SBRightDown=(X=30,Y=36,W=10,h=12)
	SBRightDisabled=(X=40,Y=36,W=10,h=12)
	SBBackground=(X=4,Y=79,W=1,h=1)
	Size_TabAreaHeight=15
	Size_TabAreaOverhangHeight=2
	Size_TabSpacing=20
	Size_TabXOffset=1
	Pulldown_ItemHeight=15
	Pulldown_VBorder=3
	Pulldown_HBorder=3
	Pulldown_TextBorder=9
}
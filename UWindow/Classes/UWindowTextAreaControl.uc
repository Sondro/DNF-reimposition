/*******************************************************************************
 * UWindowTextAreaControl generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowTextAreaControl extends UWindowDialogControl;

var string TextArea[750];
var string Prompt;
var int BufSize;
var int Head;
var int Tail;
var int Lines;
var int VisibleRows;
var bool bCursor;
var bool bScrollable;
var bool bShowCaret;
var bool bScrollOnResize;
var UWindowVScrollbar VertSB;
var float LastDrawTime;

function Created()
{
	super.Created();
	LastDrawTime = GetLevel().TimeSeconds;
	return;
}

function SetScrollable(bool newScrollable)
{
	bScrollable = newScrollable;
	// End:0x5A
	if(newScrollable)
	{
		VertSB = UWindowVScrollbar(CreateWindow(class'UWindowVScrollbar', __NFUN_199__(WinWidth, float(12)), 0, 12, WinHeight));
		VertSB.bAlwaysOnTop = true;		
	}
	else
	{
		// End:0x7D
		if(__NFUN_340__(VertSB, none))
		{
			VertSB.Close();
			VertSB = none;
		}
	}
	return;
}

function BeforePaint(Canvas C, float X, float Y)
{
	super.BeforePaint(C, X, Y);
	// End:0x9C
	if(__NFUN_340__(VertSB, none))
	{
		VertSB.WinTop = 0;
		VertSB.WinHeight = WinHeight;
		VertSB.WinWidth = float(LookAndFeel.SBPosIndicator.W);
		VertSB.WinLeft = __NFUN_199__(WinWidth, float(LookAndFeel.SBPosIndicator.W));
	}
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local int i, j, Line, TempHead, TempTail;

	local float XL, YL, W, h;

	C.Font = Root.GetFont(Font, C);
	C.DrawColor.R = 255;
	C.DrawColor.G = 255;
	C.DrawColor.B = 255;
	TextSize(C, "TEST", XL, YL);
	VisibleRows = int(__NFUN_196__(WinHeight, YL));
	TempHead = Head;
	TempTail = Tail;
	Line = TempHead;
	TextArea[Line] = Prompt;
	// End:0xFA
	if(__NFUN_308__(Prompt, ""))
	{
		__NFUN_185__(Line);
		// End:0xFA
		if(__NFUN_169__(Line, 0))
		{
			__NFUN_180__(Line, BufSize);
		}
	}
	// End:0x1A8
	if(bScrollable)
	{
		// End:0x1A8
		if(__NFUN_203__(__NFUN_199__(VertSB.MaxPos, VertSB.pos), float(0)))
		{
			__NFUN_181__(Line, int(__NFUN_199__(VertSB.MaxPos, VertSB.pos)));
			__NFUN_181__(TempTail, int(__NFUN_199__(VertSB.MaxPos, VertSB.pos)));
			// End:0x191
			if(__NFUN_169__(Line, 0))
			{
				__NFUN_180__(Line, BufSize);
			}
			// End:0x1A8
			if(__NFUN_169__(TempTail, 0))
			{
				__NFUN_180__(TempTail, BufSize);
			}
		}
	}
	// End:0x1BE
	if(__NFUN_145__(bCursor))
	{
		bShowCaret = false;		
	}
	else
	{
		// End:0x220
		if(__NFUN_150__(__NFUN_201__(GetLevel().TimeSeconds, __NFUN_198__(LastDrawTime, 0.3)), __NFUN_200__(GetLevel().TimeSeconds, LastDrawTime)))
		{
			LastDrawTime = GetLevel().TimeSeconds;
			bShowCaret = __NFUN_145__(bShowCaret);
		}
	}
	i = 0;
	J0x227:

	// End:0x309 [Loop If]
	if(__NFUN_169__(i, __NFUN_165__(VisibleRows, 1)))
	{
		ClipText(C, 2, __NFUN_199__(WinHeight, __NFUN_195__(YL, float(__NFUN_165__(i, 1)))), TextArea[Line]);
		// End:0x2CF
		if(__NFUN_148__(__NFUN_173__(Line, Head), bShowCaret))
		{
			TextSize(C, TextArea[Line], W, h);
			ClipText(C, W, __NFUN_199__(WinHeight, __NFUN_195__(YL, float(__NFUN_165__(i, 1)))), "|");
		}
		// End:0x2E1
		if(__NFUN_173__(TempTail, Line))
		{
			// [Explicit Break]
			goto J0x309;
		}
		__NFUN_185__(Line);
		// End:0x2FF
		if(__NFUN_169__(Line, 0))
		{
			__NFUN_180__(Line, BufSize);
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x227;
	}
	J0x309:

	return;
}

function AddText(string NewLine)
{
	local int i;

	TextArea[Head] = NewLine;
	Head = __NFUN_164__(__NFUN_165__(Head, 1), BufSize);
	// End:0x4A
	if(__NFUN_173__(Head, Tail))
	{
		Tail = __NFUN_164__(__NFUN_165__(Tail, 1), BufSize);
	}
	Lines = __NFUN_166__(Head, Tail);
	// End:0x73
	if(__NFUN_169__(Lines, 0))
	{
		__NFUN_180__(Lines, BufSize);
	}
	// End:0xBC
	if(bScrollable)
	{
		VertSB.SetRange(0, float(Lines), float(VisibleRows));
		VertSB.pos = VertSB.MaxPos;
	}
	return;
}

function Resized()
{
	// End:0x52
	if(bScrollable)
	{
		VertSB.SetRange(0, float(Lines), float(VisibleRows));
		// End:0x52
		if(bScrollOnResize)
		{
			VertSB.pos = VertSB.MaxPos;
		}
	}
	return;
}

function SetPrompt(string NewPrompt)
{
	Prompt = NewPrompt;
	return;
}

function Clear()
{
	TextArea[0] = "";
	Head = 0;
	Tail = 0;
	return;
}

defaultproperties
{
	BufSize=750
	bScrollOnResize=true
}
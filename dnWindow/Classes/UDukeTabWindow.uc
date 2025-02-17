/*******************************************************************************
 * UDukeTabWindow generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeTabWindow extends UWindowWindow;

var UDukeTabWindowTab Tabs[10];
var int TabCount;
var int TabX;
var UDukeTabPage CurrentPage;
var UDukeTabPage Pages[10];
var int CurrentPageIdx;

function Created()
{
	local float X;

	return;
}

function AddTab(string TabName, class<UDukeTabPage> PageClass, int Width)
{
	__NFUN_355__(__NFUN_303__(__NFUN_303__(__NFUN_303__(string(self), "::AddTab("), TabName), ")"));
	Tabs[TabCount] = UDukeTabWindowTab(CreateWindow(class'UDukeTabWindowTab', 0, 50, float(Width), 30));
	Tabs[TabCount].TabName = TabName;
	Tabs[TabCount].PageClass = PageClass;
	Tabs[TabCount].TabWindow = self;
	Tabs[TabCount].Index = TabCount;
	Tabs[TabCount].HideWindow();
	__NFUN_184__(TabCount);
	__NFUN_180__(TabX, Width);
	return;
}

function CreateAllPages()
{
	local int i;

	i = 0;
	J0x07:

	// End:0xD6 [Loop If]
	if(__NFUN_169__(i, TabCount))
	{
		// End:0xCC
		if(__NFUN_148__(__NFUN_340__(Tabs[i], none), __NFUN_339__(Pages[i], none)))
		{
			__NFUN_355__(__NFUN_303__("What is Width:", string(WinWidth)));
			__NFUN_355__(__NFUN_303__("What is Height:", string(WinHeight)));
			Pages[i] = UDukeTabPage(CreateWindow(Tabs[i].PageClass, 0, 0, WinWidth, WinHeight, self));
			Pages[i].HideWindow();
		}
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x07;
	}
	return;
}

function SelectTab(int Index)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x62 [Loop If]
	if(__NFUN_169__(i, TabCount))
	{
		// End:0x40
		if(__NFUN_173__(i, Index))
		{
			Tabs[i].Selected = true;
			// [Explicit Continue]
			goto J0x58;
		}
		Tabs[i].Selected = false;
		J0x58:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x7E
	if(__NFUN_340__(CurrentPage, none))
	{
		CurrentPage.HideWindow();
	}
	// End:0xD1
	if(__NFUN_339__(Pages[Index], none))
	{
		Pages[Index] = UDukeTabPage(CreateWindow(Tabs[Index].PageClass, 0, 0, WinWidth, WinHeight, self));
	}
	Pages[Index].ShowWindow();
	Pages[Index].SetSceneButtons();
	CurrentPage = Pages[Index];
	CurrentPageIdx = Index;
	__NFUN_355__(__NFUN_303__(__NFUN_303__(__NFUN_303__(__NFUN_303__(string(self), "::SelectTab("), string(Index)), ")::CurrentPage:"), string(CurrentPage)));
	return;
}

function NextTab()
{
	// End:0x1C
	if(__NFUN_173__(__NFUN_165__(CurrentPageIdx, 1), TabCount))
	{
		SelectTab(0);		
	}
	else
	{
		SelectTab(__NFUN_165__(CurrentPageIdx, 1));
	}
	return;
}

function OnNavForward()
{
	local int i;

	__NFUN_355__(__NFUN_303__(string(self), "::OnNavForward"));
	i = 0;
	J0x1F:

	// End:0x60 [Loop If]
	if(__NFUN_169__(i, TabCount))
	{
		// End:0x56
		if(__NFUN_340__(Pages[i], none))
		{
			Pages[i].OnNavForward();
		}
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x1F;
	}
	return;
}

function Notify(UWindowWindow W, byte E)
{
	// End:0x2F
	if(W.__NFUN_358__('UDukeTabWindowTab'))
	{
		SelectTab(UDukeTabWindowTab(W).Index);
	}
	return;
}

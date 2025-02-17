/*******************************************************************************
 * UDukeLoginWindow generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeLoginWindow extends UDukeFramedWindow;

function BeforePaint(Canvas C, float X, float Y)
{
	super.BeforePaint(C, X, Y);
	SetSize(__NFUN_196__(Root.WinWidth, float(2)), __NFUN_196__(Root.WinHeight, float(2)));
	WinLeft = __NFUN_196__(__NFUN_199__(Root.WinWidth, WinWidth), float(2));
	WinTop = __NFUN_196__(__NFUN_199__(Root.WinHeight, WinHeight), float(2));
	return;
}

function Close(optional bool bByParent)
{
	super.Close(bByParent);
	DukeConsole(Root.Console).bShowOtherWindow = false;
	// End:0x92
	if(Root.bQuickKeyEnable)
	{
		Root.Console.bCloseForSureThisTime = true;
		Root.Console.CloseUWindow();
		Root.Console.bCloseForSureThisTime = false;
	}
	return;
}

defaultproperties
{
	ClientClass='UDukeLoginMenuSC'
}
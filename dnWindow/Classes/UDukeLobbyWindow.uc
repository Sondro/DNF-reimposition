/*******************************************************************************
 * UDukeLobbyWindow generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeLobbyWindow extends UDukeFramedWindow;

function BeforePaint(Canvas C, float X, float Y)
{
	super.BeforePaint(C, X, Y);
	SetSize(Root.WinWidth, Root.WinHeight);
	WinLeft = __NFUN_196__(__NFUN_199__(Root.WinWidth, WinWidth), float(2));
	WinTop = __NFUN_196__(__NFUN_199__(Root.WinHeight, WinHeight), float(2));
	DukeHUD(GetPlayerOwner().MyHUD).bNoDraw = true;
	return;
}

function WindowHidden()
{
	super(UWindowFramedWindow).WindowHidden();
	DukeHUD(GetPlayerOwner().MyHUD).bNoDraw = false;
	return;
}

function Close(optional bool bByParent)
{
	super.Close(bByParent);
	Root.Console.bShowPreGameLobby = false;
	DukeConsole(Root.Console).bShowOtherWindow = false;
	Root.Console.bCloseForSureThisTime = true;
	Root.Console.CloseUWindow();
	Root.Console.bCloseForSureThisTime = false;
	return;
}

defaultproperties
{
	bHasCloseButton=false
	ClientClass='UDukeLobbySC'
}
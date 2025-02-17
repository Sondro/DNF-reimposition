/*******************************************************************************
 * UDukeInfoCW generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeInfoCW extends UWindowClientWindow;

var UDukeServerList Server;
var UWindowHSplitter HSplitter;
var float PrevSplitPos;

function Created()
{
	super(UWindowWindow).Created();
	HSplitter = UWindowHSplitter(CreateWindow(class'UWindowHSplitter', 0, 0, WinWidth, WinHeight));
	HSplitter.bSizable = false;
	HSplitter.LeftClientWindow = UDukeRulesGrid(HSplitter.CreateWindow(class'UDukeRulesGrid', 0, 0, __NFUN_196__(WinWidth, 2), WinHeight));
	HSplitter.RightClientWindow = UDukePlayerGrid(HSplitter.CreateWindow(class'UDukePlayerGrid', 0, 0, __NFUN_196__(WinWidth, 2), WinHeight));
	return;
}

function Resized()
{
	HSplitter.WinWidth = WinWidth;
	HSplitter.OldWinWidth = WinWidth;
	HSplitter.SplitPos = __NFUN_196__(WinWidth, 2);
	HSplitter.WinHeight = WinHeight;
	super(UWindowWindow).Resized();
	return;
}

function Paint(Canvas C, float X, float Y)
{
	return;
}

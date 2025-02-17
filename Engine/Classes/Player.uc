/*******************************************************************************
 * Player generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Player extends Object
	native
	config
	noexport;

const IDC_ARROW = 0;
const IDC_SIZEALL = 1;
const IDC_SIZENESW = 2;
const IDC_SIZENS = 3;
const IDC_SIZENWSE = 4;
const IDC_SIZEWE = 5;
const IDC_WAIT = 6;

var native const int vfOut;
var native const int vfExec;
var const transient PlayerPawn Actor;
var const transient Console Console;
var const transient bool bWindowsMouseAvailable;
var bool bShowWindowsMouse;
var bool bSuspendPrecaching;
var const transient float WindowsMouseX;
var const transient float WindowsMouseY;
var int CurrentNetSpeed;
var int DynamicNetSpeed;
var globalconfig int ConfiguredInternetSpeed;
var globalconfig int ConfiguredLanSpeed;
var byte SelectedCursor;

// Export UPlayer::execHasFocus(FFrame&, void* const)
native(507) final function bool HasFocus();

// Export UPlayer::execClearInput(FFrame&, void* const)
native(508) final function ClearInput();

defaultproperties
{
	ConfiguredInternetSpeed=26000
	ConfiguredLanSpeed=26000
}
/*******************************************************************************
 * OptionsTexAlign generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class OptionsTexAlign extends OptionsProxy
	native;

enum ETAxis
{
	TAXIS_X,
	TAXIS_Y,
	TAXIS_Z,
	TAXIS_AUTO,
	TAXIS_WALLS
};

var() OptionsTexAlign.ETAxis TAxis;

defaultproperties
{
	TAxis=3
}
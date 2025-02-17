/*******************************************************************************
 * UWindowTabControlLeftButton generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowTabControlLeftButton extends UWindowButton;

function BeforePaint(Canvas C, float X, float Y)
{
	LookAndFeel.Tab_SetupLeftButton(self);
	return;
}

function LMouseDown(float X, float Y)
{
	super(UWindowWindow).LMouseDown(X, Y);
	// End:0x3B
	if(__NFUN_145__(bDisabled))
	{
		__NFUN_185__(UWindowTabControl(ParentWindow).TabArea.TabOffset);
	}
	return;
}

defaultproperties
{
	bNoKeyboard=true
}
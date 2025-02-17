/*******************************************************************************
 * UWindowEditControl generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowEditControl extends UWindowDialogControl
	dependson(UWindowEditBox);

var float EditBoxWidth;
var float EditAreaDrawX;
var float EditAreaDrawY;
var UWindowEditBox EditBox;

function Created()
{
	local Color C;

	super.Created();
	EditBox = UWindowEditBox(CreateWindow(class'UWindowEditBox', 0, 0, WinWidth, WinHeight));
	EditBox.NotifyOwner = self;
	EditBox.bSelectOnFocus = true;
	EditBoxWidth = __NFUN_196__(WinWidth, float(2));
	return;
}

function SetAlphaOnly(bool bAlphaOnly)
{
	EditBox.bAlphaOnly = bAlphaOnly;
	return;
}

function SetNumericOnly(bool bNumericOnly)
{
	EditBox.bNumericOnly = bNumericOnly;
	return;
}

function SetNumericFloat(bool bNumericFloat)
{
	EditBox.bNumericFloat = bNumericFloat;
	return;
}

function SetFont(int NewFont)
{
	super.SetFont(NewFont);
	EditBox.SetFont(NewFont);
	return;
}

function SetHistory(bool bInHistory)
{
	EditBox.SetHistory(bInHistory);
	return;
}

function Clear()
{
	EditBox.Clear();
	return;
}

function string GetValue()
{
	return EditBox.GetValue();
	return;
}

function SetValue(string NewValue)
{
	EditBox.SetValue(NewValue);
	return;
}

function SetMaxLength(int MaxLength)
{
	EditBox.MaxLength = MaxLength;
	return;
}

function Paint(Canvas C, float X, float Y)
{
	LookAndFeel.Editbox_Draw(self, C);
	super(UWindowWindow).Paint(C, X, Y);
	return;
}

function BeforePaint(Canvas C, float X, float Y)
{
	super.BeforePaint(C, X, Y);
	LookAndFeel.Editbox_SetupSizes(self, C);
	return;
}

function SetDelayedNotify(bool bDelayedNotify)
{
	EditBox.bDelayedNotify = bDelayedNotify;
	return;
}

function SetValueProtection(bool bValue)
{
	EditBox.SetValueProtection(bValue);
	return;
}

function SetNoShrinkFont(bool bValue)
{
	EditBox.bNoShrinkFont = bValue;
	return;
}

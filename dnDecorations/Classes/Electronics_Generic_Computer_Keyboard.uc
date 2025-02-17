/*******************************************************************************
 * Electronics_Generic_Computer_Keyboard generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_Computer_Keyboard extends Electronics_Generic_Computer
	abstract
	collapsecategories;

var Electronics_Generic_Computer_CPU CPU;
var Pawn User;

final function SetCPU(Electronics_Generic_Computer_CPU NewCPU)
{
	CPU = NewCPU;
	return;
}

final function KeyPress()
{
	DecoActivity(0, 'KeyPress');
	// End:0x18
	if(DecorationIsDead())
	{
		return;
	}
	// End:0x44
	if(__NFUN_340__(CPU, none))
	{
		CPU.SwitchScreens();
		CPU.ReceivedPeripheralInput();
	}
	return;
}

event Used(Actor Other, Pawn EventInstigator)
{
	super(dnDecoration).Used(Other, EventInstigator);
	bUsable = false;
	// End:0x39
	if(__NFUN_340__(EventInstigator, none))
	{
		EventInstigator.HandQuickAction('HandQuickAction_Switch_FingerPush');
	}
	return;
}

final function BecomeUsable()
{
	bUsable = true;
	return;
}

final function BecomeUnusable()
{
	bUsable = false;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1281__('HandQuickAction_Switch_FingerPush');
	return;
}

defaultproperties
{
	DecoActivities_Default=/* Array type was not detected. */
}
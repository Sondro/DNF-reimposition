/*******************************************************************************
 * BTriggerProperty generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class BTriggerProperty extends BranchingTrigger
	collapsecategories
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

enum EBranchTestType
{
	BT_Equal,
	BT_NotEqual,
	BT_Less,
	BT_LessOrEqual,
	BT_Greater,
	BT_GreaterOrEqual,
	BT_ClassIsChildOf
};

enum EBranchVarType
{
	BV_String,
	BV_Int,
	BV_Float,
	BV_Class
};

enum EBranchJoin
{
	BJ_End,
	BJ_And,
	BJ_Or
};

struct SBranchTest
{
	var() noexport class<Actor> SearchClass "The class of the actor you're looking for a property in.";
	var() noexport deprecated name SearchTag "The tag of the actor you're looking for the property in.";
	var() noexport string SearchProperty "The name of the property (ie., Health, Weapon, etc.).";
	var() noexport int SearchPropertyIndex "If the property name is an array, use this to access the Nth element.";
	var() noexport BTriggerProperty.EBranchVarType SearchType "What type is the variable we're comparing?";
	var() noexport string SearchCompare "What value are we going to be comparing to?" "" "(For classes, just use the straight name of the class, like \"Shotgun\" or \"DukePlayer\".)";
	var() noexport BTriggerProperty.EBranchTestType test "What is the test condition?";
	var() noexport BTriggerProperty.EBranchJoin Join "If doing multiple tests, how should we join the result of this test with the result of the next?";
};

var(BranchingTrigger) noexport bool bWarn "Turn on optional warnings in the log?";
var(BranchingTrigger) SBranchTest Tests[4];

function Trigger(Actor Other, Pawn EventInstigator)
{
	local Actor TestActor;
	local string sPropText;
	local int iTest;
	local bool bPassed, bCurPassed;

	iTest = -1;
	J0x0B:

	__NFUN_184__(iTest);
	// End:0x238
	foreach __NFUN_747__(Tests[iTest].SearchClass, TestActor, Tests[iTest].SearchTag)
	{
		sPropText = TestActor.__NFUN_363__(Tests[iTest].SearchProperty, Tests[iTest].SearchPropertyIndex);
		// End:0x10D
		if(__NFUN_148__(bWarn, __NFUN_308__(sPropText, "")))
		{
			__NFUN_355__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(string(self), " -- test "), string(iTest)), " using actor "), string(TestActor)), " -- couldn't find property "), Tests[iTest].SearchProperty), " (or was empty string)"));
		}
		switch(Tests[iTest].SearchType)
		{
			// End:0x15A
			case 0:
				bCurPassed = CompareStrings(sPropText, Tests[iTest].SearchCompare, Tests[iTest].test);
				// End:0x234
				break;
			// End:0x196
			case 1:
				bCurPassed = CompareInts(int(sPropText), int(Tests[iTest].SearchCompare), Tests[iTest].test);
				// End:0x234
				break;
			// End:0x1D2
			case 2:
				bCurPassed = CompareFloats(float(sPropText), float(Tests[iTest].SearchCompare), Tests[iTest].test);
				// End:0x234
				break;
			// End:0x231
			case 3:
				sPropText = __NFUN_317__(sPropText, __NFUN_315__(sPropText, "'"));
				bCurPassed = CompareClasses(__NFUN_359__(__NFUN_343__(sPropText)), __NFUN_359__(__NFUN_343__(Tests[iTest].SearchCompare)), Tests[iTest].test);
				// End:0x234
				break;
			// End:0xFFFF
			default:
				break;
		}
		// End:0x238
		break;		
	}	
	// End:0x2CD
	if(__NFUN_339__(TestActor, none))
	{
		__NFUN_355__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(string(self), " -- failed test "), string(iTest)), " -- couldn't find actor of class "), string(Tests[iTest].SearchClass)), " with tag "), string(Tests[iTest].SearchTag)));
		bCurPassed = false;
	}
	// End:0x2E8
	if(__NFUN_173__(iTest, 0))
	{
		bPassed = bCurPassed;		
	}
	else
	{
		switch(Tests[__NFUN_166__(iTest, 1)].Join)
		{
			// End:0x31E
			case 1:
				bPassed = __NFUN_148__(bPassed, bCurPassed);
				// End:0x341
				break;
			// End:0x33E
			case 2:
				bPassed = __NFUN_150__(bPassed, bCurPassed);
				// End:0x341
				break;
			// End:0xFFFF
			default:
				break;
		}
	}
	// End:0x0B
	if(!(__NFUN_150__(__NFUN_172__(iTest, 4), __NFUN_173__(int(Tests[iTest].Join), int(0)))))
		goto J0x0B;
	// End:0x384
	if(bPassed)
	{
		Branch_Success(EventInstigator, Other);		
	}
	else
	{
		Branch_Fail(EventInstigator, Other);
	}
	return;
}

function bool CompareStrings(string s0, string s1, BTriggerProperty.EBranchTestType test)
{
	switch(test)
	{
		// End:0x1B
		case 0:
			return __NFUN_308__(s0, s1);
		// End:0x2E
		case 1:
			return __NFUN_309__(s0, s1);
		// End:0x41
		case 2:
			return __NFUN_304__(s0, s1);
		// End:0x54
		case 3:
			return __NFUN_306__(s0, s1);
		// End:0x67
		case 4:
			return __NFUN_305__(s0, s1);
		// End:0x7A
		case 5:
			return __NFUN_307__(s0, s1);
		// End:0xFFFF
		default:
			__NFUN_355__(__NFUN_302__(__NFUN_302__(__NFUN_302__(string(self), " -- invalid comparison type ("), string(test)), ") for CompareStrings()"));
			return false;
			break;
	}
	return;
}

function bool CompareInts(int I0, int i1, BTriggerProperty.EBranchTestType test)
{
	switch(test)
	{
		// End:0x1A
		case 0:
			return __NFUN_173__(I0, i1);
		// End:0x2C
		case 1:
			return __NFUN_174__(I0, i1);
		// End:0x3E
		case 2:
			return __NFUN_169__(I0, i1);
		// End:0x50
		case 3:
			return __NFUN_171__(I0, i1);
		// End:0x62
		case 4:
			return __NFUN_170__(I0, i1);
		// End:0x74
		case 5:
			return __NFUN_172__(I0, i1);
		// End:0xFFFF
		default:
			__NFUN_355__(__NFUN_302__(__NFUN_302__(__NFUN_302__(string(self), " -- invalid comparison type ("), string(test)), ") for CompareInts()"));
			return false;
			break;
	}
	return;
}

function bool CompareFloats(float f0, float f1, BTriggerProperty.EBranchTestType test)
{
	switch(test)
	{
		// End:0x1A
		case 0:
			return __NFUN_204__(f0, f1);
		// End:0x2C
		case 1:
			return __NFUN_206__(f0, f1);
		// End:0x3E
		case 2:
			return __NFUN_200__(f0, f1);
		// End:0x50
		case 3:
			return __NFUN_202__(f0, f1);
		// End:0x62
		case 4:
			return __NFUN_201__(f0, f1);
		// End:0x74
		case 5:
			return __NFUN_203__(f0, f1);
		// End:0xFFFF
		default:
			__NFUN_355__(__NFUN_302__(__NFUN_302__(__NFUN_302__(string(self), " -- invalid comparison type ("), string(test)), ") for CompareFloats()"));
			return false;
			break;
	}
	return;
}

function bool CompareClasses(Class c0, Class c1, BTriggerProperty.EBranchTestType test)
{
	switch(test)
	{
		// End:0x1B
		case 0:
			return __NFUN_339__(c0, c1);
		// End:0x2E
		case 1:
			return __NFUN_340__(c0, c1);
		// End:0x41
		case 6:
			return __NFUN_357__(c0, c1);
		// End:0xFFFF
		default:
			__NFUN_355__(__NFUN_302__(__NFUN_302__(__NFUN_302__(string(self), " -- invalid comparison type ("), string(test)), ") for CompareClasses()"));
			return false;
			break;
	}
	return;
}

/*******************************************************************************
 * DecoActivityRules_State generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DecoActivityRules_State extends DecoActivityRules
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport array<name> SuccessStates "Succeed if decoration is in any one of the listed states." "If list is not empty and decoration is not in one of these states.. fail.";
var() noexport array<name> FailureStates "Fail if decoration is in any one of the listed states." "Will override previous success.";

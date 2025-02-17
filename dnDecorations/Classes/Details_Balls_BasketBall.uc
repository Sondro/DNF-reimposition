/*******************************************************************************
 * Details_Balls_BasketBall generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Balls_BasketBall extends Details_Generic
	collapsecategories;

function Destroyed()
{
	super(dnDecoration).Destroyed();
	KRestitution = 0.1;
	KFriction = 0.9;
	return;
}

defaultproperties
{
	DecoActivities_Default=/* Array type was not detected. */
	X=/* Unknown default property type! */
	
/* Exception thrown while deserializing Engine
System.ArgumentOutOfRangeException: Length cannot be less than zero.
Parameter name: length
   at System.String.Substring(Int32 startIndex, Int32 length)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 578 */
}
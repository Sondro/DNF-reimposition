/*******************************************************************************
 * DecoActivities_Display generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DecoActivities_Display extends DecoActivities
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport Object RenderObject "RenderObject to change this to when this activity occurs. BE CAREFUL: Only set valid DrawType items (Texture,Mesh,StaticMesh)... not actors.";
var() noexport array<SUpdateMaterialEx> Skins "List of MaterialEx to update in the Skins list and the Index to place them in when this activity occurs.";
var() noexport Engine.Object.EBitModifier bHiddenModifier "How to modify the bHidden property on the decoration.";
var() noexport Engine.Object.EBitModifier MountedHiddenModifier "How to modify the bHideable actors that are mounted to us. (Example: Light with a lense flare attached to it.";
var() noexport float DrawScale "DrawScale to change this to when this activity occurs.";
var() noexport float DrawScaleVariance "DrawScale variance.";
var() noexport Engine.Object.EFloatModifier DrawScaleModifier "How to modify DrawScale for this Decoration.";
var() Vector DrawScale3D;
var() Vector DrawScale3DVariance;
var() Engine.Object.EVectModifier DrawScale3DModifier;

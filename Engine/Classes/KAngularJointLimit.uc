/*******************************************************************************
 * KAngularJointLimit generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KAngularJointLimit extends KAffector
	native
	collapsecategories
	notplaceable
	hidecategories(Collision,HeatVision,Interactivity,Karma,KarmaCollision);

cpptext
{
// Stripped
}

var(KAffector) const noexport int MaximumAngle "The maximum variance from the rest pose that this object will be allowed to move (in Unreal rotator units).";
var(KAffector) const noexport bool bUseSecondaryAxis "If true, the rest pose of the constrained objects will not be assumed to be the center of the limit. Instead, [SecondaryAxis] can be used to specify the axis for the second object, and the rotation will be used for the center of the limit.";
var(KAffector) const noexport Rotator SecondaryAxis "This is the direction that the rest pose of object represents if [bUseSecondaryAxis] is true.";

// Export UKAngularJointLimit::execSetMaximumAngle(FFrame&, void* const)
native(1106) final function SetMaximumAngle(int NewMaximumAngle)
{
	//native.NewMaximumAngle;	
}

// Export UKAngularJointLimit::execSetSecondaryAxisState(FFrame&, void* const)
native(1107) final function SetSecondaryAxisState(optional bool bNewUseSecondaryAxis, optional Rotator NewSecondaryAxis)
{
	//native.bNewUseSecondaryAxis;
	//native.NewSecondaryAxis;	
}

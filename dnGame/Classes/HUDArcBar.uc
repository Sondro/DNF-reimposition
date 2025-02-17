/*******************************************************************************
 * HUDArcBar generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class HUDArcBar extends Object;

var float OffsetX;
var float OffsetY;
var float StartAngle;
var float EndAngle;
var float InnerRadius;
var float Thickness;
var Color PrimaryColor;
var Color FadeColor;
var float PCTFill;
var float TargetPCT;
var float FadeSpeedDown;
var float FadeSpeedUp;
var float PCTWarn;
var bool bPulseUp;
var bool bPulsingUp;
var bool bPulsingWarn;
var bool bInterallyManageAlpha;
var bool bDebug;
var float PCTGhost;
var bool bGhost;
var float GhostFadeSpeed;
var float GhostFadeDelay;
var Color WarnColor;
var Color WarnFadeColor;
var bool bDrawBG;
var Color BGColor;
var Sound WarnSound;
var MaterialEx bodyMaterial;
var MaterialEx EndMaterial;
var float PulseLockTime;

final function DrawArcBar(Canvas C)
{
	local float End, Ghost, bgstart;

	End = __NFUN_198__(__NFUN_195__(PCTFill, __NFUN_199__(EndAngle, StartAngle)), StartAngle);
	InternalDrawBar(C, __NFUN_198__(__NFUN_196__(C.ClipX, 2), OffsetX), __NFUN_198__(__NFUN_196__(C.ClipY, 2), OffsetY), __NFUN_195__(InnerRadius, C.FixedScale), __NFUN_195__(C.FixedScale, __NFUN_198__(InnerRadius, Thickness)), StartAngle, End, 0.1, GetColor());
	bgstart = End;
	// End:0x17F
	if(__NFUN_201__(PCTGhost, PCTFill))
	{
		Ghost = __NFUN_198__(__NFUN_195__(PCTGhost, __NFUN_199__(EndAngle, StartAngle)), StartAngle);
		bgstart = Ghost;
		InternalDrawBar(C, __NFUN_198__(__NFUN_196__(C.ClipX, 2), OffsetX), __NFUN_198__(__NFUN_196__(C.ClipY, 2), OffsetY), __NFUN_195__(InnerRadius, C.FixedScale), __NFUN_195__(C.FixedScale, __NFUN_198__(InnerRadius, Thickness)), Ghost, End, 0.1, GetFadeColor());
	}
	// End:0x225
	if(__NFUN_148__(bDrawBG, __NFUN_206__(End, EndAngle)))
	{
		InternalDrawBar(C, __NFUN_198__(__NFUN_196__(C.ClipX, 2), OffsetX), __NFUN_198__(__NFUN_196__(C.ClipY, 2), OffsetY), __NFUN_195__(InnerRadius, C.FixedScale), __NFUN_195__(C.FixedScale, __NFUN_198__(InnerRadius, Thickness)), bgstart, EndAngle, 0.1, BGColor);
	}
	return;
}

final function InternalDrawBar(Canvas C, float X, float Y, float iR, float or, float Start, float End, float Step, Color col)
{
	local float tmp;
	local bool startCap, endCap;

	// End:0x11
	if(__NFUN_204__(Start, End))
	{
		return;
	}
	// End:0x41
	if(__NFUN_201__(Start, End))
	{
		tmp = Start;
		Start = End;
		End = tmp;
	}
	// End:0x69
	if(__NFUN_150__(__NFUN_204__(Start, StartAngle), __NFUN_204__(Start, EndAngle)))
	{
		startCap = true;
	}
	// End:0x91
	if(__NFUN_150__(__NFUN_204__(End, StartAngle), __NFUN_204__(End, EndAngle)))
	{
		endCap = true;
	}
	C.__NFUN_1256__(X, Y, iR, or, __NFUN_195__(Start, 3.141593), __NFUN_195__(End, 3.141593), Step, col, startCap, endCap, bodyMaterial, EndMaterial);
	return;
}

final function Color GetColor()
{
	// End:0x15
	if(__NFUN_202__(TargetPCT, PCTWarn))
	{
		return WarnColor;
	}
	return PrimaryColor;
	return;
}

final function Color GetFadeColor()
{
	// End:0x15
	if(__NFUN_202__(TargetPCT, PCTWarn))
	{
		return WarnFadeColor;
	}
	return FadeColor;
	return;
}

final function Tick(float Delta, DukeHUD MyHUD)
{
	// End:0xBD
	if(__NFUN_206__(PCTFill, TargetPCT))
	{
		// End:0x41
		if(__NFUN_200__(TargetPCT, PCTFill))
		{
			PCTFill = __NFUN_225__(__NFUN_199__(PCTFill, __NFUN_195__(FadeSpeedDown, Delta)), TargetPCT);			
		}
		else
		{
			PCTFill = __NFUN_224__(__NFUN_198__(PCTFill, __NFUN_195__(FadeSpeedUp, Delta)), TargetPCT);
			// End:0xBD
			if(bPulseUp)
			{
				// End:0x84
				if(__NFUN_202__(PulseLockTime, 0))
				{
					PulseLockTime = default.PulseLockTime;
				}
				PrimaryColor.A = byte(int(MyHUD.__NFUN_585__('ArcHUDPulse', 'Pulse')));
				WarnColor.A = PrimaryColor.A;
			}
		}
	}
	// End:0x10E
	if(__NFUN_202__(TargetPCT, PCTWarn))
	{
		// End:0x10E
		if(bPulsingWarn)
		{
			PrimaryColor.A = byte(int(MyHUD.__NFUN_585__('ArcHUDPulse', 'Pulse')));
			WarnColor.A = PrimaryColor.A;
		}
	}
	// End:0x173
	if(__NFUN_148__(bGhost, __NFUN_201__(PCTGhost, PCTFill)))
	{
		// End:0x153
		if(__NFUN_201__(GhostFadeDelay, 0))
		{
			GhostFadeDelay = __NFUN_225__(__NFUN_199__(GhostFadeDelay, Delta), 0);			
		}
		else
		{
			PCTGhost = __NFUN_225__(__NFUN_199__(PCTGhost, __NFUN_195__(GhostFadeSpeed, Delta)), PCTFill);
		}
	}
	// End:0x19B
	if(__NFUN_201__(PulseLockTime, 0))
	{
		PulseLockTime = __NFUN_225__(__NFUN_199__(PulseLockTime, Delta), 0);
	}
	return;
}

final function SetPCTFill(float PCT, optional bool bForce, optional HUD MyHUD)
{
	// End:0x21
	if(bForce)
	{
		PCTFill = PCT;
		TargetPCT = PCT;
		return;
	}
	// End:0x51
	if(__NFUN_148__(bGhost, __NFUN_202__(PCTGhost, PCT)))
	{
		PCTGhost = PCTFill;
		GhostFadeDelay = default.GhostFadeDelay;
	}
	// End:0x91
	if(__NFUN_148__(__NFUN_200__(PCT, PCTWarn), __NFUN_201__(TargetPCT, PCTWarn)))
	{
		MyHUD.PlayerOwner.__NFUN_697__(1, WarnSound, 0);
	}
	TargetPCT = PCT;
	return;
}

final function SetAlpha(float A)
{
	// End:0x5A
	if(__NFUN_148__(__NFUN_148__(__NFUN_204__(PCTFill, TargetPCT), __NFUN_202__(PCTGhost, PCTFill)), __NFUN_202__(PulseLockTime, 0)))
	{
		PrimaryColor.A = byte(A);
		BGColor.A = byte(__NFUN_196__(A, 4));
	}
	return;
}

final function bool IsActive()
{
	return __NFUN_148__(bGhost, __NFUN_201__(PCTGhost, PCTFill));
	return;
}

final function float GetAlpha()
{
	return float(PrimaryColor.A);
	return;
}

final function Init(DukeHUD MyHUD)
{
	PulseLockTime = 0;
	return;
}

defaultproperties
{
	PrimaryColor=(B=121,G=2,R=1,A=255)
	PCTFill=1
	TargetPCT=1
	FadeSpeedDown=0.5
	FadeSpeedUp=0.7
	PCTWarn=0.5
	bPulseUp=true
	bPulsingWarn=true
	GhostFadeSpeed=0.75
	GhostFadeDelay=3
	bodyMaterial='dt_hud.ingame_hud.arcbody'
	EndMaterial='dt_hud.ingame_hud.arcend'
	PulseLockTime=1
}
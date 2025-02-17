/*******************************************************************************
 * UDukeLobbyPlayerList generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeLobbyPlayerList extends UWindowDialogControl;

var int SelectedIndex;

function Paint(Canvas C, float X, float Y)
{
	local int i;
	local PlayerPawn P;
	local dnDeathmatchGameReplicationInfo GRI;
	local int YOffset, textOffset;
	local float XL, YL;
	local string S;

	super(UWindowWindow).Paint(C, X, Y);
	LookAndFeel.Bevel_DrawSimpleBevel(self, C, 0, 0, int(WinWidth), int(WinHeight), 1);
	P = GetPlayerOwner();
	GRI = dnDeathmatchGameReplicationInfo(GetPlayerOwner().GameReplicationInfo);
	// End:0x73
	if(__NFUN_339__(GRI, none))
	{
		return;
	}
	textOffset = int(__NFUN_195__(float(5), class'UWindowScene'.default.WinScaleY));
	// End:0xBF
	if(__NFUN_172__(SelectedIndex, GRI.NumPlayers))
	{
		SelectedIndex = __NFUN_166__(GRI.NumPlayers, 1);
	}
	// End:0x2D7
	if(__NFUN_170__(GRI.NumPlayers, 0))
	{
		i = 0;
		J0xDB:

		// End:0x2D7 [Loop If]
		if(__NFUN_169__(i, string(GRI.PRIArray)))
		{
			S = GRI.PRIArray[i].PlayerName;
			TextSize(C, S, XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
			ClipText(C, float(textOffset), float(__NFUN_165__(YOffset, textOffset)), S, false, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
			// End:0x2B4
			if(__NFUN_148__(__NFUN_173__(i, SelectedIndex), __NFUN_339__(ParentWindow.ChildInFocus, self)))
			{
				DrawStretchedTexture(C, 0, float(YOffset), float(__NFUN_163__(textOffset, 2)), __NFUN_198__(YL, float(__NFUN_162__(textOffset, 2))), class'WhiteTexture', 1);
				DrawStretchedTexture(C, __NFUN_199__(WinWidth, float(__NFUN_163__(textOffset, 2))), float(YOffset), float(__NFUN_163__(textOffset, 2)), __NFUN_198__(YL, float(__NFUN_162__(textOffset, 2))), class'WhiteTexture', 1);
				DrawStretchedTexture(C, 0, float(YOffset), WinWidth, float(__NFUN_163__(textOffset, 2)), class'WhiteTexture', 1);
				DrawStretchedTexture(C, 0, __NFUN_198__(__NFUN_198__(float(YOffset), YL), __NFUN_195__(float(textOffset), 1.5)), WinWidth, float(__NFUN_163__(textOffset, 2)), class'WhiteTexture', 1);				
			}
			__NFUN_180__(YOffset, int(__NFUN_198__(YL, float(__NFUN_162__(textOffset, 2)))));
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0xDB;
		}
	}
	return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
	local PlayerPawn P;
	local dnDeathmatchGameReplicationInfo GRI;

	super(UWindowWindow).WindowEvent(msg, C, X, Y, Key);
	P = GetPlayerOwner();
	GRI = dnDeathmatchGameReplicationInfo(GetPlayerOwner().GameReplicationInfo);
	// End:0x14A
	if(__NFUN_173__(int(msg), int(7)))
	{
		switch(Key)
		{
			// End:0x76
			case int(Root.Console.200):
			// End:0xAE
			case int(Root.Console.38):
				// End:0xAB
				if(__NFUN_146__(bNavUpRepeatBlock, false))
				{
					__NFUN_185__(SelectedIndex);
					bNavUpRepeatBlock = true;
				}
				// End:0x14A
				break;
			// End:0xC8
			case int(Root.Console.201):
			// End:0x100
			case int(Root.Console.40):
				// End:0xFD
				if(__NFUN_146__(bNavDownRepeatBlock, false))
				{
					__NFUN_184__(SelectedIndex);
					bNavDownRepeatBlock = true;
				}
				// End:0x14A
				break;
			// End:0x147
			case int(Root.Console.210):
				P.__NFUN_560__().XboxShowGamerCard(GRI.PRIArray[SelectedIndex]);
			// End:0xFFFF
			default:
				break;
		}
	}
	else
	{
		// End:0x1E1
		if(__NFUN_173__(int(msg), int(6)))
		{
			switch(Key)
			{
				// End:0x17A
				case int(Root.Console.200):
				// End:0x19F
				case int(Root.Console.38):
					bNavUpRepeatBlock = false;
					// End:0x1E1
					break;
				// End:0x1B9
				case int(Root.Console.201):
				// End:0x1DE
				case int(Root.Console.40):
					bNavDownRepeatBlock = false;
					// End:0x1E1
					break;
				// End:0xFFFF
				default:
					break;
			}
		}
		else
		{
			// End:0x204
			if(__NFUN_169__(SelectedIndex, 0))
			{
				SelectedIndex = __NFUN_166__(GRI.NumPlayers, 1);
			}
			// End:0x224
			if(__NFUN_172__(SelectedIndex, GRI.NumPlayers))
			{
				SelectedIndex = 0;
			}
			return;
		}
	}
}

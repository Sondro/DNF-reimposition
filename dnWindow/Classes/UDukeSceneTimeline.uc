/*******************************************************************************
 * UDukeSceneTimeline generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneTimeline extends UDukeSceneExtrasViewer;

struct STimelineEntry
{
	var int Year;
	var int Month;
	var int Day;
	var string Date;
	var string Info;
};

var FinalBlend WhiteMaterial;
var array<STimelineEntry> Entries;
var int Index;

function Created()
{
	local int i;

	super.Created();
	i = 0;
	J0x0D:

	// End:0xDA [Loop If]
	if(__NFUN_169__(i, string(Entries)))
	{
		Entries[i].Date = __NFUN_356__("UDukeSceneTimeline", __NFUN_302__(__NFUN_302__("Entries[", string(i)), "].Date"), "dnWindow");
		Entries[i].Info = __NFUN_356__("UDukeSceneTimeline", __NFUN_302__(__NFUN_302__("Entries[", string(i)), "].Info"), "dnWindow");
		ListSlider.AddItem(" ");
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x0D;
	}
	FirstControlToFocus = ListSlider;
	ListSlider.SetSelectedIndex(0);
	ListSlider.Register(self);
	return;
}

function PrevPicture()
{
	// End:0x2A
	if(__NFUN_170__(Index, 0))
	{
		__NFUN_185__(Index);
		GetPlayerOwner().PlaySoundInfo(0, SoundNavigateInfo);
	}
	return;
}

function NextPicture()
{
	// End:0x32
	if(__NFUN_169__(Index, __NFUN_166__(string(Entries), 1)))
	{
		__NFUN_184__(Index);
		GetPlayerOwner().PlaySoundInfo(0, SoundNavigateInfo);
	}
	return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	super(UWindowScene).NotifyFromControl(C, E);
	Index = ListSlider.GetSelectedIndex();
	return;
}

function DrawMenuContent(Canvas C, float Alpha, Region ClipRegion)
{
	local float Left, Top, Width, Height, XL, YL;

	local string Date, Text;
	local float MinValue, MaxValue, ValueRange, Value;
	local int i;

	// End:0x0E
	if(__NFUN_171__(string(Entries), 0))
	{
		return;
	}
	Top = __NFUN_198__(float(ClipRegion.Y), __NFUN_195__(0.15, float(ClipRegion.h)));
	// End:0x69
	if(__NFUN_414__())
	{
		__NFUN_180__(ClipRegion.X, int(__NFUN_195__(float(ClipRegion.W), 0.05)));
		__NFUN_178__(ClipRegion.W, 0.9);
	}
	C.DrawColor = OrangeColor;
	C.__NFUN_1250__(float(ClipRegion.X), Top);
	C.__NFUN_1234__(WhiteMaterial, float(ClipRegion.W), 2, 0, 0, 1, 1, 0, 0, 0, false, Alpha);
	MinValue = __NFUN_198__(__NFUN_198__(__NFUN_195__(float(Entries[0].Year), 366), __NFUN_195__(float(Entries[0].Month), 31)), float(Entries[0].Day));
	ValueRange = __NFUN_199__(__NFUN_198__(__NFUN_198__(__NFUN_195__(float(Entries[__NFUN_166__(string(Entries), 1)].Year), 366), __NFUN_195__(float(Entries[__NFUN_166__(string(Entries), 1)].Month), 31)), float(Entries[__NFUN_166__(string(Entries), 1)].Day)), MinValue);
	i = __NFUN_166__(string(Entries), 1);
	J0x192:

	// End:0x509 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		Value = __NFUN_196__(__NFUN_199__(__NFUN_198__(__NFUN_198__(__NFUN_195__(float(Entries[i].Year), 366), __NFUN_195__(float(Entries[i].Month), 31)), float(Entries[i].Day)), MinValue), ValueRange);
		C.__NFUN_1250__(float(__NFUN_193__(__NFUN_198__(float(ClipRegion.X), __NFUN_195__(Value, float(ClipRegion.W))))), __NFUN_199__(Top, 3));
		C.__NFUN_1234__(WhiteMaterial, 1, 8, 0, 0, 1, 1, 0, 0, 0, false, Alpha);
		// End:0x3BD
		if(__NFUN_173__(i, Index))
		{
			class'UWindowScene'.static.DrawSelectionIcon(C, __NFUN_199__(__NFUN_198__(float(ClipRegion.X), __NFUN_195__(Value, float(ClipRegion.W))), __NFUN_195__(__NFUN_196__(__NFUN_195__(1.5, float(default.SpinningNuke.__NFUN_1191__())), float(2)), C.FixedScale)), __NFUN_199__(Top, __NFUN_195__(0.1, float(ClipRegion.h))), __NFUN_195__(1.5, C.FixedScale), Alpha);
			DrawStretchedTextureSegment(C, __NFUN_198__(float(ClipRegion.X), __NFUN_195__(__NFUN_199__(Value, 0.005), float(ClipRegion.W))), __NFUN_199__(Top, __NFUN_195__(0.05, float(ClipRegion.h))), __NFUN_195__(0.01, float(ClipRegion.W)), __NFUN_195__(0.04, float(ClipRegion.h)), 417, 136, 11, 19, class'Backdrop', Alpha, true, true);
			C.DrawColor = OrangeColor;
		}
		// End:0x45A
		if(__NFUN_173__(i, 0))
		{
			C.__NFUN_1250__(float(__NFUN_193__(__NFUN_198__(float(ClipRegion.X), __NFUN_195__(__NFUN_199__(Value, 0.015), float(ClipRegion.W))))), __NFUN_198__(Top, __NFUN_195__(0.05, float(ClipRegion.h))));
			C.__NFUN_1232__(string(Entries[i].Year), false, false, false, __NFUN_195__(TTFontScale, 0.8), __NFUN_195__(TTFontScale, 0.8), Alpha, 2);
		}
		// End:0x4FF
		if(__NFUN_173__(i, __NFUN_166__(string(Entries), 1)))
		{
			C.__NFUN_1250__(float(__NFUN_193__(__NFUN_198__(float(ClipRegion.X), __NFUN_195__(__NFUN_199__(Value, 0.015), float(ClipRegion.W))))), __NFUN_198__(Top, __NFUN_195__(0.05, float(ClipRegion.h))));
			C.__NFUN_1232__(string(Entries[i].Year), false, false, false, __NFUN_195__(TTFontScale, 0.8), __NFUN_195__(TTFontScale, 0.8), Alpha, 2);
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x192;
	}
	Left = __NFUN_198__(float(ClipRegion.X), __NFUN_195__(0.2, float(ClipRegion.W)));
	Top = __NFUN_198__(__NFUN_198__(float(ClipRegion.Y), __NFUN_195__(0.2, float(ClipRegion.h))), 2);
	Width = __NFUN_195__(0.6, float(ClipRegion.W));
	Height = __NFUN_199__(__NFUN_199__(__NFUN_195__(0.7, float(ClipRegion.h)), 4), YL);
	// End:0x5E4
	if(__NFUN_148__(__NFUN_172__(Index, 0), __NFUN_169__(Index, string(Entries))))
	{
		Date = Entries[Index].Date;
		Text = Entries[Index].Info;		
	}
	else
	{
		Date = "Unknown";
		Text = "ERROR!!";
	}
	Left = __NFUN_198__(float(ClipRegion.X), __NFUN_195__(0.1, float(ClipRegion.W)));
	Top = __NFUN_198__(__NFUN_198__(float(ClipRegion.Y), __NFUN_195__(0.2, float(ClipRegion.h))), __NFUN_195__(4, C.FixedScale));
	C.Font = C.TallFont;
	C.DrawColor = GreyColor;
	C.__NFUN_1238__(Date, XL, YL, TTFontScale, TTFontScale);
	C.__NFUN_1250__(__NFUN_198__(float(ClipRegion.X), __NFUN_195__(0.5, __NFUN_199__(float(ClipRegion.W), XL))), Top);
	C.__NFUN_1232__(Date, false, false, false, TTFontScale, TTFontScale, Alpha, 2);
	__NFUN_209__(Top, YL);
	Width = __NFUN_195__(0.8, float(ClipRegion.W));
	Height = __NFUN_199__(__NFUN_199__(__NFUN_195__(0.7, float(ClipRegion.h)), __NFUN_195__(4, C.FixedScale)), YL);
	C.bCenter = true;
	C.__NFUN_1252__(__NFUN_198__(Left, Width), __NFUN_198__(Top, Height));
	C.__NFUN_1250__(Left, Top);
	C.Style = 0;
	YL = C.__NFUN_1232__(Text, false, true, true, TTFontScale, TTFontScale, Alpha, 2);
	__NFUN_209__(Top, __NFUN_195__(0.5, __NFUN_199__(Height, YL)));
	C.__NFUN_1250__(Left, Top);
	C.Style = 1;
	C.__NFUN_1232__(Text, false, true, true, TTFontScale, TTFontScale, Alpha, 2);
	C.__NFUN_1252__(float(C.SizeX), float(C.SizeY));
	C.bCenter = false;
	return;
}

defaultproperties
{
	begin object name=LineAlpha_FB class=FinalBlend
		FrameBufferBlending=2
		ZWrite=false
		ZTest=false
		Material='Engine.WhiteTexture'
	object end
	// Reference: FinalBlend'UDukeSceneTimeline.LineAlpha_FB'
	WhiteMaterial=LineAlpha_FB
	Entries(0)=(Tick=none)
	Entries(1)=(Month=5,Day=0,Date="April 28, 1997",Info="Version 1.3d of Duke Nukem 3D (Retail) is shipped to PC game retailers worldwide.? Duke Nukem 3D is a massive success that for many defined an entire generation of gaming.? Conceptualization and discussion of a sequel immediately begins inside 3D Realms headquarters near Dallas, Texas.")
	Entries(2)=(Year=1996,Month=6,Day=0,Date="June, 1996",Info="Duke Nukem 4Ever, a 2D side scrolling game produced by Keith Schuler, has development suspended in favor of prioritizing a Duke Nukem 3D add-on pack and a sequel.")
	Entries(3)=(Year=1996,Month=6,Day=0,Date="June, 1996",Info="Infogrames acquires the publishing rights for Duke Nukem Forever in a licensing agreement with 3D Realms.")
	Entries(4)=(Year=1996,Month=12,Day=0,Date="December, 1996",Info="The Quake 1 engine is licensed by 3D Realms for Duke Nukem Forever, permanently replacing the Build engine.? Most of the Duke Nukem 3D team, led by original Duke Nukem developers Todd Replogle and Allen H. Blum III, begins research and development with the technology for game.")
	Entries(5)=(Year=1997,Month=4,Day=0,Date="April, 1997",Info="Duke Nukem Forever is officially announced by 3D Realms with the intention to release in 1998.? Likewise 3D Realms also officially announced that DNF will be created with the Quake 2 Engine.")
	Entries(6)=(Year=1997,Month=5,Day=0,Date="May, 1997",Info="Randy Pitchford and Brian Martel, founders of Gearbox Software, leave 3D Realms to help form Rebel Boat Rocker and then later Gearbox Software.")
	Entries(7)=(Year=1997,Month=11,Day=0,Date="Novemember, 1997",Info="Duke Nukem Forever appears on the cover of PC Gamer magazine.? Inside are the first screenshots ever released for the game. ")
	Entries(8)=(Year=1998,Month=5,Day=0,Date="May, 1998",Info="During the Electronic Entertainment Expo, the first reveal trailer for Duke Nukem Forever was released to the public.")
	Entries(9)=(Year=1998,Month=6,Day=0,Date="June, 1998",Info="3D Realms announces a change to the Unreal Engine for Duke Nukem Forever.")
	Entries(10)=(Year=1999,Month=3,Day=0,Date="March, 1999",Info="3D Realms announces that Megadeth is to cover and record the theme song for Duke Nukem Forever.")
	Entries(11)=(Year=1999,Month=11,Day=0,Date="November, 1999",Info="PC Gamer infamous ?Miss Me?? cover story featuring Duke Nukem Forever hits newsstands.? Inside are a large number of new screenshots for Duke Nukem Forever that expose how the game looks with a new engine.")
	Entries(12)=(Year=1999,Month=12,Day=0,Date="December, 1999",Info="Infogrames, then publisher of Duke Nukem games, is purchased by GT Interactive.? Publishing rights for Duke Nukem Forever are transferred.")
	Entries(13)=(Year=2000,Month=5,Day=0,Date="May, 2000",Info="Gathering of Developers, a publisher comprised entirely of developer members (including 3D Realms), is purchased by Take Two Interactive.")
	Entries(14)=(Year=2000,Month=12,Day=0,Date="December, 2000",Info="Gathering of Developers announces that the company has acquired the PC publishing rights for the highly anticipated Duke Nukem Forever.? Take Two Interactive also acquire the publishing rights for the complete catalog of already-released Duke Nukem products including rights to certain future products.")
	Entries(15)=(Year=2001,Month=5,Day=0,Date="May, 2001",Info="At E3 2001, the highly regarded Duke Nukem Forever 10th anniversary trailer is released.? It is arguably considered to be one of the best video game trailers of all time.")
	Entries(16)=(Year=2004,Month=9,Day=0,Date="September, 2004",Info="3D Realms announces a new in-game physics system, Meqon Game Dynamics, has been chosen for Duke Nukem Forever.")
	Entries(17)=(Year=2006,Month=8,Day=0,Date="August, 2006",Info="Shacknews reports and confirms a rumor that a large contingent of employees had left 3D Realms.? Most of them have relocated to Gearbox Software which is also based in the Dallas area.")
	Entries(18)=(Year=2007,Month=8,Day=0,Date="July, 2007",Info="The famous ?Ventrilo Harassment? video using the voice of Duke Nukem to torment on-line game players was uploaded to YouTube and has been viewed more than 6 million times.")
	Entries(19)=(Year=2007,Month=12,Day=0,Date="December, 2007",Info="Shacknews breaks the first video teaser for Duke Nukem Forever in over 6 years.? Included were small snippets of in-game footage.")
	Entries(20)=(Year=2008,Month=9,Day=0,Date="September, 2008",Info="New Duke Nukem Forever screenshots are revealed after users discover these as unlockables in the release of Duke Nukem 3D on Xbox Live Arcade.")
	Entries(21)=(Year=2008,Month=12,Day=0,Date="December, 2008",Info="The last official Duke Nukem Forever screenshot from 3D Realms was released for the community.")
	Entries(22)=(Year=2009,Month=5,Day=0,Date="May, 2009",Info="The story that 3D Realms has laid off the Duke Nukem Forever development team breaks and tops gaming news websites around the world.")
	Entries(23)=(Year=2009,Month=5,Day=0,Date="May, 2009",Info="Take Two Interactive and 3D Realms submit legal arguments regarding disagreements about the business arrangement for developing and publishing of the game.")
	Entries(24)=(Year=2009,Month=6,Day=0,Date="June, 2009",Info="Gearbox and 3D Realms begin negotiation of an asset purchase agreement for Duke Nukem franchise and Duke Nukem Forever.? The business agreement is finalized and executed approximately six months later and ownership of the game and brand is transferred to Gearbox Software.")
	Entries(25)=(Year=2009,Month=6,Day=0,Date="June, 2009",Info="Triptych Games is formed from several ex-3D Realms employees and a couple of new individuals.")
	Entries(26)=(Year=2009,Month=7,Day=0,Date="July, 2009",Info="Triptych Games signs paperwork with 3D Realms to complete the Duke Nukem Forever single-player campaign.")
	Entries(27)=(Year=2009,Month=8,Day=0,Date="August, 2009",Info="Duke Nukem Forever's narrative script is written at Triptych and approved by 3D Realms.  Triptych gets to surprise Jon St. John - the famous English language voice actor who originally played Duke Nukem - with a phone call: 'Hell has finally frozen over.'")
	Entries(28)=(Year=2009,Month=11,Day=0,Date="Novemember, 2009",Info="Single-player work on Duke Nukem Forever content is complete.")
	Entries(29)=(Year=2009,Month=12,Day=0,Date="December, 2009",Info="Gearbox and 2K Games begin renegotiation of the publishing agreement for Duke Nukem Forever.? The business agreement is finalized and executed approximately six months later with 2K Games and Take Two Interactive, securing long-term publishing rights to Duke Nukem.")
	Entries(30)=(Year=2010,Month=1,Day=0,Date="January, 2010",Info="Triptych Games locks down their single-player PC version of the game and begins negotiations with Gearbox Software.")
	Entries(31)=(Year=2010,Month=2,Day=0,Date="February, 2010",Info="Triptych relocates to Gearbox?s offices in the Plano, Texas Bank of America Tower and re-resumes work alongside Gearbox and Piranha to help port Duke Nukem Forever to consoles, add multi-player, and polish features within the game.")
	Entries(32)=(Year=2010,Month=5,Day=0,Date="May, 2010",Info="Take Two and 3D Realms resolve and settle all differences regarding legal complaints from the previous year.")
}
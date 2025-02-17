/*******************************************************************************
 * UWindowLayoutRow generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowLayoutRow extends UWindowLayoutBase
	dependson(UWindowLayoutCell);

var UWindowLayoutCell CellList;

function SetupSentinel(optional bool bInTreeSort)
{
	super(UWindowList).SetupSentinel(bInTreeSort);
	CellList = new class'UWindowLayoutCell';
	CellList.SetupSentinel();
	return;
}

function UWindowLayoutCell AddCell(optional int ColSpan, optional int RowSpan)
{
	local UWindowLayoutCell C;

	C = UWindowLayoutCell(CellList.Append(class'UWindowLayoutCell'));
	C.ColSpan = ColSpan;
	C.RowSpan = RowSpan;
	return C;
	return;
}

function float CalcMinHeight()
{
	return;
}

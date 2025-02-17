/*******************************************************************************
 * BrushBuilder generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class BrushBuilder extends Object
	abstract
	native;

struct BuilderPoly
{
	var array<int> VertexIndices;
	var int Direction;
	var name Item;
	var int PolyFlags;
};

var() string BitmapFilename;
var() string ToolTip;
var array<Vector> Vertices;
var array<BuilderPoly> Polys;
var private name Group;
var private bool MergeCoplanars;

// Export UBrushBuilder::execBeginBrush(FFrame&, void* const)
native function BeginBrush(bool MergeCoplanars, name Group)
{
	//native.MergeCoplanars;
	//native.Group;	
}

// Export UBrushBuilder::execEndBrush(FFrame&, void* const)
native function bool EndBrush();

// Export UBrushBuilder::execGetVertexCount(FFrame&, void* const)
native function int GetVertexCount();

// Export UBrushBuilder::execGetVertex(FFrame&, void* const)
native function Vector GetVertex(int i)
{
	//native.i;	
}

// Export UBrushBuilder::execGetPolyCount(FFrame&, void* const)
native function int GetPolyCount();

// Export UBrushBuilder::execBadParameters(FFrame&, void* const)
native function bool BadParameters(optional string msg)
{
	//native.msg;	
}

// Export UBrushBuilder::execVertexv(FFrame&, void* const)
native function int Vertexv(Vector V)
{
	//native.V;	
}

// Export UBrushBuilder::execVertex3f(FFrame&, void* const)
native function int Vertex3f(float X, float Y, float Z)
{
	//native.X;
	//native.Y;
	//native.Z;	
}

// Export UBrushBuilder::execPoly3i(FFrame&, void* const)
native function Poly3i(int Direction, int i, int j, int K, optional name ItemName, optional int PolyFlags)
{
	//native.Direction;
	//native.i;
	//native.j;
	//native.K;
	//native.ItemName;
	//native.PolyFlags;	
}

// Export UBrushBuilder::execPoly4i(FFrame&, void* const)
native function Poly4i(int Direction, int i, int j, int K, int l, optional name ItemName, optional int PolyFlags)
{
	//native.Direction;
	//native.i;
	//native.j;
	//native.K;
	//native.l;
	//native.ItemName;
	//native.PolyFlags;	
}

// Export UBrushBuilder::execPolyBegin(FFrame&, void* const)
native function PolyBegin(int Direction, optional name ItemName, optional int PolyFlags)
{
	//native.Direction;
	//native.ItemName;
	//native.PolyFlags;	
}

// Export UBrushBuilder::execPolyi(FFrame&, void* const)
native function Polyi(int i)
{
	//native.i;	
}

// Export UBrushBuilder::execPolyEnd(FFrame&, void* const)
native function PolyEnd();

event bool Build()
{
	return;
}

defaultproperties
{
	BitmapFilename="BBGeneric"
	ToolTip="Generic Builder"
}
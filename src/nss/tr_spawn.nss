//::///////////////////////////////////////////////
//:: Name: tr_spawn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This goes in the onspawn node for a creature.
     make sure the tr_conv script is in the
     onconversation node for the creature and that
     all other scripts are removed to prevent this
     trainer from attacking anything by mistake.
*/
//:://////////////////////////////////////////////
//:: Created By: Cylvia
//:: Created On: 1-2-2004
//:://////////////////////////////////////////////
void main ()
{
SetPlotFlag(OBJECT_SELF,TRUE);
SetListenPattern(OBJECT_SELF,"*n",1111);
}

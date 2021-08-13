//::///////////////////////////////////////////////
//:: Firework Wand
//:: g_firework_wand.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
This is the OnActivate Event for the Firework Wand
And items that will shoot a firework in the sky above the PCs head and do a small
firework. Give it to you players for some fun.
*/
//:://////////////////////////////////////////////
//:: Created By: Jay Clark
//:: Created On: August 31, 2004
//:://////////////////////////////////////////////

#include "x2_inc_switches"

void main()
{
    int nEvent = GetUserDefinedItemEventNumber();
    if (nEvent ==  X2_ITEM_EVENT_ACTIVATE)
    {
        object oPC   = GetItemActivator();
        ExecuteScript("g_missile",oPC);
    }
}

//::///////////////////////////////////////////////
//:: Divine Class
//:: TEMPL_DIV01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is a cleric
    25% chance of going down to next priority
*/
//:://////////////////////////////////////////////
//:: Created By: David Gaider
//:: Created On: November 8, 2001
//:://////////////////////////////////////////////
#include "nw_i0_plot"

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=2) && (GetLocalInt(OBJECT_SELF,"counter")!=3))
    {
        int roll=d100();
        if (roll>G_CLASSCHANCE)
        {
            int nClass;
            nClass = GetLevelByClass(CLASS_TYPE_CLERIC, GetPCSpeaker());
// * May 2002: Only return true if this is a cleric
          nClass += GetLevelByClass(CLASS_TYPE_PALADIN, GetPCSpeaker());
            return nClass;
        }
        return FALSE;
    }
    return FALSE;
}



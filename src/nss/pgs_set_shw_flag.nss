//::**********************************************
//:: Script: pgs_set_shw_flag
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will update the state of the
    invitation offers option for oPlayer.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"


void main()
{
    object oPlayer = GetPCSpeaker();
    int iSetValue = !PGS_GetPlayerInt (oPlayer, PGS_SHOW_FLAG);
    int iFlagColor = PGS_GetGuildInt (PGS_GetPlayerInt (oPlayer,
        PGS_GUILD_NUMBER), PGS_GUILD_FLAG_COLOR);

    //Determine if oPlayer is hiding/showing his/her flag.
    if (iSetValue && (iFlagColor != 0))
        ApplyEffectToObject (DURATION_TYPE_PERMANENT, SupernaturalEffect
            (ExtraordinaryEffect (EffectVisualEffect (iFlagColor))), oPlayer);

    else  //oPlayer is hiding his/her flag, so remove it.
    {
        effect ePCEffect = GetFirstEffect (oPlayer);

        //Loop through effects on oPlayer, in search of a visual effect.
        while (GetIsEffectValid (ePCEffect))
        {
            //Check for a visual effect.
            if (GetEffectType (ePCEffect) == EFFECT_TYPE_VISUALEFFECT)
                RemoveEffect (oPlayer, ePCEffect);

            ePCEffect = GetNextEffect (oPlayer);
        }
    }

    //Update new setting value for oPlayer.
    PGS_SetPlayerInt (oPlayer, PGS_SHOW_FLAG, iSetValue);
}

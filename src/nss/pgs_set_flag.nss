//::**********************************************
//:: Script: pgs_set_flag
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will set and update a flag
    change for the specified guild.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 6/27/2007
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker();
    object oPCLoop = GetFirstPC();
    int iFlagColorSelect = GetLocalInt (oPlayer, "PGS_Generic_Var") + 301;
    int iGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER);
    effect eFlag = SupernaturalEffect (ExtraordinaryEffect (EffectVisualEffect (iFlagColorSelect)));
    effect ePCEffect;

    //Loop through online guild members and update flag.
    while (oPCLoop != OBJECT_INVALID)
    {
        //Check if oPCLoop is a member of iGuild, and is allowing
        //his/her flag to be shown:
        if ((PGS_GetPlayerInt (oPCLoop, PGS_GUILD_NUMBER) == iGuild) && PGS_GetPlayerInt (oPCLoop, PGS_SHOW_FLAG))
        {
            ePCEffect = GetFirstEffect (oPCLoop);

            //Remove current flag effect before applying new one.
            while (GetIsEffectValid (ePCEffect))
            {
                //Check for visual (flag) effect:
                if (GetEffectType (ePCEffect) == EFFECT_TYPE_VISUALEFFECT)
                    RemoveEffect (oPCLoop, ePCEffect);

                ePCEffect = GetNextEffect (oPCLoop);
            }

            //Check if new flag color was selected:
            if (iFlagColorSelect != 302)
                ApplyEffectToObject (DURATION_TYPE_PERMANENT, eFlag, oPCLoop);
        }

        oPCLoop = GetNextPC();
    }

    //Now store the flag color.
    if (iFlagColorSelect == 302)
        iFlagColorSelect = 0;

    PGS_SetGuildInt (iGuild, PGS_GUILD_FLAG_COLOR, iFlagColorSelect);

}

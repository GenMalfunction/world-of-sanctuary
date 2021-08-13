//::///////////////////////////////////////////////
//:: FileName at_hrothgar_trad
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 20/01/03 09:24:21
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    string sVarName ="RockXP2";
    int nOnce = GetLocalInt(GetPCSpeaker(), sVarName);
    if (nOnce==FALSE)
    {
    GiveXPToCreature (GetPCSpeaker(), 200);
    FloatingTextStringOnCreature("XP Gained - use of ability",GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(), sVarName,TRUE);
    }
}

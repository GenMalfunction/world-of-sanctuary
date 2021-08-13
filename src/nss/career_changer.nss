//::///////////////////////////////////////////////
//:: career_changer
//:: career_changer.nss
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Himura
//:: Created On: 02/28/05
//:://////////////////////////////////////////////

void main()
{

object oPC = GetPCSpeaker();

int nCCXP;
nCCXP = GetXP(oPC);

SetLocalInt(oPC, "pc_exact_xp", nCCXP);

SetXP(oPC, 0);

GetLocalInt(oPC, "pc_exact_xp");

SetXP(oPC, nCCXP);

}


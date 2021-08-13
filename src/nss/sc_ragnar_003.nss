//::///////////////////////////////////////////////
//:: FileName sc_ragnar_003    //
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Ben W-Husey
//:: Created On: 09/10/02 14:56:44
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{
  int iDC = 18;
  int iBonus = GetSkillRank(SKILL_PERSUADE, GetPCSpeaker());
  if ((d20() + iBonus) >= iDC)
  {
    return TRUE;
  }
  return FALSE;
}

//

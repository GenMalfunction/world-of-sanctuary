#include "nw_i0_tool"

int StartingConditional()
{
  int iDC = 10;
  int iBonus = GetSkillRank(SKILL_PERSUADE, GetPCSpeaker());
  if ((d20() + iBonus) >= iDC)
  {
    return TRUE;
  }
  return FALSE;
}

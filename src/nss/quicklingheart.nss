//::///////////////////////////////////////////////
//:: Default On Heartbeat
//:: NW_C2_DEFAULT1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will have people perform default
    animations.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 23, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "NW_I0_tool"

void main()
{

  object PC = GetNearestSeenOrHeardEnemy();
  /*
  object item2 =  GetFirstItemInInventory(OBJECT_SELF);

  if (GetIsObjectValid(item2) )
  {
      DestroyObject(OBJECT_SELF);
      return;
  }
  if (!GetIsObjectValid(item2) )
  {

  }
  */
   AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));

   AssignCommand(OBJECT_SELF, ActionUseSkill(SKILL_PICK_POCKET, PC));
}

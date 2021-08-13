void main()
{
    string oTag = GetTag(OBJECT_SELF);
    if (oTag == "NW_RECALL_PORTAL") {
      location lLoc = GetLocalLocation(GetPCSpeaker(), "NW_L_LOC_RECALL");
      SetLocalInt(OBJECT_SELF, "NW_L_LOC_EVERUSED", 1);
      SetLocalLocation(OBJECT_SELF, "NW_L_LOC_LAST_RECALL", lLoc);
      ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc);
      AssignCommand(GetPCSpeaker(), JumpToLocation(lLoc));}

    else if (oTag == "RHUN_RECALL_P1") {
      location lLoc1 = GetLocalLocation(GetPCSpeaker(), "RHUN_RECALL_L1");
      SetLocalInt(OBJECT_SELF, "RHUN_RECALL_U1", 1);
      SetLocalLocation(OBJECT_SELF, "RHUN_RECALL_B1", lLoc1);
      ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc1);
      AssignCommand(GetPCSpeaker(), JumpToLocation(lLoc1));}

    else if (oTag == "RHUN_RECALL_P2") {
      location lLoc2 = GetLocalLocation(GetPCSpeaker(), "RHUN_RECALL_L2");
      SetLocalInt(OBJECT_SELF, "RHUN_RECALL_U2", 1);
      SetLocalLocation(OBJECT_SELF, "RHUN_RECALL_B2", lLoc2);
      ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc2);
      AssignCommand(GetPCSpeaker(), JumpToLocation(lLoc2));}

    else if (oTag == "RHUN_RECALL_P3") {
      location lLoc3 = GetLocalLocation(GetPCSpeaker(), "RHUN_RECALL_L3");
      SetLocalInt(OBJECT_SELF, "RHUN_RECALL_U3", 1);
      SetLocalLocation(OBJECT_SELF, "RHUN_RECALL_B3", lLoc3);
      ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc3);
      AssignCommand(GetPCSpeaker(), JumpToLocation(lLoc3));}

    else if (oTag == "RHUN_RECALL_P4") {
      location lLoc4 = GetLocalLocation(GetPCSpeaker(), "RHUN_RECALL_L4");
      SetLocalInt(OBJECT_SELF, "RHUN_RECALL_U4", 1);
      SetLocalLocation(OBJECT_SELF, "RHUN_RECALL_B4", lLoc4);
      ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc4);
      AssignCommand(GetPCSpeaker(), JumpToLocation(lLoc4));}

    else if (oTag == "RHUN_RECALL_P5") {
      location lLoc5 = GetLocalLocation(GetPCSpeaker(), "RHUN_RECALL_L5");
      SetLocalInt(OBJECT_SELF, "RHUN_RECALL_U5", 1);
      SetLocalLocation(OBJECT_SELF, "RHUN_RECALL_B5", lLoc5);
      ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc5);
      AssignCommand(GetPCSpeaker(), JumpToLocation(lLoc5));}

    else if (oTag == "RHUN_RECALL_P6") {
      location lLoc6 = GetLocalLocation(GetPCSpeaker(), "RHUN_RECALL_L6");
      SetLocalInt(OBJECT_SELF, "RHUN_RECALL_U6", 1);
      SetLocalLocation(OBJECT_SELF, "RHUN_RECALL_B6", lLoc6);
      ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc6);
      AssignCommand(GetPCSpeaker(), JumpToLocation(lLoc6));}

    else if (oTag == "RHUN_RECALL_P7") {
      location lLoc7 = GetLocalLocation(GetPCSpeaker(), "RHUN_RECALL_L7");
      SetLocalInt(OBJECT_SELF, "RHUN_RECALL_U7", 1);
      SetLocalLocation(OBJECT_SELF, "RHUN_RECALL_B7", lLoc7);
      ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc7);
      AssignCommand(GetPCSpeaker(), JumpToLocation(lLoc7));}

    else if (oTag == "RHUN_RECALL_P8") {
      location lLoc8 = GetLocalLocation(GetPCSpeaker(), "RHUN_RECALL_L8");
      SetLocalInt(OBJECT_SELF, "RHUN_RECALL_U8", 1);
      SetLocalLocation(OBJECT_SELF, "RHUN_RECALL_B8", lLoc8);
      ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc8);
      AssignCommand(GetPCSpeaker(), JumpToLocation(lLoc8));}

    else if (oTag == "RHUN_RECALL_WC") {
      location lLoc9 = GetLocalLocation(GetPCSpeaker(), "RHUN_RECALL_L9");
      SetLocalInt(OBJECT_SELF, "RHUN_RECALL_U9", 1);
      SetLocalLocation(OBJECT_SELF, "RHUN_RECALL_B9", lLoc9);
      ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
      AssignCommand(GetPCSpeaker(), JumpToLocation(lLoc9));}

   else if (oTag == "DROW_ACADEMY_RECALL") {
      location lLoc9 = GetLocalLocation(GetPCSpeaker(), "DROW_ACADEMY_RECALL");
      SetLocalInt(OBJECT_SELF, "DROW_ACADEMY_RECALL", 1);
      SetLocalLocation(OBJECT_SELF, "DROW_ACADEMY_RECALL", lLoc9);
      ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
      AssignCommand(GetPCSpeaker(), JumpToLocation(lLoc9));}

   else if (oTag == "SHA_ROGUE_RECALL") {
      location lLoc9 = GetLocalLocation(GetPCSpeaker(), "SHA_ROGUE_RECALL");
      SetLocalInt(OBJECT_SELF, "SHA_ROGUE_RECALL", 1);
      SetLocalLocation(OBJECT_SELF, "SHA_ROGUE_RECALL", lLoc9);
      ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
      AssignCommand(GetPCSpeaker(), JumpToLocation(lLoc9));}

   else if (oTag == "VAMPIRE_RECALL_PORTRAIT") {
      location lLoc9 = GetLocalLocation(GetPCSpeaker(), "VAMPIRE_RECALL");
      SetLocalInt(OBJECT_SELF, "VAMPIRE_RECALL", 1);
      SetLocalLocation(OBJECT_SELF, "VAMPIRE_RECALL", lLoc9);
      ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
      AssignCommand(GetPCSpeaker(), JumpToLocation(lLoc9));}

  else if (oTag == "RECALL_WERECAT_MUSHROOM") {
      location lLoc9 = GetLocalLocation(GetPCSpeaker(), "WERECAT_RECALL");
      SetLocalInt(OBJECT_SELF, "WERECAT_RECALL", 1);
      SetLocalLocation(OBJECT_SELF, "WERECAT_RECALL", lLoc9);
      ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
      AssignCommand(GetPCSpeaker(), JumpToLocation(lLoc9));}

   else if (oTag == "RECALL_DARKELF_LIGHTS") {
      location lLoc9 = GetLocalLocation(GetPCSpeaker(), "DARKELF_RECALL");
      SetLocalInt(OBJECT_SELF, "DARKELF_RECALL", 1);
      SetLocalLocation(OBJECT_SELF, "DARKELF_RECALL", lLoc9);
      ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
      AssignCommand(GetPCSpeaker(), JumpToLocation(lLoc9));}

   else if(FindSubString(oTag, "DROW_HOUSE_RECALL") >= 0)
     {
         object oPC = GetPCSpeaker();
         object oTarget = OBJECT_SELF;
         AssignCommand(oPC, ActionSit(oTarget));

         if (oTag ==  "DROW_HOUSE_RECALL_1") {
              location lLoc9 = GetLocalLocation(oPC, "DROW_HOUSE_RECALL_1");
              SetLocalInt(OBJECT_SELF, "DROW_HOUSE_RECALL_1", 1);
              SetLocalLocation(OBJECT_SELF, "DROW_HOUSE_RECALL_1", lLoc9);
              ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
              DelayCommand(1.9, AssignCommand(oPC, ClearAllActions(TRUE)));
              DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(lLoc9)));}
         else if (oTag ==  "DROW_HOUSE_RECALL_2") {
              location lLoc9 = GetLocalLocation(oPC, "DROW_HOUSE_RECALL_2");
              SetLocalInt(OBJECT_SELF, "DROW_HOUSE_RECALL_2", 1);
              SetLocalLocation(OBJECT_SELF, "DROW_HOUSE_RECALL_2", lLoc9);
              ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
              DelayCommand(1.9, AssignCommand(oPC, ClearAllActions(TRUE)));
              DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(lLoc9)));}
         else if (oTag ==  "DROW_HOUSE_RECALL_3") {
              location lLoc9 = GetLocalLocation(oPC, "DROW_HOUSE_RECALL_3");
              SetLocalInt(OBJECT_SELF, "DROW_HOUSE_RECALL_3", 1);
              SetLocalLocation(OBJECT_SELF, "DROW_HOUSE_RECALL_3", lLoc9);
              ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
              DelayCommand(1.9, AssignCommand(oPC, ClearAllActions(TRUE)));
              DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(lLoc9)));}
         else if (oTag ==  "DROW_HOUSE_RECALL_4") {
              location lLoc9 = GetLocalLocation(oPC, "DROW_HOUSE_RECALL_4");
              SetLocalInt(OBJECT_SELF, "DROW_HOUSE_RECALL_4", 1);
              SetLocalLocation(OBJECT_SELF, "DROW_HOUSE_RECALL_4", lLoc9);
              ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
              DelayCommand(1.9, AssignCommand(oPC, ClearAllActions(TRUE)));
              DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(lLoc9)));}
        else if (oTag ==  "DROW_HOUSE_RECALL_5") {
              location lLoc9 = GetLocalLocation(oPC, "DROW_HOUSE_RECALL_5");
              SetLocalInt(OBJECT_SELF, "DROW_HOUSE_RECALL_5", 1);
              SetLocalLocation(OBJECT_SELF, "DROW_HOUSE_RECALL_5", lLoc9);
              ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
              DelayCommand(1.9, AssignCommand(oPC, ClearAllActions(TRUE)));
              DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(lLoc9)));}
        else if (oTag ==  "DROW_HOUSE_RECALL_6") {
              location lLoc9 = GetLocalLocation(oPC, "DROW_HOUSE_RECALL_6");
              SetLocalInt(OBJECT_SELF, "DROW_HOUSE_RECALL_6", 1);
              SetLocalLocation(OBJECT_SELF, "DROW_HOUSE_RECALL_6", lLoc9);
              ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
              DelayCommand(1.9, AssignCommand(oPC, ClearAllActions(TRUE)));
              DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(lLoc9)));}
        else if (oTag ==  "DROW_HOUSE_RECALL_7") {
              location lLoc9 = GetLocalLocation(oPC, "DROW_HOUSE_RECALL_7");
              SetLocalInt(OBJECT_SELF, "DROW_HOUSE_RECALL_7", 1);
              SetLocalLocation(OBJECT_SELF, "DROW_HOUSE_RECALL_7", lLoc9);
              ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
              DelayCommand(1.9, AssignCommand(oPC, ClearAllActions(TRUE)));
              DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(lLoc9)));}
        else if (oTag ==  "DROW_HOUSE_RECALL_8") {
              location lLoc9 = GetLocalLocation(oPC, "DROW_HOUSE_RECALL_8");
              SetLocalInt(OBJECT_SELF, "DROW_HOUSE_RECALL_8", 1);
              SetLocalLocation(OBJECT_SELF, "DROW_HOUSE_RECALL_8", lLoc9);
              ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
              DelayCommand(1.9, AssignCommand(oPC, ClearAllActions(TRUE)));
              DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(lLoc9)));}
        else if (oTag ==  "DROW_HOUSE_RECALL_L1") {
              location lLoc9 = GetLocalLocation(oPC, "DROW_HOUSE_RECALL_L1");
              SetLocalInt(OBJECT_SELF, "DROW_HOUSE_RECALL_L1", 1);
              SetLocalLocation(OBJECT_SELF, "DROW_HOUSE_RECALL_L1", lLoc9);
              ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
              DelayCommand(1.9, AssignCommand(oPC, ClearAllActions(TRUE)));
              DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(lLoc9)));}
        else if (oTag ==  "DROW_HOUSE_RECALL_L2") {
              location lLoc9 = GetLocalLocation(oPC, "DROW_HOUSE_RECALL_L2");
              SetLocalInt(OBJECT_SELF, "DROW_HOUSE_RECALL_L2", 1);
              SetLocalLocation(OBJECT_SELF, "DROW_HOUSE_RECALL_L2", lLoc9);
              ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
              DelayCommand(1.9, AssignCommand(oPC, ClearAllActions(TRUE)));
              DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(lLoc9)));}
        else if (oTag ==  "DROW_HOUSE_RECALL_L3") {
              location lLoc9 = GetLocalLocation(oPC, "DROW_HOUSE_RECALL_L3");
              SetLocalInt(OBJECT_SELF, "DROW_HOUSE_RECALL_L3", 1);
              SetLocalLocation(OBJECT_SELF, "DROW_HOUSE_RECALL_L3", lLoc9);
              ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_UNSUMMON), lLoc9);
              DelayCommand(1.9, AssignCommand(oPC, ClearAllActions(TRUE)));
              DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(lLoc9)));}
      }
}

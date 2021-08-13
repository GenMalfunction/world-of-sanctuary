void main()
{

   object oPC = GetLastSpeaker();
   //object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC,OBJECT_SELF,1);
   float fFace = GetFacing(oPC);
   object oTarget;
   oTarget = OBJECT_SELF;



    location lPC = GetLocation(OBJECT_SELF);
    float fFacingPC = GetFacing(OBJECT_SELF);
    vector vPC = GetPosition(OBJECT_SELF);
    object oArea = GetArea(OBJECT_SELF);
    fFacingPC += 180.0;

    if(fFacingPC > 360.0)
        fFacingPC - 360.0;

    float fFacingFire = fFacingPC = 180.0;
    if(fFacingFire > 360.0)
        fFacingFire - 360.0;
    vector vFire;
    int vDirection;
    if (d20(1)<= 14)
      {
       // Set distance from placer at 0.1
       vFire = vPC + (AngleToVector(fFacingPC) * 0.1);
       vDirection = 1;
      }
     else
      {
       // Set distance from placer at 0.2
       vFire = vPC + (AngleToVector(fFacingPC) * 0.2);
       vDirection = 2;
      }
    location lFire = Location(oArea,vFire,fFacingFire);
    object oChair = CreateObject(OBJECT_TYPE_PLACEABLE,"dirtychair",lFire,FALSE);

     //comment out the following 2 lines to remove lighting visual effect.
    //object oInvis = CreateObject(OBJECT_TYPE_PLACEABLE,"plc_solblue",lFire,FALSE);
    //DestroyObject(oInvis,40.0);

   AssignCommand(oChair,SetFacing(GetFacing(OBJECT_SELF)));  //<-- have chair face same as PC (I hope)
  float fFacing = GetFacing(oChair);
  fFacing += 360.0f;
  if ( fFacing >360.0f)
    {fFacing -=360.0f;}


  AssignCommand(OBJECT_SELF,ClearAllActions());
  SetCutsceneMode(oPC, TRUE);
  SetCameraMode(oPC, CAMERA_MODE_CHASE_CAMERA);


  AssignCommand(OBJECT_SELF, ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_CHEST , OBJECT_SELF)));
  AssignCommand(oPC,ClearAllActions());
  AssignCommand(oPC,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_CHEST,oPC)));
  AssignCommand(oPC,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_HEAD,oPC)));
  AssignCommand(oPC,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPC)));
  AssignCommand(oPC,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC)));
  DelayCommand(0.8,AssignCommand(oPC, ActionSit(oChair)));
  AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID,1.0,1.3));

// Add a little variety to the act.
  if (vDirection==1)
     {
      // Change facing to opposite that of PC at earliest oppertunity
      DelayCommand(1.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)+180.0))));
      DelayCommand(2.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)+180.0))));
      DelayCommand(3.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)+180.0))));
      DelayCommand(4.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)+180.0))));
      DelayCommand(5.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)+180.0))));
      DelayCommand(6.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)+180.0))));


     }
    else
     {
      // Change facing to that of PC at earliest oppertunity
      DelayCommand(1.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)))));
      DelayCommand(2.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)))));
      DelayCommand(3.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)))));
      DelayCommand(4.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)))));
      DelayCommand(5.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)))));
      DelayCommand(6.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)))));

     }

  DelayCommand(1.4,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,1.0,3.7)));
  DelayCommand(0.2,SetCommandable(FALSE,GetPCSpeaker()));
  DelayCommand(5.2,SetCommandable(TRUE,GetPCSpeaker()));







   PlayVoiceChat(VOICE_CHAT_LAUGH,OBJECT_SELF);

   DelayCommand(2.0,PlayVoiceChat(VOICE_CHAT_YES,OBJECT_SELF));
   DelayCommand(2.1,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,1.6)));
   DelayCommand(2.4,PlayVoiceChat(VOICE_CHAT_LAUGH,OBJECT_SELF));
   DelayCommand(2.4,PlayVoiceChat(VOICE_CHAT_LAUGH,oPC));
   DelayCommand(3.5,PlayVoiceChat(VOICE_CHAT_YES,OBJECT_SELF));
   DelayCommand(3.6,PlayVoiceChat(VOICE_CHAT_LAUGH,oPC));
   DelayCommand(3.7,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.9)));
   DelayCommand(3.9,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF));
   DelayCommand(3.9,PlayVoiceChat(VOICE_CHAT_PAIN1,oPC));

   DelayCommand(4.6,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.5)));
   DelayCommand(5.1,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.4)));
   DelayCommand(5.3,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF));

   DelayCommand(5.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.3)));
   DelayCommand(5.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.5)));
   DelayCommand(6.0,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));
   DelayCommand(6.0,PlayVoiceChat(VOICE_CHAT_PAIN2,oPC));

   DelayCommand(6.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(6.7,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.7)));
   DelayCommand(6.9,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF));
   DelayCommand(6.9,PlayVoiceChat(VOICE_CHAT_PAIN1,oPC));

   DelayCommand(7.4,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(7.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.8)));
   DelayCommand(8.0,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));

   DelayCommand(8.6,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(9.0,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.9)));
   DelayCommand(9.2,PlayVoiceChat(VOICE_CHAT_PAIN3,OBJECT_SELF));

   DelayCommand(9.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(10.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.5)));
   DelayCommand(10.5,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));

   if (vDirection==1)
      DelayCommand(10.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE,8.0,20.5)));

   DelayCommand(11.5,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF));

   DelayCommand(12.4,PlayVoiceChat(VOICE_CHAT_PAIN3,OBJECT_SELF));

   DelayCommand(13.3,PlayVoiceChat(VOICE_CHAT_PAIN3,OBJECT_SELF));

   DelayCommand(13.3,PlayVoiceChat(VOICE_CHAT_PAIN3,oPC));

   DelayCommand(14.2,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));

   DelayCommand(15.4,PlayVoiceChat(VOICE_CHAT_PAIN3,OBJECT_SELF));

   DelayCommand(16.2,PlayVoiceChat(VOICE_CHAT_GATTACK1,OBJECT_SELF));

   DelayCommand(16.2,PlayVoiceChat(VOICE_CHAT_GATTACK1,oPC));

   DelayCommand(18.4,PlayVoiceChat(VOICE_CHAT_PAIN3,OBJECT_SELF));

   DelayCommand(20.0,PlayVoiceChat(VOICE_CHAT_GATTACK1,OBJECT_SELF));

   DelayCommand(21.1,PlayVoiceChat(VOICE_CHAT_GATTACK2,OBJECT_SELF));

   DelayCommand(22.4,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));

   DelayCommand(22.4,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));

   DelayCommand(23.6,PlayVoiceChat(VOICE_CHAT_PAIN3,OBJECT_SELF));

   DelayCommand(24.4,PlayVoiceChat(VOICE_CHAT_GATTACK2,OBJECT_SELF));

   DelayCommand(24.4,PlayVoiceChat(VOICE_CHAT_GATTACK2,oPC));

   DelayCommand(25.6,PlayVoiceChat(VOICE_CHAT_GATTACK1,OBJECT_SELF));

   DelayCommand(26.6,PlayVoiceChat(VOICE_CHAT_PAIN3,OBJECT_SELF));

   DelayCommand(27.4,PlayVoiceChat(VOICE_CHAT_GATTACK2,OBJECT_SELF));

   DelayCommand(28.2,PlayVoiceChat(VOICE_CHAT_GATTACK3,OBJECT_SELF));

    DelayCommand(29.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1)));

   DelayCommand(29.4,PlayVoiceChat(VOICE_CHAT_DEATH,OBJECT_SELF));

   DelayCommand(29.4,PlayVoiceChat(VOICE_CHAT_DEATH,oPC));


  DelayCommand (30.0,SetCommandable(TRUE,OBJECT_SELF));
  DelayCommand(30.5, SetCutsceneMode(oPC, FALSE));
  DelayCommand(31.0,AssignCommand(oPC, ClearAllActions()));
  DelayCommand(31.5,AssignCommand(oPC, ActionEquipMostEffectiveArmor()));


}

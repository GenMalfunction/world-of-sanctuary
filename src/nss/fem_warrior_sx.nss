void main()
{
  object oPC = GetPCSpeaker();
   float fFace = GetFacing(oPC);

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
    object oInvis = CreateObject(OBJECT_TYPE_PLACEABLE,"plc_solblue",lFire,FALSE);
    DestroyObject(oInvis,40.0);
    //DestroyObject(oChair,35.0);// Interesting bug in v1.27, if you uncomment this line, the PC will remain sitting, and will run 'sitting down'
 //object oChair = CreateObject(OBJECT_TYPE_PLACEABLE,"chair001",GetLocation(OBJECT_SELF),FALSE);

  AssignCommand(oChair,SetFacing(GetFacing(OBJECT_SELF)));  //<-- have chair face same as PC (I hope)
  float fFacing = GetFacing(oChair);
  fFacing += 180.0f;
  if ( fFacing >360.0f)
    {fFacing -=360.0f;}

  AssignCommand(OBJECT_SELF,ClearAllActions());
  AssignCommand(OBJECT_SELF, ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_CHEST , OBJECT_SELF)));
  AssignCommand(oPC,ClearAllActions());
  AssignCommand(oPC,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_CHEST,oPC)));
  AssignCommand(oPC,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_HEAD,oPC)));
  AssignCommand(oPC,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPC)));
  AssignCommand(oPC,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC)));
  DelayCommand(0.8,AssignCommand(oPC, ActionSit(oChair)));
  AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID,1.0,2.0));

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

  DelayCommand(2.1,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,1.0,2.2)));
  DelayCommand(0.2,SetCommandable(FALSE,GetPCSpeaker()));
  DelayCommand(5.2,SetCommandable(TRUE,GetPCSpeaker()));



 //DelayCommand(5.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.5)));
 //DelayCommand(5.7,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.5)));








   PlayVoiceChat(VOICE_CHAT_SELECTED,OBJECT_SELF);

   DelayCommand(2.5,PlayVoiceChat(VOICE_CHAT_LOOKHERE,OBJECT_SELF));
   DelayCommand(4.0,PlayVoiceChat(VOICE_CHAT_LAUGH,OBJECT_SELF));
   DelayCommand(4.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,1.2)));

   DelayCommand(5.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(5.6,PlayVoiceChat(VOICE_CHAT_REST,OBJECT_SELF)); //flee
   DelayCommand(5.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.6)));
   DelayCommand(6.1,PlayVoiceChat(VOICE_CHAT_GATTACK1,OBJECT_SELF));
   DelayCommand(6.1,PlayVoiceChat(VOICE_CHAT_GATTACK1,oPC));

   DelayCommand(6.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(6.6,PlayVoiceChat(VOICE_CHAT_REST,OBJECT_SELF));
   DelayCommand(6.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.6)));
   DelayCommand(7.1,PlayVoiceChat(VOICE_CHAT_POISONED,OBJECT_SELF));

   DelayCommand(7.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(7.6,PlayVoiceChat(VOICE_CHAT_REST,OBJECT_SELF));
   DelayCommand(7.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.7)));
   DelayCommand(8.2,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF));

   DelayCommand(8.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.5)));
   DelayCommand(9.0,PlayVoiceChat(VOICE_CHAT_REST,OBJECT_SELF));
   DelayCommand(9.4,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.9)));
   DelayCommand(9.6,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF));
   DelayCommand(9.6,PlayVoiceChat(VOICE_CHAT_PAIN1,oPC));

   DelayCommand(10.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(10.4,PlayVoiceChat(VOICE_CHAT_HOLD,OBJECT_SELF));
   DelayCommand(10.7,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,1.1)));
   DelayCommand(11.0,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));

   DelayCommand(11.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(11.9,PlayVoiceChat(VOICE_CHAT_REST,OBJECT_SELF));
   DelayCommand(12.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,1.0)));
   DelayCommand(12.5,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));
   DelayCommand(12.5,PlayVoiceChat(VOICE_CHAT_PAIN2,oPC));

   DelayCommand(13.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(13.3,PlayVoiceChat(VOICE_CHAT_REST,OBJECT_SELF));
   DelayCommand(13.6,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.6)));
   DelayCommand(13.8,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF));

   DelayCommand(14.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(14.3,PlayVoiceChat(VOICE_CHAT_REST,OBJECT_SELF));
   DelayCommand(14.6,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.7)));
   DelayCommand(14.8,PlayVoiceChat(VOICE_CHAT_PAIN3,OBJECT_SELF));
   DelayCommand(14.8,PlayVoiceChat(VOICE_CHAT_PAIN3,oPC));

   DelayCommand(15.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(15.4,PlayVoiceChat(VOICE_CHAT_REST,OBJECT_SELF));
   DelayCommand(15.7,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.8)));
   DelayCommand(16.0,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));

   DelayCommand(16.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(16.6,PlayVoiceChat(VOICE_CHAT_REST,OBJECT_SELF));
   DelayCommand(16.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.5)));
   DelayCommand(17.2,PlayVoiceChat(VOICE_CHAT_GATTACK2,OBJECT_SELF));

   DelayCommand(17.4,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.2)));
   DelayCommand(17.6,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.4)));
   DelayCommand(17.8,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));

   DelayCommand(18.0,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.2)));
   DelayCommand(18.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.6)));
   DelayCommand(18.4,PlayVoiceChat(VOICE_CHAT_GATTACK2,OBJECT_SELF));
   DelayCommand(18.4,PlayVoiceChat(VOICE_CHAT_GATTACK2,oPC));

   DelayCommand(18.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(19.0,PlayVoiceChat(VOICE_CHAT_REST,OBJECT_SELF));
   DelayCommand(19.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.4)));
   DelayCommand(19.5,PlayVoiceChat(VOICE_CHAT_GATTACK2,OBJECT_SELF));

   DelayCommand(18.6,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.2)));
   DelayCommand(19.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.4)));
   DelayCommand(20.0,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));

   DelayCommand(20.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.2)));
   DelayCommand(20.4,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.5)));
   DelayCommand(20.5,PlayVoiceChat(VOICE_CHAT_GATTACK3,OBJECT_SELF));

   DelayCommand(20.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(21.0,PlayVoiceChat(VOICE_CHAT_REST,OBJECT_SELF));
   DelayCommand(21.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.4)));
   DelayCommand(21.5,PlayVoiceChat(VOICE_CHAT_GATTACK2,OBJECT_SELF));

   DelayCommand(21.7,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.2)));
   DelayCommand(21.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.6)));
   DelayCommand(22.0,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));

   DelayCommand(22.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.3)));
   DelayCommand(22.6,PlayVoiceChat(VOICE_CHAT_REST,OBJECT_SELF));
   DelayCommand(22.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.9)));
   DelayCommand(23.1,PlayVoiceChat(VOICE_CHAT_GATTACK3,OBJECT_SELF));

   DelayCommand(23.7,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.3)));
   DelayCommand(23.8,PlayVoiceChat(VOICE_CHAT_REST,OBJECT_SELF));
   DelayCommand(24.0,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.6)));
   DelayCommand(24.3,PlayVoiceChat(VOICE_CHAT_GATTACK2,OBJECT_SELF));

   DelayCommand(24.6,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,7.0,0.3)));
   DelayCommand(24.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,10.0,0.8)));
   DelayCommand(25.1,PlayVoiceChat(VOICE_CHAT_GATTACK3,OBJECT_SELF));

   DelayCommand(25.7,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,8.0,0.3)));
   DelayCommand(25.8,PlayVoiceChat(VOICE_CHAT_REST,OBJECT_SELF));
   DelayCommand(26.0,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,11.0,0.3)));
   DelayCommand(26.2,PlayVoiceChat(VOICE_CHAT_GATTACK2,OBJECT_SELF));

   DelayCommand(26.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,10.0,0.2)));
   DelayCommand(26.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,12.0,0.6)));
   DelayCommand(26.7,PlayVoiceChat(VOICE_CHAT_GATTACK3,OBJECT_SELF));

   DelayCommand(27.1,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,8.0,0.3)));
   DelayCommand(27.4,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,12.0,0.5)));
   DelayCommand(27.6,PlayVoiceChat(VOICE_CHAT_PAIN3,OBJECT_SELF));

   DelayCommand(27.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,8.0,0.3)));
   DelayCommand(28.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,12.0,0.7)));
   DelayCommand(28.4,PlayVoiceChat(VOICE_CHAT_NEARDEATH,OBJECT_SELF));
   DelayCommand(28.4,PlayVoiceChat(VOICE_CHAT_DEATH,oPC));


    // Random 'pass-out' Direction
   switch (d4(1))
    {
    case 1:
     DelayCommand(29.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)))));
     break;
    case 2:
     DelayCommand(29.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)+90))));
     break;
    case 3:
     DelayCommand(29.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)+180))));
     break;
    default:
     DelayCommand(29.0,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)+270))));
     break;
    }

   DelayCommand(29.1,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT,12.0,10.0)));


   DelayCommand(29.2,PlayVoiceChat(VOICE_CHAT_DEATH,OBJECT_SELF));
  DelayCommand (30.0,SetCommandable(TRUE,OBJECT_SELF));
}

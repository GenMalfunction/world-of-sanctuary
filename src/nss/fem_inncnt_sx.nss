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



  AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0,1.3));
  PlayVoiceChat(VOICE_CHAT_HOLD,OBJECT_SELF);
  DelayCommand(0.3,PlayVoiceChat(VOICE_CHAT_LAUGH,OBJECT_SELF));
  DelayCommand(1.0,PlayVoiceChat(VOICE_CHAT_CHEER,OBJECT_SELF));


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
  DelayCommand(1.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,1.0,3.5)));
  DelayCommand(0.2,SetCommandable(FALSE,GetPCSpeaker()));
  DelayCommand(5.2,SetCommandable(TRUE,GetPCSpeaker()));



   DelayCommand(1.8,PlayVoiceChat(VOICE_CHAT_LAUGH,OBJECT_SELF));
   DelayCommand(3.0,PlayVoiceChat(VOICE_CHAT_STOP,OBJECT_SELF));
   DelayCommand(3.7,PlayVoiceChat(VOICE_CHAT_LAUGH,OBJECT_SELF));   //3.6
   DelayCommand(4.2,PlayVoiceChat(VOICE_CHAT_CHEER,OBJECT_SELF));
   DelayCommand(4.8,PlayVoiceChat(VOICE_CHAT_ENEMIES,OBJECT_SELF));

   DelayCommand(5.0,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.5)));
   DelayCommand(5.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.5)));
   DelayCommand(5.8,PlayVoiceChat(VOICE_CHAT_BADIDEA,OBJECT_SELF));

   DelayCommand(6.0,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,7.0,0.4)));
   DelayCommand(6.3,PlayVoiceChat(VOICE_CHAT_HEALME,OBJECT_SELF));        //V
   DelayCommand(6.4,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.6)));
   DelayCommand(6.9,PlayVoiceChat(VOICE_CHAT_SPELLFAILED,OBJECT_SELF));   ///|

   DelayCommand(7.0,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,7.0,0.5)));
   DelayCommand(7.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.4)));
   DelayCommand(7.7,PlayVoiceChat(VOICE_CHAT_YES,OBJECT_SELF));
   DelayCommand(7.7,PlayVoiceChat(VOICE_CHAT_LAUGH,oPC));

   DelayCommand(7.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,7.0,0.4)));
   DelayCommand(8.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.4)));
   DelayCommand(8.4,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));

   DelayCommand(8.7,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,7.0,0.6)));
   DelayCommand(9.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.6)));
   DelayCommand(9.8,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));
   DelayCommand(9.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,7.0,0.3)));
   DelayCommand(10.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.3)));
   DelayCommand(10.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,8.0,0.5)));
   DelayCommand(11.0,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.4)));
   DelayCommand(11.2,PlayVoiceChat(VOICE_CHAT_TALKTOME,OBJECT_SELF));

   DelayCommand(11.4,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,8.0,0.5)));
   DelayCommand(11.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.6)));
   DelayCommand(12.0,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF));

   DelayCommand(12.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,8.0,0.6)));
   DelayCommand(13.1,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.6)));
   DelayCommand(13.3,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));

   DelayCommand(13.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,8.0,0.5)));
   DelayCommand(14.4,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.5)));
   DelayCommand(14.7,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF)); //talktome

   DelayCommand(14.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,8.0,0.4)));
   DelayCommand(15.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.6)));
   DelayCommand(15.4,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));
   DelayCommand(15.4,PlayVoiceChat(VOICE_CHAT_STOP,oPC));

   DelayCommand(15.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,8.0,0.4)));
   DelayCommand(16.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.6)));
   DelayCommand(16.8,PlayVoiceChat(VOICE_CHAT_PAIN3,OBJECT_SELF));

   DelayCommand(16.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,7.0,0.4)));
   DelayCommand(17.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.6)));
   DelayCommand(17.4,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));
   DelayCommand(17.4,PlayVoiceChat(VOICE_CHAT_PAIN2,oPC));

   DelayCommand(17.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,8.0,0.4)));
   DelayCommand(18.2,PlayVoiceChat(VOICE_CHAT_PAIN3,OBJECT_SELF));
   DelayCommand(18.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.5)));
   DelayCommand(18.4,PlayVoiceChat(VOICE_CHAT_GATTACK1,OBJECT_SELF));



   DelayCommand(18.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(19.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,1.0)));
   DelayCommand(19.3,PlayVoiceChat(VOICE_CHAT_GATTACK2,OBJECT_SELF));

   DelayCommand(20.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,5.0,0.7)));
   DelayCommand(20.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,1.1)));
   DelayCommand(21.2,PlayVoiceChat(VOICE_CHAT_GATTACK1,OBJECT_SELF));

   DelayCommand(22.0,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,5.0,0.7)));
   DelayCommand(22.3,PlayVoiceChat(VOICE_CHAT_GATTACK2,OBJECT_SELF));
   DelayCommand(22.3,PlayVoiceChat(VOICE_CHAT_GATTACK2,oPC));

   DelayCommand(22.7,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.7)));
   DelayCommand(23.2,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF));
   DelayCommand(23.2,PlayVoiceChat(VOICE_CHAT_PAIN1,oPC));

   DelayCommand(23.4,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.7)));
   DelayCommand(24.0,PlayVoiceChat(VOICE_CHAT_GATTACK3,OBJECT_SELF));

   DelayCommand(24.1,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,10.0,0.9)));
   DelayCommand(24.9,PlayVoiceChat(VOICE_CHAT_GATTACK2,OBJECT_SELF));

   DelayCommand(25.0,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,7.0,0.6)));
   DelayCommand(25.6,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,10.0,0.6)));
   DelayCommand(26.0,PlayVoiceChat(VOICE_CHAT_GATTACK3,OBJECT_SELF));

   DelayCommand(26.1,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,8.0,0.6)));
   DelayCommand(26.7,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,11.0,0.6)));
   DelayCommand(26.9,PlayVoiceChat(VOICE_CHAT_PAIN3,OBJECT_SELF));
   DelayCommand(26.9,PlayVoiceChat(VOICE_CHAT_PAIN3,oPC));

   DelayCommand(27.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,9.0,0.6)));
   DelayCommand(27.8,PlayVoiceChat(VOICE_CHAT_GATTACK3,OBJECT_SELF));
   DelayCommand(27.8,PlayVoiceChat(VOICE_CHAT_GATTACK3,oPC));

   DelayCommand(27.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,15.0,0.8)));
   // Random 'pass-out' Direction
   switch (d4(1))
    {
    case 1:
     DelayCommand(29.5,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)))));
     break;
    case 2:
     DelayCommand(29.5,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)+90))));
     break;
    case 3:
     DelayCommand(29.5,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)+180))));
     break;
    default:
     DelayCommand(29.5,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)+270))));
     break;
    }

   DelayCommand(28.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT,1.0,10.0)));
   DelayCommand(28.9,PlayVoiceChat(VOICE_CHAT_NEARDEATH,OBJECT_SELF));


   DelayCommand(29.8,PlayVoiceChat(VOICE_CHAT_DEATH,OBJECT_SELF));

   DelayCommand(29.8,PlayVoiceChat(VOICE_CHAT_DEATH,oPC));

  DelayCommand (30.0,SetCommandable(TRUE,OBJECT_SELF));

}

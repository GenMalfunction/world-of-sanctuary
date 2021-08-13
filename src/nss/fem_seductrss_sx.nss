// This sound script is a throw-together for the soundset
// FEMALE_SEDUCTRESS, and will work only with this soundset.

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







   PlayVoiceChat(VOICE_CHAT_LOOKHERE,OBJECT_SELF);
   DelayCommand(0.9,PlayVoiceChat(VOICE_CHAT_LAUGH,OBJECT_SELF));
   DelayCommand(5.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.5)));
   DelayCommand(5.7,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.5)));
   DelayCommand(5.9,PlayVoiceChat(VOICE_CHAT_CUSS,OBJECT_SELF));
   DelayCommand(5.9,PlayVoiceChat(VOICE_CHAT_YES,oPC));

   DelayCommand(6.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.5)));
   DelayCommand(6.7,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.7)));
   DelayCommand(7.0,PlayVoiceChat(VOICE_CHAT_ENCUMBERED,OBJECT_SELF));

   DelayCommand(7.4,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.5)));
   DelayCommand(7.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,1.0)));
   DelayCommand(8.3,PlayVoiceChat(VOICE_CHAT_CUSS,OBJECT_SELF));

   DelayCommand(8.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(9.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.9)));
   DelayCommand(9.4,PlayVoiceChat(VOICE_CHAT_REST,OBJECT_SELF));

   DelayCommand(10.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(10.6,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.9)));
   DelayCommand(10.8,PlayVoiceChat(VOICE_CHAT_CUSS,OBJECT_SELF));
   DelayCommand(14.2,PlayVoiceChat(VOICE_CHAT_PAIN1,oPC));

   DelayCommand(11.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.3)));
   DelayCommand(11.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.7)));
   DelayCommand(12.0,PlayVoiceChat(VOICE_CHAT_ENCUMBERED,OBJECT_SELF));

   DelayCommand(12.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.3)));
   DelayCommand(12.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.8)));
   DelayCommand(13.0,PlayVoiceChat(VOICE_CHAT_CUSS,OBJECT_SELF));

   DelayCommand(13.6,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(14.0,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.5)));
   DelayCommand(14.2,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF));

   DelayCommand(14.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.3)));
   DelayCommand(14.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,8.0,0.5)));
   DelayCommand(15.0,PlayVoiceChat(VOICE_CHAT_CUSS,OBJECT_SELF));

   DelayCommand(15.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.2)));
   DelayCommand(15.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.4)));
   DelayCommand(15.7,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF));

   DelayCommand(15.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.3)));
   DelayCommand(16.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.3)));
   DelayCommand(16.4,PlayVoiceChat(VOICE_CHAT_CUSS,OBJECT_SELF));

   DelayCommand(16.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.3)));
   DelayCommand(16.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.4)));
   DelayCommand(17.0,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF));

   DelayCommand(17.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.2)));
   DelayCommand(17.4,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.3)));
   DelayCommand(17.6,PlayVoiceChat(VOICE_CHAT_CUSS,OBJECT_SELF));
   DelayCommand(17.6,PlayVoiceChat(VOICE_CHAT_CUSS,oPC));

   DelayCommand(17.7,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.2)));
   DelayCommand(17.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.4)));
   DelayCommand(18.1,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF));

   DelayCommand(18.3,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.2)));
   DelayCommand(18.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.4)));
   DelayCommand(18.7,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));

   DelayCommand(18.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.2)));
   DelayCommand(19.1,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.3)));
   DelayCommand(19.4,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF));

   DelayCommand(19.4,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(19.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.8)));
   DelayCommand(20.0,PlayVoiceChat(VOICE_CHAT_ENCUMBERED,OBJECT_SELF));

   DelayCommand(20.6,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.4)));
   DelayCommand(21.0,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.4)));
   DelayCommand(21.3,PlayVoiceChat(VOICE_CHAT_PAIN3,OBJECT_SELF));
   DelayCommand(21.3,PlayVoiceChat(VOICE_CHAT_PAIN3,oPC));

   DelayCommand(21.4,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.3)));
   DelayCommand(21.7,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.5)));
   DelayCommand(22.0,PlayVoiceChat(VOICE_CHAT_GATTACK2,OBJECT_SELF));

   DelayCommand(22.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.3)));
   DelayCommand(22.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.4)));
   DelayCommand(22.8,PlayVoiceChat(VOICE_CHAT_PAIN1,OBJECT_SELF));    //bored

   DelayCommand(22.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.3)));
   DelayCommand(23.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.4)));
   DelayCommand(23.3,PlayVoiceChat(VOICE_CHAT_GATTACK2,OBJECT_SELF));
   DelayCommand(23.3,PlayVoiceChat(VOICE_CHAT_GATTACK2,oPC));

   DelayCommand(23.6,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.2)));
   DelayCommand(23.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.4)));
   DelayCommand(24.0,PlayVoiceChat(VOICE_CHAT_GATTACK1,OBJECT_SELF));

   DelayCommand(24.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.3)));
   DelayCommand(24.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.4)));
   DelayCommand(24.6,PlayVoiceChat(VOICE_CHAT_PAIN3,OBJECT_SELF));

   DelayCommand(24.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.2)));
   DelayCommand(25.1,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.4)));
   DelayCommand(25.2,PlayVoiceChat(VOICE_CHAT_GATTACK1,OBJECT_SELF));
   DelayCommand(25.2,PlayVoiceChat(VOICE_CHAT_GATTACK1,oPC));

   DelayCommand(25.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.3)));
   DelayCommand(25.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.4)));
   DelayCommand(26.0,PlayVoiceChat(VOICE_CHAT_PAIN2,OBJECT_SELF));   //rest

   DelayCommand(26.2,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.3)));
   DelayCommand(26.5,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,10.0,0.4)));
   DelayCommand(26.6,PlayVoiceChat(VOICE_CHAT_GATTACK3,OBJECT_SELF));;

   DelayCommand(26.9,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.2)));
   DelayCommand(27.1,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.3)));
   DelayCommand(27.2,PlayVoiceChat(VOICE_CHAT_PAIN3,OBJECT_SELF));
   DelayCommand(27.2,PlayVoiceChat(VOICE_CHAT_PAIN3,oPC));

   DelayCommand(27.4,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,6.0,0.2)));
   DelayCommand(27.6,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR,9.0,0.9)));
   DelayCommand(27.7,PlayVoiceChat(VOICE_CHAT_GATTACK3,OBJECT_SELF));

   // Random 'pass-out' Direction
   switch (d4(1))
    {
    case 1:
     DelayCommand(28.7,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)))));
     break;
    case 2:
     DelayCommand(28.7,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)+90))));
     break;
    case 3:
     DelayCommand(28.7,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)+180))));
     break;
    default:
     DelayCommand(28.7,AssignCommand(OBJECT_SELF,(SetFacing(GetFacing(oPC)+270))));
     break;
    }

   DelayCommand(28.8,AssignCommand(OBJECT_SELF,ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT,1.0,10.0)));


   DelayCommand(28.2,PlayVoiceChat(VOICE_CHAT_NEARDEATH,OBJECT_SELF));

   DelayCommand(29.5,PlayVoiceChat(VOICE_CHAT_DEATH,OBJECT_SELF));
   DelayCommand(29.5,PlayVoiceChat(VOICE_CHAT_DEATH,oPC));










  DelayCommand (30.0,SetCommandable(TRUE,OBJECT_SELF));
}

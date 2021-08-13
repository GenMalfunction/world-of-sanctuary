#include "inc_modulequest"
#include "lilarcor_include"
void Cough(object oDM)
{
    string snd = "as_pl_coughm" + IntToString(Random(7)+1);
    if (GetGender(oDM)) snd = "as_pl_coughf" + IntToString(Random(7)+1);
    AssignCommand (oDM, PlaySound(snd));
    return;
}

void Puke(object oPC)
{
      DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(Random(3) + VFX_COM_CHUNK_GREEN_SMALL), oPC, 1.0));
      Cough(oPC);
}

void MakeDrunk(object oPC, int alc)
{
    int alev;
    int hit;

    alc -= 1;
    SetLocalInt(oPC,"alcohol",alc);
    alev = GetLocalInt(oPC,"alclevel");
    if (alev != alc / 5) {
        alev = alc / 5;
        SetLocalInt(oPC,"alclevel",alev);
        if (alev == 0) {
            SendMessageToPC(oPC, "You are quite sober.");
        } else if(alev == 1) {
            SendMessageToPC(oPC, "You are a bit tipsy.");
        } else if(alev == 2) {
            SendMessageToPC(oPC, "You are drunk.");
            if (GetGender(oPC)) AssignCommand ( oPC, PlaySound("as_pl_tavcallf1"));
            else AssignCommand ( oPC, PlaySound("as_pl_tavsongm1"));
        } else if(alev == 3) {
            SendMessageToPC(oPC, "You are roaring drunk.");
            if (GetGender(oPC)) AssignCommand ( oPC, PlaySound("as_pl_tavlewdf1"));
            else AssignCommand ( oPC, PlaySound("as_pl_tavsongm2"));
        } else if(alev == 4) {
            SendMessageToPC(oPC, "You are Legless.");
        } else if(alev >= 5) {
            SendMessageToPC(oPC, "You are Paralytic.");
        }
    }
    hit = 0;
    if (alev == 1) AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, 1.0, 4.0));
    if (alev > 1) hit = 1;
    if (alev > 1 && alev < 5) {
        if (FortitudeSave(oPC,alc+15)) {
            hit = 0;
            if (Random(3) != 1) {
                AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, 1.0, 4.0));
            } else {
                AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 1.0, 1.0));
                AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_LAUGH));
                AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, 1.0, 4.0));
            }
        }
    }
    if (hit > 0) {
        AssignCommand(oPC, ClearAllActions(TRUE));
        if (alev < 5) {
            if (Random(6-alev) == 1) {
                if (Random(6) == 2) {
                    Puke(oPC);
                } else {
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_SLEEP),oPC,10.0);
                }
            }
            hit = Random(5);
            if (hit == 0) {
                AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 5.0));
            } else if (hit == 1) {
                AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 5.0));
            } else if (hit == 2) {
                AssignCommand(oPC, ActionRandomWalk());
            } else {
                AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 10.0));
            }
        } else {
            if (Random(12 - alev) == 2) {
                Puke(oPC);
            } else {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_SLEEP),oPC,10.0);
            }
            if (Random(6) != 1) {
                AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 10.0));
            } else {
                AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 5.0));
            }
        }
    }
}

void main()
{
   LilarcorSpeakOneLiner();
   int alc;

   object oPC = GetFirstPC();

   while(oPC!=OBJECT_INVALID && GetIsObjectValid(oPC)==TRUE) {
        int punish = GetLocalInt(oPC,"punish");
        if (punish > 0) {
            SetLocalInt(oPC,"punish", punish-6);
            Puke(oPC);
        }
        alc = GetLocalInt(oPC,"alcohol");
        if (alc > 0) MakeDrunk(oPC, alc);
        oPC = GetNextPC();
   }
    //if (TRUE) // change to FALSE to disable debugging
  if (FALSE)

  {
    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION,
                                       REPUTATION_TYPE_ENEMY,
                                       GetLocalObject(GetModule(),"DebugPC"),1,
                                       CREATURE_TYPE_PERCEPTION,
                                       PERCEPTION_SEEN);

    if (GetIsObjectValid(oEnemy))
      SendMessageToPC(GetLocalObject(GetModule(),"DebugPC"),
        "Nearest enemy: "+GetTag(oEnemy));





    SendMessageToPC(GetLocalObject(GetModule(),"DebugPC"),
      "Quest Status ->"+
      " Izual:"    +IntToString(GetModuleQuest("JOR_Izual"))+
      " Hellforge:"+IntToString(GetModuleQuest("JOR_Hellforge"))+
      " Diablo:"   +IntToString(GetModuleQuest("JOR_Diablo"))
      );

  }
}

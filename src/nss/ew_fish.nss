void main()
{
    object oPC = OBJECT_SELF;
    effect ePuke = EffectVisualEffect(VFX_COM_CHUNK_YELLOW_SMALL);
    effect edumb13 = EffectVisualEffect(VFX_IMP_PULSE_COLD);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb13,oPC);
    SpeakString("WHAT THE FUCK??");
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 0.5f, 2.0f));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 0.5f, 2.0f));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 0.5f, 2.0f));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 0.5f, 2.0f));
    AssignCommand(oPC, ActionSpeakString("HOLY SHIT!!"));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 0.5f, 2.0f));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 0.5f, 2.0f));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 0.5f, 2.0f));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 0.5f, 2.0f));
    AssignCommand(oPC, ActionSpeakString("OK, I'M GETTIN SICK!!"));
    DelayCommand(18.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePuke, OBJECT_SELF, 1.0));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 0.5f, 2.0f));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 0.5f, 2.0f));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 0.5f, 2.0f));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 0.5f, 2.0f));
    AssignCommand(oPC, ActionSpeakString("PLEASE NO MORE!!"));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 0.5f, 2.0f));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 0.5f, 2.0f));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 0.5f, 2.0f));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 0.5f, 2.0f));
    AssignCommand(oPC, ActionSpeakString("THANK THE GOD'S!!"));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, 1.0f, 99.0f));
    DelayCommand(9.0, AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_LAUGH)));
    DelayCommand(24.0, AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_POISONED)));
}

void main()
{
    object oPC = OBJECT_SELF;
    effect eFlash1 = EffectVisualEffect (VFX_IMP_HEAD_COLD);
    effect eFlash2 = EffectVisualEffect (VFX_IMP_KNOCK);
    effect eFlash3 = EffectVisualEffect (VFX_COM_CHUNK_GREEN_MEDIUM);
    string sMessage = "omg,, noooooooo";
    string sMessage2 = "Arrgggg i feel sick.";
    string sMessage3 = "No More Please.";
    string sMessage4 = "Please... No More.";
    DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash1,oPC));
    DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash2,oPC));
    DelayCommand(15.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash3,oPC));
    DelayCommand(0.9, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(1.4, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(1.9, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(2.4, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(2.8, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(3.2, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(3.6, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(4.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(4.4, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(4.8, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(5.2, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(5.6, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(6.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(6.4, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(6.7, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(7.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(7.3, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(7.6, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(7.9, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(8.2, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(8.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(8.8, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(9.1, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(9.4, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(9.7, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(10.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(10.3, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(10.7, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(11.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(11.3, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(11.6, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(11.9, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(12.2, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(12.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(12.8, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
    DelayCommand(13.1, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
    DelayCommand(13.7, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW)));
    DelayCommand(14.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE,1.0,10.0)));
    AssignCommand (oPC,DelayCommand(0.5, ActionSpeakString (sMessage, TALKVOLUME_TALK)));
    AssignCommand (oPC,DelayCommand(3.7, ActionSpeakString (sMessage2, TALKVOLUME_TALK)));
    AssignCommand (oPC,DelayCommand(16.1, ActionSpeakString (sMessage3, TALKVOLUME_TALK)));
    AssignCommand (oPC,DelayCommand(16.7, ActionSpeakString (sMessage4, TALKVOLUME_TALK)));
}

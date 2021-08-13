void main()
{
object oPC = OBJECT_SELF;

 AssignCommand(oPC, ActionSpeakString("Do the Funky Chicken!!"));
 DelayCommand(1.0,ActionDoCommand(PlaySound("as_cv_lute1b")));
 DelayCommand(4.0,ActionDoCommand(PlaySound("as_cv_lute1b")));
 DelayCommand(7.0,ActionDoCommand(PlaySound("as_cv_lute1b")));
 DelayCommand(10.0,ActionDoCommand(PlaySound("as_cv_lute1b")));
 DelayCommand(13.0,ActionDoCommand(PlaySound("as_cv_lute1b")));
 DelayCommand(1.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE2, 1.0, 1.0f)));
 DelayCommand(2.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(3.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE2, 1.0, 1.0f)));
 DelayCommand(4.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(5.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 1.0f)));
 DelayCommand(6.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(7.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 1.0f)));
 DelayCommand(8.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(9.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE2, 1.0, 1.0f)));
 DelayCommand(10.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(11.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE2, 1.0, 1.0f)));
 DelayCommand(12.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(13.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 1.0f)));
 DelayCommand(14.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(15.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 1.0f)));
 DelayCommand(16.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0f)));
 DelayCommand(17.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(19.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 1.0f)));
 DelayCommand(20.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE, 1.0, 1.0f)));
 DelayCommand(21.0, AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_CHEER)));





}

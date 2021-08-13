/*  Created by Summit Silverspeed 07/12/04    */

void main()
{
 object oPC;
oPC = GetItemActivator();
 object oTarget;
oTarget = GetItemActivatedTarget();

 effect eVFX1   = EffectVisualEffect(135);
effect eVFX2   = EffectVisualEffect(VFX_IMP_HARM);
effect eVFX3   = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
effect eVFX4   = EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE);
effect eDMG    = EffectDeath();

SetCutsceneMode(oTarget, TRUE);

BlackScreen(oTarget);

SetCameraMode(oTarget, CAMERA_MODE_CHASE_CAMERA);

DelayCommand (2.0,FadeFromBlack(oTarget, FADE_SPEED_SLOW));

DelayCommand (2.5,AssignCommand(oTarget, ActionMoveToObject(oPC)));

DelayCommand (7.0,AssignCommand(oTarget, ActionSpeakString("I am your Slave. Do with me as you please...")));

DelayCommand (8.0,AssignCommand(oTarget,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0f, 18.0f)));

DelayCommand(27.0, AssignCommand(oTarget, PlayVoiceChat(VOICE_CHAT_GOODBYE)));

DelayCommand(27.0, AssignCommand(oTarget, PlayAnimation(ANIMATION_FIREFORGET_GREETING)));

DelayCommand(30.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,eVFX1,oTarget));

DelayCommand(30.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,eVFX2,oTarget));

DelayCommand(30.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,eVFX3,oTarget));

DelayCommand(30.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,eVFX4,oTarget));

DelayCommand (30.4,SetCutsceneMode(oTarget, FALSE));

DelayCommand(30.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,eDMG,oTarget));

}

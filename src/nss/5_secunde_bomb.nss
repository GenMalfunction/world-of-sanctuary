//:://////////////////////////////////////////////
//:: BOMB settings 5 secunde
//:: BY: BUTCHA
//:://////////////////////////////////////////////
void main()
{
effect V1 = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
DelayCommand(0.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,V1, OBJECT_SELF,5.0));
DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,V1, OBJECT_SELF,5.0));
DelayCommand(0.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,V1, OBJECT_SELF,5.0));
DelayCommand(0.0,AssignCommand(OBJECT_SELF,SpeakString("5",TALKVOLUME_TALK)));
DelayCommand(1.0,AssignCommand(OBJECT_SELF,SpeakString("4",TALKVOLUME_TALK)));
DelayCommand(2.0,AssignCommand(OBJECT_SELF,SpeakString("3",TALKVOLUME_TALK)));
DelayCommand(3.0,AssignCommand(OBJECT_SELF,SpeakString("2",TALKVOLUME_TALK)));
DelayCommand(4.0,AssignCommand(OBJECT_SELF,SpeakString("1",TALKVOLUME_TALK)));
DelayCommand(5.0,AssignCommand(OBJECT_SELF,SpeakString("0",TALKVOLUME_TALK)));
DelayCommand(5.0,ExecuteScript("_thimebomb_boom_", OBJECT_SELF));
}

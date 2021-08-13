void main()
{
object oPC = OBJECT_SELF;
effect VFX1 = EffectVisualEffect(137);
object oThrone = CreateObject(OBJECT_TYPE_PLACEABLE, "throne", GetLocation(oPC),TRUE);
string sString = GetName(oPC);
//DelayCommand(1.5,AssignCommand(oPC, ActionSit(oThrone)));
DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oThrone,2.0f));
//DelayCommand(1.5,AssignCommand(oThrone, SpeakString("Wellcome " +sString ,TALKVOLUME_TALK)));
}


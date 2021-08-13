/*
called: OnSpawn
This script sets up an NPC to listen to anything said by a PC.
*/

void main()
{
  //using "**" listens to all text
  //the 777 is arbitrary and can be any number you like
  SetListenPattern(OBJECT_SELF, "**", 777);
  SetListening(OBJECT_SELF, TRUE);          //be sure NPC is listening
  if (GetName(OBJECT_SELF) == "Super Caster") {
      ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS)), OBJECT_SELF);
  }

  ExecuteScript("nw_c2_default9", OBJECT_SELF);
}

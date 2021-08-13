

void main()
{

   object oCreature = GetEnteringObject();

   //Make sure the opener is a PC
   if (GetIsObjectValid(oCreature) == TRUE && GetIsPC(oCreature) == TRUE)
   {
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCurse(), oCreature, 90.0f);
    SendMessageToPC(oCreature, "The very air you breath in these catacombs is cursed.");
   }
}

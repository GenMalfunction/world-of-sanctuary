void main()
{
    object oPC = GetEnteringObject();
    int nOnce = GetLocalInt(oPC, "TrigMess1");
   if (nOnce == FALSE)
   {
    FloatingTextStringOnCreature("This cave is a bit musty", oPC);
    SetLocalInt(oPC, "TrigMess1", TRUE);
   }
}



void main()
{

object oPC = GetPCSpeaker();

AssignCommand(oPC, TakeGoldFromCreature(100000, oPC, TRUE));

CreateItemOnObject("stablekey1", oPC);

}


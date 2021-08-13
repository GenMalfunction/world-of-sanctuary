void main()
{

object oPC = GetPCSpeaker();

AssignCommand(oPC, TakeGoldFromCreature(1000000, oPC, TRUE));

CreateItemOnObject("stablekey2", oPC);

}


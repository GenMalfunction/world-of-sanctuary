void main()
{

object oPC = GetPCSpeaker();

CreateItemOnObject("entsteig", oPC);

SendMessageToPC(oPC, "You have joined the Entsteig paladin guild");

}


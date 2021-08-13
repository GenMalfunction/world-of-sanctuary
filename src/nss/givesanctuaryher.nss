void main()
{

object oPC = GetPCSpeaker();

CreateItemOnObject("sanctuaryhero", oPC);

SendMessageToPC(oPC, "You have joined the Sanctuary Hero's guild");

}


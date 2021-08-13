void main()
{

object oPC = GetPCSpeaker();

CreateItemOnObject("ennead", oPC);

SendMessageToPC(oPC, "You have joined the Ennead fighters guild");

}


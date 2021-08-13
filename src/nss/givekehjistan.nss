void main()
{

object oPC = GetPCSpeaker();

CreateItemOnObject("kehjistan", oPC);

SendMessageToPC(oPC, "You have joined the Kehjistan Mage guild");

}


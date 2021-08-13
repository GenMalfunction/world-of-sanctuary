void main()
{

object oPC = GetPCSpeaker();

CreateItemOnObject("ammuit", oPC);

SendMessageToPC(oPC, "You have joined the Ammuit barb guild");

}


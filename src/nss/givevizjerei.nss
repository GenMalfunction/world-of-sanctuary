void main()
{

object oPC = GetPCSpeaker();

CreateItemOnObject("vizjerei", oPC);

SendMessageToPC(oPC, "You have joined the Vizjerei barbarian guild");

}


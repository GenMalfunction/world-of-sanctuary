void main()
{

object oPC = GetPCSpeaker();

CreateItemOnObject("westmarch", oPC);

SendMessageToPC(oPC, "You have joined the Westmarch Ranger/Druid guild");

}


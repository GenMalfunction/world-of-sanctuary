//Required for GetCharacterLevel function
#include "NW_I0_GENERIC"

void main()
{
    //Call the player using the script
    object oPC = GetLastUsedBy();
    //object oPC = GetPCSpeaker();


    object oPlayer = GetFirstPC();

    //Run a loop for as many players that are in the game
    while (oPlayer != OBJECT_INVALID)
        {
        //Set and attach player's character level to a variable name
        int nLevel = GetCharacterLevel(oPlayer);
        //Set a variable name for the player's location
        location lPlayerFind = GetLocation(oPlayer);
        //Attach player's current location to variable name
        object oArea = GetAreaFromLocation(lPlayerFind);
        //Make these values clean and usable as text 'strings' in the SendMessageToPC function
        //as well as setting character and player names to variables
        string sLevel = IntToString(nLevel);
        string sArea = GetName(oArea);
        string sCharName = GetName(oPlayer);
        string sLoginName = GetPCPlayerName(oPlayer);

        //Post information on current player in the log of the person calling this script
        SendMessageToPC(oPC,"Lvl " + sLevel + " - " + sArea + ": " + sCharName + "(" + sLoginName +")");
        //Find next player on game list and set as oPlayer for next loop
        oPlayer = GetNextPC();
        }
}

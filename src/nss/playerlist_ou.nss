/*********************************************************
Player Information Script - playerlist_ou

This is my first script created from scratch, it sends
Charater Level - Location: Name(and Login Name) information
to the script caller's combat log. It's purpose is for getting
player characters together more easily in Persistant Worlds.

Unmodified, This script is called on the OnUsed slot of any
usable object. However, included are the functions for calling it
from a conversation. To enable this script to be called from a
conversation, simply comment[put "//" at the beginning of]line 28
and uncomment[erase the "//" at the beginning of]line 29.
Save the script as playerlist_conv or any other name
you want and you're good to go. All you have to do is then
choose the renamed script in the OWNER'S Actions Taken
slot in a conversation file.

-McKillynu
*********************************************************/

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

//------------------
//sc_door_sendpc
//Author: Rick Martin
//Version: 1.0
//------------------
// This script sends the pc to the new tag.
void main()
{
//Grab the PC.
object oPC = GetLastUsedBy();

//Set the name of the Destination
string sDestinationName =  "WP_ToFalseCrypt";
string sDoorName = GetTag(OBJECT_SELF);
int iLength = GetStringLength(sDoorName);
//string sUnique = GetSubString(sDoorName, 0, iLength - 3);
//sDestinationName =  sDestinationName + sUnique;

//Debugging only
//AssignCommand(OBJECT_SELF, ActionSpeakString(sDestinationName));

//Grab the Destination.
location loc = GetLocation(GetObjectByTag(sDestinationName));

//Jump the PC to the new location.
AssignCommand(oPC, JumpToLocation(loc));

//Work on the NPC party members.
int n = 1;
while (n < 6)
    {
    object oAssociate = GetAssociate(n, oPC);
    if (oAssociate != OBJECT_INVALID)
        {
        AssignCommand(oAssociate, JumpToLocation(loc));
        }
    n++;
    }
}

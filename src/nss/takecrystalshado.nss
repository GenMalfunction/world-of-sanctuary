#include "nw_i0_tool"

void main()
{
// Remove items from the player's inventory
object oItemToTake;
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "crystalshadow");
if(GetIsObjectValid(oItemToTake) != 0)
DestroyObject(oItemToTake);

}

#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp63"))
{
CreateItemOnObject("wayp63", oPlayer, 1);
}

}



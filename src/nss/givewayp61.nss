#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp61"))
{
CreateItemOnObject("wayp61", oPlayer, 1);
}

}



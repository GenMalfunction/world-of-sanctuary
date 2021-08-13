#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp52"))
{
CreateItemOnObject("wayp52", oPlayer, 1);
}

}



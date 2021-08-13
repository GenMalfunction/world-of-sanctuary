#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp43"))
{
CreateItemOnObject("wayp43", oPlayer, 1);
}

}



#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp57"))
{
CreateItemOnObject("wayp57", oPlayer, 1);
}

}



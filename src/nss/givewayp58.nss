#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp58"))
{
CreateItemOnObject("wayp58", oPlayer, 1);
}

}



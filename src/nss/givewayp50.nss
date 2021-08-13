#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp50"))
{
CreateItemOnObject("wayp50", oPlayer, 1);
}

}



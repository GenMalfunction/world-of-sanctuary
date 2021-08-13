#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp62"))
{
CreateItemOnObject("wayp62", oPlayer, 1);
}

}



#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp59"))
{
CreateItemOnObject("wayp59", oPlayer, 1);
}

}



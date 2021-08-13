#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp47"))
{
CreateItemOnObject("wayp47", oPlayer, 1);
}

}



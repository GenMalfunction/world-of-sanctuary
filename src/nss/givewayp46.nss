#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp46"))
{
CreateItemOnObject("wayp46", oPlayer, 1);
}

}



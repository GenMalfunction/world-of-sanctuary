#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp64"))
{
CreateItemOnObject("wayp64", oPlayer, 1);
}

}



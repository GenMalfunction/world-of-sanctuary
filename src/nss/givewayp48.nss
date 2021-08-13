#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp48"))
{
CreateItemOnObject("wayp48", oPlayer, 1);
}

}



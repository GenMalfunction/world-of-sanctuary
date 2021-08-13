#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp45"))
{
CreateItemOnObject("wayp45", oPlayer, 1);
}

}



#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp60"))
{
CreateItemOnObject("wayp60", oPlayer, 1);
}

}



#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp56"))
{
CreateItemOnObject("wayp56", oPlayer, 1);
}

}



#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp28"))
{
CreateItemOnObject("wayp28", oPlayer, 1);
}

}


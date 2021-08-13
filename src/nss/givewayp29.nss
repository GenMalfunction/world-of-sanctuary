#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp29"))
{
CreateItemOnObject("wayp29", oPlayer, 1);
}

}


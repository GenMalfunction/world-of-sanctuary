#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp23"))
{
CreateItemOnObject("wayp23", oPlayer, 1);
}

}


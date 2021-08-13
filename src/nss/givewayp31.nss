#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp31"))
{
CreateItemOnObject("wayp31", oPlayer, 1);
}

}


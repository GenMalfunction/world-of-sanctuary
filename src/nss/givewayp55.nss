#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp55"))
{
CreateItemOnObject("wayp55", oPlayer, 1);
}

}



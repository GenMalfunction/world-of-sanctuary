#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp65"))
{
CreateItemOnObject("wayp65", oPlayer, 1);
}

}



#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp22"))
{
CreateItemOnObject("wayp22", oPlayer, 1);
}

}


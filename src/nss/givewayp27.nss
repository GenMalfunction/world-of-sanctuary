#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp27"))
{
CreateItemOnObject("wayp27", oPlayer, 1);
}

}


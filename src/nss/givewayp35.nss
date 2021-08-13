#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp35"))
{
CreateItemOnObject("wayp35", oPlayer, 1);
}

}


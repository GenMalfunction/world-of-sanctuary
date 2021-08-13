#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp40"))
{
CreateItemOnObject("wayp40", oPlayer, 1);
}

}


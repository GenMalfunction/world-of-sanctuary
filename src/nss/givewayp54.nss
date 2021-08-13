#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp54"))
{
CreateItemOnObject("wayp54", oPlayer, 1);
}

}



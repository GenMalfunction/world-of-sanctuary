#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp14"))
{
CreateItemOnObject("wayp14", oPlayer, 1);
}


}

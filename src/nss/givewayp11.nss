#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp11"))
{
CreateItemOnObject("wayp11", oPlayer, 1);
}


}

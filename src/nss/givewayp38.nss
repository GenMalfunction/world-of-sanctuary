#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp38"))
{
CreateItemOnObject("wayp38", oPlayer, 1);
}

}


#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp30"))
{
CreateItemOnObject("wayp30", oPlayer, 1);
}

}


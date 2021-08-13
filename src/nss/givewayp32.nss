#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp32"))
{
CreateItemOnObject("wayp32", oPlayer, 1);
}

}


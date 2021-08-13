#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp53"))
{
CreateItemOnObject("wayp53", oPlayer, 1);
}

}



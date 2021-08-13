#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp49"))
{
CreateItemOnObject("wayp49", oPlayer, 1);
}

}



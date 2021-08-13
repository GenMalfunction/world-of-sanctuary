#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp51"))
{
CreateItemOnObject("wayp51", oPlayer, 1);
}

}



#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp37"))
{
CreateItemOnObject("wayp37", oPlayer, 1);
}

}


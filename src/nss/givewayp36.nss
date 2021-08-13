#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp36"))
{
CreateItemOnObject("wayp36", oPlayer, 1);
}

}


#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp24"))
{
CreateItemOnObject("wayp24", oPlayer, 1);
}

}


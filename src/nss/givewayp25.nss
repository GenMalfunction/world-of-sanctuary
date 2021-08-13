#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp25"))
{
CreateItemOnObject("wayp25", oPlayer, 1);
}

}


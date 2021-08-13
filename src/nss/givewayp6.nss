#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp6"))
{
CreateItemOnObject("wayp6", oPlayer, 1);
}


}

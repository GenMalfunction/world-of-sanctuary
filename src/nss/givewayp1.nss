#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp1"))
{
CreateItemOnObject("wayp1", oPlayer, 1);
}


}

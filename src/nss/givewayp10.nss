#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp10"))
{
CreateItemOnObject("wayp10", oPlayer, 1);
}


}

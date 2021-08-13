#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp2"))
{
CreateItemOnObject("wayp2", oPlayer, 1);
}


}

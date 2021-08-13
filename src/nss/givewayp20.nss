#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp20"))
{
CreateItemOnObject("wayp20", oPlayer, 1);
}


}

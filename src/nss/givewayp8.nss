#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp8"))
{
CreateItemOnObject("wayp8", oPlayer, 1);
}


}

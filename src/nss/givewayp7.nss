#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp7"))
{
CreateItemOnObject("wayp7", oPlayer, 1);
}


}

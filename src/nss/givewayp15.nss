#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp15"))
{
CreateItemOnObject("wayp15", oPlayer, 1);
}


}

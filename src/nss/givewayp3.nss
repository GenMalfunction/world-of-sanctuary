#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp3"))
{
CreateItemOnObject("wayp3", oPlayer, 1);
}


}

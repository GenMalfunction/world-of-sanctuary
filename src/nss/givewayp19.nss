#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp19"))
{
CreateItemOnObject("wayp19", oPlayer, 1);
}


}

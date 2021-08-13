#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp4"))
{
CreateItemOnObject("wayp4", oPlayer, 1);
}


}

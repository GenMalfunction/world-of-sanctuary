#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp17"))
{
CreateItemOnObject("wayp17", oPlayer, 1);
}


}

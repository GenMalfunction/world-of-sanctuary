#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp5"))
{
CreateItemOnObject("wayp5", oPlayer, 1);
}


}

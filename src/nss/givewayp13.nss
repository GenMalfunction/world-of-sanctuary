#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp13"))
{
CreateItemOnObject("wayp13", oPlayer, 1);
}


}

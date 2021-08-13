#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp12"))
{
CreateItemOnObject("wayp12", oPlayer, 1);
}


}

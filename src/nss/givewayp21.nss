#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp21"))
{
CreateItemOnObject("wayp21", oPlayer, 1);
}


}

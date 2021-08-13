#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp16"))
{
CreateItemOnObject("wayp16", oPlayer, 1);
}


}

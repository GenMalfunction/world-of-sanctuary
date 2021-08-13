#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp34"))
{
CreateItemOnObject("wayp34", oPlayer, 1);
}

}


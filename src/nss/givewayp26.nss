#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp26"))
{
CreateItemOnObject("wayp26", oPlayer, 1);
}

}


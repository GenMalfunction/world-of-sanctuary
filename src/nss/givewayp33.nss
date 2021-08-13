#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp33"))
{
CreateItemOnObject("wayp33", oPlayer, 1);
}

}


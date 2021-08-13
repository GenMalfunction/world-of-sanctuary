#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

if(!HasItem(oPlayer, "wayp41"))
{
CreateItemOnObject("wayp41", oPlayer, 1);
}

}


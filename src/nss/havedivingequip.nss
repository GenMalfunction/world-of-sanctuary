#include "nw_i0_tool"

int StartingConditional()
{
    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "divinghelm"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "divingsuit"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "divingflippers"))
        return FALSE;

    return TRUE;
}

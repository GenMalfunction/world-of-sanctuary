#include "nw_i0_tool"

int StartingConditional()
{
    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "vic1"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "vic2"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "vic3"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "vic4"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "vic5"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "vic6"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "vic7"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "vic8"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "vic9"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "vic10"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "vic11"))
        return FALSE;

    return TRUE;
}

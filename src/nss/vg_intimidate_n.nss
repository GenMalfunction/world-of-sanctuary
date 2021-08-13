#include "nw_i0_tool"
int StartingConditional()
{
    // Perform intimidate skill check
    if(!(AutoDC(DC_MEDIUM, SKILL_INTIMIDATE, GetPCSpeaker())))
        return FALSE;

    return TRUE;
}

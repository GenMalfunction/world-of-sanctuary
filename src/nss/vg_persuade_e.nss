#include "nw_i0_tool"
int StartingConditional()
{
    // Perform persuade skill check
    if(!(AutoDC(DC_EASY, SKILL_PERSUADE, GetPCSpeaker())))
        return FALSE;

    return TRUE;
}

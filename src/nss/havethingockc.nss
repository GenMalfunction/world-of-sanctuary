#include "nw_i0_plot"
int StartingConditional()
{
    string sThingOfGuild = "CrazyKillerClan";
    int nNumBook = 1;
    if(GetNumItems(GetPCSpeaker(),sThingOfGuild) == nNumBook)
                    return TRUE;
    return FALSE;
}


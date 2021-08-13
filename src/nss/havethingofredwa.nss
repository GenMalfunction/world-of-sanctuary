#include "nw_i0_plot"
int StartingConditional()
{
    string sThingOfGuild = "RedWarrior";
    int nNumBook = 1;
    if(GetNumItems(GetPCSpeaker(),sThingOfGuild) == nNumBook)
                    return TRUE;
    return FALSE;
}


#include "nw_i0_plot"
int StartingConditional()
{
    string sTheRing = "wayp21";
    int nNumBook = 1;
    if(GetNumItems(GetPCSpeaker(),sTheRing) == nNumBook)
                    return TRUE;
    return FALSE;
}


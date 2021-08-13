// returns true if player has dm access
// if you change this you must rebuild the module

int isdm(object PC)
{
    int s, dcnt = GetLocalInt(GetModule(), "dcnt");
    string name = GetPCPlayerName(PC);
    for(s=0; s<dcnt; s++) {
        if (name == GetLocalString(GetModule(), "dname"+IntToString(s))) {
            return TRUE;
        }
    }
    return FALSE;
}

#include "lilarcor_include"
void CleanTrash(object oTrash, object oWho)
{
    if (oTrash != OBJECT_INVALID) {
        object oPossessor = GetItemPossessor(oTrash);
        if (GetIsPC(oPossessor)==FALSE && GetPCPlayerName(oPossessor)=="") {
            if (GetHasInventory(oPossessor) == TRUE || VectorToAngle(GetPosition(oTrash)) != 0.0) {
                if (GetStringLeft(GetTag(oPossessor), 3) != "NT_") DestroyObject(oTrash);
            }
        }
    }
}

void main()
{
    LilarcorUnAcquired();
    object oWho = GetModuleItemLostBy();
    object oItem = GetModuleItemLost();
    SetLocalInt(oItem, "stolen", GetStolenFlag(oItem));
    DelayCommand(300.0, CleanTrash(oItem, oWho));
}



#include "lilarcor_include"
void main()
{
    LilarcorAcquired();
    object oItem = GetModuleItemAcquired();
    object oThief = GetItemPossessor(oItem);
    object oOwner = GetModuleItemAcquiredFrom();
    if (GetStolenFlag(oItem) == TRUE && oOwner != OBJECT_INVALID) {
        int sel = d10();
        string nam = GetName(oOwner);
        if (GetItemPossessor(oOwner) != OBJECT_INVALID) {
            nam = GetName(GetItemPossessor(oOwner));
        }
        string msg = "Umm " + nam + ", you seem to have dropped something, here have it back";
        if (sel > 8) {
            msg = "Careful there you clumsy oaf, you nearly dropped this on my foot " + nam;
        } else if (sel > 7) {
            msg = "Psst. " + nam + ", ya dropped this";
        } else if (sel > 6) {
            msg = "You might want to get that hole on your pack fixed "  + nam;
        } else if (sel > 5) {
            msg = "You need to be more careful with your stuff "  + nam;
        } else if (sel > 3) {
            msg = "Hey " + nam + ", this looks like it might be yours";
        }
        AssignCommand(oThief, SpeakString(msg));
        SetStolenFlag(oItem, GetLocalInt(oItem, "stolen"));
        CopyItem(oItem, oOwner);
        DestroyObject(oItem);
    }
}

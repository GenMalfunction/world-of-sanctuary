#include "nw_i0_henchman"
void main()
{
 SetFormerMaster(GetPCSpeaker(), OBJECT_SELF);
 RemoveHenchman(GetPCSpeaker());
 // Set so chickens can not be re-hired
 SetLocalInt(GetPCSpeaker(), "chickdismiss", 1);
 ClearAllActions();
}

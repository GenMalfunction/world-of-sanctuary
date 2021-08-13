
#include "CU_FUNCTIONS"
void main()
{
    int nOnce = GetLocalInt(GetLastUnlocked(),"un"+GetTag(OBJECT_SELF));
    if (nOnce==FALSE)
    {
    GiveXPToCreature (GetLastUnlocked(), 50);
    FloatingTextStringOnCreature("XP Gained - use of skill",GetLastUnlocked());
    AllParty("un"+GetTag(OBJECT_SELF),GetLastUnlocked(),TRUE);  //Set so no one else in the party (and the opener) can get this xp again.
    }
}

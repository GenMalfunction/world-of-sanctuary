#include "NW_I0_GENERIC"
void main()
{
  object oCreature = GetFirstObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(OBJECT_SELF));
  while( oCreature != OBJECT_INVALID )
  {
    if( GetFactionEqual(OBJECT_SELF, oCreature) )
    {
      AdjustReputation(GetLastUnlocked(), OBJECT_SELF, -50);
      AssignCommand(oCreature, DetermineCombatRound());
      oCreature = OBJECT_INVALID; // only needs to be done once
    } else {
      oCreature = GetNextObjectInShape(SHAPE_SPHERE, 20.0, GetLocation(OBJECT_SELF));
    }
  }

//VARIABLE DECLARATIONS----------------------------

    object oPC = GetLastUnlocked();
    object oItem = GetFirstItemInInventory(oPC);
    string sKey = GetTrapKeyTag(OBJECT_SELF);
    object oKey = GetObjectByTag(sKey);
    int nDC = GetLockUnlockDC(OBJECT_SELF);
    int nKeyAssociated = TRUE;
    int nAlreadyUnlocked = FALSE;

//Regardless of whether lock was just picked or key was used,
//localint "AlreadyUnlocked" will be set to indicate unlocking.

    SetLocalInt(OBJECT_SELF,"AlreadyUnlocked",TRUE);

//if oKey is OBJECT_INVALID then no key is associated with object

    if (oKey == OBJECT_INVALID)
    {
        nKeyAssociated = FALSE;
    }

//If a key is associated with the door, check oPC's inventory for the key
//If oPC has key, return from script

    while (oItem != OBJECT_INVALID && nKeyAssociated == TRUE)
    {
        if (oItem == oKey)
        {
            return;
        }
        oItem = GetNextItemInInventory(oPC);
    }
    int nExp = nDC * 1 ;//5 exp per 1 DC, adjust to your liking.
    GiveXPToCreature(oPC,nExp);
    DelayCommand(290.0, SetLocked( OBJECT_SELF, 1));
}

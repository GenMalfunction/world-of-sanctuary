void main()
{
    object oPC = GetLastAttacker();
    object oFacMember = OBJECT_SELF;
    int PCCurrFac;
      AdjustReputation(oPC, oFacMember, 100);
      AdjustReputation(oPC, oFacMember, -50);
}

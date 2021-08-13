void main()
{
    object oPC;
    int nSkill;
    int nDC = GetTrapDetectDC(OBJECT_SELF);
    if (GetIsTrapped(OBJECT_SELF))
    {
        oPC = GetFirstObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(OBJECT_SELF), TRUE);
        while (oPC != OBJECT_INVALID)
        {
            if (GetIsPC(oPC))
            {
                nSkill = GetSkillRank(SKILL_SEARCH, oPC);
                if ((d20() + nSkill) >= nDC)
                    SetTrapDetectedBy(OBJECT_SELF, oPC);
            }
            oPC = GetNextObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(OBJECT_SELF), TRUE);
        }
    }
}

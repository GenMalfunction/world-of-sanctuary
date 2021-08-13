// Created By Scarface
void main()
{
    object oPC = GetPCSpeaker();
    effect eEffect = GetFirstEffect(oPC);
    int iType, iSub;

    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
}

// Created By Scarface
void main()
{
    object oPC = GetPCSpeaker();
    effect eEffect, eVisEyes;
    int iGender = GetGender(oPC), iSub, iType;

    switch(GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_DWARF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_DWARF_FEMALE);
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_ELF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_ELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_GNOME_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_GNOME_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFELF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFLING_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFLING_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFORC_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFORC_FEMALE);
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HUMAN_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HUMAN_FEMALE);
            break;
        }
    }
    eEffect = GetFirstEffect(oPC);
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
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes), oPC);
}

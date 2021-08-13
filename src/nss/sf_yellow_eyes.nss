// Created By Scarface
void main()
{
    object oPC = GetPCSpeaker();
    effect eVisEyes1, eVisEyes2, eLink, eEffect;
    int iGender = GetGender(oPC), iType, iSub;

    switch(GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE)
            {
                eVisEyes1 = EffectVisualEffect(VFX_EYES_GREEN_DWARF_MALE);
                eVisEyes2 = EffectVisualEffect(VFX_EYES_RED_FLAME_DWARF_MALE);
            }
            else
            {
                eVisEyes1 = EffectVisualEffect(VFX_EYES_GREEN_DWARF_FEMALE);
                eVisEyes2 = EffectVisualEffect(VFX_EYES_RED_FLAME_DWARF_FEMALE);
            }
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE)
            {
                eVisEyes1 = EffectVisualEffect(VFX_EYES_GREEN_ELF_MALE);
                eVisEyes2 = EffectVisualEffect(VFX_EYES_RED_FLAME_ELF_MALE);
            }
            else
            {
                eVisEyes1 = EffectVisualEffect(VFX_EYES_GREEN_ELF_FEMALE);
                eVisEyes2 = EffectVisualEffect(VFX_EYES_RED_FLAME_ELF_FEMALE);
            }
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE)
            {
                eVisEyes1 = EffectVisualEffect(VFX_EYES_GREEN_GNOME_MALE);
                eVisEyes2 = EffectVisualEffect(VFX_EYES_RED_FLAME_GNOME_MALE);
            }
            else
            {
                eVisEyes1 = EffectVisualEffect(VFX_EYES_GREEN_GNOME_FEMALE);
                eVisEyes2 = EffectVisualEffect(VFX_EYES_RED_FLAME_GNOME_FEMALE);
            }
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE)
            {
                eVisEyes1 = EffectVisualEffect(VFX_EYES_GREEN_HALFELF_MALE);
                eVisEyes2 = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFELF_MALE);
            }
            else
            {
                eVisEyes1 = EffectVisualEffect(VFX_EYES_GREEN_HALFELF_FEMALE);
                eVisEyes2 = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFELF_FEMALE);
            }
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE)
            {
                eVisEyes1 = EffectVisualEffect(VFX_EYES_GREEN_HALFLING_MALE);
                eVisEyes2 = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFLING_MALE);
            }
            else
            {
                eVisEyes1 = EffectVisualEffect(VFX_EYES_GREEN_HALFLING_FEMALE);
                eVisEyes2 = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFLING_FEMALE);
            }
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE)
            {
                eVisEyes1 = EffectVisualEffect(VFX_EYES_GREEN_HALFORC_MALE);
                eVisEyes2 = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFORC_MALE);
            }
            else
            {
                eVisEyes1 = EffectVisualEffect(VFX_EYES_GREEN_HALFORC_FEMALE);
                eVisEyes2 = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFORC_FEMALE);
            }
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE)
            {
                eVisEyes1 = EffectVisualEffect(VFX_EYES_GREEN_HUMAN_MALE);
                eVisEyes2 = EffectVisualEffect(VFX_EYES_RED_FLAME_HUMAN_MALE);
            }
            else
            {
                eVisEyes1 = EffectVisualEffect(VFX_EYES_GREEN_HUMAN_FEMALE);
                eVisEyes2 = EffectVisualEffect(VFX_EYES_RED_FLAME_HUMAN_FEMALE);
            }
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
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes1), oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes2), oPC);
}

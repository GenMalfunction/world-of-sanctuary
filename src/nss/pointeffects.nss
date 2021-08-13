void main()
{

    object oPC = GetFirstPC();
    object oMostMonsterKills;
    object oMostPCKills;
    object oMostPCDeaths;

    effect eEffect;

    int iMonsterKills;
    int iMaxMonsterKills = 0;
    int iPCKills;
    int iMaxPCKills = 0;
    int iPCDeaths;
    int iMaxPCDeaths = 0;

    int nMonsterFlagEffect = VFX_DUR_PROTECTION_GOOD_MINOR;
    int nPCFlagEffect = VFX_DUR_PROTECTION_EVIL_MINOR;
    int nMostDeaths = VFX_DUR_MIND_AFFECTING_FEAR;

    effect eMonsterFlag = SupernaturalEffect(EffectVisualEffect(nMonsterFlagEffect));
    effect ePCFlag = SupernaturalEffect(EffectVisualEffect(nPCFlagEffect));
    effect eMostDeaths = SupernaturalEffect(EffectVisualEffect(nMostDeaths));

    while (oPC != OBJECT_INVALID) {
        iMonsterKills = GetLocalInt (oPC,"monster");
        if (iMonsterKills > iMaxMonsterKills) {
            oMostMonsterKills = oPC;
            iMaxMonsterKills = iMonsterKills;
        }

        iPCKills = GetLocalInt (oPC,"killed");
        if (iPCKills > iMaxPCKills) {
            oMostPCKills = oPC;
            iMaxPCKills = iPCKills;
        }

        iPCDeaths = GetLocalInt (oPC,"died");
        if (iPCDeaths > iMaxPCDeaths) {
            oMostPCDeaths = oPC;
            iMaxPCDeaths = iPCDeaths;
        }

        eEffect = GetFirstEffect(oPC);
        while ( GetIsEffectValid(eEffect) == TRUE ) {
           if ( GetEffectSubType(eEffect) == SUBTYPE_SUPERNATURAL) RemoveEffect(oPC,eEffect);
           eEffect = GetNextEffect(oPC);
        }
        oPC = GetNextPC();
    }

    ApplyEffectToObject (DURATION_TYPE_PERMANENT, eMonsterFlag, oMostMonsterKills);
    ApplyEffectToObject (DURATION_TYPE_PERMANENT, ePCFlag, oMostPCKills);
    ApplyEffectToObject (DURATION_TYPE_PERMANENT, eMostDeaths, oMostPCDeaths);

}


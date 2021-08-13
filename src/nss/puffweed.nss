location GetLocationAboveAndInFrontOf(object oPC, float fDist, float fHeight)
{
    float fDistance = -fDist;
    object oTarget = (oPC);
    object oArea = GetArea(oTarget);
    vector vPosition = GetPosition(oTarget);
    vPosition.z += fHeight;
    float fOrientation = GetFacing(oTarget);
    vector vNewPos = AngleToVector(fOrientation);
    float vZ = vPosition.z;
    float vX = vPosition.x - fDistance * vNewPos.x;
    float vY = vPosition.y - fDistance * vNewPos.y;
    fOrientation = GetFacing(oTarget);
    vX = vPosition.x - fDistance * vNewPos.x;
    vY = vPosition.y - fDistance * vNewPos.y;
    vNewPos = AngleToVector(fOrientation);
    vZ = vPosition.z;
    vNewPos = Vector(vX, vY, vZ);
    return Location(oArea, vNewPos, fOrientation);
}


void main()
{
object oItem = GetItemActivated();
    object oActivator = GetItemActivator();

if(GetTag(oItem) == "PUFFWEED")
   {
        // CONFIGURE "HIGH" EFFECTS
        int FORTITUDE_CHECK_DC      = 20;
        int DURATION_REAL_TIME_MINS = 2;
        int HP_HEAL                 = 1;
        int INT_DECREASE            = 1;
        int PERCENT_SLOW            = 1;


        AssignCommand(oActivator, ClearAllActions());

        float fDelay = 4.0;

        // Taking a puff animation
        //DelayCommand(fDelay - 2.0, AssignCommand(oActivator, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 0.2, 2.0)));
        //DelayCommand(fDelay + 7.0, AssignCommand(oActivator, ActionPlayAnimation(ANIMATION_LOOPING_LOOK_FAR, 0.2, 2.0)));
        //DelayCommand(fDelay + 16.0, AssignCommand(oActivator, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 0.2, 2.0)));

        // Smoke effect
        DelayCommand(fDelay, FloatingTextStringOnCreature("@", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" @", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("  @", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("   @", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("   @", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("  @", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" @", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("@", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("@", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("@", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" @", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("  @", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("   @", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("   @", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("  @", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" @", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("@", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" ", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" !", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" !", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("A ", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("E", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" Y", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("  H", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("   O", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("    ", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("   ", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" !", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("!", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("s", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("s", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" A", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("   ", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("    ", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("   s", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("   k", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("  c", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" i", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("K", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" ", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" ", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" ", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" ", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("d", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" e", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("  e", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("   W", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("    ", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("    ", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("  s", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("  '", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" t", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature(" i", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("m", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("m", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("u", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("S", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("", oActivator, TRUE));
        DelayCommand(fDelay, FloatingTextStringOnCreature("", oActivator, TRUE));

        // Try to blow smoke rings
        int numSmokeRings = 3;
        int smokeRingDC   = 5;

        int ringNum = 0;
        for (ringNum = 0; ringNum < numSmokeRings; ringNum++)
        {
            int smokeCheck = d20(1) + GetAbilityModifier(ABILITY_INTELLIGENCE, oActivator);

            string smokeChar = "";
            if (smokeCheck >= smokeRingDC)
            {
                smokeChar = "O";
            }
            else
            {
                smokeChar = "#";
                // Once failed, no more chances
                ringNum = numSmokeRings;
            }

            // Random drift
            if (d2(1) == 1)
            {
                smokeChar = " " + smokeChar;
            }
            DelayCommand(fDelay, FloatingTextStringOnCreature(smokeChar, oActivator, TRUE));

            // Interval between smoke rings
            if (ringNum < numSmokeRings)
            {
                DelayCommand(fDelay, FloatingTextStringOnCreature("", oActivator, TRUE));
                DelayCommand(fDelay, FloatingTextStringOnCreature("", oActivator, TRUE));
                DelayCommand(fDelay, FloatingTextStringOnCreature("", oActivator, TRUE));
            }
        float fHeight = 1.7;
    float fDistance = 0.1;
    // Set height based on race and gender
    if (GetGender(oActivator) == GENDER_MALE)
    {
        switch (GetRacialType(oActivator))
        {
            case RACIAL_TYPE_HUMAN:
            case RACIAL_TYPE_HALFELF:
                fHeight = 1.7;
                fDistance = 0.12;
                break;

            case RACIAL_TYPE_ELF:
                fHeight = 1.55;
                fDistance = 0.08;
                break;

            case RACIAL_TYPE_GNOME:
            case RACIAL_TYPE_HALFLING:
                fHeight = 1.15;
                fDistance = 0.12;
                break;

            case RACIAL_TYPE_DWARF:
                fHeight = 1.2;
                fDistance = 0.12;
                break;

            case RACIAL_TYPE_HALFORC:
                fHeight = 1.9;
                fDistance = 0.2;
                break;
        }
    }
    else
    {
        // FEMALES
        switch (GetRacialType(oActivator))
        {
            case RACIAL_TYPE_HUMAN:
            case RACIAL_TYPE_HALFELF:
                fHeight = 1.6;
                fDistance = 0.12;
                break;

            case RACIAL_TYPE_ELF:
                fHeight = 1.45;
                fDistance = 0.12;
                break;

            case RACIAL_TYPE_GNOME:
            case RACIAL_TYPE_HALFLING:
                fHeight = 1.1;
                fDistance = 0.075;
                break;

            case RACIAL_TYPE_DWARF:
                fHeight = 1.2;
                fDistance = 0.1;
                break;

            case RACIAL_TYPE_HALFORC:
                fHeight = 1.8;
                fDistance = 0.13;
                break;
        }
    }

    location lAboveHead = GetLocationAboveAndInFrontOf(oActivator, fDistance, fHeight);

    // glow red
    AssignCommand(oActivator, ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_LIGHT_RED_5), oActivator, 0.15)));

    // wait a moment
    AssignCommand(oActivator, ActionWait(3.0));

    // puff of smoke above and in front of head
    AssignCommand(oActivator, ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lAboveHead)));

    // if female, turn head to left
    if ((GetGender(oActivator) == GENDER_MALE) && (GetRacialType(oActivator) != RACIAL_TYPE_DWARF))
        AssignCommand(oActivator, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 1.0, 20.0));
        AssignCommand(oActivator, PlayVoiceChat(VOICE_CHAT_LAUGH));

    // funky effect
    //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectParalyze(), oActivator);
}
}
}

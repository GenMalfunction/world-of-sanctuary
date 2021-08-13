
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
    object oPC=OBJECT_SELF;
    string sEmote1 = "*Ahhhhhhhh*";
    string sEmote2 = "*Damn i needed that*";
    string sEmote3 = "*Cant beat a good Nicotine hit*";
    float fHeight = 1.7;
    float fDistance = 0.1;
    // Set height based on race and gender
    if (GetGender(oPC) == GENDER_MALE) {
        switch (GetRacialType(oPC)) {
            case RACIAL_TYPE_HUMAN:
            case RACIAL_TYPE_HALFELF: fHeight = 1.7; fDistance = 0.12; break;
            case RACIAL_TYPE_ELF: fHeight = 1.55; fDistance = 0.08; break;
            case RACIAL_TYPE_GNOME:
            case RACIAL_TYPE_HALFLING: fHeight = 1.15; fDistance = 0.12; break;
            case RACIAL_TYPE_DWARF: fHeight = 1.2; fDistance = 0.12; break;
            case RACIAL_TYPE_HALFORC: fHeight = 1.9; fDistance = 0.2; break;
        }
    } else {
        switch (GetRacialType(oPC)) {
            case RACIAL_TYPE_HUMAN:
            case RACIAL_TYPE_HALFELF: fHeight = 1.6; fDistance = 0.12; break;
            case RACIAL_TYPE_ELF: fHeight = 1.45; fDistance = 0.12; break;
            case RACIAL_TYPE_GNOME:
            case RACIAL_TYPE_HALFLING: fHeight = 1.1; fDistance = 0.075; break;
            case RACIAL_TYPE_DWARF: fHeight = 1.2; fDistance = 0.1; break;
            case RACIAL_TYPE_HALFORC: fHeight = 1.8; fDistance = 0.13; break;
        }
    }
    location lAboveHead = GetLocationAboveAndInFrontOf(oPC, fDistance, fHeight);
    // emotes
    switch (d3()) {
        case 1: AssignCommand(oPC, ActionSpeakString(sEmote1)); break;
        case 2: AssignCommand(oPC, ActionSpeakString(sEmote2)); break;
        case 3: AssignCommand(oPC, ActionSpeakString(sEmote3));break;
    }
    // glow red
    AssignCommand(oPC, ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_LIGHT_RED_5), oPC, 0.15)));
    // wait a moment
    AssignCommand(oPC, ActionWait(3.0));
    // puff of smoke above and in front of head
    AssignCommand(oPC, ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lAboveHead)));
    // if female, turn head to left
    if ((GetGender(oPC) == GENDER_FEMALE) && (GetRacialType(oPC) != RACIAL_TYPE_DWARF))
        AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 1.0, 5.0));
}

// For use on a PC that is "stuck" in a mounted appearance.
// Do not use on polymorphed (including shifted) characters.
void main()
{
    // How to initialize oPC depends on how you invoke this script.
    // I'll assume something along the lines of a DM targeting a PC with an ability or item.
    object oPC = GetSpellTargetObject();
    // Fix the appearance based on racial type.
    // Only the playable races need be listed.
    switch ( GetRacialType(oPC) )
    {
        case RACIAL_TYPE_DWARF:    SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_DWARF);    break;
        case RACIAL_TYPE_ELF:      SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_ELF);      break;
        case RACIAL_TYPE_GNOME:    SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_GNOME);    break;
        case RACIAL_TYPE_HALFELF:  SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_HALF_ELF); break;
        case RACIAL_TYPE_HALFLING: SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_HALFLING); break;
        case RACIAL_TYPE_HALFORC:  SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_HALF_ORC); break;
        case RACIAL_TYPE_HUMAN:    SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_HUMAN);    break;
    }
    // Remove any mounted phenotypes.
    switch ( GetPhenoType(oPC) )
    {
        case 3: // mounted, normal
        case 6: // jousting, normal
            SetPhenoType(PHENOTYPE_NORMAL, oPC);
            break;
        case 5: // mounted, large
        case 8: // jousting, large
            SetPhenoType(PHENOTYPE_BIG, oPC);
            break;
    }
    // Restore default footstep.
    SetFootstepType(FOOTSTEP_TYPE_DEFAULT, oPC);
    // Remove the tail.
    SetCreatureTailType(CREATURE_TAIL_TYPE_NONE, oPC);
}

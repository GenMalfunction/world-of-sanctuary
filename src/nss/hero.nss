void main()
{

object oPC = GetEnteringObject();

    if (GetItemPossessedBy(oPC, "wayp64")!= OBJECT_INVALID)
    {
    FloatingTextStringOnCreature("Your rank on the server is Sanctuary Holy Guardian", oPC);
    return;
    }
    if (GetItemPossessedBy(oPC, "wayp59")!= OBJECT_INVALID)
    {
    FloatingTextStringOnCreature("Your rank on the server is Sanctuary Guardian", oPC);
    return;
    }
    if (GetItemPossessedBy(oPC, "wayp58")!= OBJECT_INVALID)
    {
    FloatingTextStringOnCreature("Your rank on the server is Sanctuary Vanquisher", oPC);
    return;
    }
    if (GetItemPossessedBy(oPC, "wayp54")!= OBJECT_INVALID)
    {
    FloatingTextStringOnCreature("Your rank on the server is Sanctuary Hero", oPC);
    return;
    }
    if (GetItemPossessedBy(oPC, "wayp50")!= OBJECT_INVALID)
    {
    FloatingTextStringOnCreature("Your rank on the server is Slayer of Balial", oPC);
    return;
    }
    if (GetItemPossessedBy(oPC, "wayp49")!= OBJECT_INVALID)
    {
    FloatingTextStringOnCreature("Your rank on the server is Slayer of Azmodan", oPC);
    return;
    }
    if (GetItemPossessedBy(oPC, "wayp39")!= OBJECT_INVALID)
    {
    FloatingTextStringOnCreature("Your rank on the server is Slayer of Baal", oPC);
    return;
    }
    if (GetItemPossessedBy(oPC, "wayp30")!= OBJECT_INVALID)
    {
    FloatingTextStringOnCreature("Your rank on the server is Slayer of Diablo", oPC);
    return;
    }
    if (GetItemPossessedBy(oPC, "wayp27")!= OBJECT_INVALID)
    {
    FloatingTextStringOnCreature("Your rank on the server is Slayer of Mephisto", oPC);
    return;
    }
    if (GetItemPossessedBy(oPC, "wayp18")!= OBJECT_INVALID)
    {
    FloatingTextStringOnCreature("Your rank on the server is Slayer of Duriel", oPC);
    return;
    }
    if (GetItemPossessedBy(oPC, "wayp9")!= OBJECT_INVALID)
    {
    FloatingTextStringOnCreature("Your rank on the server is Slayer of Andariel", oPC);
    return;
    }
}

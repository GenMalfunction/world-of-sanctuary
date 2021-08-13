#include "x0_i0_anims"
#include "x0_i0_treasure"
#include "x2_inc_switches"

void main()
{

  object oNPC = OBJECT_SELF;
    object oItem = GetFirstItemInInventory(oNPC);

    while (GetIsObjectValid(oItem)&& GetDroppableFlag(oItem)== FALSE)
    {

//     int bDroppable=d100()>90;
       int bDroppable=d100()>85;
//     int bDroppable=d100()>75;

     SetDroppableFlag(oItem, bDroppable);

    oItem = GetNextItemInInventory(oNPC);
    }
    //--------------------------------------------------------------------------
    // Enable stealth mode by setting a variable on the creature
    // Great for ambushes
    // See x2_inc_switches for more information about this
    //--------------------------------------------------------------------------
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_STEALTH) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_STEALTH);
    }
    //--------------------------------------------------------------------------
    // Make creature enter search mode after spawning by setting a variable
    // Great for guards, etc
    // See x2_inc_switches for more information about this
    //--------------------------------------------------------------------------
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_SEARCH) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_SEARCH);
    }
    //--------------------------------------------------------------------------
    // Enable immobile ambient animations by setting a variable
    // See x2_inc_switches for more information about this
    //--------------------------------------------------------------------------
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_AMBIENT_IMMOBILE) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
    }
    //--------------------------------------------------------------------------
    // Enable mobile ambient animations by setting a variable
    // See x2_inc_switches for more information about this
    //--------------------------------------------------------------------------
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_AMBIENT) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS);
    }
    SetListeningPatterns();
    WalkWayPoints();

    //* Create a small amount of treasure on the creature
    if ((GetLocalInt(GetModule(), "X2_L_NOTREASURE") == FALSE)  &&
        (GetLocalInt(OBJECT_SELF, "X2_L_NOTREASURE") == FALSE)   )
    {
        CTG_GenerateNPCTreasure(TREASURE_TYPE_MONSTER, OBJECT_SELF);
    }
    // ***** ADD ANY SPECIAL ON-SPAWN CODE HERE ***** //
    // * If Incorporeal, apply changes
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_IS_INCORPOREAL) == TRUE)
    {
        effect eConceal = EffectConcealment(50, MISS_CHANCE_TYPE_NORMAL);
        eConceal = ExtraordinaryEffect(eConceal);
        effect eGhost = EffectCutsceneGhost();
        eGhost = ExtraordinaryEffect(eGhost);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eConceal, OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, OBJECT_SELF);
    }

}

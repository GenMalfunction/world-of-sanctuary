#include "nw_i0_generic"
void main()
{
    object oItem;
    object oPC = GetLastUsedBy();
    if (!GetIsPC(oPC)) return;

    object oTarget;
    object oSpawn;
    location lTarget;
    oTarget = GetWaypointByTag("openhellgate9");
    lTarget = GetLocation(oTarget);
    oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "gateofhell9", lTarget);
    oTarget = oSpawn;
    SetIsTemporaryEnemy(oPC, oTarget);
    AssignCommand(oTarget, ActionAttack(oPC));
    AssignCommand(oTarget, DetermineCombatRound(oPC));
    int nIntt;
    nIntt = GetObjectType(oTarget);
    if (nIntt != OBJECT_TYPE_WAYPOINT) DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_TORNADO), oTarget));
    else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_TORNADO), GetLocation(oTarget)));


    int nInt;
    nInt = GetObjectType(oPC);
    if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_SPARK_SMALL), oPC);
    else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_SPARK_SMALL), GetLocation(oPC));
    string sName = "npc"+GetName(oPC);
    //create and name the object. Set up debug strings
    object oOppForce = CopyObject(oPC, GetLocation(oPC),OBJECT_INVALID, sName);
    int nHP = GetMaxHitPoints(oOppForce);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHP), oOppForce);
    string altName= GetName (oOppForce);
    string altTag= GetTag (oOppForce);
    //COPY BUFFS OF PC
    effect eBuff=GetFirstEffect(oPC);
    while(GetIsEffectValid(eBuff))
     {
      ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBuff , oOppForce);
      eBuff=GetNextEffect(oPC);
     }
    //INVENTORY MANAGEMENT FUNCTIONS
    //Remove this if you want loot to drop
    //if you want inventory or gold to drop then set to true
    //Remove gold
    //Remark the take statement out if you want gold to drop
    int nGold = GetGold(oOppForce);
    TakeGoldFromCreature(nGold, oOppForce, TRUE);
    //Set equipped items to FALSE for Dropping
    for (nInt=0; nInt<NUM_INVENTORY_SLOTS; nInt++)
    {
        oItem=GetItemInSlot(nInt, oOppForce);
        SetDroppableFlag(oItem, FALSE);
    }
    //Set inventory items to FALSE for Dropping
    //if you want inventory to drop then set to true
    object oItem1 = GetFirstItemInInventory(oOppForce);
    while (GetIsObjectValid(oItem1) == TRUE)
    {
        SetDroppableFlag(oItem1, FALSE);
        SetDroppableFlag(oItem1, FALSE);
        oItem1 = GetNextItemInInventory(oOppForce);
    }
    //START THE AI FUNCTIONS!!!!
    //Have the object attack the PC
        ChangeToStandardFaction(oOppForce, STANDARD_FACTION_HOSTILE);
        AdjustReputation(oPC, oOppForce, -100);
        SetIsTemporaryEnemy(oPC, oOppForce);
        DelayCommand(1.0f,AssignCommand(oOppForce, DetermineCombatRound(oPC)));
        DelayCommand(2.0f,AssignCommand(oOppForce, ActionDoCommand(ActionAttack(oPC, FALSE))));
        DelayCommand(3.0f,ExecuteScript("nw_c2_default1",oOppForce)); //perception script default
    //object exists for five minutes
    DelayCommand(180.0f,DestroyObject(oOppForce));  //change the number if seconds if you want clone to stay longer or shorter time
}


#include "nw_i0_plot"

//Get PC Gold and apply XP Penalty
void ApplyPenalty(object oDead)
{
    int nXP = GetXP(oDead) ; //Gets PC's experience
    int nPenalty = 35 * GetHitDice(oDead) ; // Calculates how much experience to lose
    int nHD = GetHitDice(oDead) ; //Gets PC's TOTAL level
// Prevents level loss while respawning and sets new experience
    int nMin = ((nHD * (nHD - 1)) / 2) * 1000 ;
    int nNewXP = nXP - nPenalty ;
    if (nNewXP < nMin)
    nNewXP = nMin ;
    SetXP(oDead, nNewXP) ;
// Takes gold from PC
    int nGoldToTake = FloatToInt(0.20 * GetGold(oDead)) ;
    AssignCommand(oDead, TakeGoldFromCreature(nGoldToTake, oDead, TRUE)) ;
    location nLocDead = GetLocation(oDead) ;// Gets location of death
// Creates the bag into which the gold is placed.
    object oGoldBag = CreateObject(OBJECT_TYPE_PLACEABLE, "pcgoldbag", nLocDead) ;
     {
// This creates the gold in the chest just created above:
        object oTarget = GetNearestObjectByTag ("pcgoldbag", oDead, 1) ; // Gets the chest
        string sItemTemplate = "nw_it_gold001" ;  // The standard gold piece
        int nStackSize = nGoldToTake ; // Create gold equal to gold taken on respawn
        CreateItemOnObject(sItemTemplate, oTarget, nStackSize) ; // Makes stack of gold pieces = nGoldToTake, places in chest
     }
// The next two lines cause the Text "GP Loss" and "XP Loss" to float above the PC AFTER respawn.  Works fine without them.
    DelayCommand(2.0, FloatingTextStrRefOnCreature(58299, oDead, FALSE)) ;
    DelayCommand(2.8, FloatingTextStrRefOnCreature(58300, oDead, FALSE)) ;
}
void main ()
{
 object oRespawner = GetLastRespawnButtonPresser() ;
   ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oRespawner) ;
   ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(5), oRespawner) ;
   RemoveEffects (oRespawner) ;
   SetLocalLocation(oRespawner, "NW_L_I_DIED_HERE", GetLocation(oRespawner));
   SetLocalInt(oRespawner, "NW_L_I_DIED", 1);
   string sDestTag =  "WT_RESPAWN_00" ;
   string sArea = GetTag(GetArea(oRespawner)) ;
   object oSpawnPoint = GetObjectByTag(sDestTag) ;
   AssignCommand(oRespawner,JumpToLocation(GetLocation(oSpawnPoint))) ;
   ApplyPenalty(oRespawner) ;
}

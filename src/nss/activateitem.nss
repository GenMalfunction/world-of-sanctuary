//:: Activate Item script
//:: Created by: Helge "DarkFame" Ingvoldstad
//::
//:: Purpose: Checks if the town portal scroll is casted.
void main()
{
// variable init
object oItem = GetItemActivated(); // gets which item activated
object oPC = GetItemActivator(); // gets item activator
string sItemTag = GetTag(oItem); // gets tag of activated item
if (sItemTag == "townportal") { // checks if it's the town portal scroll that was used
location lLoc = GetItemActivatedTargetLocation(); // sets the location the scroll was casted at
 // Effects start
effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD, FALSE);
ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, lLoc, 6.0);
// Effects stop
CreateObject(OBJECT_TYPE_PLACEABLE,sItemTag,lLoc,TRUE); // creates the actual portal
SetLocalLocation(oPC, "Portal", GetItemActivatedTargetLocation()); // stores the location variable in the PC itself
}
}

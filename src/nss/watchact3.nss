void main()
{

object oPC = GetEnteringObject();
object oDeny;

if (!GetIsPC(oPC)) return;

if (GetTag(GetItemInSlot(INVENTORY_SLOT_HEAD, oPC)) == "divinghelm")
   {
   oDeny = GetWaypointByTag("deathrow_wp");
   SpeakString(GetName(oPC) + "...no diving equipment alloud in this area", TALKVOLUME_SHOUT);
   AssignCommand(oPC, JumpToObject(oDeny));
   return;
   }

if (GetTag(GetItemInSlot(INVENTORY_SLOT_CHEST, oPC)) == "divingsuit")
   {
   oDeny = GetWaypointByTag("deathrow_wp");
   SpeakString(GetName(oPC) + "...no diving equipment alloud in this area", TALKVOLUME_SHOUT);
   AssignCommand(oPC, JumpToObject(oDeny));
   return;
   }

if (GetTag(GetItemInSlot(INVENTORY_SLOT_BOOTS, oPC)) == "divingflippers")
   {
   oDeny = GetWaypointByTag("deathrow_wp");
   SpeakString(GetName(oPC) + "...no diving equipment alloud in this area", TALKVOLUME_SHOUT);
   AssignCommand(oPC, JumpToObject(oDeny));
   return;
   }

if (GetItemPossessedBy(oPC, "wayp18")!= OBJECT_INVALID)
   return;

object oTarget;
location lTarget;
oTarget = GetWaypointByTag("deathrow_wp");

lTarget = GetLocation(oTarget);

if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;

AssignCommand(oPC, ClearAllActions());

DelayCommand(0.5, AssignCommand(oPC, ActionJumpToLocation(lTarget)));

oTarget = oPC;

SpeakString(GetName(oPC) + "...has no right to access Act III", TALKVOLUME_SHOUT);

int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), GetLocation(oTarget));

}


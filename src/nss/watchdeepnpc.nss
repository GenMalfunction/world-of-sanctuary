object oDeny;
void main()
{

ExecuteScript("nw_c2_default2", OBJECT_SELF);

object oPC = GetLastPerceived();

if (!GetIsPC(oPC)) return;

if (!GetLastPerceptionSeen()) return;
if (GetTag(GetItemInSlot(INVENTORY_SLOT_HEAD, oPC)) != "divinghelm")
   {
   oDeny = GetWaypointByTag("deathrow_wp");
   SpeakString(GetName(oPC) + "...has no diving equipment", TALKVOLUME_SHOUT);
   AssignCommand(oPC, JumpToObject(oDeny));
   return;
   }

if (GetTag(GetItemInSlot(INVENTORY_SLOT_CHEST, oPC)) != "divingsuit")
   {
   oDeny = GetWaypointByTag("deathrow_wp");
   SpeakString(GetName(oPC) + "...has no diving equipment", TALKVOLUME_SHOUT);
   AssignCommand(oPC, JumpToObject(oDeny));
   return;
   }

if (GetTag(GetItemInSlot(INVENTORY_SLOT_BOOTS, oPC)) != "divingflippers")
   {
   oDeny = GetWaypointByTag("deathrow_wp");
   SpeakString(GetName(oPC) + "...has no diving equipment", TALKVOLUME_SHOUT);
   AssignCommand(oPC, JumpToObject(oDeny));
   return;
   }

}


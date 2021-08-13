object oDeny;
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

if (GetTag(GetItemInSlot(INVENTORY_SLOT_HEAD, oPC)) != "divinghelm")
   {
   oDeny = GetWaypointByTag("backfromdeep");
   SpeakString(GetName(oPC) + "...has no diving equipment", TALKVOLUME_SHOUT);
   AssignCommand(oPC, JumpToObject(oDeny));
   return;
   }

if (GetTag(GetItemInSlot(INVENTORY_SLOT_CHEST, oPC)) != "divingsuit")
   {
   oDeny = GetWaypointByTag("backfromdeep");
   SpeakString(GetName(oPC) + "...has no diving equipment", TALKVOLUME_SHOUT);
   AssignCommand(oPC, JumpToObject(oDeny));
   return;
   }

if (GetTag(GetItemInSlot(INVENTORY_SLOT_BOOTS, oPC)) != "divingflippers")
   {
   oDeny = GetWaypointByTag("backfromdeep");
   SpeakString(GetName(oPC) + "...has no diving equipment", TALKVOLUME_SHOUT);
   AssignCommand(oPC, JumpToObject(oDeny));
   return;
   }

}


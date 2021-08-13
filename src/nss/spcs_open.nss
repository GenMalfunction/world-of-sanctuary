void main()
{

string SPCS_WAYPOINT = "waypoint";  // Tag of a waypoint created at a location in the module to determine the spawn point of the NULL_HUMAN
string SPCS_DB = "SPCS_Storage";    // Name of the DB to be used to store items


object oPC = GetLastUsedBy();
string PlayerID = GetPCPublicCDKey(oPC);

if (GetLocalInt(OBJECT_SELF, "in_use") == 1)
    {
    FloatingTextStringOnCreature("*Storage Chest is currently in use!*", oPC);
    return;
    }
SetLocalInt(OBJECT_SELF, "in_use", 1);


object oSpawn = RetrieveCampaignObject(SPCS_DB, PlayerID, GetLocation(GetWaypointByTag(SPCS_WAYPOINT)));

object oChest = CreateObject(OBJECT_TYPE_PLACEABLE, "spcs_chest_u", GetLocation(OBJECT_SELF));
SetLocalObject(oChest, "chest_use", OBJECT_SELF);
SetLocalObject(oChest, "user", oPC);

object oItem = GetFirstItemInInventory(oSpawn);
while (GetIsObjectValid(oItem))
    {
    CopyObject(oItem, GetLocation(oChest), oChest);
    DestroyObject(oItem, 0.0);
    oItem = GetNextItemInInventory(oSpawn);
    }
DestroyObject(oSpawn, 0.0);

AssignCommand(oPC, ActionInteractObject(oChest));

}

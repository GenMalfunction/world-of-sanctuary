void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "vic1");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "vic2");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "vic3");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "vic4");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "vic5");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "vic6");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "vic7");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "vic8");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "vic9");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "vic10");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "vic11");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

CreateItemOnObject("el", oPC);

CreateItemOnObject("eld", oPC);

CreateItemOnObject("tir", oPC);

CreateItemOnObject("nef", oPC);

CreateItemOnObject("eth", oPC);

CreateItemOnObject("ith", oPC);

CreateItemOnObject("tal", oPC);

CreateItemOnObject("ral", oPC);

CreateItemOnObject("ort", oPC);

CreateItemOnObject("thul", oPC);

CreateItemOnObject("amn", oPC);

CreateItemOnObject("sol", oPC);

CreateItemOnObject("shael", oPC);

CreateItemOnObject("dol", oPC);

CreateItemOnObject("hel", oPC);

CreateItemOnObject("io", oPC);

CreateItemOnObject("lum", oPC);

CreateItemOnObject("ko", oPC);

CreateItemOnObject("fal", oPC);

CreateItemOnObject("lem", oPC);

CreateItemOnObject("pul", oPC);

CreateItemOnObject("um", oPC);

CreateItemOnObject("mal", oPC);

CreateItemOnObject("ist", oPC);

CreateItemOnObject("gul", oPC);

CreateItemOnObject("vex", oPC);

CreateItemOnObject("ohm", oPC);

CreateItemOnObject("lo", oPC);

CreateItemOnObject("sur", oPC);

CreateItemOnObject("ber", oPC);

CreateItemOnObject("jah", oPC);

CreateItemOnObject("cham001", oPC);

CreateItemOnObject("zod", oPC);

CreateItemOnObject("xod", oPC);

CreateItemOnObject("xid", oPC);

CreateItemOnObject("gar", oPC);

CreateItemOnObject("fur", oPC);

CreateItemOnObject("imu", oPC);

CreateItemOnObject("tyhl", oPC);

CreateItemOnObject("rhul", oPC);

}

void equip(int id)
{
  DestroyObject(GetItemInSlot(INVENTORY_SLOT_CHEST));
  object item = CreateItemOnObject("teasef"+IntToString(id));
ActionSpeakString(GetName(item));
  ActionEquipItem(item, INVENTORY_SLOT_CHEST);

}

object makeitem(string ref)
{
    object item = GetItemPossessedBy(OBJECT_SELF, ref);
    if (item == OBJECT_INVALID) item = CreateItemOnObject(ref);
    return item;
}

void main()
{
    string ref = "teasef";
    if (GetGender(OBJECT_SELF) != TRUE) {
        ref = "teasem";
    }
    object item1 = makeitem(ref+"11");
    object item2 = makeitem(ref+"12");
    object item3 = makeitem(ref+"13");
//the tease part
    ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT,1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_BOW,1.0);
    object oItem = GetItemInSlot (INVENTORY_SLOT_CHEST);
    ActionUnequipItem (oItem);

//    DestroyObject(GetItemInSlot(INVENTORY_SLOT_CHEST));
//    item = CreateItemOnObject(ref+"11");
//SpeakString(GetName(item));
//    ActionEquipItem(item, INVENTORY_SLOT_CHEST);
//    AssignCommand(OBJECT_SELF, equip(11));
//  string sStrip04 = "strip04";
//  object oStrip04 = GetObjectByTag(sStrip04);
    ActionEquipItem(item1, INVENTORY_SLOT_CHEST);
    ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2,1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_BOW,1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,1.0);

//    DestroyObject(item);
//    item = CreateItemOnObject(ref+"12");
//SpeakString(GetName(item));
//    ActionEquipItem(item, INVENTORY_SLOT_CHEST);
//    AssignCommand(OBJECT_SELF, equip(12));
//  object oItem2 = GetItemInSlot (INVENTORY_SLOT_CHEST);
//  ActionUnequipItem (oItem2);
//  string sStrip03 = "strip03";
//  object oStrip03 = GetObjectByTag(sStrip03);
//  ActionEquipItem(oStrip03, INVENTORY_SLOT_CHEST);
    ActionEquipItem(item2, INVENTORY_SLOT_CHEST);
    ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2,1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_MID,1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0);

//    DestroyObject(item);
//    item = CreateItemOnObject(ref+"13");
//SpeakString(GetName(item));
//    ActionEquipItem(item, INVENTORY_SLOT_CHEST);
//    AssignCommand(OBJECT_SELF, equip(13));
//  object oItem3 = GetItemInSlot(INVENTORY_SLOT_CHEST);
//  ActionUnequipItem(oItem3);
//  string sStrip02 = "strip02";
//  object oStrip02 = GetObjectByTag(sStrip02);
//  ActionEquipItem(oStrip02, INVENTORY_SLOT_CHEST);
    ActionEquipItem(item3, INVENTORY_SLOT_CHEST);
    ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL,1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_BOW,1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING,1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0);

    if (GetTag(GetArea(OBJECT_SELF))=="Baths") {
        ActionUnequipItem(item3);
//    DestroyObject(item);
//    AssignCommand(OBJECT_SELF, equip(14));
//  ActionUnequipItem(oItem4);
//  string sStrip01 = "strip01";
//  object oStrip01 = GetObjectByTag(sStrip01);
//  ActionEquipItem(oStrip01, INVENTORY_SLOT_CHEST);
        ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT,1.0);
        ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,1.0);
        ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2,1.0);
    }
    ActionPlayAnimation(ANIMATION_FIREFORGET_BOW,1.0);

    ActionEquipItem(oItem, INVENTORY_SLOT_CHEST);
    ActionPlayAnimation(ANIMATION_FIREFORGET_BOW,1.0);
    ActionDoCommand( PlayVoiceChat(VOICE_CHAT_LAUGH));
}

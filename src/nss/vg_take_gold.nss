void main()
{
object oPC = GetPCSpeaker();
// Remove 10 gold from the player
TakeGoldFromCreature(10, oPC, TRUE);
// Determine Quest Number
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
// Get Tag of Quest Item that matches this quest
string sItem = "QuestItem"+sQuest;
// Define the Quest Item by the above tag
object oItem = GetItemPossessedBy(OBJECT_SELF,sItem);
// Give them the item
ActionGiveItem(oItem,oPC);

SetLocalInt(oPC,"Quest"+sQuest,3);
}

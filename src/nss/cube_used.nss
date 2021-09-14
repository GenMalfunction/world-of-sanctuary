// Transmutation chest
// Built for Shadow Mountain
// www.shadowmountain.netfirms.com
// Built by Mohobie
//
// Debug string left in place for those who wish to manipulate the script.
// This is the only script from the Transmutation chest system that needs to
// be in the module it's intended to be added to.  The module
// "Shadow Mountain Transmutation Chest", which is included in the
// bundle should be used to create and expand the database.
//
// NOTE: Does not take into account item stacks.
//
void main()
{
int count = 0;
object oPC = GetLastClosedBy(); //Know what pc to give the new item to
object oItem = GetFirstItemInInventory();// Get item to start loop with
string sItem1, sItem2, sItem3, sItem;
if (!GetIsObjectValid(oItem))
return;
SpeakString("debug, Start counter.",TALKVOLUME_TALK);
while(GetIsObjectValid(oItem))// main loop
{
count++;

if(count == 1)
{
sItem1 = GetTag(oItem);
sItem = GetResRef(oItem);
}
else if(count == 2)
sItem2 = GetTag(oItem);
else if(count == 3)
sItem3 = GetTag(oItem);
else if(count > 3) //To many items in the chest
{
 SpeakString("You have to many items in the transmutation chest.",TALKVOLUME_TALK);
return;
}

oItem = GetNextItemInInventory();
}
//SpeakString("debug, Start same item check.",TALKVOLUME_TALK);
if(sItem1 == sItem2 && sItem2 == sItem3)
{
//SpeakString("debug, Items passed likeness check",TALKVOLUME_TALK);
oItem = GetFirstItemInInventory();
string sItem2 = GetCampaignString("SM_Cube_DB",sItem);
if(sItem2 == "") //3 of a kind but no 'upgrade' availible
{

SpeakString("These Items cannot be transmuted.",TALKVOLUME_TALK);
return;
}
while(GetIsObjectValid(oItem))// remove contents of the chest
{
DestroyObject(oItem);
oItem = GetNextItemInInventory();
}
//Successfull transmution
ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_POLYMORPH), oPC);
SpeakString("Your items have been transmuted.",TALKVOLUME_TALK);
//SpeakString("Debug, resref check",TALKVOLUME_TALK);
//SpeakString(sItem2,TALKVOLUME_TALK);
        CreateItemOnObject(sItem2, oPC);
}
else // Items do not fit requirements or have no 'upgrade'
{
SpeakString("These Items cannot be transmuted.",TALKVOLUME_TALK);
}
}

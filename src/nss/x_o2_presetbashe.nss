



void RespawnObject(string sTag, int iType, location lLoc) {

// ResRef must be derivable from Tag
string sResRef = GetStringLowerCase(GetStringLeft(sTag, 16));

CreateObject(iType, sResRef, lLoc);

}



void main()
{
location lLoc = GetLocation(OBJECT_SELF);
SetPlotFlag(OBJECT_SELF, FALSE);
object item = GetFirstItemInInventory(OBJECT_SELF);
while (GetIsObjectValid(item)){
DestroyObject(item);
CreateObject(OBJECT_TYPE_ITEM, "brokenloot", lLoc);
item=GetNextItemInInventory(OBJECT_SELF);
}
float fDelay2 = 0.0;
DestroyObject(OBJECT_SELF, fDelay2);
string sTag = GetTag(OBJECT_SELF);
int iType = GetObjectType(OBJECT_SELF);

// For creatures, save the location at spawn-time as a local location and
// use it instead. Otherwise, the creature will respawn where it died.


float fDelay = 1800.0;  // 1000 second delay

AssignCommand(GetArea(OBJECT_SELF), DelayCommand(fDelay, RespawnObject(sTag, iType, lLoc)));
}
























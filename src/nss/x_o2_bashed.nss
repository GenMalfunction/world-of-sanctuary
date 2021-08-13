#include "X_O2_CONINCLUDE"



void RespawnObject(string sTag, int iType, location lLoc) {

// ResRef must be derivable from Tag
string sResRef = GetStringLowerCase(GetStringLeft(sTag, 16));

CreateObject(iType, sResRef, lLoc);

}



void main()
{
 location lLoc = GetLocation(OBJECT_SELF);
CreateObject(OBJECT_TYPE_ITEM, "brokenloot", lLoc);


string sTag = GetTag(OBJECT_SELF);
int iType = GetObjectType(OBJECT_SELF);

// For creatures, save the location at spawn-time as a local location and
// use it instead. Otherwise, the creature will respawn where it died.


float fDelay = 1000.0;  // 1000 second delay

DestroyObject(OBJECT_SELF, 0.0);
AssignCommand(GetArea(OBJECT_SELF), DelayCommand(fDelay, RespawnObject(sTag, iType, lLoc)));
}
























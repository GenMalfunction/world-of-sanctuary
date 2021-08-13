int StartingConditional()
{
string sTaskMaster = GetLocalString(OBJECT_SELF,"TaskMaster");
// We need to identify the tag all five quest givers
// involved so we can work with the objects as needed
string sGiver1 = "QuestGiver1"+sTaskMaster;
string sGiver2 = "QuestGiver2"+sTaskMaster;
string sGiver3 = "QuestGiver3"+sTaskMaster;
string sGiver4 = "QuestGiver4"+sTaskMaster;
string sGiver5 = "QuestGiver5"+sTaskMaster;


// Now lets get the name of these NPCs so we can
// set up some nice custom tokens for convos
string sGiverName1 = GetName(GetObjectByTag(sGiver1));
string sGiverName2 = GetName(GetObjectByTag(sGiver2));
string sGiverName3 = GetName(GetObjectByTag(sGiver3));
string sGiverName4 = GetName(GetObjectByTag(sGiver4));
string sGiverName5 = GetName(GetObjectByTag(sGiver5));

SetCustomToken(50016, sGiverName1);
SetCustomToken(50017, sGiverName2);
SetCustomToken(50018, sGiverName3);
SetCustomToken(50019, sGiverName4);
SetCustomToken(50020, sGiverName5);

// Now lets get the name of the areas all these guys are
// in so we can set up some nice custom tokens for convos
object oGiver1Area = GetArea(GetObjectByTag(sGiver1));
object oGiver2Area = GetArea(GetObjectByTag(sGiver2));
object oGiver3Area = GetArea(GetObjectByTag(sGiver3));
object oGiver4Area = GetArea(GetObjectByTag(sGiver4));
object oGiver5Area = GetArea(GetObjectByTag(sGiver5));

string sGiver1Area = (GetName(oGiver1Area));
string sGiver2Area = (GetName(oGiver2Area));
string sGiver3Area = (GetName(oGiver3Area));
string sGiver4Area = (GetName(oGiver4Area));
string sGiver5Area = (GetName(oGiver5Area));

SetCustomToken(50021, sGiver1Area);
SetCustomToken(50022, sGiver2Area);
SetCustomToken(50023, sGiver3Area);
SetCustomToken(50024, sGiver4Area);
SetCustomToken(50025, sGiver5Area);

return TRUE;
}

int StartingConditional()
{
// We need to identify the quest number of the NPCs
// involved so we can work with the objects as needed
string sQuest = GetStringRight(GetTag(OBJECT_SELF),5);

// We need to identify the tag of the NPCs
// involved so we can work with the objects as needed
string sGiver = "QuestGiver"+sQuest;
string sAcceptor = "QuestAcceptor"+sQuest;
string sCriminal = "QuestCriminal"+sQuest;
string sVictim = "QuestVictim"+sQuest;
string sKNVictim = "QuestKNVictim"+sQuest;
string sItem = "QuestItem"+sQuest;

// Now lets get the name of these NPCs so we can
// set up some nice custom tokens for convos
string sGiverName = GetName(GetObjectByTag(sGiver));
string sAcceptorName = GetName(GetObjectByTag(sAcceptor));
string sCriminalName = GetName(GetObjectByTag(sCriminal));
string sVictimName = GetName(GetObjectByTag(sVictim));
string sKNVictimName = GetName(GetObjectByTag(sKNVictim));
string sItemName = GetName(GetObjectByTag(sItem));

SetCustomToken(50000, sGiverName);
SetCustomToken(50001, sAcceptorName);
SetCustomToken(50002, sCriminalName);
SetCustomToken(50003, sVictimName);
SetCustomToken(50004, sKNVictimName);
SetCustomToken(50005, sItemName);

// Now lets get the name of the areas all these guys are
// in so we can set up some nice custom tokens for convos
object oGiverArea = GetArea(GetObjectByTag(sGiver));
object oAcceptorArea = GetArea(GetObjectByTag(sAcceptor));
object oCriminalArea = GetArea(GetObjectByTag(sCriminal));
object oVictimArea = GetArea(GetObjectByTag(sVictim));
object oKNVictimArea = GetArea(GetObjectByTag(sKNVictim));

string sGiverArea = (GetName(oGiverArea));
string sAcceptorArea = (GetName(oAcceptorArea));
string sCriminalArea = (GetName(oCriminalArea));
string sVictimArea = (GetName(oVictimArea));
string sKNVictimArea = (GetName(oKNVictimArea));

SetCustomToken(50006, sGiverArea);
SetCustomToken(50007, sAcceptorArea);
SetCustomToken(50008, sCriminalArea);
SetCustomToken(50009, sVictimArea);
SetCustomToken(50010, sKNVictimArea);

// Lets grab the gender so we can refer to them with personal pronouns
// via use of our custom token system
int iGenderGiver = GetGender(GetObjectByTag(sGiver));
int iGenderAcceptor = GetGender(GetObjectByTag(sAcceptor));
int iGenderCriminal = GetGender(GetObjectByTag(sCriminal));
int iGenderVictim = GetGender(GetObjectByTag(sVictim));
int iGenderKNVictim = GetGender(GetObjectByTag(sKNVictim));

// Gender Check and token setting for the NPCs
string sGenderGiver;
string sGenderAcceptor;
string sGenderCriminal;
string sGenderVictim;
string sGenderKNVictim;

if (iGenderGiver == GENDER_FEMALE)
    {
    sGenderGiver = "her";
    }
if (iGenderGiver == GENDER_MALE)
    {
    sGenderGiver = "him";
    }
    SetCustomToken(50011, sGenderGiver);

// Gender Check and token setting for Acceptor
if (iGenderAcceptor == GENDER_FEMALE)
    {
    sGenderAcceptor = "her";
    }
if (iGenderAcceptor == GENDER_MALE)
    {
    sGenderAcceptor = "him";
    }
    SetCustomToken(50012, sGenderAcceptor);

// Gender Check and token setting for Criminal
if (iGenderCriminal == GENDER_FEMALE)
    {
    sGenderCriminal = "her";
    }
if (iGenderCriminal == GENDER_MALE)
    {
    sGenderCriminal = "him";
    }
    SetCustomToken(50013, sGenderCriminal);

// Gender Check and token setting for Victim
if (iGenderVictim == GENDER_FEMALE)
    {
    sGenderVictim = "her";
    }
if (iGenderVictim == GENDER_MALE)
    {
    sGenderVictim = "him";
    }
    SetCustomToken(50014, sGenderVictim);

// Gender Check and token setting for Kidnap Victim
if (iGenderKNVictim == GENDER_FEMALE)
    {
    sGenderKNVictim = "her";
    }
if (iGenderKNVictim == GENDER_MALE)
    {
    sGenderKNVictim = "him";
    }
    SetCustomToken(50015, sGenderKNVictim);

// Set up the token for the Ransom required by the Kidnapper
int iRansom = GetLocalInt(OBJECT_SELF,"Ransom");
string sRansom = IntToString(iRansom);
SetCustomToken(50026, sRansom);

return TRUE;
}

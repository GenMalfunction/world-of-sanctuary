//::///////////////////////////////////////////////
//:: Name: tr_conv
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will go in the onconversation
     node of an NPC.
*/
//:://////////////////////////////////////////////
//:: Created By: Cylvia
//:: Created On: 1-2-2004
//:://////////////////////////////////////////////
void main()
{
int iListen = GetListenPatternNumber();
object oShouter = GetLastSpeaker();
object oIntruder;
SetCommandable(TRUE);
switch(iListen)
{
    // normal conversation as normal
    case -1:
    {
        ClearAllActions();
        BeginConversation();
        break;
    }

    // "***n**" string set in onspawn for this creature.
    // will attempt to store the number on self if
    // player that last spoke it is in conversation.
    case 1111:
    {

    if (IsInConversation(oShouter))
        {
        // get potential number for level adjusting.
        string sNumber = GetMatchedSubstring(0);

        // set string locally on self.
        SetLocalString(OBJECT_SELF,"trainer evaluate",sNumber);
        }
    break;
    }
}
}

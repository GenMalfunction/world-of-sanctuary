//Modified to give xp
#include "CU_FUNCTIONS"
void main()
{
    // get the radius and DC of the secret door.
    float fSearchDist = IntToFloat(GetReflexSavingThrow(OBJECT_SELF));
    int nDiffaculty = GetWillSavingThrow(OBJECT_SELF);

    // what is the tag of this object used in setting the destination
    string sTag = GetTag(OBJECT_SELF);

    // has it been found?
    int nDone = GetLocalInt(OBJECT_SELF,"D_"+sTag);
    int nReset = GetLocalInt(OBJECT_SELF,"Reset");

    // ok reset the door is destroyed, and the done and reset flas are made 0 again
    if (nReset == 1)
    {
        nDone = 0;
        nReset = 0;

        SetLocalInt(OBJECT_SELF,"D_"+sTag,nDone);
        SetLocalInt(OBJECT_SELF,"Reset",nReset);

        object oidDoor= GetLocalObject(OBJECT_SELF,"Door");
        if (oidDoor != OBJECT_INVALID)
        {
            SetPlotFlag(oidDoor,0);
            DestroyObject(oidDoor,GetLocalFloat(OBJECT_SELF,"ResetDelay"));
        }

    }

    int nBestSkill = -50;
    object oidBestSearcher = OBJECT_INVALID;
    int nCount = 1;

    // Find the best searcher within the search radius.
    object oidNearestCreature = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    int nDoneSearch = 0;
    int nFoundPCs = 0;

    while ((nDone == 0) &&
           (nDoneSearch == 0) &&
           (oidNearestCreature != OBJECT_INVALID)
          )
    {
        // what is the distance of the PC to the door location
        float fDist = GetDistanceBetween(OBJECT_SELF,oidNearestCreature);

        if (fDist <= fSearchDist)
        {
            int nSkill = GetSkillRank(SKILL_SEARCH,oidNearestCreature);

            if (nSkill > nBestSkill)
            {
                nBestSkill = nSkill;
                oidBestSearcher = oidNearestCreature;
            }
            nFoundPCs = nFoundPCs +1;
        }
        else
        {
            // If there is no one in the search radius, don't continue to search
            // for the best skill.
            nDoneSearch = 1;
        }
        nCount = nCount +1;
        oidNearestCreature = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF ,nCount);
    }

    if ((nDone == 0) &&
        (nFoundPCs != 0) &&
        (GetIsObjectValid(oidBestSearcher))
       )
    {
       int nMod = d20();

            // did we find it.
       if ((nBestSkill +nMod > nDiffaculty))
       {
            location locLoc = GetLocation (OBJECT_SELF);
            //INSERTED LINE
            string sObjectTag = GetTag(OBJECT_SELF);
            object oidDoor;
            // yes we found it, now create the appropriate door
            oidDoor = CreateObject(OBJECT_TYPE_PLACEABLE,"NW_PL_HIDDENDR03",locLoc,TRUE);
            //INSERTED LINE
            PartyGotEntry(sObjectTag,oidBestSearcher,200, "XP gain - discovery");
            SetLocalString( oidDoor, "Destination" , "DST_"+sTag );
            // make this door as found.
            SetLocalInt(OBJECT_SELF,"D_"+sTag,1);
            SetPlotFlag(oidDoor,1);
            SetLocalObject(OBJECT_SELF,"Door",oidDoor);
            //INSERTED LINE
            SetMapPinEnabled(GetNearestObjectByTag("SecretDoorMN"),1);
       } // if skill search found
    } // if Object is valid
}

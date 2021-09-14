// B W-Husey 17th January 2003
// Script to unlock and open a magic door at specific times with suitable effects!

#include "cu_functions"

void main()
{
    object oTarget = GetLastUsedBy();
    object oDoor = OBJECT_SELF;
    effect eFirst = EffectVisualEffect(VFX_IMP_HOLY_AID);
    effect eSecond = EffectVisualEffect(VFX_IMP_HEALING_X);
//    object oSounder = GetObjectByTag( "NoiseRock");
    int DoIt = FALSE;
    if (GetTimeHour()==24 || GetTimeHour()==0 || GetTimeHour()==1)
    {
        DoIt = TRUE;
    }
    if(GetIsPC(oTarget) && DoIt==TRUE)
    {
//    AssignCommand(oSounder, PlaySound("as_gl_rockfalgl2"));
//    SoundObjectPlay(oSounder);
    DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eFirst, oDoor));
    DelayCommand(4.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSecond, GetLocation(GetWaypointByTag ("WPDoorEffect1"))));
    DelayCommand(4.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSecond, GetLocation(GetWaypointByTag ("WPDoorEffect2"))));
    DelayCommand(4.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSecond, GetLocation(GetWaypointByTag ("WPDoorEffect3"))));
    DelayCommand(5.5, SetLocked(oDoor, FALSE));
    DelayCommand(5.5, ActionOpenDoor(oDoor));
    string sObjectTag = "DwarfDoorOpenXP1";
    if (GetLocalInt(oTarget,sObjectTag) == 0)
    {
    PartyGotEntry(sObjectTag,oTarget,500, "XP gain - furthered plot");
    }
    SetLocalInt(oTarget, "nRumour3", 1);
    SetLocalInt(oTarget, "nSeenDwarfDoor", 1);
    }
    else
    {
    ActionCloseDoor(oDoor);
    SetLocked(oDoor, TRUE);

    SetLocalInt(oTarget, "nRumour3", 1);
    SetLocalInt(oTarget, "nSeenDwarfDoor", 1);
    }

}


void CreateObject2(int nObjectType, string sTemplate, location lLocation, int bUseAppearAnimation=FALSE);
//::///////////////////////////////////////////////
//:: Gas Trap
//:: NW_T1_GasStrC1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a  5m poison radius gas cloud that
    lasts for 2 rounds and poisons all creatures
    entering the area with Dark Reaver Powder
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 30, 2001
//:://////////////////////////////////////////////

void main()
{
    //Declare major variables including Area of Effect Object
    effect eAOE = EffectAreaOfEffect(AOE_PER_FOGACID, "NW_T1_GasStrC1", "****", "****");
    location lTarget = GetLocation(GetEnteringObject());
    int nDuration = 2;
    //Create an instance of the AOE Object using the Apply Effect function
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, RoundsToSeconds(nDuration));

    //respawn trap
    DelayCommand(598.0, CreateObject2(GetObjectType(OBJECT_SELF), GetResRef(OBJECT_SELF), GetLocation(OBJECT_SELF)));
    DelayCommand(600.0, DestroyObject(OBJECT_SELF));
}

void CreateObject2(int nObjectType, string sTemplate, location lLocation, int bUseAppearAnimation=FALSE)
{
    CreateObject(nObjectType, sTemplate, lLocation, bUseAppearAnimation);
    return;
}

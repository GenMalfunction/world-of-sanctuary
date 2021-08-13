//mod_activate
// ** This script goes in the OnItemActivation event of your Module
#include "lilarcor_include"
void chkloc(object PC, object mat, string ref)
{
    if(!GetIsObjectValid(PC)) {
        DestroyObject(mat);  // destroy if they leave
    } else if (GetLocalLocation(PC, "loc") != GetLocation(PC)) {
        CreateItemOnObject(ref, PC, 1);
        DestroyObject(mat);
    } else {
        DelayCommand(4.0, chkloc(PC, mat, ref));
    }

}

void SetLoc(object PC)
{
    SetLocalLocation(PC, "loc", GetLocation(PC));
}

void matsit(object PC)
{
    location loc = GetLocation(PC);
    object area = GetAreaFromLocation(loc);
    vector pos = GetPositionFromLocation(loc);
    loc = Location(area, pos, GetFacingFromLocation(loc) + 90.0);
    object mat = CreateObject(OBJECT_TYPE_PLACEABLE, "placeablemat", loc);
    AssignCommand(PC, ClearAllActions(TRUE));
//    AssignCommand(PC, ActionMoveToObject(mat, FALSE, 0.0));
//    float dir = GetFacing(mat);
//    AssignCommand(PC, SetFacing(dir-90.0));
    AssignCommand(PC, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS,0.0f,30000.0));
    DelayCommand(2.0, SetLoc(PC));
    DelayCommand(4.0, chkloc(PC, mat, "mat"));
}

void main()
{
    ExecuteScript(GetTag(GetItemActivated()),
OBJECT_SELF);


    IsLilarcor();
    object PC = GetItemActivator();
    object item = GetItemActivated();
    object oTownPortal;
    string tag = GetTag(item);
    ExecuteScript("puffweed", PC);
    ExecuteScript("_create_bomb", PC);
    if (tag == "water") {
        FloatingTextStringOnCreature("You feel refreshed.", PC);
        SetLocalInt(PC, "thirst", 1);
    } else  if (tag == "EmoteWand") {
        DelayCommand(1.0, ExecuteScript("cc_emote", PC));
    } else  if (tag == "MyThrone") {
        DelayCommand(1.0, ExecuteScript("ew_throne", PC));
    } else  if (tag == "NW_IT_RECALL") {
        DelayCommand(1.0, ExecuteScript("cc_recall", PC));
    } else if (tag == "whostone" || tag == "WhoStone") {
        ExecuteScript("whostone", PC);
    } else if (GetStringLeft(tag, 4) == "toy_") {
        ExecuteScript("x_activate", OBJECT_SELF);
    } else  if (tag == "mat") {
        DelayCommand(1.0, matsit(PC));
    } else {
        ExecuteScript("nw_s3_alcohol", PC);
    }
    if (GetTag(item) == "ITM_BookOfTownPortal")
  {
    if (GetTag(GetArea(PC)) != "ARE_PandemoniumFortress")
    {
      // if player already has a town portal destroy it
      oTownPortal = GetLocalObject(PC,"TownPortal");
      if (oTownPortal != OBJECT_INVALID) DestroyObject(oTownPortal);

      // create new town portal at player location
      oTownPortal = CreateObject(OBJECT_TYPE_PLACEABLE,"townportal",GetLocation(PC));
      SetLocalObject(PC,"TownPortal",oTownPortal);
      switch (d6())
      {
        case 1: AssignCommand(oTownPortal,PlaySound("sco_lgrinholy01")); break;
        case 2: AssignCommand(oTownPortal,PlaySound("sco_lgsprholy01")); break;
        case 3: AssignCommand(oTownPortal,PlaySound("sco_lgupholy01"));  break;
        case 4: AssignCommand(oTownPortal,PlaySound("sco_lgrinodd01"));  break;
        case 5: AssignCommand(oTownPortal,PlaySound("sco_lgsprodd01"));  break;
        case 6: AssignCommand(oTownPortal,PlaySound("sco_mehanodd03"));  break;
      }
      DelayCommand(0.3,
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SMOKE_PUFF),oTownPortal));
      DelayCommand(0.5,SignalEvent(oTownPortal,EventUserDefined(9000)));

      // if there is no town portal in the Pandemonium Fortress create one
      oTownPortal = GetLocalObject(OBJECT_SELF,"TownPortal");
      if (!GetIsObjectValid(oTownPortal))
      {
        oTownPortal = CreateObject(OBJECT_TYPE_PLACEABLE,"townportal",GetLocation(GetObjectByTag("WP_TownPortal")));
        SetLocalObject(OBJECT_SELF,"TownPortal",oTownPortal);
        DelayCommand(0.6,SignalEvent(oTownPortal,EventUserDefined(9000)));
      }
    }
    else
    {
      SendMessageToPC(PC,"You wonder why there is no effect.");
    }

}
}

//::///////////////////////////////////////////////
//:: randomitem.nss
//::
//:://////////////////////////////////////////////
/*
   Turns the placeable into a random item
   if a player comes near enough.
*/
//:://////////////////////////////////////////////
//:: Edited  By:   Ben W-Husey
//:: Created On:   July 22, 2002
//:://////////////////////////////////////////////

void main()
{
   object oCreature = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
   if (GetIsObjectValid(oCreature) == TRUE && GetDistanceToObject(oCreature) < 20.0)
   {
    effect eMind = EffectVisualEffect(VFX_IMP_DISPEL);
    string sItem = "wspka002";
    int rnd;
    rnd = Random(100); // Calculate _one_ random number
    if (rnd < 20)
    {
sItem = "wspka002";
    } else if (rnd < 35)
    {
sItem = "helmofthedelving";
    } else if (rnd < 55)
    {
sItem = "magistoslesserra";
    } else if (rnd < 70)
    {
sItem = "massiveaxe";
    } else if (rnd < 85)
    {
sItem = "axemansguard";
    } else if (rnd < 95)
    {
sItem = "beltofwizardry";
    } else if (rnd < 100)
    {
sItem = "ringofberegan";
    }
    object oMonster = CreateObject(OBJECT_TYPE_ITEM, sItem, GetLocation(OBJECT_SELF));
   ApplyEffectToObject(DURATION_TYPE_INSTANT, eMind, oMonster);
    SetPlotFlag(OBJECT_SELF, FALSE);
    DestroyObject(OBJECT_SELF, 0.5);
   }
}

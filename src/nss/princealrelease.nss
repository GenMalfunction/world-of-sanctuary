#include "nw_i0_spells"

void main()
{

object oPC = GetPCSpeaker();

object oTarget;
oTarget=GetHenchman(oPC);

RemoveHenchman(oPC, oTarget);

DestroyObject(oTarget);

oTarget = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);

if (GetIsPossessedFamiliar(oTarget)) AssignCommand(oPC, UnpossessFamiliar(oTarget));

if (GetIsObjectValid(oTarget)) DestroyObject(oTarget);

oTarget = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);

if (GetIsObjectValid(oTarget)) DestroyObject(oTarget);

oTarget = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);

if (GetIsObjectValid(oTarget)) RemoveSummonedAssociate(oPC, oTarget);

if (GetIsObjectValid(oTarget)) DestroyObject(oTarget);

oTarget = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);

if (GetIsObjectValid(oTarget)) RemoveSpecificEffect(EFFECT_TYPE_DOMINATED, oTarget);

if (GetIsObjectValid(oTarget)) DestroyObject(oTarget);

}


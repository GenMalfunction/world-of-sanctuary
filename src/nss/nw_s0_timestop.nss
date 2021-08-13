//::////////////////////////////////////////////////////:://
//:: Invizible420's Alternate Time Stop Spell         //:://
//::                                                  //:://
//:: By: Invizible420                                 //:://
//:: (Created 12/20/02 updated 06/13/04 (v 1.75)      //:://
//::////////////////////////////////////////////////////:://
//::                                                  //:://
//:: Persistent World Workaround for Bioware's        //:://
//:: Default Time Stop Spell.  This will              //:://
//:: CutSceneDominate creatures within a radius       //:://
//:: of the caster.                                   //:://
//::                                                  //:://
//:: This version will not Time Stop the caster's     //:://
//:: familiar, summons, animal companion, and only    //:://
//:: the caster's first henchman (Does not support    //:://
//:: multiple henchmens.  Has been thoroughly tested  //:://
//:: and will Time Stop creature's with Immunity to   //:://
//:: Mind Affecting spells.                           //:://
//::                                                  //:://
//:: Contact info/Bug Reports: Digiddy777@yahoo.com   //:://
//::////////////////////////////////////////////////////:://
#include "NW_I0_GENERIC"

// Customize User Defined Variables
//float fDur   = 15.0; // Duration in seconds -- Change this to however long you want Time Stop to last Uncomment and Comment out 3rd ed duration

// This is the formula for accurate 3rd ed. Duration
float fDur     = IntToFloat(d4(1)+1)*6.0; // Least duration is 12 seconds, maximum duration is 30 seconds

float fDist    = 10.0; // Radius in meters -- for a wider area of affect increase this float

// Function to resume creature(s) previous actions wrapped for Delay
void ResumeLast(object oResumee, object oIntruder)
{
    // Delay DetermineCombatRound
    DelayCommand(fDur+0.25,AssignCommand(oResumee,DetermineCombatRound(oIntruder)));
}


// Function to control Time Stop effects
void TSEffects(object oEffector, object oCaster)
{
    // Check if stopped creature is a hostile
    if (GetIsReactionTypeHostile(oCaster,oEffector) == TRUE)
    {
    // Start the resume combat round after Time Stop
    ResumeLast(oEffector, oCaster);
    }

    // Clear the creature(s) action que
    AssignCommand(oEffector,ClearAllActions(TRUE));

    // Make module dominate the creature(s) for fDur seconds & Freeze the Animation to look like time stopped
    AssignCommand(GetModule(),ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectCutsceneDominated(),oEffector,fDur));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION),oEffector,fDur);
    }


// Function to get creature(s) within radius and apply the alternate Time Stop
void TimeStop(object oTarget)
{
    object oNearestC;  // Define nearest creature

    // Begin loop to find all creatures within the fDist meter radius
    oNearestC = GetFirstObjectInShape(SHAPE_SPHERE, fDist, GetSpellTargetLocation(), FALSE, OBJECT_TYPE_CREATURE);
    while(GetIsObjectValid(oNearestC))
    {

        // To make sure it doesn't stop the caster or caster's familiar, first henchman, or summons
        if ((oNearestC != oTarget) &&
           (GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oTarget) != oNearestC) &&
           (GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oTarget) != oNearestC) &&
           (GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oTarget) != oNearestC) &&
           (GetAssociate(ASSOCIATE_TYPE_SUMMONED, oTarget) != oNearestC))
        {
            // Start the Time Stop effects
            DelayCommand(0.75,TSEffects(oNearestC,oTarget));
        }

        // Get the next creature in the fDist meter radius and continue loop
        oNearestC = GetNextObjectInShape(SHAPE_SPHERE, fDist, GetSpellTargetLocation(), FALSE, OBJECT_TYPE_CREATURE);
    }
}


// Begin Main Function
void main()
{
    //Signal event to start the Time Stop
    SignalEvent(OBJECT_SELF, EventSpellCastAt(OBJECT_SELF, SPELL_TIME_STOP, FALSE));

    // Begin custom Time Stop
    TimeStop(OBJECT_SELF);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), GetSpellTargetLocation());
}

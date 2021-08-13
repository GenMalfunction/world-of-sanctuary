/*
    s_modload - Incorporate this code into Module::OnLoad
*/
#include "x2_inc_switches"
#include "pgs_inc_events"

void main()
{
UID_OnModuleLoad();
PGS_OnModuleLoad();

DelayCommand(500.0, SignalEvent(OBJECT_SELF, EventUserDefined(200)));

DelayCommand(500.0, SignalEvent(OBJECT_SELF, EventUserDefined(220)));

DelayCommand(14400.0, SignalEvent(OBJECT_SELF, EventUserDefined(230)));

{
// apply visualisation effects to thones
    object Target = GetObjectByTag("ded1o1", 0);
    int s = 0;
    while(s<100) {
       Target = GetObjectByTag("scoreboard", s);
       if (Target == OBJECT_INVALID) {
           s=100;
       } else {
           s++;
           ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROT_PREMONITION)), Target);
       }

    }
}

SetModuleSwitch (MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS, TRUE);

   if (GetModuleSwitchValue (MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
   {
        // SetUserDefinedItemEventPrefix("1_");

   }


}

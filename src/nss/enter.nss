#include "in_g_cameramove"

void main()
{
 object oPlayer = GetLastUsedBy();
 object oTarget = GetWaypointByTag("secondchance");
 object oToken = GetObjectByTag("Player_ID_Token");

 if(GetLocalInt(oToken, "Enterfirsttime")==1)
 {
 DelayCommand(0.0, AssignCommand(oPlayer, ActionJumpToObject(oTarget,TRUE)));
 return;
 }
 else
 {
   SetLocalInt(oToken, "Enterfirsttime",1);
   SetCutsceneMode(oPlayer,TRUE);
   DelayCommand(16.0,SetCutsceneMode(oPlayer,FALSE));
   AssignCommand(oPlayer,StoreCameraFacing());
   DelayCommand(0.1,AssignCommand(oPlayer,PlayAnimation(ANIMATION_LOOPING_MEDITATE,1.0,15.0)));
   DelayCommand(3.0,FloatingTextStringOnCreature("</c Welcome to the Neverwinter Nights",oPlayer));
   DelayCommand(4.5,FloatingTextStringOnCreature("</c Diablo Lord of Destruction module",oPlayer));
   DelayCommand(5.5,FloatingTextStringOnCreature("</c ",oPlayer));
   DelayCommand(6.5,FloatingTextStringOnCreature("</c ",oPlayer));
   DelayCommand(7.0,FloatingTextStringOnCreature("</c What fires burn within my heart and force me to contend",oPlayer));
   DelayCommand(8.0,FloatingTextStringOnCreature("</c With the perils that await me at this tragic journey's end ?",oPlayer));
   DelayCommand(9.0,FloatingTextStringOnCreature("</c I have walked the roads that lead to Hell, I have challenged all but Fate.",oPlayer));
   DelayCommand(10.0,FloatingTextStringOnCreature("</c I have fought and bled and carried on just to reach this final gate.",oPlayer));
   DelayCommand(11.0,FloatingTextStringOnCreature("</c And now the task before me looms, this dire deed undone",oPlayer));
   DelayCommand(12.0,FloatingTextStringOnCreature("</c I shall make my stand against the Three until the battle's won.",oPlayer));
   DelayCommand(13.0,FloatingTextStringOnCreature("</c What fear or wound could ever still this last defiant cry.",oPlayer));
   DelayCommand(14.0,FloatingTextStringOnCreature("</c As I stand against the Shadow 'neath the endless burning sky ?",oPlayer));
   DelayCommand(15.0,FloatingTextStringOnCreature("</c ",oPlayer));
   DelayCommand(16.0,FloatingTextStringOnCreature("</c ",oPlayer));
   DelayCommand(17.0, AssignCommand(oPlayer, ActionJumpToObject(oTarget,TRUE)));
   DelayCommand (15.5,ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), oPlayer));
   GestaltCameraMove(0.7,GetFacing(oPlayer) + 90.0,18.0,30.0,GetFacing(oPlayer) + 450.0,12.0,50.0,5.0,40.0,oPlayer);
 }
}


#include "in_g_cameramove"
void main()
{

object oPC = GetPCSpeaker();
object oTarget;
location lTarget;
effect eEffect1 = EffectVisualEffect(VFX_FNF_SUMMON_EPIC_UNDEAD);
effect eEffect2 = EffectVisualEffect(VFX_FNF_ICESTORM);
effect eEffect3 = EffectVisualEffect(VFX_FNF_METEOR_SWARM);

oTarget = GetWaypointByTag("enterrogue");

lTarget = GetLocation(oTarget);

if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;

AssignCommand(oPC, ClearAllActions());
SetCutsceneMode(oPC,TRUE);
DelayCommand(130.0,SetCutsceneMode(oPC,FALSE));
AssignCommand(oPC,StoreCameraFacing());
DelayCommand(5.0,  ActionSpeakString("Hmmmm... That didn't work ...."));
DelayCommand(10.0, ActionSpeakString("Stay put don't move - I'll try it again"));
DelayCommand(15.0, ActionSpeakString("So, what are you in for ?"));
DelayCommand(20.0, ActionSpeakString("Did you try to steal Waypoints ?"));
DelayCommand(24.0, ActionSpeakString("Did you attack someone in town ?"));
DelayCommand(26.0, ActionSpeakString("Did you try to cheat the Death script ?"));
DelayCommand(28.0, ActionSpeakString("Did you try to kill another player whitout permission ?"));
DelayCommand(30.0, ActionSpeakString("Did you upset one of the Dungeon Masters ?"));
DelayCommand(35.0, ActionSpeakString("Aha, I see ...."));
DelayCommand(40.0, ActionSpeakString("Time to think about your sin..."));
DelayCommand(45.0, ActionSpeakString("Are you sorry about this, or am I going to see you here more often ?"));
DelayCommand(50.0, ActionSpeakString("Okay okay... no time to waste... I will try to get you out of here"));
DelayCommand(55.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect1,oPC));
DelayCommand(60.0, ActionSpeakString("Hmmmm... Sorry, I'm a little rusty with magic at this time of year"));
DelayCommand(65.0, ActionSpeakString("... I will try it again"));
DelayCommand(70.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect2,oPC));
DelayCommand(75.0, ActionSpeakString("Damn... that didn't work... "));
DelayCommand(80.0, ActionSpeakString("Hmmmm... let me think"));
DelayCommand(83.0, ActionSpeakString("?"));
DelayCommand(84.0, ActionSpeakString("!"));
DelayCommand(85.0, ActionSpeakString("$"));
DelayCommand(86.0, ActionSpeakString("%"));
DelayCommand(87.0, ActionSpeakString("?"));
DelayCommand(88.0, ActionSpeakString("!"));
DelayCommand(89.0, ActionSpeakString("$"));
DelayCommand(90.0, ActionSpeakString("%"));
DelayCommand(95.0, ActionSpeakString("I will try it again"));
DelayCommand(100.0, ActionSpeakString("Here we go"));
DelayCommand(105.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect3,oPC));
DelayCommand(110.0, ActionSpeakString("Damn... I am no good with this magic stuff... "));
DelayCommand(115.0, ActionSpeakString("Oooooh yes I think I got it... Lets try this one last time"));
DelayCommand(122.0, AssignCommand(oPC,PlayAnimation(ANIMATION_LOOPING_MEDITATE,1.0,7.5)));
DelayCommand(124.0, FloatingTextStringOnCreature("</c Please read the server rules in your journal",oPC));
DelayCommand(126.0, FloatingTextStringOnCreature("</c Please read the server rules in your journal",oPC));
DelayCommand(128.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), oPC));
DelayCommand(129.5, AssignCommand(oPC, ActionJumpToObject(oTarget,TRUE)));
DelayCommand(130.2, AssignCommand(oPC, ActionJumpToLocation(lTarget)));
GestaltCameraMove(0.7,GetFacing(oPC) + 90.0,18.0,30.0,GetFacing(oPC) + 450.0,12.0,50.0,5.0,40.0,oPC);

oTarget = oPC;
int nInt;
nInt = GetObjectType(oTarget);
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), GetLocation(oTarget));
}







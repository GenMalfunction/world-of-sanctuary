#include "in_g_cameramove"
#include "nw_i0_tool"
void main()
{
object oPC = GetLastUsedBy();
if (!GetIsPC(oPC)) return;
if(HasItem(oPC, "soulstone0010"))
{
SpeakString("Someone completed the game and got the Power of the Gods !", TALKVOLUME_SHOUT);

{
SetPlotFlag(oPC, TRUE);
effect ePlot1 = EffectVisualEffect(VFX_IMP_GLOBE_USE);
DelayCommand(0.1,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePlot1,oPC));
DelayCommand(0.2,FloatingTextStringOnCreature("You have the Powers of the Gods!!",oPC));
}

object oItem;
oItem = GetItemPossessedBy(oPC, "soulstone0010");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
oItem = GetItemPossessedBy(oPC, "soulstone0011");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
object oTarget;
oTarget = oPC;
int nInt;
nInt = GetObjectType(oTarget);
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget));
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SOUND_BURST), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SOUND_BURST), GetLocation(oTarget));
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), GetLocation(oTarget));
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget));




 object oPlayer = GetLastUsedBy();
 object oTarget1 = GetWaypointByTag("templeofthegods");
{
SetCutsceneMode(oPlayer,TRUE);
DelayCommand(24.0,SetCutsceneMode(oPlayer,FALSE));
AssignCommand(oPlayer,StoreCameraFacing());
DelayCommand(0.1,AssignCommand(oPlayer,PlayAnimation(ANIMATION_LOOPING_MEDITATE,1.0,15.0)));
DelayCommand(3.0,FloatingTextStringOnCreature("</c You have used the globe of the World of Sanctuary",oPlayer));
DelayCommand(4.5,FloatingTextStringOnCreature("</c ",oPlayer));
DelayCommand(5.5,FloatingTextStringOnCreature("</c ",oPlayer));
DelayCommand(6.5,FloatingTextStringOnCreature("</c ",oPlayer));
DelayCommand(7.0,FloatingTextStringOnCreature("</c I am impressed, Mortal.",oPlayer));
DelayCommand(8.0,FloatingTextStringOnCreature("</c ",oPlayer));
DelayCommand(9.0,FloatingTextStringOnCreature("</c You have overcome the greatest challenges this mortal world has ever faced.",oPlayer));
DelayCommand(10.0,FloatingTextStringOnCreature("</c ",oPlayer));
DelayCommand(11.0,FloatingTextStringOnCreature("</c The names on the monument in the Hall of Monuments are the true hero's of the World of Sanctuary.",oPlayer));
DelayCommand(12.0,FloatingTextStringOnCreature("</c ",oPlayer));
DelayCommand(13.0,FloatingTextStringOnCreature("</c They all have made it to the end of the game.",oPlayer));
DelayCommand(14.0,FloatingTextStringOnCreature("</c ",oPlayer));
DelayCommand(15.0,FloatingTextStringOnCreature("</c If you made it through here please contact a DM.",oPlayer));
DelayCommand(16.0,FloatingTextStringOnCreature("</c ",oPlayer));
DelayCommand(17.0,FloatingTextStringOnCreature("</c Let him/her know you made it to the end of the game",oPlayer));
DelayCommand(18.0,FloatingTextStringOnCreature("</c ",oPlayer));
DelayCommand(19.0,FloatingTextStringOnCreature("</c Then your name will be added to the monument...",oPlayer));
DelayCommand(20.0,FloatingTextStringOnCreature("</c ",oPlayer));
DelayCommand(21.0,FloatingTextStringOnCreature("</c Enjoy your new powers of the gods !",oPlayer));
DelayCommand(22.0,FloatingTextStringOnCreature("</c ",oPlayer));
DelayCommand(23.0, AssignCommand(oPlayer, ActionJumpToObject(oTarget1,TRUE)));
DelayCommand (22.5,ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), oPlayer));
GestaltCameraMove(0.7,GetFacing(oPlayer) + 90.0,18.0,30.0,GetFacing(oPlayer) + 450.0,12.0,50.0,5.0,40.0,oPlayer);


}


}
}

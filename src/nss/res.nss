
////////////////////
///// Created by: bushido
//////////////////////////////////////

////////////////////
// AdjustPlayerStats()
// Developed by: Wouter Dhondt
// Slightly modified by: bushido
//////////////////////////////////////
// Adjust Player Stats function
#include"x0_i0_petrify"

void AdjustPlayerStats()
{
// Get the last player that died
object oDied = GetLastPlayerDied();
// Increment or set the death variable
int iDied = GetLocalInt (oDied, "iDied");
++iDied;
SetLocalInt(oDied, "iDied", iDied);

object oKiller = GetLastHostileActor(oDied);
// Is this object a PC?
if (GetIsPC(oKiller) == TRUE)
{
// Increment or set the killer var
int iKilled = GetLocalInt (oKiller,"iKilled");
++iKilled;
SetLocalInt(oKiller, "iKilled", iKilled);
}
}

// Raise OnDeath function
void Raise(object oPlayer)
{
//object oKai = CreateObject(OBJECT_TYPE_CREATURE,"death",GetLocation(oPlayer));
  object oKai = GetObjectByTag( "death1");
effect eEffect = EffectVisualEffect(VFX_IMP_GLOBE_USE);
effect eEffect1 = EffectVisualEffect(VFX_FNF_WORD);
effect eEffect2 = EffectVisualEffect(VFX_FNF_NATURES_BALANCE);
//effect eFly = EffectDisappear();
//effect eFlyDown = EffectAppear();
effect eBad = GetFirstEffect(oPlayer);
//effect eEffect3 = EffectVisualEffect(VFX_IMP_UNSUMMON);
string Sname = GetName(oPlayer);

DelayCommand(4.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,oPlayer,1.0));
DelayCommand(5.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,oPlayer,1.0));
DelayCommand(6.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect1,oPlayer,1.0));
DelayCommand (6.3,AssignCommand (oKai, ActionSpeakString (" <cÜ>The Diablo God's have given you a second chance "+Sname+", So you live to Die, Again...", TALKVOLUME_SHOUT)));
DelayCommand(6.7,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect2,oPlayer));
//DelayCommand(3.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlyDown,oKai,1.0));
//DelayCommand(3.0,ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectBlindness(),oPlayer,1.0));
//DelayCommand(4.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect1,oKai));
//DelayCommand(5.0,AssignCommand(oKai, ActionCastFakeSpellAtObject(SPELL_SLAY_LIVING, oPlayer)));
DelayCommand(7.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPlayer));
DelayCommand(7.1,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oPlayer)), oPlayer));
//DelayCommand(7.0,RemoveEffectOfType(oPlayer,EFFECT_TYPE_BLINDNESS));
//DelayCommand(9.0,ApplyEffectToObject(DURATION_TYPE_PERMANENT,eFly,oKai));
//DelayCommand(9.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect1,oKai));
//DelayCommand(9.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect3,oKai));
//DelayCommand(9.0,FloatingTextStringOnCreature(" <cÜ>The Diablo God's have given you a second chance "+Sname+", So you live to Die, Again...",oPlayer));
oPlayer = GetNextPC();

//Search for negative effects
while(GetIsEffectValid(eBad))
{
if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
{
//Remove effect if it is negative.
DelayCommand(7.0,(RemoveEffect(oPlayer, eBad)));
}
eBad = GetNextEffect(oPlayer);
}
//Fire cast spell at event for the specified target
DelayCommand(7.0,SignalEvent(oPlayer,EventSpellCastAt(oKai, SPELL_RESTORATION, FALSE)));

}

// Respawn/Teleporter OnDeath function
// Optionally you can create the waypoints described to send the dead player
// to their respective locations.

void main()
{

//Count up the kills and deaths
AdjustPlayerStats();

//Standard Ondeath stuff
object oPlayer = GetLastPlayerDied();
// * make friendly to Each of the 3 common factions
AssignCommand(oPlayer, ClearAllActions());
DelayCommand(0.0,Raise(oPlayer));
// * Note: waiting for Sophia to make SetStandardFactionReptuation to clear all personal reputation
if (GetStandardFactionReputation(STANDARD_FACTION_COMMONER, oPlayer) <= 10)
{ SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 80, oPlayer);
}
if (GetStandardFactionReputation(STANDARD_FACTION_MERCHANT, oPlayer) <= 10)
{ SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 80, oPlayer);
}
if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER, oPlayer) <= 10)
{ SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 80, oPlayer);
}

}


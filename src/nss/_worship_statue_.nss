//:://////////////////////////////////////////////
//::       Speed Worship Startue
//::Createt by BUTCHA(MoD)
//:://////////////////////////////////////////////
//THIS SCRIPT GOUS IN THE OnUsed EVENT ON A PLACABLE//
void main()
{
object oPC= GetLastUsedBy();
int iRun;
if(GetLocalInt(OBJECT_SELF,"iRun")== TRUE)
{
return;
}
else
{
SetLocalInt(OBJECT_SELF,"iRun",TRUE);
DelayCommand(4.0,SetLocalInt(OBJECT_SELF,"iRun",FALSE));
object oCaster = OBJECT_SELF;
effect VFX1      =      EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
effect VFX2      =      EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION);
effect VFX3      =      EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE);
effect VFX4      =      EffectVisualEffect(VFX_IMP_SPIKE_TRAP);
effect VFX5      =      EffectDamage(9999);
effect VFX5_1    =      EffectDamage(30);
effect VFX6      =      EffectVisualEffect(136);
effect VFX7      =      EffectVisualEffect(VFX_DUR_PROT_STONESKIN);
effect VFX8      =      EffectVisualEffect(VFX_DUR_MAGIC_RESISTANCE);
effect VFX9      =      EffectVisualEffect(VFX_DUR_GLOBE_INVULNERABILITY);
effect VFX10     =      EffectBlindness();
effect VFX11     =      EffectPolymorph(POLYMORPH_TYPE_COW);
effect VFX12     =      EffectSleep();
effect VFX12_1   =      EffectVisualEffect(VFX_IMP_SLEEP);
location L1      = GetLocation(oPC);
int RANDOMING    = Random(20) + 1;
switch (RANDOMING)
{
case 1:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_GREATER_STONESKIN, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));

break;
}
case 2:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_HARM, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
DelayCommand(6.0,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_POWER_WORD_KILL, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
break;
}
case 3:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_GREATER_RESTORATION, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
break;
}
case 4:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_IMPROVED_INVISIBILITY, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
break;
}
case 5:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_HAMMER_OF_THE_GODS, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
break;
}
case 6:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(6.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX3,oPC));
DelayCommand(6.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX4,oPC));
DelayCommand(6.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX5,oPC));
break;
}
case 7:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_DARKVISION, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
break;
}
case 8:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_PERMANENT,VFX10,oPC,60.0));
break;
}
case 9:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,SetCommandable(FALSE,oPC));
DelayCommand(5.5,SetPlotFlag(oPC,TRUE));
DelayCommand(120.0,SetCommandable(TRUE,oPC));
DelayCommand(120.0,SetPlotFlag(oPC,FALSE));
DelayCommand(120.0,RemoveEffect(oPC,VFX2));
DelayCommand(120.0,RemoveEffect(oPC,VFX7));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_PERMANENT,VFX2,oPC));
DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT,VFX6,L1));
DelayCommand(5.4, ApplyEffectAtLocation(DURATION_TYPE_INSTANT,VFX6,L1));
DelayCommand(5.8, ApplyEffectAtLocation(DURATION_TYPE_INSTANT,VFX6,L1));
DelayCommand(6.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT,VFX6,L1));
DelayCommand(6.6, ApplyEffectAtLocation(DURATION_TYPE_INSTANT,VFX6,L1));
DelayCommand(7.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT,VFX6,L1));
DelayCommand(7.4, ApplyEffectAtLocation(DURATION_TYPE_INSTANT,VFX6,L1));
DelayCommand(7.8, ApplyEffectAtLocation(DURATION_TYPE_INSTANT,VFX6,L1));
DelayCommand(8.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT,VFX6,L1));
DelayCommand(8.6, ApplyEffectAtLocation(DURATION_TYPE_INSTANT,VFX6,L1));
DelayCommand(9.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT,VFX6,L1));
DelayCommand(11.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT,VFX7,oPC));
DelayCommand(12.5,FloatingTextStringOnCreature("HAHA 2 MINUTES FREEZE YOU IDIOT",oPC));
DelayCommand(60.0,FloatingTextStringOnCreature("1 Minute Left",oPC));
DelayCommand(120.0,FloatingTextStringOnCreature("YOU ARE FREE NOW!!",oPC));
DelayCommand(5.5,ActionDoCommand(PlaySound("as_na_rockfalsm3")));
DelayCommand(5.5,ActionDoCommand(PlaySound("as_pl_chantingm1")));
break;
}
case 10:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_PERMANENT,VFX8,oPC));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_PERMANENT,VFX9,oPC));
DelayCommand(6.5,FloatingTextStringOnCreature("YOU ARE THE GOD FOR 1 MINUTE",oPC));
DelayCommand(5.5,SetPlotFlag(oPC,TRUE));
DelayCommand(60.5,SetPlotFlag(oPC,FALSE));
DelayCommand(60.5,RemoveEffect(oPC,VFX8));
DelayCommand(60.5,RemoveEffect(oPC,VFX9));
DelayCommand(60.5,FloatingTextStringOnCreature("YOUR GOD TIME IS OVER",oPC));
break;
}
case 11:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_MAGIC_MISSILE, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
DelayCommand(6.0,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_MAGIC_MISSILE, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
DelayCommand(6.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_MAGIC_MISSILE, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
DelayCommand(7.0,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_MAGIC_MISSILE, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
DelayCommand(8.5,AssignCommand(oCaster, ActionSpeakString("GO AWAY BITCH",TALKVOLUME_TALK)));
DelayCommand(6.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX5_1,oPC));
break;
}
case 12:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_REGENERATE, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
break;
}
case 13:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_FIREBALL, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
DelayCommand(5.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_NEGATIVE_ENERGY_RAY, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
DelayCommand(5.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_NEGATIVE_ENERGY_BURST, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
break;
}
case 14:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_MAGE_ARMOR, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
break;
}
case 15:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX11,oPC));
break;
}
case 16:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX5_1,oPC));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX3,oPC));
DelayCommand(6.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX5_1,oPC));
DelayCommand(6.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX3,oPC));
DelayCommand(7.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX5_1,oPC));
DelayCommand(7.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX3,oPC));
DelayCommand(8.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX5_1,oPC));
DelayCommand(8.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX3,oPC));
DelayCommand(9.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX5_1,oPC));
DelayCommand(9.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX3,oPC));
DelayCommand(10.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX5_1,oPC));
DelayCommand(10.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX3,oPC));
break;
}
case 17:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_RESISTANCE, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
break;
}
case 18:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_RESIST_ELEMENTS, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
break;
}
case 19:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_PERMANENT,VFX12,oPC));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_PERMANENT,VFX12_1,oPC));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_PERMANENT,VFX10,oPC));
DelayCommand(60.0,RemoveEffect(oPC,VFX12_1));
DelayCommand(60.0,RemoveEffect(oPC,VFX12));
DelayCommand(60.0,RemoveEffect(oPC,VFX10));
break;
}
case 20:
{
AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,10.0,6.0));
DelayCommand(5.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,VFX1,oPC));
DelayCommand(5.5,AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_GREATER_OWLS_WISDOM, oPC, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
break;
}
}
}
}

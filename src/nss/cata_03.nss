void main()
{
object oUser = GetLastUsedBy();
object oWP = GetWaypointByTag("CATA_03");
location lWP = GetLocation(oWP);
object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 10.0, lWP, FALSE, OBJECT_TYPE_CREATURE);
 if (GetLocalInt(OBJECT_SELF, "Fired") == 0)
  {
   ActionCastSpellAtLocation(SPELL_FIREBALL, lWP, PROJECTILE_PATH_TYPE_BALLISTIC);
   SetLocalInt(OBJECT_SELF, "Fired", 1);
   DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lWP));
   DelayCommand(10.0, DeleteLocalInt(OBJECT_SELF, "Fired"));
    if ((GetIsObjectValid(oTarget)) && (GetIsPC(oUser)))
     {
      DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d10(2), DAMAGE_TYPE_FIRE, DAMAGE_POWER_NORMAL), oTarget));
      GetNextObjectInShape(SHAPE_SPHERE, 10.0, lWP, FALSE, OBJECT_TYPE_CREATURE);
       while (GetIsObjectValid(oTarget) && (GetIsPC(oUser)))
       {
        DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d10(4), DAMAGE_TYPE_FIRE, DAMAGE_POWER_PLUS_FIVE), oTarget));
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, 10.0, lWP, FALSE, OBJECT_TYPE_CREATURE);
       }
     }
   }
 else if (GetLocalInt(OBJECT_SELF, "Fired") == 1)
  {
  }
}

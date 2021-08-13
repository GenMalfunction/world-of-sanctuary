// * transport player back to place where you died
void main()
{
     object oSelf = OBJECT_SELF;
     effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
     DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, GetLocalLocation(GetPCSpeaker(),"NW_L_I_DIED_HERE")));
     SetLocalInt(GetPCSpeaker(), "NW_L_I_DIED", 0);
     object oPC = GetPCSpeaker();
     ActionCastFakeSpellAtObject(SPELL_MORDENKAINENS_DISJUNCTION, oPC);
     AssignCommand(OBJECT_SELF ,ActionCastFakeSpellAtObject(SPELL_HOLY_AURA, oPC, PROJECTILE_PATH_TYPE_DEFAULT));
     AssignCommand(GetPCSpeaker(), DelayCommand(5.0, JumpToLocation(GetLocalLocation(oPC,"NW_L_I_DIED_HERE"))));
}

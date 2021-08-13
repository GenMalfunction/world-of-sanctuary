  void main()
{
    object oWayPoint = GetObjectByTag("VALOR_EXIT");
    object oPlayer = GetPCSpeaker();
    effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
{
DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPlayer));
DelayCommand(0.6, AssignCommand(oPlayer, JumpToObject(oWayPoint)));
    }
}



void main()
{
object oCaller     = GetEnteringObject();
SetPlotFlag(oCaller, TRUE);
effect ePlot1 = EffectVisualEffect(VFX_IMP_GLOBE_USE);
DelayCommand(0.1,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePlot1,oCaller));
DelayCommand(0.2,FloatingTextStringOnCreature("You Are Plot!!",oCaller));
}

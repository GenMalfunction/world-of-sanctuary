void main()
{
effect ePenguin = ExtraordinaryEffect(EffectPolymorph(POLYMORPH_TYPE_PENGUIN));
ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePenguin, GetLastKiller());
}

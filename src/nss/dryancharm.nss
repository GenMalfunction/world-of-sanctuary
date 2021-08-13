void main()
{
object oTarget = GetPCSpeaker();
effect eCharm = EffectCharmed();
ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eCharm, oTarget, 15.0);
}

void main()
{
object oPC = GetPCSpeaker();
DelayCommand(3.0, AssignCommand(oPC, JumpToObject(GetWaypointByTag("secondchance"))));

object oTarget = GetObjectByTag("WP_sha_Gateway");

//Visual effects can't be applied to waypoints, so if it is a WP
//apply to the WP's location instead

int nInt;
nInt = GetObjectType(oTarget);
ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), oTarget, 2.0);
ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_PWKILL), GetLocation(oTarget));
ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HARM), GetLocation(oTarget));
}

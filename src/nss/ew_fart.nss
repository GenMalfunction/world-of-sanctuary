//Put this on action taken in the conversation editor
void main()
{

object oPC = OBJECT_SELF;

AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 1.0f, 1.0f));

object oTarget;
oTarget = oPC;

//Visual effects can't be applied to waypoints, so if it is a WP
//apply to the WP's location instead

int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), oTarget));
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oTarget));

DelayCommand(2.0, SpeakString("Excuse me, did I just Break Wind?!!",TALKVOLUME_TALK));
DelayCommand(0.5,ActionDoCommand(PlaySound("as_cv_florcreak3")));
DelayCommand(2.2, AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_LAUGH)));
DelayCommand(2.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 4.0f)));
DelayCommand(4.5, SpeakString("Damn, that was a ripe one!!",TALKVOLUME_TALK));


}

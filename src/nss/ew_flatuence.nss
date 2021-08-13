void main()
{
    int nth,bGender;
    effect iEffect;
    location lPC;
    object oEmote,oPC,oArea;

    oPC = OBJECT_SELF;
    lPC = GetLocation(oPC);
    iEffect = EffectAreaOfEffect(AOE_PER_FOGFIRE );
    bGender = GetGender(oPC);
    oArea = GetArea(oPC);

    CreateObject(OBJECT_TYPE_PLACEABLE,"ew_plc",lPC,FALSE);
    ActionWait(3.0);
//    oEmote = GetNearestObjectByTag("ew_plc",oPC,1);
//    SetLocalObject(oPC,"ew_plc",oEmote);

    if(bGender == TRUE) {
        PlayVoiceChat(VOICE_CHAT_GATTACK1 ,oPC);
    } else {
        PlayVoiceChat(VOICE_CHAT_GATTACK3 ,oPC);
    }

    AssignCommand(oPC,PlayAnimation(ANIMATION_FIREFORGET_BOW,4.0,0.2));
//    SetLocalObject(oEmote,"ew_pc",OBJECT_SELF);
//    SignalEvent(oEmote,EventUserDefined(1000));

    nth=nth+1;
    object oPoorGuy = GetNearestObject( OBJECT_TYPE_CREATURE,oPC,nth);
    while(nth<10) {
        if(GetIsPC(oPoorGuy) != TRUE && GetDistanceToObject(oPoorGuy)<10.0) {
            AssignCommand(oPoorGuy,ClearAllActions(TRUE));
            AssignCommand(oPoorGuy, ActionMoveAwayFromObject(oPC,FALSE,10.0));
            AssignCommand(oPoorGuy, ActionMoveToObject(GetNearestObjectByTag("POST_" + GetTag(oPoorGuy))));
            AssignCommand(oPoorGuy, ActionJumpToObject(GetNearestObjectByTag("POST_" + GetTag(oPoorGuy))));
        }
        nth++;
        oPoorGuy = GetNearestObject( OBJECT_TYPE_CREATURE,oPC,nth);
    }
}


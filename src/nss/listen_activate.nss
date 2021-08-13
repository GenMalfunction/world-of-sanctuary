void main()
{
    object oPlayer = GetItemActivator();
    object oItem = GetItemActivated();
    if(GetResRef(oItem) == "createlistener")
    {
        if(GetLocalObject(oPlayer, "Listener")!= OBJECT_INVALID){ SendMessageToPC(oPlayer, "You already have a listener"); return;}
        object oListener = CreateObject(OBJECT_TYPE_CREATURE, "listener", GetLocation(oPlayer));
        SetLocalObject(oListener, "Master", oPlayer);
        SetLocalObject(oPlayer, "Listener", oListener);
        effect eInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY); // players shouldn't see their listener
        effect eEther = EffectEthereal();  // prevents monsters attacking the listener
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eInvis, oListener, 999999.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEther, oListener, 999999.0);
        AssignCommand(oListener, ActionForceFollowObject(oPlayer));
        SetListening(oListener, TRUE);
        SetListenPattern(oListener, "**::**", 5432);
    }
}

void main()
{
    object PC = GetLastSpeaker();
    PlayVoiceChat(VOICE_CHAT_HELLO, OBJECT_SELF);
    ActionMoveToObject(GetNearestObjectByTag("POST_" + GetTag(OBJECT_SELF)));
    ActionJumpToObject(GetNearestObjectByTag("POST_" + GetTag(OBJECT_SELF)));
    object store = GetObjectByTag(GetTag(OBJECT_SELF) + "_merch");
    OpenStore(store, PC);
}

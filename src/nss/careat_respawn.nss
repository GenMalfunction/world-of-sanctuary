//::///////////////////////////////////////////////
//:: Name       Braneloc's Respawn Script
//:: FileName   respawn_later
//:://////////////////////////////////////////////

void CreateCreature(string sTemplate, location locHere)
{
     CreateObject( OBJECT_TYPE_CREATURE, sTemplate, locHere);
}
void CreateThing(string sTemplate, int type, location locHere)
{
     CreateObject(type, sTemplate, locHere);
}

void main()
{
    int iUD = GetUserDefinedEventNumber();

    if (iUD == 1007)
    {
        string name;
        string tag;
        object spn;
        location loc;
        object test;

        tag=GetTag(OBJECT_SELF);
        loc=GetLocalLocation(OBJECT_SELF,"spawn");
        int what=GetObjectType(OBJECT_SELF);
        if (what==OBJECT_TYPE_CREATURE)
            {
            PlayVoiceChat(VOICE_CHAT_DEATH);
            ActionSpeakString("AAWW SHIT!!!");
            }
        AssignCommand(GetArea(OBJECT_SELF), DelayCommand(60.0,CreateThing(tag,what,loc)));
    }
}

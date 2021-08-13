void main()
{
BeginConversation ("rock3",GetLastUsedBy());
ActionWait (3.0);

ActionStartConversation(GetLastUsedBy(),"rock3");
}

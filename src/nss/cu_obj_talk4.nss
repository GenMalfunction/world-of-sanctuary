void main()
{
BeginConversation ("rock2",GetLastUsedBy());
ActionWait (3.0);

ActionStartConversation(GetLastUsedBy(),"rock2");
}

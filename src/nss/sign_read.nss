void main()
{
SpeakString("You have acquired a rulebook, please read through it before joining either team.");
CreateItemOnObject("rulebook", GetLastUsedBy(), 1);
CreateItemOnObject("ctfrules", GetLastUsedBy(), 1);
CreateItemOnObject("kothrules", GetLastUsedBy(), 1);
}

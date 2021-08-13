int StartingConditional()
{
string sQuestType = GetLocalString(OBJECT_SELF,"QuestType");
if (TestStringAgainstPattern("Murder",sQuestType))
    {
    return TRUE;
    }
else return FALSE;
}

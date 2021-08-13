int StartingConditional()
{
string sQuestType = GetLocalString(OBJECT_SELF,"QuestType");
if (TestStringAgainstPattern("Fetch",sQuestType))
    {
    return TRUE;
    }
else return FALSE;
}

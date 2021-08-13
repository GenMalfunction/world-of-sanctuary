int StartingConditional()
{
string sQuestType = GetLocalString(OBJECT_SELF,"QuestType");
if (TestStringAgainstPattern("Search",sQuestType))
    {
    return TRUE;
    }
else return FALSE;
}

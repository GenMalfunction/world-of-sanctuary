int StartingConditional()
{
string sQuestType = GetLocalString(OBJECT_SELF,"QuestType");
if (TestStringAgainstPattern("Gopher",sQuestType))
    {
    return TRUE;
    }
else return FALSE;
}

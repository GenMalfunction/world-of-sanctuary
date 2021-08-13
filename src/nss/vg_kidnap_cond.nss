int StartingConditional()
{
string sQuestType = GetLocalString(OBJECT_SELF,"QuestType");
if (TestStringAgainstPattern("Kidnapping",sQuestType))
    {
    return TRUE;
    }
else return FALSE;
}

int StartingConditional()
{
string sQuestType = GetLocalString(OBJECT_SELF,"QuestType");
if (TestStringAgainstPattern("Robbery",sQuestType))
    {
    return TRUE;
    }
else return FALSE;
}

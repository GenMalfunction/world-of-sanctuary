int StartingConditional()
{
if(!(GetLocalInt(GetPCSpeaker(), "nFirstTimeTalkedGandalf") == 1))
  return FALSE;

return TRUE;
}

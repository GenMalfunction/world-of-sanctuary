int StartingConditional()
{
if(!(GetLocalInt(GetPCSpeaker(), "nFirstTimeTalkedLegolas") == 1))
  return FALSE;

return TRUE;
}

int StartingConditional()
{
if(!(GetLocalInt(GetPCSpeaker(), "nFirstTimeTalkedAragorn") == 1))
  return FALSE;

return TRUE;
}

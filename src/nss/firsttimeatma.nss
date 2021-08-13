int StartingConditional()
{
if(!(GetLocalInt(GetPCSpeaker(), "nFirstTimeTalkedAtma") == 0))
  return FALSE;

return TRUE;
}

int StartingConditional()
{
if(!(GetLocalInt(GetPCSpeaker(), "nFirstTimeTalkedKashya") == 0))
  return FALSE;

return TRUE;
}

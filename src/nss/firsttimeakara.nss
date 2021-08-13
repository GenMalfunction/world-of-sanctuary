int StartingConditional()
{
if(!(GetLocalInt(GetPCSpeaker(), "nFirstTimeTalkedAkara") == 0))
  return FALSE;
return TRUE;
}

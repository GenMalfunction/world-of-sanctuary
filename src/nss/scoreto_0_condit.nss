//////////////////////
//StartingConditional If Its Dm (For set Score to 0)
//scripted by :Butcha
//////////////////////

int StartingConditional()
{
int iResult;
object oPC = GetLastSpeaker();
iResult = GetIsDM(oPC);
return iResult;
}

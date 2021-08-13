///////////////////////////
//Player Location & Info
//Scripted by:Butcha
/////////////////////////
string Playerlist()
{
object oPC       = GetFirstPC();
string Say = "  Player Info  ";
Say+= "\n";
while (oPC != OBJECT_INVALID)
{
object oArea     = GetArea(oPC);
int i_HpLaft     = GetCurrentHitPoints(oPC);
int i_MaxHp      = GetMaxHitPoints(oPC);
int i_Ac         = GetAC(oPC);
string Sarea     = GetTag(oArea);
string Sname     = GetName(oPC);
string Sname2    = GetPCPlayerName(oPC);
string S_HpLaft  = IntToString(i_HpLaft);
string S_MaxHp   = IntToString(i_MaxHp);
string S_Ac      = IntToString(i_Ac);
Say += "<cêç>-----------------------------";
Say += "\n";
Say += "<cõ>Name: <c{>"+Sname;
Say += "\n";
Say += "<cõ>Acc:  <c……Œ>"+Sname2;
Say += "\n";
Say += "<cõ>Hp:   <cÜ~>"+S_HpLaft+"<c……Œ>/<cÜ>"+S_MaxHp;
Say += "\n";
Say += "<cõ>Ac:   <cš¡>"+S_Ac;
Say += "\n";
Say += "<cõ>Location: <cööö>"+Sarea;
Say += "\n";
Say += "<cêç>-----------------------------";
Say += "\n";
Say += "\n";
oPC  = GetNextPC();
}
return Say;
}
void main()
{
object oPC = GetPCSpeaker();
string sPlayerlist = Playerlist();
SetCustomToken(1000, sPlayerlist);
}



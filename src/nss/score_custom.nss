//////////////////////////////////
//Custom Player Score
//Scripted By:Butcha
/////////////////////////////////
string Score()
{
object oPlayer = GetFirstPC();
int iDied;
int iKilled;
int iKilledPerfeckt;
int iOwned;
string SpeakText = "<c�>Kills<c���> / <c�~>Perfeckts<c���> / <c���>Deaths<c���> / <c��>Owned";
while (GetIsPC(oPlayer) == TRUE)
{
iDied =  GetCampaignInt("PointScore","iDied",oPlayer);
iKilled =  GetCampaignInt("PointScore","iKilled",oPlayer);
iKilledPerfeckt = GetCampaignInt("PointScore","iKilledPerfeckt",oPlayer);
iOwned = GetCampaignInt("PointScore","iOwned",oPlayer);
SpeakText += "\n";
SpeakText += "<c��>-----------------------------";
SpeakText += "\n";
SpeakText += "<c�>Name: <c��>"+GetName(oPlayer);
SpeakText += "\n";
SpeakText += "<c�>Score: <c�>"+IntToString(iKilled)+"<c���>/<c�~>"+IntToString(iKilledPerfeckt)+"<c���>/<c���>"+IntToString(iDied)+"<c���>/<c��>"+IntToString(iOwned);
SpeakText += "\n";
SpeakText += "<c��>-----------------------------";
SpeakText += "\n";
oPlayer = GetNextPC();
}
return SpeakText;
}
void main()
{
object oPC = GetPCSpeaker();
string sPlayerlist = Score();
SetCustomToken(1001, sPlayerlist);
}

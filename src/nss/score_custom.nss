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
string SpeakText = "<cç>Kills<c‚‚‚> / <cÊ~>Perfeckts<c‚‚‚> / <cññõ>Deaths<c‚‚‚> / <c¡¶>Owned";
while (GetIsPC(oPlayer) == TRUE)
{
iDied =  GetCampaignInt("PointScore","iDied",oPlayer);
iKilled =  GetCampaignInt("PointScore","iKilled",oPlayer);
iKilledPerfeckt = GetCampaignInt("PointScore","iKilledPerfeckt",oPlayer);
iOwned = GetCampaignInt("PointScore","iOwned",oPlayer);
SpeakText += "\n";
SpeakText += "<cÙÒ>-----------------------------";
SpeakText += "\n";
SpeakText += "<cî>Name: <cîî>"+GetName(oPlayer);
SpeakText += "\n";
SpeakText += "<cî>Score: <cç>"+IntToString(iKilled)+"<c‚‚‚>/<cÊ~>"+IntToString(iKilledPerfeckt)+"<c‚‚‚>/<cññõ>"+IntToString(iDied)+"<c‚‚‚>/<c¡¶>"+IntToString(iOwned);
SpeakText += "\n";
SpeakText += "<cÙÒ>-----------------------------";
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

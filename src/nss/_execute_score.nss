void main()
{
object oKiller = GetLastKiller();
int MaxHp = GetMaxHitPoints(oKiller);
if(GetIsPC(oKiller) == TRUE)
{
int iKilled = GetCampaignInt("PointScore","iKilled",oKiller);
++iKilled;
SetCampaignInt("PointScore","iKilled",iKilled,oKiller);
}
if(GetIsPC(oKiller)&&(GetCurrentHitPoints(oKiller)== MaxHp))
{
int iKilledPerfeckt = GetCampaignInt("PointScore","iKilledPerfeckt",oKiller);
++iKilledPerfeckt;
SetCampaignInt("PointScore","iKilledPerfeckt",iKilledPerfeckt,oKiller);
}
}

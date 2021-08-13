void main()
{
        object oPC = GetLastSpeaker();

        AdjustReputation(oPC, GetObjectByTag("goodfaction"),1000);
        AdjustReputation(oPC, GetObjectByTag("evilfaction"),-100);

}

void main()
{
 object LeavingChar = GetExitingObject();
 int curHP = GetCurrentHitPoints(LeavingChar);

if(curHP >= 0)
{
   int deathSwitch;
   SetLocalInt(LeavingChar,"deathSwitch", 0);

}
if(curHP < 0)
{
   int deathSwitch;
   SetLocalInt(LeavingChar,"deathSwitch", 2);
}

}

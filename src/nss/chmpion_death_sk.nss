void main()
{
object oKiller = GetLastKiller();
object oMaster = GetMaster(oKiller);
object oItem;
string sItem1 = "gaxe1";
string sItem2 = "axe0";
string sItem3 = "mstar1";
string sItem4 = "blunt02";
string sItem5 = "blunt1";
string sItem6 = "blunt01";
string sItem7 = "sword01";
string sItem8 = "kata02";
string sItem9 = "kata01";
string sItem10 = "rape02";
string sItem11 = "rape01";
string sItem12 = "lsword2";
string sItem13 = "sword0";
string sItem14 = "great2";
string sItem15 = "great3";
string sItem16 = "bast5";
string sItem17 = "2handaxe1";
string sItem18 = "gaxe3";
string sItem19 = "axe1";
string sItem20 = "wdbmsw011";
int iKillerLevel = GetHitDice(oKiller);
  float fDeadLevel = GetChallengeRating(OBJECT_SELF);
  float fGold = (fDeadLevel*100);
  float fXP = ((fDeadLevel/iKillerLevel)*200);
    int iGold = FloatToInt(fGold);
    int iXP = FloatToInt(fXP);
 if (GetIsPC(oKiller)==TRUE)
 {
GiveGoldToCreature(oKiller, iGold);
GiveXPToCreature (oKiller, iXP);
 switch(Random(20))
 {
case 0: oItem = CreateItemOnObject(sItem1,oKiller,1);
break;
case 1: oItem = CreateItemOnObject(sItem2,oKiller,1);
break;
case 2: oItem = CreateItemOnObject(sItem3,oKiller,1);
break;
case 3: oItem = CreateItemOnObject(sItem4,oKiller,1);
break;
case 4: oItem = CreateItemOnObject(sItem5,oKiller,1);
break;
case 5: oItem = CreateItemOnObject(sItem6,oKiller,1);
break;
case 6: oItem = CreateItemOnObject(sItem7,oKiller,1);
break;
case 7: oItem = CreateItemOnObject(sItem8,oKiller,1);
break;
case 8: oItem = CreateItemOnObject(sItem9,oKiller,1);
break;
case 9: oItem = CreateItemOnObject(sItem10,oKiller,1);
break;
case 10: oItem = CreateItemOnObject(sItem11,oKiller,1);
break;
case 11: oItem = CreateItemOnObject(sItem12,oKiller,1);
break;
case 12: oItem = CreateItemOnObject(sItem13,oKiller,1);
break;
case 13: oItem = CreateItemOnObject(sItem14,oKiller,1);
break;
case 14: oItem = CreateItemOnObject(sItem15,oKiller,1);
break;
case 15: oItem = CreateItemOnObject(sItem16,oKiller,1);
break;
case 16: oItem = CreateItemOnObject(sItem17,oKiller,1);
break;
case 17: oItem = CreateItemOnObject(sItem18,oKiller,1);
break;
case 18: oItem = CreateItemOnObject(sItem19,oKiller,1);
break;
case 19: oItem = CreateItemOnObject(sItem20,oKiller,1);
break;
}
}
else if (GetIsPC(oKiller)==FALSE)
 {
GiveGoldToCreature(oMaster, iGold);
GiveXPToCreature (oMaster, iXP);
 switch(Random(20))
 {
case 0: oItem = CreateItemOnObject(sItem1,oKiller,1);
break;
case 1: oItem = CreateItemOnObject(sItem2,oKiller,1);
break;
case 2: oItem = CreateItemOnObject(sItem3,oKiller,1);
break;
case 3: oItem = CreateItemOnObject(sItem4,oKiller,1);
break;
case 4: oItem = CreateItemOnObject(sItem5,oKiller,1);
break;
case 5: oItem = CreateItemOnObject(sItem6,oKiller,1);
break;
case 6: oItem = CreateItemOnObject(sItem7,oKiller,1);
break;
case 7: oItem = CreateItemOnObject(sItem8,oKiller,1);
break;
case 8: oItem = CreateItemOnObject(sItem9,oKiller,1);
break;
case 9: oItem = CreateItemOnObject(sItem10,oKiller,1);
break;
case 10: oItem = CreateItemOnObject(sItem11,oKiller,1);
break;
case 11: oItem = CreateItemOnObject(sItem12,oKiller,1);
break;
case 12: oItem = CreateItemOnObject(sItem13,oKiller,1);
break;
case 13: oItem = CreateItemOnObject(sItem14,oKiller,1);
break;
case 14: oItem = CreateItemOnObject(sItem15,oKiller,1);
break;
case 15: oItem = CreateItemOnObject(sItem16,oKiller,1);
break;
case 16: oItem = CreateItemOnObject(sItem17,oKiller,1);
break;
case 17: oItem = CreateItemOnObject(sItem18,oKiller,1);
break;
case 18: oItem = CreateItemOnObject(sItem19,oKiller,1);
break;
case 19: oItem = CreateItemOnObject(sItem20,oKiller,1);
break;
 }
}
}

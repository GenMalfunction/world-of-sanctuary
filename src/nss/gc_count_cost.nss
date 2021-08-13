//Script Name: gc_count_cost
//////////////////////////////////////////
//Created By: Genisys (Guile)
//Created On: 9/11/08
/////////////////////////////////////////
/*
This script goes in the ActionTaken
Event of a Conversation line, it will
determine the cost of the item after
the property would be added..
*/
////////////////////////////////////////

///////////////PLOT ITEM CONTROL SWITCH///////////////////

//Set this to FALSE to NOT allow Plot items to be crafted.
const int nPlot = FALSE; //Default = TRUE (allow plot items)

////////////////COST CONTROL SWITCH////////////////////////
//This is the control of the cost of crafting..
// 0.01 = 1% / 0.1 = 10 % / 1.5 = 150% / 3.0 = 300%
//Set the float below to the % you want crafting to cost..
//This is NOT per D&D Rules, adjust it to suit your module.

const float fMC = 3.0; // 1.0 = normal cost (default)

//NOTE: 740,000 = The Max Forge Cost (To add 1 Property)
//& 1000 = The Minimum Forge Cost. (To add 1 Property)
//Item's current level and the property chosen effects cost

//NOTE: Max cost averages around 300 - 400,000 Gold
// (If the property selected isn't TOO powerful..

///////////////MAX ITEM LEVEL CONTROL SWITCH///////////////

//Set the # below to the max level allowed to be crafted.
//NOTE: Level is calculated BEFORE modifications, so if you
//set this to 20 and the player adds a powerful property to
//say a level 19 item, it could become a level 21-25 item!
//Therefore, make sure you keep this in mind when adjusting!
//NOTE: (2 - 39 = Are the Acceptable Settings)

const int nMax = 39; //39 = Default (Maximum Setting)

///////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////
//////////WARNING: DO NOT TOUCH ANYTHING BELOW THIS LINE!///////
////////////////////////////////////////////////////////////////

//Main Script
void main()
{
object oPC = GetPCSpeaker();

int nSlot = GetLocalInt(oPC, "CRAFT_SLOT");
object oCraft = GetItemInSlot(nSlot, oPC);

if (!GetIsObjectValid(oCraft))
{
 FloatingTextStringOnCreature("You must be wearing the item to craft it!", oPC, FALSE);
 AssignCommand(oPC, ClearAllActions());
 return;
}

//Do we allow plot items to be forged or not?
if (nPlot == FALSE)
{
 if(GetPlotFlag(oCraft)==TRUE)
 {
 FloatingTextStringOnCreature("You cannot forge a plot item!", oPC, FALSE);
 AssignCommand(oPC, ClearAllActions());
 return;
 }
}

//The new cost..
int nNewPrice;
int nRandom;
int nTotal;
string sNewCost;

//Reset the Gold check on the PC
SetLocalInt(oPC, "BROKE_JOKE", 0);

//Get the Cost Multiplier..
float fCost = GetLocalFloat(oPC, "COST_TOTAL");

if(fCost>10.0)
{
fCost = 10.0;
}

//Covert the Float Cost Multiplier to an Intergal (Round up!)

int nMC;    //Multiplier of Cost
float fNMC; //New Multiplier of Cost
float fNMA; //New Multiplier Adjustment
float fAMC; //Adjusted Max Cost

//The Currrent Gold Piece Value of the Item..
int nCost = GetGoldPieceValue(oCraft);
int gp = nCost;
int nGp;
int nLevel;
    //Return the level..
    if (gp<1000)
        nLevel= 1;
    if (gp>1000 && gp<1500)
        nLevel= 2;
    if (gp>1499 && gp<2500)
        nLevel= 3;
    if (gp>2499 && gp<3500)
        nLevel= 4;
    if (gp>3499 && gp<5000)
        nLevel= 5;
    if (gp>4999 && gp<7000)
        nLevel= 6;
    if (gp>6999 && gp<9000)
        nLevel= 7;
    if (gp>8999 && gp<12000)
        nLevel= 8;
    if (gp>11999 && gp<15000)
        nLevel= 9;
    if (gp>14999 && gp<20000)
        nLevel= 10;
    if (gp>19999 && gp<25000)
        nLevel= 11;
    if (gp>24999 && gp<30000)
        nLevel= 12;
    if (gp>29999 && gp<35000)
        nLevel= 13;
    if (gp>34999 && gp<40000)
        nLevel= 14;
    if (gp>39999 && gp<50000)
        nLevel= 15;
    if (gp>49999 && gp<65000)
        nLevel= 16;
    if (gp>64000 && gp<75000)
        nLevel= 17;
    if (gp>74999 && gp<90000)
        nLevel= 18;
    if (gp>89999 && gp>110000)
        nLevel= 19;
    if (gp>109999 && gp<130000)
        nLevel= 20;
    if (gp>129999 && gp<250000)
        nLevel= 21;
    if (gp>249999 && gp<500000)
        nLevel= 22;
    if (gp>499999 && gp<750000)
        nLevel= 23;
    if (gp>749999 && gp<1000000)
        nLevel= 24;
    if (gp>999999 && gp<1200000)
        nLevel = 25;
    if (gp>1999999 && gp<1400000)
        nLevel = 26;
    if (gp>1399999 && gp<1600000)
        nLevel = 27;
    if (gp>1599999 && gp<1800000)
        nLevel = 28;
    if (gp>1799999 && gp<2000000)
        nLevel = 29;
    if (gp>1999999 && gp<2200000)
        nLevel = 30;
    if (gp>2199999 && gp<2400000)
        nLevel = 31;
    if (gp>2399999 && gp<2600000)
        nLevel = 32;
    if (gp>2599999 && gp<2800000)
        nLevel = 33;
    if (gp>2799999 && gp<3000000)
        nLevel = 34;
    if (gp>2999999 && gp<3200000)
        nLevel = 35;
    if (gp>3199999 && gp<3400000)
        nLevel = 36;
    if (gp>3399999 && gp<3600000)
        nLevel = 37;
    if (gp>3599999 && gp<3800000)
        nLevel = 38;
    if (gp>3799999 && gp<4000000)
        nLevel = 39;
    if (gp>3999999)
        nLevel = 40;

string sLevel = IntToString(nLevel);
SetCustomToken(3331, sLevel);

int nCCM;


//Determine the cost of the upgrade depending upon the value of the item..
if(fCost <1.0)
{
 nNewPrice = 500;
 nRandom = d100(5); //+ Random 500 Gold
 nTotal = nNewPrice + nRandom; //Current Cost
 nCost = nLevel * nTotal; //(Cost * Level of Item)
 sNewCost = IntToString(nCost);
 SetCustomToken(3330, sNewCost);
}
else if(fCost <2.0 && fCost >=1.0)
{
 nNewPrice = 1000;
 nRandom = d100(5); //+ Random 500 Gold
 nTotal = nNewPrice + nRandom; //Current Cost
 nCost = nLevel * nTotal; //(Cost * Level of Item)
 sNewCost = IntToString(nCost);
 SetCustomToken(3330, sNewCost);
}
else if(fCost <3.0 && fCost >=2.0)
{
 nNewPrice = 2000;
 nRandom = d100(10); //+ Random 1000 Gold
 nTotal = nNewPrice + nRandom; //Current Cost
 nCost = nLevel * nTotal; //(Cost * Level of Item)
 sNewCost = IntToString(nCost);
 SetCustomToken(3330, sNewCost);
}
else if(fCost <4.0 && fCost >=3.0)
{
 nNewPrice = 4000;
 nRandom = d100(10); //+ Random 1000 Gold
 nTotal = nNewPrice + nRandom; //Current Cost
 nCost = nLevel * nTotal; //(Cost * Level of Item)
 sNewCost = IntToString(nCost);
 SetCustomToken(3330, sNewCost);
}
else if(fCost <5.0 && fCost >=4.0)
{
 nNewPrice = 6000;
 nRandom = d100(10); //+ Random 1000 Gold
 nTotal = nNewPrice + nRandom; //Current Cost
 nCost = nLevel * nTotal; //(Cost * Level of Item)
 sNewCost = IntToString(nCost);
 SetCustomToken(3330, sNewCost);
}
else if(fCost <6.0 && fCost >=5.0)
{
 nNewPrice = 9000;
 nRandom = d100(10); //+ Random 1000 Gold
 nTotal = nNewPrice + nRandom; //Current Cost
 nCost = nLevel * nTotal; //(Cost * Level of Item)
 sNewCost = IntToString(nCost);
 SetCustomToken(3330, sNewCost);
}
else if(fCost <7.0 && fCost >=6.0)
{
 nNewPrice = 12000;
 nRandom = d100(10); //+ Random 1000 Gold
 nTotal = nNewPrice + nRandom; //Current Cost
 nCost = nLevel * nTotal; //(Cost * Level of Item)
 sNewCost = IntToString(nCost);
 SetCustomToken(3330, sNewCost);
}
else if(fCost <8.0 && fCost >=7.0)
{
 nNewPrice = 20000;
 nRandom = d100(10); //+ Random 1000 Gold
 nTotal = nNewPrice + nRandom; //Current Cost
 nCost = nLevel * nTotal; //(Cost * Level of Item)
 sNewCost = IntToString(nCost);
 SetCustomToken(3330, sNewCost);
}
else if(fCost <9.0 && fCost >=8.0)
{
 nNewPrice = 40000;
 nRandom = d100(15); //+ Random 1500 Gold
 nTotal = nNewPrice + nRandom;
 nTotal = nNewPrice + nRandom; //Current Cost
 nCost = nLevel * nTotal; //(Cost * Level of Item)
 sNewCost = IntToString(nCost);
 SetCustomToken(3330, sNewCost);
}

else if(fCost <10.0 && fCost >=9.0)
{
 nNewPrice = 60000;
 nRandom = d100(15); //+ Random 1500 Gold
 nTotal = nNewPrice + nRandom; //Current Cost
 nCost = nLevel * nTotal; //(Cost * Level of Item)
 sNewCost = IntToString(nCost);
 SetCustomToken(3330, sNewCost);
}

//Otherwise it must be Greather than or Equal to 10.0

//Max Cost.. 38,000 Gold + 2000 (Random) /Per Upgrade!
else
{

 nNewPrice = 80000;
 nRandom = d100(20); //+ Random 2000 Gold
 nTotal = nNewPrice + nRandom; //Current Cost
 nCost = nLevel * nTotal; //(Cost * Level of Item)
 sNewCost = IntToString(nCost);
 SetCustomToken(3330, sNewCost);
}

int nPCGold = GetGold(oPC);

//If the PC Doesn't have enough gold, tell the conversation..
if(nCost>nPCGold)
{
 SetLocalInt(oPC, "BROKE_JOKE", 2);
}

SetLocalInt(oPC, "CRAFT_PAYMENT", nCost);

AssignCommand(OBJECT_SELF, ActionPauseConversation());
DelayCommand(2.0, AssignCommand(OBJECT_SELF, ActionResumeConversation()));

//Main Script End
}

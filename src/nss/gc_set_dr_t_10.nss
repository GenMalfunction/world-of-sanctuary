void main()
{
 float nCost = GetLocalFloat(GetPCSpeaker(), "COST_TOTAL");
 nCost +=2.0; //Add + 2
 SetLocalFloat(GetPCSpeaker(), "COST_TOTAL", nCost);
 SetLocalInt(GetPCSpeaker(), "CRAFT_DR_AMOUNT", IP_CONST_DAMAGESOAK_10_HP);
}

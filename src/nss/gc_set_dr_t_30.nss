void main()
{
 float nCost = GetLocalFloat(GetPCSpeaker(), "COST_TOTAL");
 nCost +=6.0; //Add + 6
 SetLocalFloat(GetPCSpeaker(), "COST_TOTAL", nCost);
 SetLocalInt(GetPCSpeaker(), "CRAFT_DR_AMOUNT", IP_CONST_DAMAGESOAK_30_HP);
}

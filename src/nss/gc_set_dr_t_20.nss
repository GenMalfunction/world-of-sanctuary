void main()
{
 float nCost = GetLocalFloat(GetPCSpeaker(), "COST_TOTAL");
 nCost +=4.0; //Add + 4
 SetLocalFloat(GetPCSpeaker(), "COST_TOTAL", nCost);
 SetLocalInt(GetPCSpeaker(), "CRAFT_DR_AMOUNT", IP_CONST_DAMAGESOAK_20_HP);
}

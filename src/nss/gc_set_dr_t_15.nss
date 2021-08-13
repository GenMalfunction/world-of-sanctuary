void main()
{
 float nCost = GetLocalFloat(GetPCSpeaker(), "COST_TOTAL");
 nCost +=3.0; //Add + 3
 SetLocalFloat(GetPCSpeaker(), "COST_TOTAL", nCost);
 SetLocalInt(GetPCSpeaker(), "CRAFT_DR_AMOUNT", IP_CONST_DAMAGESOAK_15_HP);
}

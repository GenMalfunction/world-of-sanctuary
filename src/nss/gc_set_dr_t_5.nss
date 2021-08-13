void main()
{
 float nCost = GetLocalFloat(GetPCSpeaker(), "COST_TOTAL");
 nCost +=1.0; //Add + 1
 SetLocalFloat(GetPCSpeaker(), "COST_TOTAL", nCost);
 SetLocalInt(GetPCSpeaker(), "CRAFT_DR_AMOUNT", IP_CONST_DAMAGESOAK_5_HP);
}

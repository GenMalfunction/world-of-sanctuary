//Ben W-Husey, October 2002
// Set a local integer on entering PC

void main()
{
     object oPC = GetEnteringObject();
      if(GetIsPC(oPC))
      {
      SetLocalInt(oPC, "nFloor", 1);
      }
}

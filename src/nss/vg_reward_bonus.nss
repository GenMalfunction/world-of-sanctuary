void main()
{
object oPC = GetPCSpeaker();
int iRandomGold = d10();
GiveGoldToCreature(oPC,iRandomGold);

int iRandomXP = d20();
GiveXPToCreature(oPC,iRandomXP);
}

void main()
{
object oPC = GetPCSpeaker();

int iRandomGold = d10(100000);
int iGP = 1000000+iRandomGold;
GiveGoldToCreature(oPC,iGP);

int iRandomXP = d20(2);
int iXP = 5000+iRandomXP;
GiveXPToCreature(oPC,iXP);
}

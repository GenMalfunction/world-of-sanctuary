void main()
{
object oPC = GetPCSpeaker();

int iRandomGold = d10(10000);
int iGP = 100000+iRandomGold;
GiveGoldToCreature(oPC,iGP);

int iRandomXP = d20(2);
int iXP = 2000+iRandomXP;
GiveXPToCreature(oPC,iXP);
}

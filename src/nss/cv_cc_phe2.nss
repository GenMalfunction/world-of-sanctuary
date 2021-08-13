// norm pheno
void main()
{
    object oPC = GetPCSpeaker();
    SendMessageToPC(oPC, "Large Phenotype Selected.");
    SetPhenoType(PHENOTYPE_BIG, oPC);
}


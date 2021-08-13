// norm pheno
void main()
{
    object oPC = GetPCSpeaker();
    SendMessageToPC(oPC, "Normal Phenotype Selected.");
    SetPhenoType(PHENOTYPE_NORMAL, oPC);
}


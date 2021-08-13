void main()
{
    object PC = GetLastUsedBy();
    if (GetIsObjectValid(PC)== TRUE) {
        ExecuteScript("whostone", PC);
    }
}

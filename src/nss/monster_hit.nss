void main()
{
    if (GetCurrentHitPoints() < 260) SetImmortal(OBJECT_SELF, FALSE);
    ExecuteScript("nw_c2_default5", OBJECT_SELF);
}

void clean(object area)
{
    int pcnt = 0;
    float delay = 2.0;
    string atag = GetTag(area);
    object tst = GetFirstPC();
    while(tst != OBJECT_INVALID) {
        if (atag == GetTag(GetArea(tst))) pcnt++;
        tst = GetNextPC();
    }
    if (pcnt == 0) {
        tst = GetFirstObjectInArea(area);
        effect eEffect=EffectDeath(TRUE,TRUE);
        while(tst != OBJECT_INVALID) {
            if (GetObjectType(tst) == OBJECT_TYPE_CREATURE) {
                SetImmortal(tst, FALSE);
                DelayCommand(delay, ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,tst));
                delay += 0.1;
//                DestroyObject(tst, 1.0);
            }
            tst = GetNextObjectInArea(area);
        }
     }
}

void ClearEffect(object PC)
{
    effect eEffect = GetFirstEffect(PC);
    while ( GetIsEffectValid(eEffect) == TRUE ) {
       if ( GetEffectSubType(eEffect) == SUBTYPE_EXTRAORDINARY) RemoveEffect(PC,eEffect);
       eEffect = GetNextEffect(PC);
    }
}

void KillMonster(object area, object mon)
{
    if (GetTag(area) != GetTag(GetArea(mon))) {
        effect eEffect=EffectDeath(TRUE,TRUE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, mon);

    }
}

void main()
{
    object area = OBJECT_SELF;
    object PC = GetExitingObject();
    if (GetIsPC(PC) != TRUE) {
        SetImmortal(PC, FALSE);
        DelayCommand(15.0, KillMonster(area, PC));
    } else {
        if (GetLocalInt(PC, "qhit") != 0) {
            DeleteLocalInt(PC, "qhit");
            ClearEffect(PC);
        }
        ClearEffect(PC);
        DelayCommand(20.0, clean(area));
    }
}

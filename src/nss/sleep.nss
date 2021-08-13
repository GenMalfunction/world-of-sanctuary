void main()
{
    float dir = GetFacing(OBJECT_SELF);
    vector vect = GetPosition(OBJECT_SELF);
    object oPC = GetLastUsedBy();
    effect eEffect = EffectVisualEffect(VFX_IMP_SLEEP);
    if (dir < 85.0) {
        vect.x -= 0.5;
    } else if (dir < 175.0) {
        vect.y -= 0.5;
    } else if (dir < 265.0) {
        vect.x += 0.5;
    } else {
        vect.y += 0.5;
    }
    location loc = Location(GetArea(OBJECT_SELF), vect, dir - 180.0);
    DelayCommand(0.5, AssignCommand(oPC,ActionJumpToLocation(loc)));
//    DelayCommand(0.7, AssignCommand(oPC,SetFacing(dir)));
    DelayCommand(1.0, AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK,1.0,30000.0)));
    DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,oPC,1.0));
}

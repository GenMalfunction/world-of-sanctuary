//Script: chikendeath
void main()
{
    location lSource= GetLocation( OBJECT_SELF );
    ApplyEffectAtLocation( DURATION_TYPE_INSTANT, EffectVisualEffect( VFX_FNF_FIREBALL), lSource);
    object oObject = GetFirstObjectInShape( SHAPE_SPHERE, 30.0, lSource);
    while( oObject != OBJECT_INVALID && d12()!=1)
    {
        if(GetTag(oObject)!="NW_CHICKEN")
        {
            if(GetIsPC(oObject)==FALSE)
                ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectDamage(1, DAMAGE_TYPE_FIRE), oObject);
            oObject = GetNextObjectInShape( SHAPE_SPHERE, 30.0, lSource);
            continue;
        }
        if(GetLocalInt(oObject, "DeadChicken")==1)
        {
            oObject = GetNextObjectInShape( SHAPE_SPHERE, 30.0, lSource);
            continue;
        }
        if(Random(50)==47)
        {
            SetLocalInt( oObject, "DeadChicken", 1);
            ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectDamage(d6(2), DAMAGE_TYPE_FIRE), oObject);
            oObject = GetNextObjectInShape( SHAPE_SPHERE, 30.0, lSource);
            continue;
        }
        if(d6()==1)
        {
             SetLocalInt( oObject, "DeadChicken", 1);
             AssignCommand( oObject, DelayCommand(IntToFloat(Random(20)+3), ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectDamage(d6(2), DAMAGE_TYPE_FIRE), OBJECT_SELF)));
             oObject = GetNextObjectInShape( SHAPE_SPHERE, 30.0, lSource);
             continue;
        }
        oObject = GetNextObjectInShape( SHAPE_SPHERE, 30.0, lSource);
    }
}


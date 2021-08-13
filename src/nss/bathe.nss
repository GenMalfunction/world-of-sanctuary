object Seat;

int isSeatEmpty()
{
    object PC = GetSittingCreature(Seat);
    if (PC != OBJECT_INVALID) {
        if (GetCurrentAction(PC) != 37) {
            location loc = GetLocation(Seat);
            string ref = GetResRef(Seat);
            DestroyObject(Seat);
            Seat = CreateObject(OBJECT_TYPE_PLACEABLE, ref, loc);
            return TRUE;
        }
    } else {
        return TRUE;
    }
    return FALSE;
}

void main()
{
    object oPlayer = GetLastUsedBy();
    Seat = OBJECT_SELF;
    if (GetIsObjectValid(oPlayer)) {
        AssignCommand(oPlayer, ClearAllActions(TRUE));
        if (isSeatEmpty() == TRUE) {
            AssignCommand(oPlayer, ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_CHEST, oPlayer)));
            AssignCommand(oPlayer, ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_HEAD, oPlayer)));
            effect eEffect=EffectVisualEffect(263);
            DelayCommand(2.0,ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY,eEffect,GetLocation(OBJECT_SELF), 15.0));
            DelayCommand(4.0,ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY,eEffect,GetLocation(OBJECT_SELF), 15.0));
            DelayCommand(6.0,ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY,eEffect,GetLocation(OBJECT_SELF), 15.0));
            AssignCommand (oPlayer, ActionSit(Seat));
        }
    }
}


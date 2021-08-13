//::////////////////////////////////////////////
//:: Name:  s_cleartrash - Clear trash on ground
//::////////////////////////////////////////////
void DestroyAllItems();
int GetIsAreaOccupied(object oArea);
void main()
    {
    {
    DelayCommand(300.0, ExecuteScript("s_spawnclear2", OBJECT_SELF));
    DelayCommand(300.0, ExecuteScript("s_spawnclear", OBJECT_SELF));
    }
    if (!GetIsAreaOccupied(OBJECT_SELF) && GetIsPC(GetExitingObject()) && !GetLocalInt(GetArea(OBJECT_SELF), "SPAWN_CLEAR_OFF"))
        {
        float Wait = 10.0; // How many seconds to delay after PC has left area
        int Rounds = GetLocalInt(OBJECT_SELF, "PrepClean") + 1;
        /*
        Rounds counts how many times the delayed DestroyAllItems fires.
        This accounts for when a PC leaves and comes back and leaves again.
        */
        SetLocalInt(OBJECT_SELF, "PrepClean", Rounds);
        Rounds = GetLocalInt(OBJECT_SELF, "PrepClean");
        DelayCommand(Wait, DestroyAllItems());
        }
    }
void DestroyAllItems()
    {
    int Rounds = GetLocalInt(OBJECT_SELF, "PrepClean");
    if (!GetIsAreaOccupied(OBJECT_SELF))
        {
        // If this is in reaction to the most recent instance of a PC leaving the area, <span class="highlight">clean</span> up.
        if (Rounds == 1)
            {
            object oItem = GetFirstObjectInArea(OBJECT_SELF);
            // When an NPC dies, they drop an object, not an item... like a treasure chest.
            while (oItem != OBJECT_INVALID)
                {
                //
                if (GetTag(oItem) == "BodyBag")
                    {
                    object oLookIn = GetFirstItemInInventory(oItem);
                    // Destroy everything in it except plot items.
                    while (oLookIn != OBJECT_INVALID)
                        {
                        if (!GetPlotFlag(oLookIn))
                            DestroyObject(oLookIn);
                        oLookIn = GetNextItemInInventory(oItem);
                        }
                    }
                else if ((GetObjectType(oItem) == OBJECT_TYPE_ITEM) && (!GetPlotFlag(oItem)))
                    DestroyObject(oItem);
                oItem = GetNextObjectInArea(OBJECT_SELF);
                }
            SetLocalInt(OBJECT_SELF, "PrepClean", 0);
            }
        else
            {
            // If this is not from the most recent instance of a PC leaving an area, decriment.
            Rounds--;
            SetLocalInt(OBJECT_SELF, "PrepClean", Rounds);
            }
        }
    else
        {
        Rounds--;
        SetLocalInt(OBJECT_SELF, "PrepClean", Rounds);
        }
    }
/*
This function returns TRUE if oArea currently
has a PC in it and FALSE it doesn't.
*Note: Returns FALSE if oArea is not valid.
*/
int GetIsAreaOccupied(object oArea)
    {
    if (GetIsObjectValid(oArea))
        {
        object oPlayer = GetFirstPC();
        while ((GetArea(oPlayer) != oArea) && (oPlayer != OBJECT_INVALID))
            oPlayer = GetNextPC();
        if (oPlayer != OBJECT_INVALID)
            return TRUE;
        else
            return FALSE;
        }
    else
        return FALSE;
}

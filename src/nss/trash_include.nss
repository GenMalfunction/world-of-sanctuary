//
//      Braneloc's Trash Collectors.
//
//      Braneloc@mirex.demon.co.uk
//
#include "NW_I0_PLOT"

//      Finds the next bit of trash lying around.
object FindTrash(float range=9999.0);
//      Are we stuck in a loop looking for nothing ?
//      If so, reset.
void CheckStuck();
//      Look for anything to loot, and loot it !
void LootUp(float range=9999.0);
//      Gives all objects in inventory to target.
void GiveAll(object to);
//      debug
void debug(string whatever);
void debug(string whatever)
{
//    SpeakString(whatever);
}


void GiveAll(object to)
{    // dump the trash
     object item=GetFirstItemInInventory(OBJECT_SELF);
     while (GetIsObjectValid(item))
     {
        ActionGiveItem(item,to);
        item=GetNextItemInInventory(OBJECT_SELF);
     }

     int gold=GetGold(OBJECT_SELF);
     if (gold != 0)
     {
        GiveGoldToCreature(to,gold);
        TakeGold(gold,OBJECT_SELF,TRUE);
     }

     SetLocalInt(OBJECT_SELF,"mode",0);
}
void CheckStuck()
{
    // display what we were doing !
    debug("Mode "+IntToString(GetLocalInt(OBJECT_SELF,"mode")));
    // stuck doing something check
    if (GetLocalInt(OBJECT_SELF,"mode") != 0)
    {
        SetLocalInt(OBJECT_SELF,"ct",GetLocalInt(OBJECT_SELF,"ct") +1 );
    } else {
        SetLocalInt(OBJECT_SELF,"ct",0);
    }

    if (GetLocalInt(OBJECT_SELF,"ct") > 3)
    {
        SetLocalInt(OBJECT_SELF,"ct",0);
        SetLocalInt(OBJECT_SELF,"mode",0);
    }
}
object FindTrash(float range=9999.0)
{
    object obj;
    int type;
    int done=FALSE;
    object closest;

    obj=GetFirstObjectInArea();
    while (!done)
    {
        if (GetIsObjectValid(obj))
        {
            type=GetObjectType(obj);
            if (type==OBJECT_TYPE_ITEM)
            {
                // hey that was nice and easy.
                if (GetDistanceBetween(obj,OBJECT_SELF) < range)
                {
                    range=GetDistanceBetween(obj,OBJECT_SELF);
                    closest=obj;
                }
            }
            if (type==OBJECT_TYPE_PLACEABLE)
            {
                if (GetTag(obj) != "TRASH" &&
                    GetTag(obj) != "NEST" &&
                    GetHasInventory(obj))
                {
                    object inbag=GetFirstItemInInventory(obj);
                    if (GetIsObjectValid(inbag))
                    {
                        // found a bag, or something lootable.
                        // send back the BAG, not the obj in it !
                        if (GetDistanceBetween(obj,OBJECT_SELF) < range)
                        {
                            range=GetDistanceBetween(obj,OBJECT_SELF);
                            closest=obj;
                        }
                    }
                }
            }
            obj=GetNextObjectInArea();
        } else {
            return closest;
        }
    }
    return closest;
}

void LootUp(float range=9999.0)
{
    if (GetLocalInt(OBJECT_SELF,"loot")==1)
    {
        // sniff out regular items
        if (GetLocalInt(OBJECT_SELF,"mode") == 0)
        {
           object thing=FindTrash(range);
           if (GetIsObjectValid(thing))
           {
                debug("Getting "+GetName(thing));
                ActionMoveToObject(thing);
                if (GetObjectType(thing)==OBJECT_TYPE_ITEM)
                {
                    SetLocalInt(OBJECT_SELF,"mode",1);
                    ActionPickUpItem(thing);

                } else {
                    SetLocalInt(OBJECT_SELF,"mode",2);
                    object inbag=GetFirstItemInInventory(thing);
                    while (GetIsObjectValid(inbag))
                    {
                        ActionTakeItem(inbag,thing);
                        inbag=GetNextItemInInventory(thing);
                    }

                }
            }
        }
    }
}

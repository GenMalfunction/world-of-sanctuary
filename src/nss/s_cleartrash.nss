//::////////////////////////////////////////////
//:: Name:  s_cleartrash - Clear trash on ground
//::////////////////////////////////////////////
/*

This script is intended to be called by or incorporated into the
Area:OnEntered event (script). Every time a PC enters an area, all
items and monster drop bags on the ground are checked for a destruct
time. If the object does not have a destruct time, one is set. If the
destruct time has already passed, the object is destroyed.

The constant iObjectsToDestroy is a throttle control. Adjust it lower
to reduce burst server load, higher if objects are accumulating.

*/
//:://////////////////////////////////////////////
//:: Author: Scott Thorne
//:: E-mail: Thornex2@wans.net
//:: Updated: August 09, 2002
//:://////////////////////////////////////////////
/*
void Debug(string sMessage) {
    WriteTimestampedLogEntry(sMessage);
    SendMessageToPC(GetFirstPC(), sMessage);
}
*/


void TrashObject(object oObject)

{
     /* search and destroy contents of body bag's, others just destroy */
    if (GetObjectType(oObject) == OBJECT_TYPE_PLACEABLE) {

        object oItem = GetFirstItemInInventory(oObject);

        /* recursively trash all items inside container */
        while (GetIsObjectValid(oItem))
        {
            TrashObject(oItem);

            oItem = GetNextItemInInventory(oObject);
        }
    }

    DestroyObject(oObject);
}


void main()
{

/* bypass if currently in-progress (blocked) or ClearTrash is disabled */
if ((GetLocalInt(OBJECT_SELF, "CT_IN_PROGRESS") != 1) &&
     (GetLocalInt(GetModule(), "CT_DISABLED") != 1))
{

    SetLocalInt(OBJECT_SELF, "CT_IN_PROGRESS", 1); /* set a flag to block */

    int iItemDestructTime;
    int iObjectType;

    int iObjectsDestroyed = 0;
    int iObjectsToDestroy = 5;  /* adjust as desired */
    int iNow = (GetCalendarMonth()*10000) + (GetCalendarDay()*100) + GetTimeHour();
    int iAreaDestructTime = iNow + 1;  /* destroy items in 'n' game hours from now */

    object oItem = GetFirstObjectInArea();

    while (GetIsObjectValid(oItem))
    {
        iObjectType = GetObjectType(oItem);

        switch (iObjectType) {
        case OBJECT_TYPE_PLACEABLE:

            /* monster drop containers are tagged placeables */
            if (GetTag(oItem) != "Body Bag") {
                break; }

            /* note: no break here, allow fall-through */

        case OBJECT_TYPE_ITEM:

            iItemDestructTime = GetLocalInt(oItem, "CT_DESTRUCT_TIME");

            if (iItemDestructTime > 0)
            {
                if (iItemDestructTime <= iNow) {
                    TrashObject(oItem);   /* destruct time has passed, trash the object */
                    iObjectsDestroyed++;
                }

                /* note: no action if destruct time set but not passed */

            } else {

                /* no destruct time set, so do it now */
                SetLocalInt(oItem, "CT_DESTRUCT_TIME", iAreaDestructTime);
            }
        }

        if (iObjectsDestroyed < iObjectsToDestroy) {
            oItem = GetNextObjectInArea();
        } else {
            break;  /* destroyed enough objects, get out of loop */
        }
    }

    SetLocalInt(OBJECT_SELF, "CT_IN_PROGRESS", 0);  /* done, release */

}  /* if (not blocked or disabled) */
}  /* main() */


/*-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
* File Name: p_onuse_examine
*
* Purpose:  Displays the examine window of the placeable when a player uses it.
*
* Location:  OnUsed event of a placeable.
*
* Created By: Mistress, Realms of Mythology - www.realmsofmythology.net
* Created On: 6-22-06
*
* Modeled after and adapted from:
*
* Change Log:
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=*/
void main()
{
    // For some goofy reason ActionExamine will show the player's description
    // instead of the placeable if you send it OBJECT_SELF directly.
    object oPlaceable = OBJECT_SELF;

    // Have them examine the placeable to read the description
    AssignCommand(GetLastUsedBy(), ActionExamine(oPlaceable));
}


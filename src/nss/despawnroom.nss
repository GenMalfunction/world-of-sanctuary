/*******************************************************
*    Area OnExit                                       *
*    onexit                                            *
********************************************************
* Created By: Alan Guile                               *
* Altered By: Hillary Skeryanc-Mann & Daniel C. Mann   *
* Created On: July 27, 2002                            *
* Altered On: May 2, 2003                              *
********************************************************
*                                                      *
*   Checks the area for any remaining PCs. If there    *
*   are none, it destroys all encounter creatures.     *
*   Tested in both multiplayer and single player       *
*   with and without remaining PCs. This should go     *
*   in an areas OnExit event.                          *
*                                                      *
********************************************************/
void main()
{
object oObject = GetFirstObjectInArea();                    // gets the first object in the area being exited... area isn't specified cause the caller is the area
int nPCinArea = FALSE;                                      // sets the nPCinArea to false so the loop will execute

while (GetIsObjectValid(oObject) == TRUE &&
       nPCinArea == FALSE)                                  // grabs the first object in the area and makes sure it exists
        {
            if (GetIsPC(oObject) == TRUE)                   // if the script finds a PC in the area...
                {
                nPCinArea = TRUE;                           // sets nPCinArea to TRUE
                }
            else                                            // otherwise...
                {
                oObject = GetNextObjectInArea();            // it gets the next object and begins the loop again
                }
        }

if (nPCinArea == FALSE)                                     // once the loop ends because there are no objects in the area, if no PCs were found...
    {
    oObject = GetFirstObjectInArea();                       // restarts the object check list

    while (GetIsObjectValid(oObject) == TRUE)               // makes sure it actually has an object
        {
            if (GetIsEncounterCreature(oObject) == TRUE)    // if the object is a creature from an encounter
                {
                DestroyObject(oObject);                     // it gets detroyed
                }
            oObject=GetNextObjectInArea();                  // gets the next object and sends it through the loop
        }
    }

}

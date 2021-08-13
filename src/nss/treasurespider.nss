// Treasure Chest
#include "NW_O2_CONINCLUDE"
void main()
{
    object oItem = OBJECT_INVALID;
// Clear all contents of the <span class="highlight">chest</span>
    oItem = GetFirstItemInInventory();
    while ( oItem != OBJECT_INVALID )
        {
        //Make sure people don't stuff <span class="highlight">chest</span> with plot items and break it
        SetPlotFlag(oItem, FALSE);
        DestroyObject( oItem, 0.0 );
        oItem = GetNextItemInInventory();
        }
    // Set respawntime float to the number of seconds.
    float respawntime = 600.00;
    if (GetLocalInt(OBJECT_SELF,"NW_DO_ONCE") != 0)
    {
       return;
    }
    object oLastOpener = GetLastOpener();
    GenerateLowTreasure(oLastOpener, OBJECT_SELF);
    GenerateLowTreasure(oLastOpener, OBJECT_SELF);

    {int nRandom = d6(1);
     int nTreasureType = 1;
    if (nRandom == 1){
      CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF, 305);
      CreateGem(OBJECT_SELF, OBJECT_SELF, nTreasureType);}
    else if (nRandom == 2){
      CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF, 532);
      CreateGem(OBJECT_SELF, OBJECT_SELF, nTreasureType);
      CreateGem(OBJECT_SELF, OBJECT_SELF, nTreasureType);}
    else if (nRandom == 3){
      CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF, 682);
      GenerateLowTreasure(oLastOpener, OBJECT_SELF);
      CreateGem(OBJECT_SELF, OBJECT_SELF, nTreasureType);
      CreateGem(OBJECT_SELF, OBJECT_SELF, nTreasureType);}
    else if (nRandom == 4){
      CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF, 840);
      GenerateMediumTreasure(oLastOpener, OBJECT_SELF);
      CreateGem(OBJECT_SELF, OBJECT_SELF, nTreasureType);
      CreateGem(OBJECT_SELF, OBJECT_SELF, nTreasureType);}
    else if (nRandom == 5){
      CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF, 1430);
      GenerateHighTreasure(oLastOpener, OBJECT_SELF);
      CreateGem(OBJECT_SELF, OBJECT_SELF, nTreasureType);
      CreateGem(OBJECT_SELF, OBJECT_SELF, nTreasureType);
      CreateGem(OBJECT_SELF, OBJECT_SELF, nTreasureType);}
    else if (nRandom == 6){
      CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF, 1850);
      GenerateHighTreasure(oLastOpener, OBJECT_SELF);
      GenerateLowTreasure(oLastOpener, OBJECT_SELF);
      CreateGem(OBJECT_SELF, OBJECT_SELF, nTreasureType);
      CreateGem(OBJECT_SELF, OBJECT_SELF, nTreasureType);
      CreateGem(OBJECT_SELF, OBJECT_SELF, nTreasureType);}}

    SetLocalInt(OBJECT_SELF,"NW_DO_ONCE",1);
    ShoutDisturbed();
    // Command added to delay the <span class="highlight">respawn</span>
    AssignCommand( OBJECT_SELF, DelayCommand (respawntime, SetLocalInt(OBJECT_SELF,"NW_DO_ONCE",0) ) );
}

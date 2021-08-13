void main()
{
   object oPC = GetPCSpeaker() ;
   object oItem = GetFirstItemInInventory(OBJECT_SELF) ;
      while (GetIsObjectValid(oItem))
           { AssignCommand(OBJECT_SELF, ActionGiveItem(oItem, oPC)) ;
             oItem = GetNextItemInInventory(OBJECT_SELF) ; }
   DestroyObject(OBJECT_SELF,0.9f) ;
}

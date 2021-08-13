////////////////////////////////////////////////////////////////////////////////
// Module Event: OnLoad
////////////////////////////////////////////////////////////////////////////////

void main()
{
  // set module options
  SetLocalInt(OBJECT_SELF,"OPTION_WPAlwaysUseable" ,FALSE);
  SetLocalInt(OBJECT_SELF,"OPTION_RestTimer"       ,4);
  SetLocalInt(OBJECT_SELF,"OPTION_RespawnWhereDied",FALSE);

  // activate trash can system
  // (loot bags are being destroyed after specific amount of time)
  // (see: mod_trashcan_usr)
  DelayCommand(10.0,SignalEvent(OBJECT_SELF,EventUserDefined(9000)));
}

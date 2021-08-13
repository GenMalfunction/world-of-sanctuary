void PortalTo(string sTag) {
  AssignCommand(GetLastUsedBy(), JumpToObject(GetWaypointByTag(sTag)));
}

int StartingConditional() {
  return FALSE;
}

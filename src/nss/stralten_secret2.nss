void main()
{
object oPC = GetPCSpeaker();
object oFollow1 = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
object oFollow2 = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
object oFollow3 = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
object oFollow4 = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
object oFollow5 = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
AssignCommand(oFollow1, JumpToObject(GetWaypointByTag("stralten_lvl1_waypoint_4")));
AssignCommand(oFollow2, JumpToObject(GetWaypointByTag("stralten_lvl1_waypoint_4")));
AssignCommand(oFollow3, JumpToObject(GetWaypointByTag("stralten_lvl1_waypoint_4")));
AssignCommand(oFollow4, JumpToObject(GetWaypointByTag("stralten_lvl1_waypoint_4")));
AssignCommand(oFollow5, JumpToObject(GetWaypointByTag("stralten_lvl1_waypoint_4")));
AssignCommand(oPC, JumpToObject(GetWaypointByTag("stralten_lvl1_waypoint_4")));
}

void main()
{
object oPC = GetEnteringObject();
if (!GetIsPC(oPC)) return;

int DoOnce = GetLocalInt(OBJECT_SELF, GetTag(OBJECT_SELF));
if (DoOnce==TRUE) return;
SetLocalInt(OBJECT_SELF, GetTag(OBJECT_SELF), TRUE);


object oTarget;
object oSpawn;
location lTarget;
oTarget = GetWaypointByTag("firework");
lTarget = GetLocation(oTarget);
oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "fireworkssource", lTarget);
}


string sDeny;
/*   Script generated by
Lilac Soul's NWN Script Generator, v. 1.6

For download info, please visit:
http://www.lilacsoul.revility.com    */

//Put this OnUsed
void main()
{

object oPC = GetLastUsedBy();
object oTarget1;
oTarget1 = OBJECT_SELF;

if (!GetIsPC(oPC)) return;

if (GetItemPossessedBy(oPC, "scal11")== OBJECT_INVALID)
   {
   //sDeny="You need the Dragonscale in Dragonkeep to sit here!";

   //SendMessageToPC(oPC, sDeny);
   ExecuteScript("_mem_throne_sit", oTarget1);
   return;
   }

object oTarget;
oTarget = OBJECT_SELF;

AssignCommand(oPC, ActionSit(oTarget));

}

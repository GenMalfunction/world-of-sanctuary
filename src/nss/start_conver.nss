//Start conversation Whit score bord
//scripted by Butcha
void main()
{
object oPC = GetLastUsedBy();
 AssignCommand(oPC,ActionStartConversation(oPC,"info_conversatio",TRUE));
}

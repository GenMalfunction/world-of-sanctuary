 #include "nw_i0_tool"
 #include "inc_reward"
void main()
{
object oKiller = GetLastKiller();
object oMaster = GetMaster(oKiller);
if (GetIsPC(oKiller)==TRUE
&&!HasItem(oKiller, "cats_rune"))
{
rewardhostile();
CreateItemOnObject("undeadcrown", oKiller, 1);
CreateItemOnObject("cats_rune", oKiller, 1);
SetLocalInt(oKiller,"UndeadKing", 3);
 }
else  if (GetIsPC(oKiller)==FALSE
&&!HasItem(oMaster, "cats_rune"))
{
rewardhostile();
CreateItemOnObject("undeadcrown", oKiller, 1);
CreateItemOnObject("cats_rune", oKiller, 1);
SetLocalInt(GetLastKiller(),"UndeadKing", 3);
 }
else  if (GetIsPC(oKiller)==TRUE
&&HasItem(oKiller, "cats_rune"))
{
rewardb();
 }
else  if (GetIsPC(oKiller)==FALSE
&&HasItem(oMaster, "cats_rune"))
{
 rewardb();
 }
}

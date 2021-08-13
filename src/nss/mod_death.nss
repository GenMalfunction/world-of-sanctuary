//(THIS SCRIPT GOES OnPlayerDeath in your module)
void main()
{
int killed, died;

object PC           = GetLastPlayerDied();
object Killer       = GetLastHostileActor(PC);
object oPlayer       = GetFirstPC();
object oKai = CreateObject(OBJECT_TYPE_CREATURE,"death",GetLocation(PC));
int iHeal            = GetMaxHitPoints(PC);

effect eBlood1       = EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE);
effect eBlood2       = EffectVisualEffect(VFX_COM_BLOOD_SPARK_LARGE);
effect eSmoke         = EffectVisualEffect(VFX_IMP_DEATH_L);
effect eEffect1 = EffectVisualEffect(VFX_FNF_HOWL_WAR_CRY);
effect eEffect2 = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
effect eEffect3 = EffectVisualEffect(VFX_FNF_SUMMON_EPIC_UNDEAD);
effect eFly = EffectDisappear();
effect eFlyDown = EffectAppear();
effect eBad = GetFirstEffect(oPlayer);

string sName         = GetName(PC);
string sName2        = GetName(Killer);
string sMessage      = sName+ " <cy>Was Owned By:<càçê> " +sName2;
ApplyEffectToObject(DURATION_TYPE_INSTANT,eBlood1,PC);
ApplyEffectToObject(DURATION_TYPE_INSTANT,eBlood2,PC);
ApplyEffectToObject(DURATION_TYPE_INSTANT,eSmoke,PC);

if (GetIsPC(Killer)==TRUE || GetPCPlayerName(Killer)!="") {
        killed = GetLocalInt(Killer, "killed") + 1;
        SetLocalInt(Killer, "killed", killed);
        FloatingTextStringOnCreature("Player Kills: " + IntToString(killed), Killer, TRUE);
    }
    if (GetIsPC(PC)==TRUE || GetPCPlayerName(PC)!="") {
        died = GetLocalInt(PC,"died") + 1;
        SetLocalInt(PC, "died", died);
        FloatingTextStringOnCreature("Deaths: " + IntToString(died), PC, TRUE);
    }
  ExecuteScript("pointeffects", OBJECT_SELF);

DelayCommand(0.3,AssignCommand(PC,SpeakString("OWNED!!",TALKVOLUME_TALK)));
DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlyDown,oKai));
DelayCommand(3.0,AssignCommand(oKai, ActionCastFakeSpellAtObject(SPELL_SLAY_LIVING, PC)));
DelayCommand(4.4,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect1,PC));
DelayCommand(4.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect2,PC));
DelayCommand(4.6,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect3,PC));
DelayCommand(5.0,FloatingTextStringOnCreature(" <cÜ>The EK God's show Mercy on you "+sName+", Rise to fight again...",PC));
DelayCommand(6.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),PC));
DelayCommand(6.1,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(PC)), PC));
DelayCommand(7.0,ApplyEffectToObject(DURATION_TYPE_PERMANENT,eFly,oKai));



{
while (GetIsPC(oPlayer) == TRUE)
{
FloatingTextStringOnCreature(sMessage, oPlayer, FALSE);
oPlayer = GetNextPC();

}
}
}


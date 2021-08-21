void Raise(object oPlayer)
{
        effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION);
        effect eBad = GetFirstEffect(oPlayer);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPlayer);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oPlayer)), oPlayer);

        //Search for negative effects
        while(GetIsEffectValid(eBad))
        {
            if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
                GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
                GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
                GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
                {
                    //Remove effect if it is negative.
                    RemoveEffect(oPlayer, eBad);
                }
            eBad = GetNextEffect(oPlayer);
        }
        //Fire cast spell at event for the specified target
        SignalEvent(oPlayer, EventSpellCastAt(OBJECT_SELF, SPELL_RESTORATION, FALSE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oPlayer);
}

object GetMyItem(object oPlayer, int nNumber)
{
    object oItem ;
     switch(nNumber)
        {
        //  Only selects items from the following slots
           case 0:  oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oPlayer) ; break ;
           case 1:  oItem = GetItemInSlot(INVENTORY_SLOT_BELT, oPlayer) ; break ;
           case 2:  oItem = GetItemInSlot(INVENTORY_SLOT_CLOAK, oPlayer) ; break ;
           case 3:  oItem = GetItemInSlot(INVENTORY_SLOT_HEAD, oPlayer) ; break ;
           case 4:  oItem = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPlayer) ; break ;
           case 5:  oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPlayer) ; break ;
           case 6:  oItem = GetItemInSlot(INVENTORY_SLOT_NECK, oPlayer) ; break ;
           case 7:  oItem = GetItemInSlot(INVENTORY_SLOT_BOOTS, oPlayer) ; break ;
           case 8:  oItem = GetItemInSlot(INVENTORY_SLOT_ARMS, oPlayer) ; break ;
           case 9:  oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPlayer) ; break ;
           case 10: oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPlayer) ; break ;
        }
     if (GetIsObjectValid(oItem)==TRUE)
          { return oItem ; }
     else
          { return OBJECT_INVALID ; }
}

int GetNumber(object oPlayer)
{
    int nAlpha = 0 ;
     if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CHEST, oPlayer))==TRUE){nAlpha++ ; }
     if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_BELT, oPlayer))==TRUE){nAlpha++ ; }
     if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CLOAK, oPlayer))==TRUE){nAlpha++ ; }
     if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_HEAD, oPlayer))==TRUE){nAlpha++ ; }
     if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPlayer))==TRUE){nAlpha++ ; }
     if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPlayer))==TRUE){nAlpha++ ; }
     if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_NECK, oPlayer))==TRUE){nAlpha++ ; }
     if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_BOOTS, oPlayer))==TRUE){nAlpha++ ; }
     if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_ARMS, oPlayer))==TRUE){nAlpha++ ; }
     if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPlayer))==TRUE){nAlpha++ ; }
     if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPlayer))==TRUE){nAlpha++ ; }
    return nAlpha ;
}

void main()
{
    object oPC = GetLastPlayerDied() ;

    AssignCommand(oPC, ClearAllActions()) ;
        if (GetStandardFactionReputation(STANDARD_FACTION_COMMONER, oPC) <= 10)
    {   SetLocalInt(oPC, "NW_G_Playerhasbeenbad", 10) ; // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 80, oPC) ;
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_MERCHANT, oPC) <= 10)
    {   SetLocalInt(oPC, "NW_G_Playerhasbeenbad", 10) ; // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 80, oPC) ;
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER, oPC) <= 10)
    {   SetLocalInt(oPC, "NW_G_Playerhasbeenbad", 10) ; // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 80, oPC) ;
    }
    // * get up to four random equipped items and put them on a "corpse"
    int nOnPC = GetNumber(oPC) ;
        if (nOnPC!=0)
    {
           int nRandom ;
           int nCount=1 ;
           int nHowMany = Random(1) + 1 ;
               if (nOnPC<nHowMany)
                 { nHowMany=nOnPC ; }
           object oSlot ;
    object oMyItem ;
    location locPC = GetLocation(oPC) ;
    // Change "pccorpse" to the tag for your item (if that doesnt work then change it to the resref
    object oBag = CreateObject(OBJECT_TYPE_PLACEABLE, "pccorpse", locPC) ;
    string sName = GetPCPlayerName(oPC) ;
           SetLocalString(oBag, "sOwner", sName) ;

        while(nCount <= nHowMany)
    {
           nRandom = Random(11) ;
           oMyItem = GetMyItem(oPC, nRandom) ;
               if(GetIsObjectValid(oMyItem)==TRUE)
           {
              AssignCommand(oBag, ActionTakeItem(oMyItem, oPC)) ;
              nCount++ ;
           }
    }

    }

{
int killed, died;

object PC           = GetLastPlayerDied();
object Killer       = GetLastHostileActor(PC);
object oPlayer      = GetFirstPC();
object oKai         = CreateObject(OBJECT_TYPE_CREATURE,"death",GetLocation(PC));
int iHeal           = GetMaxHitPoints(PC);

effect eBlood1       = EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE);
effect eBlood2       = EffectVisualEffect(VFX_COM_BLOOD_SPARK_LARGE);
effect eSmoke        = EffectVisualEffect(VFX_IMP_DEATH_L);
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

DelayCommand(1.0,AssignCommand(PC,SpeakString("OWNED!!",TALKVOLUME_TALK)));
DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlyDown,oKai));
DelayCommand(3.0,AssignCommand(oKai, ActionCastFakeSpellAtObject(SPELL_SLAY_LIVING, PC)));
DelayCommand(4.4,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect1,PC));
DelayCommand(4.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect2,PC));
DelayCommand(4.6,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect3,PC));
DelayCommand(6.0,FloatingTextStringOnCreature(" <cÜ>Diablo shows no mercy on you "+sName+", Respawn to fight again...",PC));
DelayCommand(6.3,ApplyEffectToObject(DURATION_TYPE_PERMANENT,eFly,oKai));

object oTarget;
location lTarget;
oTarget = GetWaypointByTag("WT_RESPAWN_00");
lTarget = GetLocation(oTarget);

if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;
AssignCommand(oPlayer, ClearAllActions());
DelayCommand(7.0, PopUpGUIPanel(oPC,GUI_PANEL_PLAYER_DEATH)) ;
{
while (GetIsPC(oPlayer) == TRUE)
{
FloatingTextStringOnCreature(sMessage, oPlayer, FALSE);
oPlayer = GetNextPC();
}
}
}
}

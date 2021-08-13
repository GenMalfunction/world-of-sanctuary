
// Functions Script for Birthright of the North
// Ben W-Husey (B G P Hughes)

//This function is used to reward a party with xp for an action, describe why the xp was given, and set a variable so it is only given once for the action.
// Inputs are:  sGotEntry = The name of the Local Variable,
//              oPCGotEntry = the PC that called this function (speaker, chest opener, etc)
//              nXPToGive = xp for each party member
//              sTextMessage = Message to display, telling why xp was given

void PartyGotEntry(string sGotEntry,object oPCGotEntry, int nXPToGive, string sTextMessage)
{
    object oPartyMember = GetFirstFactionMember(oPCGotEntry, TRUE); // oPartyMember is the PC that called this function

    while (GetIsObjectValid(oPartyMember) == TRUE) // While there are more members in the party
  {
    GiveXPToCreature(oPartyMember,nXPToGive); //Give xp to each member
    SetLocalInt(oPartyMember,sGotEntry,1);  // Sets a local variable in case you want to check for it (i.e. give the bonus once only)
    FloatingTextStringOnCreature(sTextMessage, oPartyMember, TRUE); //Tell the player what the xp was for with a string above his PC's head
    oPartyMember = GetNextFactionMember(oPCGotEntry, TRUE); // Find next party member
  }
}

//This function is used to to set a local variable on every member of a party - particularly useful to stop every party member having to have the same conversation.
// Inputs are:  sGotEntry = The name of the Local Variable,
//              oPCGotEntry = the PC that called this function (speaker, chest opener, etc)
//              nValue = value to set variable to

void AllParty(string sGotEntry,object oPCGotEntry, int nValue)
{
  SetLocalInt(oPCGotEntry, sGotEntry, nValue);
  object oPartyMember = GetFirstFactionMember(oPCGotEntry, TRUE);
  while (GetIsObjectValid(oPartyMember) == TRUE)
  {
    SetLocalInt(oPartyMember,sGotEntry,nValue);  // Sets a local variable on each party member
    oPartyMember = GetNextFactionMember(oPCGotEntry, TRUE);
  }
}

//This function is used to reward alignment xp, and shift alignment
// Inputs are:  sVar = The name of a local variable
//              oPCGotXP = the PC to affect
//              sAlig = the alignment to shift and/or reward
//              nXP = The xp reward
//              nShift = the alignment amount to shift
// Modify: if shift of 0 sent, no message wanted. If xp = 0 no message wanted.
// Examples:
// if you send AligXP(Variable, Player, "CHAOTIC",100,0) then if Player is a chaotic character will get 100xp and a message to tell them (the variable stops this happening more than once)
// Or AligXP(Variable, Player, "CHAOTIC",0,5) then Player will shift alignment 5 points towards chaotic and a message to tell them about the shift
// AligXP(Variable, Player, "CHAOTIC",100,5) will do both:
//                  Any PC will shift 5 towards chaotic and
//                  A chaotic character will gain 100xp.


void AligXP(string sVar, object oPCGotXP, string sAlig, int nXP, int nShift)
{
  if (GetLocalInt(oPCGotXP, sVar)==FALSE) {
    SetLocalInt(oPCGotXP, sVar, TRUE);
    int nAlig;
// This section deals with what alignment gets the xp, or towards which alignment the shift takes place
    if (sAlig == "CHAOTIC") nAlig = ALIGNMENT_CHAOTIC;
    if (sAlig == "GOOD") nAlig = ALIGNMENT_GOOD;
    if (sAlig == "LAWFUL") nAlig = ALIGNMENT_LAWFUL;
    if (sAlig == "EVIL") nAlig = ALIGNMENT_EVIL;
    if (sAlig == "NEUTRAL") nAlig = ALIGNMENT_NEUTRAL;
    if (GetAlignmentGoodEvil(oPCGotXP)== nAlig)
        {
        if (nXP==0) PartyGotEntry(sVar,oPCGotXP,nXP, ""); // No xp = no message
        else PartyGotEntry(sVar,oPCGotXP,nXP, "XP gained - Playing alignment");
        }
    if (GetAlignmentLawChaos(oPCGotXP)== nAlig)
        {
        if (nXP==0) PartyGotEntry(sVar,oPCGotXP,nXP, ""); // No xp = no message
        else PartyGotEntry(sVar,oPCGotXP,nXP, "XP gained - Playing alignment");
        }
    if (!(nShift==0)) AdjustAlignment(oPCGotXP, nAlig, nShift); //only execute if shift is not 0 otherwise you get a message in the console.
    }
}


int SkillCheck()
{
    int nSkill = 0;
    int xcheck = Random(16)+1;
    if (xcheck==1) nSkill = SKILL_CONCENTRATION ;
    if (xcheck==2) nSkill = SKILL_DISCIPLINE ;
    if (xcheck==3) nSkill = SKILL_HEAL ;
    if (xcheck==4) nSkill = SKILL_LISTEN ;
    if (xcheck==5) nSkill = SKILL_LORE ;
    if (xcheck==6) nSkill = SKILL_OPEN_LOCK ;
    if (xcheck==7) nSkill = SKILL_PARRY ;
    if (xcheck==8) nSkill = SKILL_PERSUADE ;
    if (xcheck==9) nSkill = SKILL_PERFORM ;
    if (xcheck==10) nSkill = SKILL_SEARCH ;
    if (xcheck==11) nSkill = SKILL_SPELLCRAFT ;
    if (xcheck==12) nSkill = SKILL_SPOT ;
    if (xcheck==13) nSkill = SKILL_TUMBLE ;
    if (xcheck==14) nSkill = SKILL_USE_MAGIC_DEVICE ;
    if (xcheck==15) nSkill = SKILL_ALL_SKILLS ;
    if (xcheck==16) nSkill = SKILL_DISABLE_TRAP ;

    return nSkill;
}

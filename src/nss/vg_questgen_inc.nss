void DetermineQuestType()
{
switch (d12(1))
    {
    case 0:
         // statements ...
         // condition would also evaluate as true if x == 0, which should not happen . . .
         // but . . . lets put this in here just as a safety device :)
         break;
    case 1:
         // Declare this as a fetch quest
         SetLocalInt(OBJECT_SELF,"Fetch",1);
         SetLocalString(OBJECT_SELF,"QuestType","Fetch");
         break;
    case 2:
         // Declare this as a gopher quest
         SetLocalInt(OBJECT_SELF,"Gopher",1);
         SetLocalString(OBJECT_SELF,"QuestType","Gopher");
         break;
    case 3:
         // Declare this as a kidnapping
         SetLocalInt(OBJECT_SELF,"Kidnapping",1);
         SetLocalString(OBJECT_SELF,"QuestType","Kidnapping");
         break;
    case 4:
         // Declare this as a robbery
         SetLocalInt(OBJECT_SELF,"Robbery",1);
         SetLocalString(OBJECT_SELF,"QuestType","Robbery");
         break;
    case 5:
         // Declare this as a murder
         SetLocalInt(OBJECT_SELF,"Murder",1);
         SetLocalString(OBJECT_SELF,"QuestType","Murder");
         break;
    case 6:
         // Declare this as a search
         SetLocalInt(OBJECT_SELF,"Search",1);
         SetLocalString(OBJECT_SELF,"QuestType","Search");
         break;
    case 7:
         // Declare this as a fetch quest
         SetLocalInt(OBJECT_SELF,"Fetch",1);
         SetLocalString(OBJECT_SELF,"QuestType","Fetch");
         break;
    case 8:
         // Declare this as a gopher quest
         SetLocalInt(OBJECT_SELF,"Gopher",1);
         SetLocalString(OBJECT_SELF,"QuestType","Gopher");
         break;
    case 9:
         // Declare this as a fetch
         SetLocalInt(OBJECT_SELF,"Fetch",1);
         SetLocalString(OBJECT_SELF,"QuestType","Fetch");
         break;
    case 10:
         // Declare this as a gopher
         SetLocalInt(OBJECT_SELF,"Gopher",1);
         SetLocalString(OBJECT_SELF,"QuestType","Gopher");
         break;
    case 11:
         // Declare this as a robbery
         SetLocalInt(OBJECT_SELF,"Robbery",1);
         SetLocalString(OBJECT_SELF,"QuestType","Robbery");
         break;
    case 12:
         // Declare this as a search
         SetLocalInt(OBJECT_SELF,"Search",1);
         SetLocalString(OBJECT_SELF,"QuestType","Search");
         break;
    default:
         // Do nothing!
         break;
    }
}

void DetermineItem(object oGiver)
{
string sItemType;
// Lets randomize the type of item to be found/transported/etc
switch (d20(1))
    {
    case 0:
         // statements ...
         // condition would also evaluate as true if x == 0, which should not happen . . .
         // but . . . lets put this in here just as a safety device :)
         break;
    case 1:
         // clock
         sItemType = "clock";
         break;
    case 2:
         // Bolt of Cloth
         sItemType = "x2_it_cmat_cloth";
         break;
    case 3:
         // Bar of Iron
         sItemType = "x2_it_cmat_iron";
         break;
    case 4:
         // letter
         sItemType = "letter";
         break;
    case 5:
         // Dark Red Cloth Dye
         sItemType = "x2_it_dyec37";
         break;
    case 6:
         // package
         sItemType = "package";
         break;
    case 7:
         // statuette
         sItemType = "statuette";
         break;
    case 8:
         // Bolt of Cloth
         sItemType = "x2_it_cmat_cloth";
         break;
    case 9:
         // painting
         sItemType = "painting";
         break;
    case 10:
         // Copper Necklace
         sItemType = "nw_it_mneck020";
         break;
    case 11:
         // Copper Ring
         sItemType = "nw_it_mring021";
         break;
    case 12:
         // Arrows
         sItemType = "nw_wamar001";
         break;
    case 13:
         // Bolts
         sItemType = "nw_wambo001";
         break;
    case 14:
         // Longsword
         sItemType = "nw_wswls001";
         break;
    case 15:
         // Battleaxe
         sItemType = "nw_waxbt001";
         break;
    case 16:
         // Mace
         sItemType = "nw_wblml001";
         break;
    case 17:
         // Spear
         sItemType = "nw_wplss001";
         break;
    case 18:
         // Longbow
         sItemType = "nw_wbwln001";
         break;
    case 19:
         // pipes
         sItemType = "pipes";
         break;
    case 20:
         // horn
         sItemType = "horn";
         break;
    default:
         // Do nothing!
         break;
    }
// We need to uniquely identify the item via tag so we can deal with data in the convos
// So we can best do this by determing what quest this item belongs to, then call to that
// later on as needed
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
SetLocalString(OBJECT_SELF,"QuestItem"+sQuest,sItemType);
}

void AreaNPC()
{
// ID this Task Master as an individual by a local string set on him
string sTaskMaster = GetLocalString(OBJECT_SELF,"TaskMaster");
// Set up the declaration for the Area Designator String
string sArea;
switch(d6(1))
    {
    case 1:
        sArea = GetTag(GetArea(GetObjectByTag("01"+sTaskMaster)));
        break;
    case 2:
        sArea = GetTag(GetArea(GetObjectByTag("02"+sTaskMaster)));
        break;
    case 3:
        sArea = GetTag(GetArea(GetObjectByTag("03"+sTaskMaster)));
        break;
    case 4:
        sArea = GetTag(GetArea(GetObjectByTag("04"+sTaskMaster)));
        break;
    case 5:
        sArea = GetTag(GetArea(GetObjectByTag("05"+sTaskMaster)));
        break;
    case 6:
        sArea = GetTag(GetArea(GetObjectByTag("06"+sTaskMaster)));
        break;
    default:
         // Do nothing!
         break;
    }
    SetLocalString(OBJECT_SELF,"AreaNPC",sArea);
    // Debug feedback
    if (GetLocalInt(GetModule(),"Debug")==1)
        {
        SendMessageToPC(GetFirstPC(),"The NPC's area is "+sArea);
        }
}

void LocateNPC()
{
string sAreaNPC = GetLocalString(OBJECT_SELF,"AreaNPC");
object oAreaNPC = GetObjectByTag(sAreaNPC);
int iX = GetAreaSize(AREA_WIDTH,oAreaNPC)*10;
int iY = GetAreaSize(AREA_HEIGHT,oAreaNPC)*10;
int iRandomX = Random(iX);
int iRandomY = Random(iY);
float fx = IntToFloat(iRandomX);
float fy = IntToFloat(iRandomY);
vector vPos = Vector(fx,fy);
int iFacing = d10(36);
float fFacing = IntToFloat(iFacing);
location lLocationNPC = Location(oAreaNPC, vPos, fFacing);
SetLocalLocation(OBJECT_SELF,"LocationNPC",lLocationNPC);
// Debug feedback
if (GetLocalInt(GetModule(),"Debug")==1)
    {
    string sX = IntToString(iX);
    string sY = IntToString(iY);
    string sRandomX = IntToString(iRandomX);
    string sRandomY = IntToString(iRandomY);
    string sFacingAngle = IntToString(iFacing);
    SendMessageToPC(GetFirstPC(),"The Area Size for this NPC is "+sX+","+sY);
    SendMessageToPC(GetFirstPC(),"The Random Position for this NPC is "+sRandomX+","+sRandomY);
    SendMessageToPC(GetFirstPC(),"The Facing Angle for this NPC is "+sFacingAngle);
    }
}

void RandomGiver()
{
string sGiverRes;
switch (d12(1))
    {
    case 0:
         // statements ...
         // condition would also evaluate as true if x == 0, which should not happen . . .
         // but . . . lets put this in here just as a safety device :)
         break;
    case 1:
         // Make the NPC a Female Dwarf
         sGiverRes = "fdgiver";
         break;
    case 2:
         // Make the NPC Male Dwarf
         sGiverRes = "mdgiver";
         break;
    case 3:
         // Make the NPC Female Elf
         sGiverRes = "fegiver";
         break;
    case 4:
         // Make the NPC Male Elf
         sGiverRes = "megiver";
         break;
    case 5:
         // Make the NPC Female Gnome
         sGiverRes = "fggiver";
         break;
    case 6:
         // Make the NPC Male Gnome
         sGiverRes = "mggiver";
         break;
    case 7:
         // Make the NPC Female Halfling
         sGiverRes = "fhgiver";
         break;
    case 8:
         // Make the NPC Male Halfling
         sGiverRes = "mhgiver";
         break;
    case 9:
         // Make the NPC Female Half-Orc
         sGiverRes = "fhogiver";
         break;
    case 10:
         // Make the NPC Male Half-Orc
         sGiverRes = "mhogiver";
         break;
    case 11:
         // Make the NPC Female Human
         sGiverRes = "fhugiver";
         break;
    case 12:
         // Make the NPC Male Human
         sGiverRes = "mhugiver";
         break;
    default:
         // Do nothing!
         break;
    }
// We need to uniquely identify the item via tag so we can deal with data in the convos
// So we can best do this by determing what quest this item belongs to, then call to that
// later on as needed
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
SetLocalString(OBJECT_SELF,"sGiverRes"+sQuest,sGiverRes);
}

void RandomAcceptor()
{
string sAcceptorRes;
switch (d12(1))
    {
    case 0:
         // statements ...
         // condition would also evaluate as true if x == 0, which should not happen . . .
         // but . . . lets put this in here just as a safety device :)
         break;
    case 1:
         // Make the NPC a Female Dwarf
         sAcceptorRes = "fdacceptor";
         break;
    case 2:
         // Make the NPC Male Dwarf
         sAcceptorRes = "mdacceptor";
         break;
    case 3:
         // Make the NPC Female Elf
         sAcceptorRes = "feacceptor";
         break;
    case 4:
         // Make the NPC Male Elf
         sAcceptorRes = "meacceptor";
         break;
    case 5:
         // Make the NPC Female Gnome
         sAcceptorRes = "fgacceptor";
         break;
    case 6:
         // Make the NPC Male Gnome
         sAcceptorRes = "mgacceptor";
         break;
    case 7:
         // Make the NPC Female Halfling
         sAcceptorRes = "fhacceptor";
         break;
    case 8:
         // Make the NPC Male Halfling
         sAcceptorRes = "mhacceptor";
         break;
    case 9:
         // Make the NPC Female Half-Orc
         sAcceptorRes = "fhoacceptor";
         break;
    case 10:
         // Make the NPC Male Half-Orc
         sAcceptorRes = "mhoacceptor";
         break;
    case 11:
         // Make the NPC Female Human
         sAcceptorRes = "fhuacceptor";
         break;
    case 12:
         // Make the NPC Male Human
         sAcceptorRes = "mhuacceptor";
         break;
    default:
         // Do nothing!
         break;
    }
// We need to uniquely identify the item via tag so we can deal with data in the convos
// So we can best do this by determing what quest this item belongs to, then call to that
// later on as needed
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
SetLocalString(OBJECT_SELF,"sAcceptorRes"+sQuest,sAcceptorRes);
}

void RandomCriminal()
{
string sCriminalRes;
switch (d12(1))
    {
    case 0:
         // statements ...
         // condition would also evaluate as true if x == 0, which should not happen . . .
         // but . . . lets put this in here just as a safety device :)
         break;
    case 1:
         // Make the NPC a Female Dwarf
         sCriminalRes = "fdcriminal";
         break;
    case 2:
         // Make the NPC Male Dwarf
         sCriminalRes = "mdcriminal";
         break;
    case 3:
         // Make the NPC Female Elf
         sCriminalRes = "fecriminal";
         break;
    case 4:
         // Make the NPC Male Elf
         sCriminalRes = "mecriminal";
         break;
    case 5:
         // Make the NPC Female Gnome
         sCriminalRes = "fgcriminal";
         break;
    case 6:
         // Make the NPC Male Gnome
         sCriminalRes = "mgcriminal";
         break;
    case 7:
         // Make the NPC Female Halfling
         sCriminalRes = "fhcriminal";
         break;
    case 8:
         // Make the NPC Male Halfling
         sCriminalRes = "mhcriminal";
         break;
    case 9:
         // Make the NPC Female Half-Orc
         sCriminalRes = "fhocriminal";
         break;
    case 10:
         // Make the NPC Male Half-Orc
         sCriminalRes = "mhocriminal";
         break;
    case 11:
         // Make the NPC Female Human
         sCriminalRes = "fhucriminal";
         break;
    case 12:
         // Make the NPC Male Human
         sCriminalRes = "mhucriminal";
         break;
    default:
         // Do nothing!
         break;
    }
// We need to uniquely identify the item via tag so we can deal with data in the convos
// So we can best do this by determing what quest this item belongs to, then call to that
// later on as needed
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
SetLocalString(OBJECT_SELF,"sCriminalRes"+sQuest,sCriminalRes);
}

void RandomVictim()
{
string sVictimRes;
switch (d12(1))
    {
    case 0:
         // statements ...
         // condition would also evaluate as true if x == 0, which should not happen . . .
         // but . . . lets put this in here just as a safety device :)
         break;
    case 1:
         // Make the NPC a Female Dwarf
         sVictimRes = "fdvictim";
         break;
    case 2:
         // Make the NPC Male Dwarf
         sVictimRes = "mdvictim";
         break;
    case 3:
         // Make the NPC Female Elf
         sVictimRes = "fevictim";
         break;
    case 4:
         // Make the NPC Male Elf
         sVictimRes = "mevictim";
         break;
    case 5:
         // Make the NPC Female Gnome
         sVictimRes = "fgvictim";
         break;
    case 6:
         // Make the NPC Male Gnome
         sVictimRes = "mgvictim";
         break;
    case 7:
         // Make the NPC Female Halfling
         sVictimRes = "fhvictim";
         break;
    case 8:
         // Make the NPC Male Halfling
         sVictimRes = "mhvictim";
         break;
    case 9:
         // Make the NPC Female Half-Orc
         sVictimRes = "fhovictim";
         break;
    case 10:
         // Make the NPC Male Half-Orc
         sVictimRes = "mhovictim";
         break;
    case 11:
         // Make the NPC Female Human
         sVictimRes = "fhuvictim";
         break;
    case 12:
         // Make the NPC Male Human
         sVictimRes = "mhuvictim";
         break;
    default:
         // Do nothing!
         break;
    }
// We need to uniquely identify the item via tag so we can deal with data in the convos
// So we can best do this by determing what quest this item belongs to, then call to that
// later on as needed
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
SetLocalString(OBJECT_SELF,"sVictimRes"+sQuest,sVictimRes);
}

void RandomKidnapVictim()
{
string sKNVictimRes;
switch (d2(1))
    {
    case 0:
         // statements ...
         // condition would also evaluate as true if x == 0, which should not happen . . .
         // but . . . lets put this in here just as a safety device :)
         break;
    case 1:
         // Make the NPC Female
         sKNVictimRes = "fmknvictim";
         break;
    case 2:
         // Make the NPC Male
         sKNVictimRes = "mknvictim";
         break;
    default:
         // Do nothing!
         break;
    }
// We need to uniquely identify the item via tag so we can deal with data in the convos
// So we can best do this by determing what quest this item belongs to, then call to that
// later on as needed
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
SetLocalString(OBJECT_SELF,"sKNVictimRes"+sQuest,sKNVictimRes);
}

void MakeName(object oNPC)
{
// Dwarven Names
string sDFFirst=RandomName(NAME_FIRST_DWARF_FEMALE);
string sDMFirst=RandomName(NAME_FIRST_DWARF_MALE);
string sDLast=RandomName(NAME_LAST_DWARF);
// Elven Names
string sEFFirst=RandomName(NAME_FIRST_ELF_FEMALE);
string sEMFirst=RandomName(NAME_FIRST_ELF_MALE);
string sELast=RandomName(NAME_LAST_ELF);
// Gnome Names
string sGFFirst=RandomName(NAME_FIRST_GNOME_FEMALE);
string sGMFirst=RandomName(NAME_FIRST_GNOME_MALE);
string sGLast=RandomName(NAME_LAST_GNOME);
// Halfling Names
string sHFFirst=RandomName(NAME_FIRST_HALFLING_FEMALE);
string sHMFirst=RandomName(NAME_FIRST_HALFLING_MALE);
string sHLast=RandomName(NAME_LAST_HALFLING);
// Half-Orc Names
string sHOFFirst=RandomName(NAME_FIRST_HALFORC_FEMALE);
string sHOMFirst=RandomName(NAME_FIRST_HALFORC_MALE);
string sHOLast=RandomName(NAME_LAST_HALFORC);
// Human Names
string sHuFFirst=RandomName(NAME_FIRST_HUMAN_FEMALE);
string sHuMFirst=RandomName(NAME_FIRST_HUMAN_MALE);
string sHuLast=RandomName(NAME_LAST_HUMAN);
// Definitions of Ints to determine Appearance, Gender, and Race
int iAppearance = GetAppearanceType(oNPC);  // Used to make first names only on kidnap victims
int iGender = GetGender(oNPC);
int iRace = GetRacialType(oNPC);
int iDwarf = RACIAL_TYPE_DWARF;
int iElf = RACIAL_TYPE_ELF;
int iGnome = RACIAL_TYPE_GNOME;
int iHalfling = RACIAL_TYPE_HALFLING;
int iHalfOrc = RACIAL_TYPE_HALFORC;
int iHuman = RACIAL_TYPE_HUMAN;
// Declaration of Name String
string sFullName;
// Name creation for females of the given races
if (iGender == GENDER_FEMALE)
    {
    if (iRace == iDwarf)
        {
        sFullName = sDFFirst + " " +  sDLast;
        }
    if (iRace == iElf)
        {
        sFullName = sEFFirst + " " +  sELast;
        }
    if (iRace == iGnome)
        {
        sFullName = sGFFirst + " " +  sGLast;
        }
    if (iRace == iHalfling)
        {
        sFullName = sHFFirst + " " +  sHLast;
        }
    if (iRace == iHalfOrc)
        {
        sFullName = sHOFFirst + " " +  sHOLast;
        }
    if (iRace == iHuman)
        {
        sFullName = sHuFFirst + " " +  sHuLast;
        }
    }
// Name creation for males of the given races
if (iGender == GENDER_MALE)
    {
    if (iRace == iDwarf)
        {
        sFullName = sDMFirst + " " +  sDLast;
        }
    if (iRace == iElf)
        {
        sFullName = sEMFirst + " " +  sELast;
        }
    if (iRace == iGnome)
        {
        sFullName = sGMFirst + " " +  sGLast;
        }
    if (iRace == iHalfling)
        {
        sFullName = sHMFirst + " " +  sHLast;
        }
    if (iRace == iHalfOrc)
        {
        sFullName = sHOMFirst + " " +  sHOLast;
        }
    if (iRace == iHuman)
        {
        sFullName = sHuMFirst + " " +  sHuLast;
        }
    }
// Name creation for female and male kidnap victims
if ((iAppearance == APPEARANCE_TYPE_KID_FEMALE)||(iAppearance == APPEARANCE_TYPE_KID_MALE))
    {
    if (iGender == GENDER_FEMALE)
        {
        sFullName = sHuFFirst;
        }
    if (iGender == GENDER_MALE)
        {
        sFullName = sHuMFirst;
        }
    }
SetName(oNPC,sFullName);
}

void RandomClothes(object oNPC)
{
// This function should generator a random bit of clothing
// NPC to wear then adorn it so they look "stylin'"
string sClothing;
switch (d20(1))
    {
    case 0:
         // statements ...
         // condition would also evaluate as true if x == 0, which should not happen . . .
         // but . . . lets put this in here just as a safety device :)
         break;
    case 1:
         // Make the NPC Female
         sClothing = "nw_cloth001";
         break;
    case 2:
         // Make the NPC Male
         sClothing = "nw_cloth002";
         break;
    case 3:
         // Make the NPC Female
         sClothing = "nw_cloth003";
         break;
    case 4:
         // Make the NPC Male
         sClothing = "nw_cloth004";
         break;
    case 5:
         // Make the NPC Female
         sClothing = "nw_cloth006";
         break;
    case 6:
         // Make the NPC Male
         sClothing = "nw_cloth007";
         break;
    case 7:
         // Make the NPC Female
         sClothing = "x2_cloth008";
         break;
    case 8:
         // Make the NPC Male
         sClothing = "nw_cloth010";
         break;
    case 9:
         // Make the NPC Female
         sClothing = "nw_cloth013";
         break;
    case 10:
         // Make the NPC Male
         sClothing = "nw_cloth017";
         break;
    case 11:
         // Make the NPC Female
         sClothing = "nw_cloth018";
         break;
    case 12:
         // Make the NPC Male
         sClothing = "nw_cloth019";
         break;
    case 13:
         // Make the NPC Female
         sClothing = "nw_cloth022";
         break;
    case 14:
         // Make the NPC Male
         sClothing = "nw_cloth024";
         break;
    case 15:
         // Make the NPC Female
         sClothing = "nw_cloth025";
         break;
    case 16:
         // Make the NPC Male
         sClothing = "nw_cloth028";
         break;
    case 17:
         // Make the NPC Female
         sClothing = "nw_cloth013";
         break;
    case 18:
         // Make the NPC Male
         sClothing = "nw_cloth019";
         break;
    case 19:
         // Make the NPC Female
         sClothing = "nw_cloth006";
         break;
    case 20:
         // Make the NPC Male
         sClothing = "nw_cloth025";
         break;
    default:
         // Do nothing!
         break;
    }
    CreateItemOnObject(sClothing,oNPC,1,"clothing");
    object oClothing = GetItemPossessedBy(oNPC,"clothing");
    SetDroppableFlag(oClothing,FALSE);
    SetPickpocketableFlag(oClothing,FALSE);
    AssignCommand(oNPC,ActionEquipItem(oClothing,INVENTORY_SLOT_CHEST));
}

void LevelUp(object oNPC, object oPC)
{
int iClass;
switch (d20(1))
    {
    case 0:
         // statements ...
         // condition would also evaluate as true if x == 0, which should not happen . . .
         // but . . . lets put this in here just as a safety device :)
         break;
    case 1:
         iClass = CLASS_TYPE_BARBARIAN;
         break;
    case 2:
         iClass = CLASS_TYPE_BARD;
         break;
    case 3:
         iClass = CLASS_TYPE_CLERIC;
         break;
    case 4:
         iClass = CLASS_TYPE_COMMONER;
         break;
    case 5:
         iClass = CLASS_TYPE_DRUID;
         break;
    case 6:
         iClass = CLASS_TYPE_FIGHTER;
         break;
    case 7:
         iClass = CLASS_TYPE_RANGER;
         break;
    case 8:
         iClass = CLASS_TYPE_ROGUE;
         break;
    case 9:
         iClass = CLASS_TYPE_SORCERER;
         break;
    case 10:
         iClass = CLASS_TYPE_WIZARD;
         break;
    case 11:
         iClass = CLASS_TYPE_COMMONER;
         break;
    case 12:
         iClass = CLASS_TYPE_COMMONER;
         break;
    case 13:
         iClass = CLASS_TYPE_COMMONER;
         break;
    case 14:
         iClass = CLASS_TYPE_COMMONER;
         break;
    case 15:
         iClass = CLASS_TYPE_COMMONER;
         break;
    case 16:
         iClass = CLASS_TYPE_COMMONER;
         break;
    case 17:
         iClass = CLASS_TYPE_COMMONER;
         break;
    case 18:
         iClass = CLASS_TYPE_COMMONER;
         break;
    case 19:
         iClass = CLASS_TYPE_COMMONER;
         break;
    case 20:
         iClass = CLASS_TYPE_COMMONER;
         break;
    default:
         // Do nothing!
         break;
    }
// Lets calculate the average party hit dice for production of appropriate CRs
int iAveHD = GetFactionAverageLevel(oPC);
// Now we have to randomize the HD to +/- 2 HD of the parties average HD to
// add some randomization to the CR scaling . . . just for fun of course :)
int iRandomHD;
switch (d8(1))
    {
    case 0:
         // statements ...
         // condition would also evaluate as true if x == 0, which should not happen . . .
         // but . . . lets put this in here just as a safety device :)
         break;
    case 1:
         iRandomHD = iAveHD-4;
         break;
    case 2:
         iRandomHD = iAveHD-3;
         break;
    case 3:
         iRandomHD = iAveHD-2;
         break;
    case 4:
         iRandomHD = iAveHD-1;
         break;
    case 5:
         iRandomHD = iAveHD;
         break;
    case 6:
         iRandomHD = iAveHD;
         break;
    case 7:
         iRandomHD = iAveHD+1;
         break;
    case 8:
         iRandomHD = iAveHD+2;
         break;
    default:
         // Do nothing!
         break;
    }
// Now we need to get the equivalet xp of the party averge hit
// dice and set the xp of the npc to that value
int iXPRandomHD = ((iRandomHD) * 1000) + ((((iRandomHD - 1) * (iRandomHD - 2)) / 2) * 1000) - 999;
SetXP(oNPC, iXPRandomHD);
// Finally it is time to level up our NPC :)
while((GetHitDice(oNPC) < iRandomHD)&&(GetHitDice(oNPC)<40))
    {
    LevelUpHenchman(oNPC, iClass, TRUE);
    }
// Debug feedback
if (GetLocalInt(GetModule(),"Debug")==1)
    {
    SendMessageToPC(GetFirstPC(),"The Average Hit Dice of the Party is "+IntToString(iAveHD));
    SendMessageToPC(GetFirstPC(),"The Randomized Hit Dice of the NPC is "+IntToString(iRandomHD));
    SendMessageToPC(GetFirstPC(),"The NPC's current XP is "+IntToString(iXPRandomHD));
    SendMessageToPC(GetFirstPC(),"The Level of the NPC is "+IntToString(GetHitDice(oNPC)));
    }
}

void CreateGiver(object oPC)
{
// Find the area the NPC will spawn in
AreaNPC();
// Retrieve the area given by the randomized area function
string sAreaGiver = GetLocalString(OBJECT_SELF,"AreaNPC");
// Find the location the NPC will spawn at within the given area
LocateNPC();
// Retrieve the location given by the randomized location function
location lLocationGiver = GetLocalLocation(OBJECT_SELF,"LocationNPC");
// We want to be able to identify the NPC based on the quest number they are assigned to
// for quest tracking purposes, so lets add a unique tag based on their quest number
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
// Lets see what random race and gender we get
RandomGiver();
// Generate the Resref of this NPC
string sGiverRes = GetLocalString(OBJECT_SELF,"sGiverRes"+sQuest);
// Time to actually create the NPC
object oGiver = CreateObject(OBJECT_TYPE_CREATURE,sGiverRes,lLocationGiver,FALSE,"QuestGiver"+sQuest);
// We need to clear the local location because the randomizer does not seem random enough . . .
// I just want a fresh start so the randomization is truly random :)
vector vPos = Vector(0.0,0.0);
int iFacing = 0;
float fFacing = IntToFloat(iFacing);
location lLocationNPC = Location(GetObjectByTag(""), vPos, fFacing);
SetLocalLocation(OBJECT_SELF,"LocationNPC",lLocationNPC);
// Lets give a random name to the NPC based on race and gender
MakeName(oGiver);
// Lets give random clothing to the NPC
RandomClothes(oGiver);
// Debug feedback
if (GetLocalInt(GetModule(),"Debug")==1)
    {
    SendMessageToPC(GetFirstPC(),"The Giver's name should be "+GetName(oGiver,FALSE));
    SendMessageToPC(GetFirstPC(),"The Giver's tag is "+GetTag(oGiver));
    }
// Give the quest "giver" an item for the PC to transport if this is a "gopher" quest
// The PC is to carry this item from the "giver" to the "acceptor"
if ((GetLocalString(OBJECT_SELF,"QuestType")=="Gopher"))
    {
    // Randomize the item
    DetermineItem(oGiver);
    // Create item based on determined tag
    string sItemType = GetLocalString(OBJECT_SELF,"QuestItem"+sQuest);
    object oItem = CreateItemOnObject(sItemType,oGiver,1,"QuestItem"+sQuest);
    string sItemName = GetName(oItem);
    // Debug feedback
    if (GetLocalInt(GetModule(),"Debug")==1)
        {
        SendMessageToPC(GetFirstPC(),"The Item's name should be "+GetName(oItem,FALSE));
        SendMessageToPC(GetFirstPC(),"The Item's tag is "+GetTag(oItem));
        }
    }
}

void CreateAcceptor(object oPC)
{
// Find the area the NPC will spawn in
AreaNPC();
// Retrieve the area given by the randomized area function
string sAreaAcceptor = GetLocalString(OBJECT_SELF,"AreaNPC");
// Find the location the NPC will spawn at within the given area
LocateNPC();
// Retrieve the location given by the randomized location function
location lLocationAcceptor = GetLocalLocation(OBJECT_SELF,"LocationNPC");
// We want to be able to identify the NPC based on the quest number they are assigned to
// for quest tracking purposes, so lets add a unique tag based on their quest number
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
// Lets see what random race and gender we get
RandomAcceptor();
// Generate the Resref of this NPC
string sAcceptorRes = GetLocalString(OBJECT_SELF,"sAcceptorRes"+sQuest);
// Time to actually create the NPC
object oAcceptor = CreateObject(OBJECT_TYPE_CREATURE,sAcceptorRes,lLocationAcceptor,FALSE,"QuestAcceptor"+sQuest);
// We need to clear the local location because the randomizer does not seem random enough . . .
// I just want a fresh start so the randomization is truly random :)
vector vPos = Vector(0.0,0.0);
int iFacing = 0;
float fFacing = IntToFloat(iFacing);
location lLocationNPC = Location(GetObjectByTag(""), vPos, fFacing);
SetLocalLocation(OBJECT_SELF,"LocationNPC",lLocationNPC);
// Lets give a random name to the NPC based on race and gender
MakeName(oAcceptor);
// Lets give random clothing to the NPC
RandomClothes(oAcceptor);
// Debug feedback
if (GetLocalInt(GetModule(),"Debug")==1)
    {
    SendMessageToPC(GetFirstPC(),"The Acceptor's name should be "+GetName(oAcceptor,FALSE));
    SendMessageToPC(GetFirstPC(),"The Acceptor's tag is "+GetTag(oAcceptor));
    }
// Give the quest giver an item for the PC to transport if this is a "fetch" quest
// The PC is to go to the "acceptor" and bring back said item to "giver"
if ((GetLocalString(OBJECT_SELF,"QuestType")=="Fetch"))
    {
    // Randomize the item
    DetermineItem(oAcceptor);
    // Create item based on determined tag
    string sItemType = GetLocalString(OBJECT_SELF,"QuestItem"+sQuest);
    object oItem = CreateItemOnObject(sItemType,oAcceptor,1,"QuestItem"+sQuest);
    string sItemName = GetName(oItem);
    // Debug feedback
    if (GetLocalInt(GetModule(),"Debug")==1)
        {
        SendMessageToPC(GetFirstPC(),"The Item's name should be "+GetName(oItem,FALSE));
        SendMessageToPC(GetFirstPC(),"The Item's tag is "+GetTag(oItem));
        }
    }
}

void CreateCriminal(object oPC)
{
// Find the area the NPC will spawn in
AreaNPC();
// Retrieve the area given by the randomized area function
string sAreaCriminal = GetLocalString(OBJECT_SELF,"AreaNPC");
// Find the location the NPC will spawn at within the given area
LocateNPC();
// Retrieve the location given by the randomized location function
location lLocationCriminal = GetLocalLocation(OBJECT_SELF,"LocationNPC");
// We want to be able to identify the Criminal based on the quest number they are assigned to
// for quest tracking purposes, so lets add a unique tag based on their quest number
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
// Lets see what random race and gender we get
RandomCriminal();
// Generate the Resref of this NPC
string sCriminalRes = GetLocalString(OBJECT_SELF,"sCriminalRes"+sQuest);
// Time to actually create the NPC
object oCriminal = CreateObject(OBJECT_TYPE_CREATURE,sCriminalRes,lLocationCriminal,FALSE,"QuestCriminal"+sQuest);
// Lets give a random name to the NPC based on race and gender
MakeName(oCriminal);
// Lets give random clothing to the NPC
RandomClothes(oCriminal);
// Level this NPC up!
LevelUp(oCriminal,oPC);
// Debug feedback
if (GetLocalInt(GetModule(),"Debug")==1)
    {
    SendMessageToPC(GetFirstPC(),"The Criminal's name should be "+GetName(oCriminal,FALSE));
    SendMessageToPC(GetFirstPC(),"The Criminal's tag is "+GetTag(oCriminal));
    }
}

void CreateVictim(object oPC)
{
// Find the area the NPC will spawn in
AreaNPC();
// Retrieve the area given by the randomized area function
string sAreaVictim = GetLocalString(OBJECT_SELF,"AreaNPC");
// Find the location the NPC will spawn at within the given area
LocateNPC();
// Retrieve the location given by the randomized location function
location lLocationVictim = GetLocalLocation(OBJECT_SELF,"LocationNPC");
// We want to be able to identify the Victim based on the quest number they are assigned to
// for quest tracking purposes, so lets add a unique tag based on their quest number
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
// Lets see what random race and gender we get
RandomVictim();
// Generate the Resref of this NPC
string sVictimRes = GetLocalString(OBJECT_SELF,"sVictimRes"+sQuest);
// Time to actually create the NPC
object oVictim = CreateObject(OBJECT_TYPE_CREATURE,sVictimRes,lLocationVictim,FALSE,"QuestVictim"+sQuest);
// We need to clear the local location because the randomizer does not seem random enough . . .
// I just want a fresh start so the randomization is truly random :)
vector vPos = Vector(0.0,0.0);
int iFacing = 0;
float fFacing = IntToFloat(iFacing);
location lLocationNPC = Location(GetObjectByTag(""), vPos, fFacing);
SetLocalLocation(OBJECT_SELF,"LocationNPC",lLocationNPC);
// Lets give a random name to the NPC based on race and gender
MakeName(oVictim);
// Lets give random clothing to the NPC
RandomClothes(oVictim);
// Level this NPC up!
LevelUp(oVictim,oPC);
// Debug feedback
if (GetLocalInt(GetModule(),"Debug")==1)
    {
    SendMessageToPC(GetFirstPC(),"The Victim's name should be "+GetName(oVictim,FALSE));
    SendMessageToPC(GetFirstPC(),"The Victim's tag is "+GetTag(oVictim));
    }

// Give the quest victim an item for the PC to steal if this is a "robbery" quest
// PC is to "acquire" said item and bring back to the quest "giver"
if ((GetLocalString(OBJECT_SELF,"QuestType")=="Robbery"))
    {
    // Randomize the item
    DetermineItem(oVictim);
    // Create item based on determined tag
    string sItemType = GetLocalString(OBJECT_SELF,"QuestItem"+sQuest);
    object oItem = CreateItemOnObject(sItemType,oVictim,1,"QuestItem"+sQuest);
    string sItemName = GetName(oItem);
    // Debug feedback
    if (GetLocalInt(GetModule(),"Debug")==1)
        {
        SendMessageToPC(GetFirstPC(),"The Item's name should be "+GetName(oItem,FALSE));
        SendMessageToPC(GetFirstPC(),"The Item's tag is "+GetTag(oItem));
        }
    }
// Give the quest victim an "ear" for the PC to "cut off" for proof in a "murder" quest
// PC is to "acquire" said ear and bring back to the quest "giver"
if ((GetLocalString(OBJECT_SELF,"QuestType")=="Murder"))
    {
    string sItemType = GetLocalString(OBJECT_SELF,"QuestItem"+sQuest);
    object oItem = CreateItemOnObject("victimsear",oVictim,1,"QuestItem"+sQuest);
    string sItemName = GetName(oItem);

    if (GetLocalInt(GetModule(),"Debug")==1)
        {
        SendMessageToPC(GetFirstPC(),"The Item's name should be "+GetName(oItem,FALSE));
        SendMessageToPC(GetFirstPC(),"The Item's tag is "+GetTag(oItem));
        }
    }
}

void CreateKNVictim(object oPC)
{
// Find the area the NPC will spawn in
AreaNPC();
// Retrieve the area given by the randomized area function
string sAreaKNVictimr = GetLocalString(OBJECT_SELF,"AreaNPC");
// Find the location the NPC will spawn at within the given area
LocateNPC();
// Retrieve the location given by the randomized location function
location lLocationKNVictim = GetLocalLocation(OBJECT_SELF,"LocationNPC");
// We want to be able to identify the Victim based on the quest number they are assigned to
// for quest tracking purposes, so lets add a unique tag based on their quest number
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
// Lets see what random race and gender we get
RandomKidnapVictim();
// Generate the Resref of this NPC
string sKNVictimRes = GetLocalString(OBJECT_SELF,"sKNVictimRes"+sQuest);
// Time to actually create the NPC
object oKNVictim = CreateObject(OBJECT_TYPE_CREATURE,sKNVictimRes,lLocationKNVictim,FALSE,"QuestKNVictim"+sQuest);
// We need to clear the local location because the randomizer does not seem random enough . . .
// I just want a fresh start so the randomization is truly random :)
vector vPos = Vector(0.0,0.0);
int iFacing = 0;
float fFacing = IntToFloat(iFacing);
location lLocationNPC = Location(GetObjectByTag(""), vPos, fFacing);
SetLocalLocation(OBJECT_SELF,"LocationNPC",lLocationNPC);
// Lets give a random name to the NPC based on race and gender
MakeName(oKNVictim);
// Debug feedback
if (GetLocalInt(GetModule(),"Debug")==1)
    {
    SendMessageToPC(GetFirstPC(),"The Kidnapping Victim's name should be "+GetName(oKNVictim,FALSE));
    SendMessageToPC(GetFirstPC(),"The Kidnappin Victim's tag is "+GetTag(oKNVictim));
    }
}

void SpawnNPCs(object oPC)
{
object oMod = GetModule();
// We need to identify the Quest number so we can work with the objects as needed
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
// We need to identify the tag of the NPCs involved so we can work with the objects as needed
string sGiver = "QuestGiver"+sQuest;
string sAcceptor = "QuestAcceptor"+sQuest;
string sCriminal = "QuestCriminal"+sQuest;
string sVictim = "QuestVictim"+sQuest;
string sKNVictim = "QuestKNVictim"+sQuest;
// Spawn in NPCs with random names based on the type of quest
// Get an item from "acceptor" and bring back to "giver"
if (GetLocalInt(OBJECT_SELF,"Fetch")==1)
    {
    CreateGiver(oPC);
    CreateAcceptor(oPC);
    SetLocalString(GetObjectByTag(sGiver),"QuestType","Fetch");
    SetLocalString(GetObjectByTag(sAcceptor),"QuestType","Fetch");
    SetLocalString(GetObjectByTag(sGiver),"Quest",sQuest);
    SetLocalString(GetObjectByTag(sAcceptor),"Quest",sQuest);
    SetLocalInt(OBJECT_SELF,"Fetch",0);
    }
// Take an item from "giver" to "acceptor"
if (GetLocalInt(OBJECT_SELF,"Gopher")==1)
    {
    CreateGiver(oPC);
    CreateAcceptor(oPC);
    SetLocalString(GetObjectByTag(sGiver),"QuestType","Gopher");
    SetLocalString(GetObjectByTag(sAcceptor),"QuestType","Gopher");
    SetLocalString(GetObjectByTag(sGiver),"Quest",sQuest);
    SetLocalString(GetObjectByTag(sAcceptor),"Quest",sQuest);
    SetLocalInt(OBJECT_SELF,"Gopher",0);
    }
// Rescue the child from the criminal and return child to "giver"
if (GetLocalInt(OBJECT_SELF,"Kidnapping")==1)
    {
    CreateGiver(oPC);
    CreateCriminal(oPC);
    CreateKNVictim(oPC);
    SetLocalString(GetObjectByTag(sGiver),"QuestType","Kidnapping");
    SetLocalString(GetObjectByTag(sCriminal),"QuestType","Kidnapping");
    SetLocalString(GetObjectByTag(sKNVictim),"QuestType","Kidnapping");
    SetLocalString(GetObjectByTag(sGiver),"Quest",sQuest);
    SetLocalString(GetObjectByTag(sCriminal),"Quest",sQuest);
    SetLocalString(GetObjectByTag(sKNVictim),"Quest",sQuest);
    // Determine a Ransom amount for the Criminal to ask for in exchange for the child
    int iRansom = 200 + d100(3);
    SetLocalInt(GetObjectByTag(sCriminal),"Ransom",iRansom);
    // Lets make the kidnapping victim jump to then follow the criminal
    AssignCommand(GetObjectByTag(sKNVictim),ClearAllActions());
    AssignCommand(GetObjectByTag(sKNVictim),ActionJumpToObject(GetObjectByTag(sCriminal)));
    AssignCommand(GetObjectByTag(sKNVictim),ActionForceFollowObject(GetObjectByTag(sCriminal),1.0));
    // Debug feedback
    if (GetLocalInt(GetModule(),"Debug")==1)
        {
        object oCrimeScene = GetArea(GetObjectByTag(sCriminal));
        string sCrimeScene = GetName(oCrimeScene,FALSE);
        SendMessageToPC(GetFirstPC(),"The Victim's new location should be "+sCrimeScene);
        }
    SetLocalInt(OBJECT_SELF,"Kidnapping",0);
    }
// Go steal something from the "victim" and bring back to "giver"
if (GetLocalInt(OBJECT_SELF,"Robbery")==1)
    {
    CreateGiver(oPC);
    CreateVictim(oPC);
    SetLocalString(GetObjectByTag(sGiver),"QuestType","Robbery");
    SetLocalString(GetObjectByTag(sVictim),"QuestType","Robbery");
    SetLocalString(GetObjectByTag(sGiver),"Quest",sQuest);
    SetLocalString(GetObjectByTag(sVictim),"Quest",sQuest);
    SetLocalInt(OBJECT_SELF,"Robbery",0);
    }
// Go kill the "victim" and bring back proof to "giver"
if (GetLocalInt(OBJECT_SELF,"Murder")==1)
    {
    CreateGiver(oPC);
    CreateVictim(oPC);
    SetLocalString(GetObjectByTag(sGiver),"QuestType","Murder");
    SetLocalString(GetObjectByTag(sVictim),"QuestType","Murder");
    SetLocalString(GetObjectByTag(sGiver),"Quest",sQuest);
    SetLocalString(GetObjectByTag(sVictim),"Quest",sQuest);
    SetLocalInt(OBJECT_SELF,"Murder",0);
    }
// Go find . . . something
if (GetLocalInt(OBJECT_SELF,"Search")==1)
    {
    CreateGiver(oPC);
    CreateAcceptor(oPC);
    SetLocalString(GetObjectByTag(sGiver),"QuestType","Search");
    SetLocalString(GetObjectByTag(sAcceptor),"QuestType","Search");
    SetLocalString(GetObjectByTag(sGiver),"Quest",sQuest);
    SetLocalString(GetObjectByTag(sAcceptor),"Quest",sQuest);
    SetLocalInt(OBJECT_SELF,"Search",0);
    }
}

void DespawnNPCs()
{
// ID this Task Master as an individual by a local string set on him
string sTaskMaster = GetLocalString(OBJECT_SELF,"TaskMaster");
// We need to be able to destroy all quest NPCs and quest items that were previously made.
// If we do not clean up these objects, then the module will get cluttered beyond usefullness
// and there will be doubling effects for quests.
object oGiver1 = GetObjectByTag("QuestGiver1"+sTaskMaster);
object oGiver2 = GetObjectByTag("QuestGiver2"+sTaskMaster);
object oGiver3 = GetObjectByTag("QuestGiver3"+sTaskMaster);
object oGiver4 = GetObjectByTag("QuestGiver4"+sTaskMaster);
object oGiver5 = GetObjectByTag("QuestGiver5"+sTaskMaster);
object oAcceptor1 = GetObjectByTag("QuestAcceptor1"+sTaskMaster);
object oAcceptor2 = GetObjectByTag("QuestAcceptor2"+sTaskMaster);
object oAcceptor3 = GetObjectByTag("QuestAcceptor3"+sTaskMaster);
object oAcceptor4 = GetObjectByTag("QuestAcceptor4"+sTaskMaster);
object oAcceptor5 = GetObjectByTag("QuestAcceptor5"+sTaskMaster);
object oCriminal1 = GetObjectByTag("QuestCriminal1"+sTaskMaster);
object oCriminal2 = GetObjectByTag("QuestCriminal2"+sTaskMaster);
object oCriminal3 = GetObjectByTag("QuestCriminal3"+sTaskMaster);
object oCriminal4 = GetObjectByTag("QuestCriminal4"+sTaskMaster);
object oCriminal5 = GetObjectByTag("QuestCriminal5"+sTaskMaster);
object oVictim1 = GetObjectByTag("QuestVictim1"+sTaskMaster);
object oVictim2 = GetObjectByTag("QuestVictim2"+sTaskMaster);
object oVictim3 = GetObjectByTag("QuestVictim3"+sTaskMaster);
object oVictim4 = GetObjectByTag("QuestVictim4"+sTaskMaster);
object oVictim5 = GetObjectByTag("QuestVictim5"+sTaskMaster);
object oKNVictim1 = GetObjectByTag("QuestKNVictim1"+sTaskMaster);
object oKNVictim2 = GetObjectByTag("QuestKNVictim2"+sTaskMaster);
object oKNVictim3 = GetObjectByTag("QuestKNVictim3"+sTaskMaster);
object oKNVictim4 = GetObjectByTag("QuestKNVictim4"+sTaskMaster);
object oKNVictim5 = GetObjectByTag("QuestKNVictim5"+sTaskMaster);
object oItem1 = GetObjectByTag("QuestItem1"+sTaskMaster);
object oItem2 = GetObjectByTag("QuestItem2"+sTaskMaster);
object oItem3 = GetObjectByTag("QuestItem3"+sTaskMaster);
object oItem4 = GetObjectByTag("QuestItem4"+sTaskMaster);
object oItem5 = GetObjectByTag("QuestItem5"+sTaskMaster);
object oNote1 = GetObjectByTag("QuestItem1Note"+sTaskMaster);
object oNote2 = GetObjectByTag("QuestItem2Note"+sTaskMaster);
object oNote3 = GetObjectByTag("QuestItem3Note"+sTaskMaster);
object oNote4 = GetObjectByTag("QuestItem4Note"+sTaskMaster);
object oNote5 = GetObjectByTag("QuestItem5Note"+sTaskMaster);
// Destroy quest items
DestroyObject(oItem1);
DestroyObject(oItem2);
DestroyObject(oItem3);
DestroyObject(oItem4);
DestroyObject(oItem5);
// Destroy quest notes
DestroyObject(oNote1);
DestroyObject(oNote2);
DestroyObject(oNote3);
DestroyObject(oNote4);
DestroyObject(oNote5);
// Destroy quest givers
DestroyObject(oGiver1);
DestroyObject(oGiver2);
DestroyObject(oGiver3);
DestroyObject(oGiver4);
DestroyObject(oGiver5);
// Destroy quest acceptors
DestroyObject(oAcceptor1);
DestroyObject(oAcceptor2);
DestroyObject(oAcceptor3);
DestroyObject(oAcceptor4);
DestroyObject(oAcceptor5);
// Destroy quest criminals
DestroyObject(oCriminal1);
DestroyObject(oCriminal2);
DestroyObject(oCriminal3);
DestroyObject(oCriminal4);
DestroyObject(oCriminal5);
// Destroy quest victims
DestroyObject(oVictim1);
DestroyObject(oVictim2);
DestroyObject(oVictim3);
DestroyObject(oVictim4);
DestroyObject(oVictim5);
// Destroy quest kidnap victims
DestroyObject(oKNVictim1);
DestroyObject(oKNVictim2);
DestroyObject(oKNVictim3);
DestroyObject(oKNVictim4);
DestroyObject(oKNVictim5);
}

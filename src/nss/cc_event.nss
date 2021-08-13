#include "inc_isdm"

int CUSTOM_TOKEN = 8000;
int MaxOpt = 23;
int pos;
string ConvName;

string FixName(string src)
{
    string nam = src;
    int cnt = 0;
    int s;

    for(s=0; s<GetStringLength(nam); s++) {
        if (GetSubString(nam, s, 1) == "<") {
            if (GetSubString(nam, s+1, 1) == "c") cnt++;
            if (GetSubString(nam, s+1, 1) == "/") cnt--;
        }
    }
    for(s=0; s<cnt; s++) nam += "</c>";
// SpeakString("fixed:" + nam + IntToString(cnt) + " name:" +src + " cnt:", TALKVOLUME_SHOUT);

    return nam;
}

string ShowAttr(object oPC)
{
    string str;
    str = "Strength: " + IntToString(GetAbilityScore(oPC, ABILITY_STRENGTH)) + " (" + IntToString(GetAbilityModifier(ABILITY_STRENGTH, oPC)) + ") ";
    str += "dexterity: " + IntToString(GetAbilityScore(oPC, ABILITY_DEXTERITY)) + " (" + IntToString(GetAbilityModifier(ABILITY_DEXTERITY, oPC)) + ") ";
    str += "charisma: " + IntToString(GetAbilityScore(oPC, ABILITY_CHARISMA)) + " (" + IntToString(GetAbilityModifier(ABILITY_CHARISMA, oPC)) + ") ";
    str += "intellegence: " + IntToString(GetAbilityScore(oPC, ABILITY_INTELLIGENCE)) + " (" + IntToString(GetAbilityModifier(ABILITY_INTELLIGENCE, oPC)) + ") ";
    str += "wisdom: " + IntToString(GetAbilityScore(oPC, ABILITY_WISDOM)) + " (" + IntToString(GetAbilityModifier(ABILITY_WISDOM, oPC)) + ") ";
    str += "constitution: " + IntToString(GetAbilityScore(oPC, ABILITY_CONSTITUTION)) + " (" + IntToString(GetAbilityModifier(ABILITY_CONSTITUTION, oPC)) + ") ";
    str += "fortitude: " + IntToString(GetFortitudeSavingThrow(oPC)) + " ";
    str += "will: " + IntToString(GetWillSavingThrow(oPC)) + " ";
    str += "reflex: " + IntToString(GetReflexSavingThrow(oPC)) + " ";
    str += "ac: " + IntToString(GetAC(oPC)) + " ";
    str += "age: " + IntToString(GetAge(oPC)) + " ";
    str += "diety: " + GetDeity(oPC) + " ";
    str += "base attack: " + IntToString(GetBaseAttackBonus(oPC)) + " ";
    str += "caster lv: " + IntToString(GetCasterLevel(oPC)) + " ";
    str += "challenge rating: " + FloatToString(GetChallengeRating(oPC), 5, 2) + " ";
    str += "hp: " + IntToString(GetCurrentHitPoints(oPC)) + " (" + IntToString(GetMaxHitPoints(oPC)) + ") ";
    str += "speed: " + IntToString(GetMovementRate(oPC)) + " ";

    if (isdm(OBJECT_SELF)==TRUE) {
        str += "immortal: " + IntToString(GetImmortal(oPC)) + " ";
        str += "IP: " + GetPCIPAddress(oPC) + " ";
        str += "cdkey: " + GetPCPublicCDKey(oPC) + " ";
    }

    return str;
}

void CreateChoice(object oPC, string msg, string act)
{
    int lev = GetLocalInt(oPC, "cc_level");
    SetLocalString(oPC, "cc_msg" + IntToString(pos), msg);
    SetLocalString(oPC, "cc_act" + IntToString(pos), act);
    if (pos == 0) {
        SetLocalInt(oPC, "cc_level", lev+1);
        SetLocalString(oPC, "cc_prev" + IntToString(lev), ConvName);
        if (lev != 0) {
            SetLocalString(oPC, "cc_msg" + IntToString(pos+1), "<< Previous");
            SetLocalString(oPC, "cc_act" + IntToString(pos+1), "<<");
            if (pos < MaxOpt) pos += 1;
        }
    }
    if (pos < MaxOpt) pos += 1;
}

void MakeLvUp(int l, object oPC)
{
    string xp;
    int s;
    for(s=l; s<l+20; s++) {
        xp = Get2DAString("exptable", "XP", s);
        CreateChoice(oPC, "Raise or lower level to " + IntToString(s+1), "xp_" + xp);
    }
}

string Align(object oPC)
{
    string str = "";
    switch (GetAlignmentLawChaos(oPC)) {
        case ALIGNMENT_LAWFUL:    str = "Lawful ";    break;
        case ALIGNMENT_NEUTRAL:   str = "Neutral ";   break;
        case ALIGNMENT_CHAOTIC:   str = "Chaotic ";   break;
   }

    switch (GetAlignmentGoodEvil(oPC)) {
        case ALIGNMENT_GOOD:    str += "Good";       break;
        case ALIGNMENT_NEUTRAL: str += "Neutral";   break;
        case ALIGNMENT_EVIL:    str += "Evil";      break;
   }

   if (str == "Neutral Neutral") str = "True Neutral";

   str += "(" + IntToString(GetLawChaosValue(oPC)) + "/" + IntToString(GetGoodEvilValue(oPC)) + ")";
   str += "\n" + ShowAttr(oPC);

   return str;
}

void MakePoly(int p, object oPC)
{
    string nam;
    int s;
    for(s=p; s<p+15; s++) {
        nam = Get2DAString("polymorph", "Name", s);
        if (nam != "") {
            if (GetStringLeft(nam, 15) == "POLYMORPH_TYPE_") nam = GetSubString(nam, 15, 40);
            if (GetStringLeft(nam, 10) == "POLYMORPH_") nam = GetSubString(nam, 10, 40);
            nam = GetStringLeft(nam, 1) + GetStringLowerCase(GetSubString(nam, 1, 40));
            CreateChoice(oPC, nam, "p_" + IntToString(s));
        }
    }
}

void ZapToys(object PC, object Target, int perm)
{
    int s, tcnt = GetLocalInt(GetModule(), "tcnt");
    object item;
    string ref;
    string amsg = "";
    if (perm != 0) amsg = " & deactivated forever";
    for(s=0; s<tcnt; s++) {
        ref = GetLocalString(GetModule(), "tref"+IntToString(s));
        item = GetItemPossessedBy(Target, "toy_"+ref);
//SpeakString(GetName(Target) + ": "+ ref + " = " + GetName(item), TALKVOLUME_SHOUT);
        if (item != OBJECT_INVALID) {
            SendMessageToPC(PC, GetName(item) + " removed" + amsg + " for " + GetName(Target));
            DestroyObject(item, 1.0);
        }
    }
    if (perm != 0) {
        SetLocalInt(Target, "toys", 0);
        SetCampaignInt(GetModuleName(), "toys", GetLocalInt(Target, "toys"), Target);
    }
}

void ShowToy(object PC, object Target, int toys, int t)
{
    string name = GetLocalString(GetModule(), "tname"+IntToString(t));
    string ref = GetLocalString(GetModule(), "tref"+IntToString(t));

    string colour = "<cú  >";  // red
    if (GetItemPossessedBy(Target, "toy_"+ref) != OBJECT_INVALID) {
        if ((toys & (1<<t)) != 0 || isdm(Target) == TRUE) {
            colour = "<cfú >";  // green
        } else {
            colour = "<cúú >";  // yellow
        }
    }
    CreateChoice(PC, colour + name + "</c>", "toy_" + IntToString(t));
}

void ShowAllow(object oPC, string typ)
{
    int s, e = 0, n;
    string who, allow = GetCampaignString(GetModuleName(), "allow"+GetPCPlayerName(oPC));

    for(n=0; n<10; n++) {
        s = e+1;
        e = FindSubString(allow, "~" + IntToString(n+1));
        who = GetSubString(allow, s + 1, e - s - 1);
        if (who != "~") CreateChoice(oPC, who, typ + who);
    }
}

void InitConv(object oPC, string conv) // fill in then start the selcted custom conversation
{
    int n;
    pos = 0;
    ConvName = conv;
    for(n=0; n<=MaxOpt; n++) {  // Clear old conversation
        SetLocalString(oPC, "cc_msg" + IntToString(n), "");
    }

    if (conv == "summon") {
        SetLocalInt(oPC, "cc_level", 0);
        CreateChoice(oPC, "Choose monster type:", "");
        CreateChoice(oPC, "All Creatures", "cc_quest"); // delete line - demo only
        CreateChoice(oPC, "Newest Creatures", "cc_new");

// copy & paste the following line to add a new monster category
        CreateChoice(oPC, "", "cc_");

    } else if (conv == "quest") { // delete line - demo only
        CreateChoice(oPC, "Choose Monster:", ""); // delete line - demo only
        CreateChoice(oPC, "Superman", "s_bandit002"); // delete line - demo only
        CreateChoice(oPC, "The Hulk", "s_thehulk"); // delete line - demo only

// copy the following 3 lines and paste them here to create a new category menu
     } else if (conv == "new") {
        CreateChoice(oPC, "Choose Monster:", "");
        CreateChoice(oPC, "Superman", "s_bandit002");
        CreateChoice(oPC, "The Hulk", "s_thehulk");

    } else if (conv == "qty") {
        object cc_conv=GetLocalObject(oPC, "cc_conv");
        int sum_cnt=0;
        int s;
        object monster;
        for(s=1; s<10; s++) {
            monster = GetNearestObjectByTag("s_"+GetTag(cc_conv), cc_conv, s);
            if (monster != OBJECT_INVALID) sum_cnt++;
        }
        if(sum_cnt<3){
            CreateChoice(oPC, "How many", "");
            CreateChoice(oPC, "One", "q_1");
            CreateChoice(oPC, "Two", "q_2");
//            CreateChoice(oPC, "Three", "q_3");
//            CreateChoice(oPC, "Four", "q_4");
//            CreateChoice(oPC, "Five", "q_5");
        } else {
            AssignCommand(cc_conv, SpeakString("I will not summon any more monsters until current ones have been killed"));
        }
    } else if (conv == "lvup") {
        object oTarget = GetLocalObject(oPC, "target");
        CreateChoice(oPC, FixName(GetName(oTarget)) + ": " + ShowAttr(oTarget) + "\n", "");
        CreateChoice(oPC, "Change Aligment", "cc_align");
        if (Get2DAString("exptable", "XP", 21) != "") {
            CreateChoice(oPC, "Levels 21 to 40", "cc_lvup2");
        }
        MakeLvUp(0, oPC);
    } else if (conv == "lvup2") {
        object oTarget = GetLocalObject(oPC, "target");
        CreateChoice(oPC, FixName(GetName(oTarget)) + ": " + ShowAttr(oTarget) + "\n", "");
        MakeLvUp(20, oPC);
    } else if (conv == "align") {
        object oTarget = GetLocalObject(oPC, "target");
        CreateChoice(oPC, "Shift Alignment:\n" + FixName(GetName(oTarget)) + ": " + Align(oTarget) + "\n", "");
        CreateChoice(oPC, "Chaotic 5", "al_c5");
        CreateChoice(oPC, "Chaotic 10", "al_c10");
        CreateChoice(oPC, "Chaotic 20", "al_c20");
        CreateChoice(oPC, "Lawful 5", "al_l5");
        CreateChoice(oPC, "Lawful 10", "al_l10");
        CreateChoice(oPC, "Lawful 20", "al_l20");
        CreateChoice(oPC, "Good 5", "al_g5");
        CreateChoice(oPC, "Good 10", "al_g10");
        CreateChoice(oPC, "Good 20", "al_g20");
        CreateChoice(oPC, "Evil 5", "al_e5");
        CreateChoice(oPC, "Evil 10", "al_e10");
        CreateChoice(oPC, "Evil 20", "al_e20");
    } else if (conv == "poly") {
//        SetLocalInt(oPC, "cc_level", 0);   // now done in cc_poly to allow emote wand to work
        CreateChoice(oPC, "Select form:", "");
        MakePoly(0, oPC);
        if (Get2DAString("polymorph", "Name", 15) != "") {
            CreateChoice(oPC, "Some more", "cc_poly2");
        }
        if (Get2DAString("polymorph", "Name", 30) != "") {
            CreateChoice(oPC, "Still more", "cc_poly3");
        }
        if (Get2DAString("polymorph", "Name", 45) != "") {
            CreateChoice(oPC, "Yet more", "cc_poly4");
        }
    } else if (conv == "poly2") {
        CreateChoice(oPC, "Select form:", "");
        MakePoly(15, oPC);
    } else if (conv == "poly3") {
        CreateChoice(oPC, "Select form:", "");
        MakePoly(30, oPC);
    } else if (conv == "poly4") {
        CreateChoice(oPC, "Select form:", "");
        MakePoly(45, oPC);
    } else if (conv == "emote") {
        SetLocalInt(oPC, "cc_level", 0);
        CreateChoice(oPC, "What would you like to do?", "");
        CreateChoice(oPC, "Freeze/Unfreeze", "ew_freeze");
        CreateChoice(oPC, "Sit on the Floor", "ew_sit");
        CreateChoice(oPC, "Sit in the nearest Chair", "ew_chair");
//        CreateChoice(oPC, "Sleep", "ew_sleep");
        CreateChoice(oPC, "Worship", "ew_worship");
        CreateChoice(oPC, "Meditate/Pray", "ew_pray");
        CreateChoice(oPC, "Read", "ew_read");
        CreateChoice(oPC, "Dance", "cc_dance");
        CreateChoice(oPC, "Fart", "ew_fart");
        CreateChoice(oPC, "The Funky Chicken", "ew_funky_chick");
        CreateChoice(oPC, "Change Appearance", "cc_ap0");
//        CreateChoice(oPC, "Polymorph", "cc_poly");
        CreateChoice(oPC, "Sound effect", "cc_snd");
//        CreateChoice(oPC, "I'd like to do a dice roll", "cc_roll");
//        CreateChoice(oPC, "Give me a Throne", "ew_throne");
        CreateChoice(oPC, "Flipper", "ew_flip");
        CreateChoice(oPC, "Fish Flop", "ew_fish");
        CreateChoice(oPC, "WoW", "ew_wow");
        CreateChoice(oPC, "Fly", "cc_fly");
        CreateChoice(oPC, "Have a Smoke", "ew_smoke");
        CreateChoice(oPC, "Lie Down-Back", "ew_back");
        CreateChoice(oPC, "Lie Down-Front", "ew_front");
        CreateChoice(oPC, "Speak", "cc_speak");
        CreateChoice(oPC, "Get Drunk", "cc_getdrunk");
    } else if (conv == "fly") {
        CreateChoice(oPC, "Choose", "");
        CreateChoice(oPC, "Freeze/Unfreeze", "ew_freeze");
        CreateChoice(oPC, "Fly", "ew_fly1");
        CreateChoice(oPC, "Fly 2", "ew_fly2");
        CreateChoice(oPC, "Super fly", "ew_fly3");
        CreateChoice(oPC, "Super fly 2", "ew_fly4");
    } else if (conv == "dance") {
        CreateChoice(oPC, "Choose dance", "");
        CreateChoice(oPC, "Freeze/Unfreeze", "ew_freeze");
        CreateChoice(oPC, "Dance 1", "ew_dance");
        CreateChoice(oPC, "Dance 2", "ew_dance2");
        CreateChoice(oPC, "Dance 3", "ew_dance3");
        CreateChoice(oPC, "Dance 4", "ew_dance4");
        CreateChoice(oPC, "Striptease", "ew_strip");
        CreateChoice(oPC, "Striptease2", "ew_strip2");
    } else if (conv == "speak") {
        CreateChoice(oPC, "Say what?", "");
        CreateChoice(oPC, "Greet", "sp_" + IntToString(VOICE_CHAT_HELLO));
        CreateChoice(oPC, "GoodBye", "sp_" + IntToString(VOICE_CHAT_GOODBYE));
        CreateChoice(oPC, "Cuss", "sp_" + IntToString(VOICE_CHAT_CUSS));
        CreateChoice(oPC, "Laugh", "sp_" + IntToString(VOICE_CHAT_LAUGH));
        CreateChoice(oPC, "Cheer", "sp_" + IntToString(VOICE_CHAT_CHEER));
        CreateChoice(oPC, "Bored", "sp_" + IntToString(VOICE_CHAT_BORED));
        CreateChoice(oPC, "Search", "sp_" + IntToString(VOICE_CHAT_SEARCH));
        CreateChoice(oPC, "Thanks", "sp_" + IntToString(VOICE_CHAT_THANKS));
        CreateChoice(oPC, "Good idea", "sp_" + IntToString(VOICE_CHAT_GOODIDEA));
        CreateChoice(oPC, "Bad idea", "sp_" + IntToString(VOICE_CHAT_BADIDEA));
        CreateChoice(oPC, "Threaten", "sp_" + IntToString(VOICE_CHAT_THREATEN));
        CreateChoice(oPC, "Poisoned", "sp_" + IntToString(VOICE_CHAT_POISONED));
        CreateChoice(oPC, "Need Rest", "sp_" + IntToString(VOICE_CHAT_REST));
        CreateChoice(oPC, "Enemies", "sp_" + IntToString(VOICE_CHAT_ENEMIES));
        CreateChoice(oPC, "Look Here", "sp_" + IntToString(VOICE_CHAT_LOOKHERE));
        CreateChoice(oPC, "Move Over", "sp_" + IntToString(VOICE_CHAT_MOVEOVER));
        CreateChoice(oPC, "Flatuence", "ew_fart");
    } else if (conv == "getdrunk") {
        CreateChoice(oPC, "How drunk?", "");
        CreateChoice(oPC, "Take a swig", "gd_ew_drunk_swig");
        CreateChoice(oPC, "Drink", "gd_ew_drink");
        CreateChoice(oPC, "Burp", "gd_ew_drunk_burp");
        CreateChoice(oPC, "Wobbly", "gd_ew_drunk");
        CreateChoice(oPC, "Falling Down", "gd_ew_drunkfall");
        CreateChoice(oPC, "Pass Out", "gd_ew_drunkpassout");
    } else if (conv == "roll") {
        CreateChoice(oPC, "What do you want to roll?", "");
        CreateChoice(oPC, "an Ability Check", "cc_ability");
        CreateChoice(oPC, "a Skill Check", "cc_skill");
        CreateChoice(oPC, "Just roll a dice", "cc_dice");
    } else if (conv == "ability") {
        CreateChoice(oPC, "Which Ability?", "");
        CreateChoice(oPC, "Strength", "ew_str");
        CreateChoice(oPC, "Dexterity (Reflex Saves)", "ew_dex");
        CreateChoice(oPC, "Constitution (Fort Saves)", "ew_con");
        CreateChoice(oPC, "Intelligence", "ew_int");
        CreateChoice(oPC, "Wisdom  (Will Saves)", "ew_wis");
        CreateChoice(oPC, "Charisma", "ew_char");
    } else if (conv == "skill") {
        CreateChoice(oPC, "Which Skill?", "");
        CreateChoice(oPC, "Concentration", "ew_conc");
        CreateChoice(oPC, "Disable Trap", "ew_trap");
        CreateChoice(oPC, "Discipline", "ew_disc");
        CreateChoice(oPC, "Hide", "ew_hide");
        CreateChoice(oPC, "Listen", "ew_listen");
        CreateChoice(oPC, "Lore", "ew_lore");
        CreateChoice(oPC, "Open Lock", "ew_open");
        CreateChoice(oPC, "Perform", "ew_perf");
        CreateChoice(oPC, "Persuade", "ew_pers");
        CreateChoice(oPC, "Search", "ew_search");
        CreateChoice(oPC, "Spellcraft", "ew_spell");
        CreateChoice(oPC, "Spot", "ew_spot");
        CreateChoice(oPC, "Taunt", "ew_taunt");
    } else if (conv == "dice") {
        CreateChoice(oPC, "Ok, which dice?", "");
        CreateChoice(oPC, "d4", "ew_d4");
        CreateChoice(oPC, "d6", "ew_d6");
        CreateChoice(oPC, "d8", "ew_d8");
        CreateChoice(oPC, "d10", "ew_d10");
        CreateChoice(oPC, "d12", "ew_d12");
        CreateChoice(oPC, "d20", "ew_d20");
        CreateChoice(oPC, "d100", "ew_d100");
    } else if (conv == "snd") {
        CreateChoice(oPC, "Which sound would you like?", "");
        CreateChoice(oPC, "Animal Sounds", "cc_s_animal");
        CreateChoice(oPC, "People Sounds", "cc_s_people");
        CreateChoice(oPC, "Spooky Sounds", "cc_s_spook");
        CreateChoice(oPC, "Environment Sounds", "cc_s_env");
    } else if (conv == "s_animal") {
        CreateChoice(oPC, "Which Animal Sound?", "");
        CreateChoice(oPC, "Big Cat", "ews_cat");
        CreateChoice(oPC, "Cat Screech", "as_an_catscrech2");
        CreateChoice(oPC, "Wolves howling", "ews_wolf");
        CreateChoice(oPC, "Cow Mooing", "ews_cow");
        CreateChoice(oPC, "Crow Cawing", "ews_crow");
        CreateChoice(oPC, "Dog Barking", "as_an_dogbark6");
        CreateChoice(oPC, "Hawk", "as_an_hawk1");
        CreateChoice(oPC, "Owl Hooting", "ews_owl");
        CreateChoice(oPC, "Rooster Crowing", "as_an_rooster1");
    } else if (conv == "s_people") {
        CreateChoice(oPC, "Which People Sound?", "");
        CreateChoice(oPC, "2 Men Chatting", "as_pl_nobtalk1");
        CreateChoice(oPC, "Man Coughs", "ews_mcough");
        CreateChoice(oPC, "Man Crying", "ews_mcry");
        CreateChoice(oPC, "Man Dies", "ews_mdie");
        CreateChoice(oPC, "Man Sneezes", "as_pl_sneezingm1");
        CreateChoice(oPC, "Man Spits", "as_pl_spittingm2");
        CreateChoice(oPC, "Man Yawns", "as_pl_yawningm1");
        CreateChoice(oPC, "Woman screams", "ews_wscream");
        CreateChoice(oPC, "Woman Coughs", "ews_wcough");
        CreateChoice(oPC, "Woman Crying", "ews_wcry");
        CreateChoice(oPC, "Woman Says 'Hands off Pig!'", "as_pl_tavlewdf2");
        CreateChoice(oPC, "More", "cc_s_people2");
    } else if (conv == "s_people2") {
        CreateChoice(oPC, "Which People Sound?", "");
        CreateChoice(oPC, "Rough Man says 'I need more Ale'", "as_pl_tavcallm2");
        CreateChoice(oPC, "Dunk man sings about an Ogre", "as_pl_tavsongm1");
        CreateChoice(oPC, "Drunk Singing", "as_pl_tavsongm2");
        CreateChoice(oPC, "Officer shouts 'To your Posts!'", "as_pl_officerm4");
        CreateChoice(oPC, "Male Pleading 'Let me out Please'", "as_pl_despairm1");
        CreateChoice(oPC, "We're doomed", "as_pl_evanglstm3");
    } else if (conv == "s_spook") {
        CreateChoice(oPC, "Which Spooky Sound?", "");
        CreateChoice(oPC, "Deep Growling", "ews_growl");
        CreateChoice(oPC, "Evil Men Chanting", "as_pl_evilchantm");
        CreateChoice(oPC, "Spooky Laughing", "ews_slaugh");
        CreateChoice(oPC, "Spooky Moaning", "ews_smoan");
        CreateChoice(oPC, "Demon Voice 'I will rape your soul'", "c_demon_bat1");
        CreateChoice(oPC, "Demon Voice 'Your pain shall be eternal'", "c_demon_bat2");
        CreateChoice(oPC, "Ghoul Voice 'Rend your flesh'", "c_ghoul_bat2");
    } else if (conv == "s_env") {
        CreateChoice(oPC, "Which Environment Sound?", "");
        CreateChoice(oPC, "Breaking Noises", "ews_break");
        CreateChoice(oPC, "Bush Rustles", "as_na_bushmove1");
        CreateChoice(oPC, "Door Shuts", "ews_door");
        CreateChoice(oPC, "Floorboard Creaks", "ews_creak");
        CreateChoice(oPC, "Small Splash", "as_na_splash1");
        CreateChoice(oPC, "Thunder", "ews_thunder");
        CreateChoice(oPC, "Twig Snaps", "ews_twig");
    } else if (conv == "score") {
        SetLocalInt(oPC, "cc_level", 0);
        CreateChoice(oPC, "Scoreboard", "");
        CreateChoice(oPC, "Show all players scores", "sb_scores");
        CreateChoice(oPC, "Tell everyone my stats", "sb_stats");
//        CreateChoice(oPC, "Show which toys work for me here", "sb_toys");
        CreateChoice(oPC, "Give me the Dismounthorse Wand", "sb_dismounthorse");
        CreateChoice(oPC, "Give me the Emote Wand", "sb_emote");
        CreateChoice(oPC, "Give me the Who Stone", "sb_whostone");
        CreateChoice(oPC, "Give me a Mat", "sb_mat");
        CreateChoice(oPC, "Jump to party leader", "sb_leader");
//        CreateChoice(oPC, "Jump to " + GetName(GetArea(GetWaypointByTag("WP_Main"))), "sb_main");
    } else if (conv == "ajump") {
        CreateChoice(oPC, "Where to ?", "");
        int cnt = 0;
        object loc = GetObjectByTag("jump", cnt);
        while(GetIsObjectValid(loc) == TRUE && cnt<15) {
            CreateChoice(oPC, GetName(GetArea(loc)), "aj_" + IntToString(cnt));
            cnt++;
            loc = GetObjectByTag("jump", cnt);
        }
        if (GetObjectByTag("jump", 15) != OBJECT_INVALID) CreateChoice(oPC, "More", "cc_ajump2");
        if (GetObjectByTag("jump", 30) != OBJECT_INVALID) CreateChoice(oPC, "Still More", "cc_ajump3");
    } else if (conv == "ajump2") {
        CreateChoice(oPC, "Where to ?", "");
        int cnt = 0;
        object loc = GetObjectByTag("jump", cnt+15);
        while(GetIsObjectValid(loc) == TRUE && cnt<15) {
            CreateChoice(oPC, GetName(GetArea(loc)), "aj_" + IntToString(cnt+15));
            cnt++;
            loc = GetObjectByTag("jump", cnt+15);
        }
    } else if (conv == "ajump3") {
        CreateChoice(oPC, "Where to ?", "");
        int cnt = 0;
        object loc = GetObjectByTag("jump", cnt+30);
        while(GetIsObjectValid(loc) == TRUE && cnt<15) {
            CreateChoice(oPC, GetName(GetArea(loc)), "aj_" + IntToString(cnt+30));
            cnt++;
            loc = GetObjectByTag("jump", cnt+30);
        }
    } else if (conv == "pjump") {
        //SetLocalInt(oPC, "cc_level", 0);
        CreateChoice(oPC, "Jump to:", "");
        object oPlay = GetFirstPC();
        while(GetIsObjectValid(oPlay) == TRUE) {
            if (GetTag(GetArea(oPlay)) != "WaitingRoom") {
                CreateChoice(oPC, FixName(GetName(oPlay))+" ("+GetName(GetArea(oPlay))+")", "pj_" + GetName(oPlay));
            }
            oPlay = GetNextPC();
        }
    } else if (conv == "GetPlayer") {
        //SetLocalInt(oPC, "cc_level", 0);
        SetLocalString(OBJECT_SELF, "action", GetLocalString(OBJECT_SELF, "tool"));
        CreateChoice(oPC, "Select Player:", "");
        object oPlay = GetFirstPC();
        while(GetIsObjectValid(oPlay) == TRUE) {
            CreateChoice(oPC, FixName(GetName(oPlay))+" ("+GetName(GetArea(oPlay))+")", "sel_" + GetName(oPlay));
            oPlay = GetNextPC();
        }
    } else if (GetStringLeft(conv, 2) == "sp") {
        int p = StringToInt(GetSubString(conv, 2, 3));
        int e = p + 10;
        CreateChoice(oPC, "Select spell to cast or speak a number between 1 and 802:", "");
        SetLocalInt(oPC, "spell", p);
        if (p > 0) {
            if (p<10) {
                CreateChoice(oPC, "Back 10 spells", "cc_sp0");
            } else {
                CreateChoice(oPC, "Back 10 spells", "cc_sp"+IntToString(p-10));
            }
        }
        object oTarget = GetLocalObject(oPC, "target");
//            if (GetName(oTarget) == GetName(oPC)) {
        if (GetLocalObject(oPC, "old") != OBJECT_INVALID) {
            CreateChoice(oPC, "You cast at me", "you");
        } else {
            CreateChoice(oPC, "I'll cast on myself", "me");
        }
        CreateChoice(oPC, "Dispel", "dis");
        while(p<e) {
//            CreateChoice(oPC, Get2DAString("iprp_spells", "Label", p) + " level : " + Get2DAString("iprp_spells", "CasterLvl", p) + " (" + IntToString(p) + ")", "cs_" + Get2DAString("iprp_spells", "SpellIndex", p));
            CreateChoice(oPC, Get2DAString("spells", "Label", p) + " (" + IntToString(p) + ")", "cs_" + IntToString(p));
            p++;
        }
        CreateChoice(oPC, "Next 10 spells", "cc_sp"+IntToString(e));
    } else if (GetStringLeft(conv, 2) == "ap") {
        int p = StringToInt(GetSubString(conv, 2, 5));
        int e = p + 10;
        if (GetLocalInt(oPC, "old_ap") == 0) SetLocalInt(oPC, "old_ap", GetAppearanceType(oPC));
//        CreateChoice(oPC, "Select appearance or speak a number between 1 and 802, saving your character will make appearance change permanent:", "");
        CreateChoice(oPC, "Select appearance (saving your character will make appearance change permanent):", "");
        if (p > 0) {
            if (p<10) {
                CreateChoice(oPC, "Back 10", "cc_ap0");
            } else {
                CreateChoice(oPC, "Back 10", "cc_ap"+IntToString(p-10));
            }
            if (p<50) {
                CreateChoice(oPC, "Back 50", "cc_ap0");
            } else {
                CreateChoice(oPC, "Back 50", "cc_ap"+IntToString(p-50));
            }
        }
        CreateChoice(oPC, "Go back to your normal appearance", "ca_orig");
        if (GetLocalInt(GetModule(), "CEP") == 1) {
            if (p > 500) {
                CreateChoice(oPC, "Standard Appearances", "cc_ap0");
            } else {
                CreateChoice(oPC, "CEP Appearances", "cc_ap1000");
            }
        }
        CreateChoice(oPC, "Favourite Appearances", "cc_favapp");
        string aname;
        while(p<e) {
            aname = Get2DAString("appearance", "LABEL", p);
            if (aname != "") {
                CreateChoice(oPC, aname + " (" + IntToString(p) + ")", "ca_" + IntToString(p));
            } else {
                CreateChoice(oPC, "invalid" + " (" + IntToString(p) + ")", "ca_8");
            }
            p++;
        }
        CreateChoice(oPC, "Next 10", "cc_ap"+IntToString(e));
        CreateChoice(oPC, "Forward 50", "cc_ap"+IntToString(e+40));
        CreateChoice(oPC, "Forward 100", "cc_ap"+IntToString(e+90));
    } else if (conv == "favapp") {
        CreateChoice(oPC, "Select:", "");
        int s, app;
        string aname;
        for(s=1; s<10; s++) {
            app = GetCampaignInt(GetModuleName(), "app" + IntToString(s), oPC) - 1;
            aname = "Slot " + IntToString(s) + ": ";
            if (app != -1) {
                aname += Get2DAString("appearance", "LABEL", app);
            } else {
                aname += "(not used)";
            }
            CreateChoice(oPC, aname + " (" + IntToString(app) + ")", "fa_" + IntToString(app));
        }
        CreateChoice(oPC, "Add current appearance to Favourites", "cc_favappadd");
    } else if (conv == "favappadd") {
        CreateChoice(oPC, "There are 9 slots where you can save your favourite appearances.\n\nSelect:", "");
        int s;
        for(s=1; s<10; s++) {
            CreateChoice(oPC, "Slot " + IntToString(s), "afa_" + IntToString(s));
        }
    } else if (conv == "recall") {
        CreateChoice(oPC, "Select:", "");
        CreateChoice(oPC, "Jump to " + GetName(GetArea(GetWaypointByTag("WP_Main"))), "sb_main");
        string loc1 = GetName(GetAreaFromLocation(GetLocalLocation(oPC, "loc1")));
        string loc2 = GetName(GetAreaFromLocation(GetLocalLocation(oPC, "loc2")));
        string loc3 = GetName(GetAreaFromLocation(GetLocalLocation(oPC, "loc3")));
        if (loc1 != "") CreateChoice(oPC, "Jump to " + loc1 + " (slot 1)", "rec_1");
        if (loc2 != "") CreateChoice(oPC, "Jump to " + loc2 + " (slot 2)", "rec_2");
        if (loc3 != "") CreateChoice(oPC, "Jump to " + loc3 + " (slot 3)", "rec_3");
        CreateChoice(oPC, "Save this location in slot 1", "sav_1");
        CreateChoice(oPC, "Save this location in slot 2", "sav_2");
        CreateChoice(oPC, "Save this location in slot 3", "sav_3");
    } else if (GetStringLeft(conv, 2) == "tm") {
//SpeakString(GetName(oPC) + " -> " + GetName(GetLocalObject(oPC, "target")), TALKVOLUME_SHOUT);
        int t = StringToInt(GetSubString(conv, 2, 3));
        object Target = GetLocalObject(oPC, "target");
        CreateChoice(oPC, "Select:", "");
        CreateChoice(oPC, "Activate toys", "toy_activate");
        CreateChoice(oPC, "Remove toys till player reloads", "toy_deactivate");
        CreateChoice(oPC, "Remove toys forever", "toy_zap");
        int toys = GetLocalInt(Target, "toys");
        int tcnt = GetLocalInt(GetModule(), "tcnt");
        int end = t+15;
        if (tcnt < end) end = tcnt;
        while(t<end) {
            ShowToy(oPC, Target, toys, t);
            t++;
        }
        if (t<tcnt) CreateChoice(oPC, "more toys", "cc_tm" + IntToString(t));
    } else if (conv == "dye") {
        CreateChoice(oPC, "Action:", "");
        CreateChoice(oPC, "Open the cloth dye shop.", "dye_clothdye_merch");
        CreateChoice(oPC, "Open the leather dye shop.", "dye_leatherdye_merch");
        CreateChoice(oPC, "Open the metal dye shop.", "dye_metaldye_merch");
        CreateChoice(oPC, "Give me the dye color code book.", "dye_book");
//        CreateChoice(oPC, "Give me a copy of my Armor.", "dye_carm");
//        CreateChoice(oPC, "Give me a copy of my Helm.", "dye_chelm");
        CreateChoice(oPC, "Dye my Armor.", "dye_arm");
        CreateChoice(oPC, "Dye my Helm.", "dye_helm");
    } else if (conv == "msg") {
        string msg = "Message board:";
        DeleteLocalInt(oPC, "privshow");
        int sel = GetLocalInt(oPC, "sel");
        if (sel != 0) {
            msg += "\n\n" + GetCampaignString(GetModuleName(), "from" + IntToString(sel)) + "\n";
            msg += GetCampaignString(GetModuleName(), "msg" + IntToString(sel));
        }
        CreateChoice(oPC, msg, "");
        int m = GetLocalInt(oPC, "showmsg");
        int s = m - 9;
        if (s < 1) s = 1;
        while(s<=m) {
            msg = IntToString(s);
            CreateChoice(oPC, GetCampaignString(GetModuleName(), "from" + msg), "msg_" + msg);
            s++;
        }
        CreateChoice(oPC, "Leave a message.", "msg_new");
        if (sel != 0 && GetItemPossessedBy(oPC, "toy_maker") != OBJECT_INVALID) {
            CreateChoice(oPC, "Delete current message.", "msg_del");
        }
        if (m > 10) CreateChoice(oPC, "Go back 10 messages.", "msg_back");
        CreateChoice(oPC, "Private Messages.", "cc_priv");
    } else if (conv == "post") {
        string cmd = "msg_post";
        if (GetLocalString(oPC, "to") != "") cmd = "priv_ppost";
        CreateChoice(oPC, GetLocalString(oPC, "title") + "\n" + GetLocalString(oPC, "msg") + "\n\nPost this message ?", "");
        CreateChoice(oPC, "Yes.", cmd);
        CreateChoice(oPC, "No.", "cc_msg" + IntToString(GetLocalInt(GetModule(), "msgcnt")));
    } else if (conv == "priv") {
        string msg = "Private Message board:";
        int sel = GetLocalInt(oPC, "privsel");
        if (sel != 0) {
            msg += "\n\n" + GetCampaignString(GetModuleName(), "from" + GetPCPlayerName(oPC) + IntToString(sel)) + "\n";
            msg += GetCampaignString(GetModuleName(), "msg" + GetPCPlayerName(oPC) + IntToString(sel));
        }
        CreateChoice(oPC, msg, "");
        int m = GetLocalInt(oPC, "privshow");
        if (m == 0) {
            m = GetCampaignInt(GetModuleName(), "msgcnt" + GetPCPlayerName(oPC));
            SetLocalInt(oPC, "msgcnt", m);
            SetLocalInt(oPC, "privshow", m);
        }
        int s = m - 9;
        if (s < 1) s = 1;
        while(s<=m) {
            msg = IntToString(s);
            CreateChoice(oPC, GetCampaignString(GetModuleName(), "from" + GetPCPlayerName(oPC) + msg), "priv_pmsg_" + msg);
            s++;
        }
        CreateChoice(oPC, "Add player to private message allow list.", "cc_privadd");
        CreateChoice(oPC, "Remove player from private message allow list.", "cc_prem");
        CreateChoice(oPC, "Leave a private message.", "cc_pmsg");
        if (m > 10) CreateChoice(oPC, "Go back 10 messages.", "priv_back");
    } else if (conv == "privadd") {
        CreateChoice(oPC, "Select Player:", "");
        object oPlay = GetFirstPC();
        while(GetIsObjectValid(oPlay) == TRUE) {
            CreateChoice(oPC, GetPCPlayerName(oPlay) + " ("+FixName(GetName(oPlay))+")", "priv_sel_" + GetPCPlayerName(oPlay));
            oPlay = GetNextPC();
        }
    } else if (conv == "pmsg") {
        CreateChoice(oPC, "Send Private Message to:", "");
        ShowAllow(oPC, "priv_psend_");
    } else if (conv == "prem") {
        CreateChoice(oPC, "Remove Name:", "");
        ShowAllow(oPC, "priv_prem_");
    } else if (conv == "allow") {
        object who = GetLocalObject(oPC, "who");
        CreateChoice(oPC, "Allow " + FixName(GetName(who)) + " (" + GetPCPlayerName(who) + ") to send you private messages", "");
        CreateChoice(oPC, "Yes.", "priv_yes");
        CreateChoice(oPC, "No.", "cc_");
    }
}

void ew_chair(object oPC)
{
    object seat = GetNearestObjectByTag("sit", oPC);
    if (seat != OBJECT_INVALID) {
        SetLocalInt(oPC, "emotesit", 1);
        AssignCommand(oPC, ActionInteractObject(seat));
    }
    return;

    // get the closest chair, couch and/or throne
    object oChair = GetNearestObjectByTag("Chair", oPC);
    object oCouch = GetNearestObjectByTag("Couch", oPC);
    object oThroneGood = GetNearestObjectByTag("ThroneGood", oPC);
    object oStool=GetNearestObjectByTag("Stool", oPC);
    // get the distance between the user and each object (-1.0 is the result if no object is found
    float fDistanceChair = GetDistanceToObject(oChair);
    float fDistanceGood = GetDistanceToObject(oThroneGood);
    float fDistanceCouch = GetDistanceToObject(oCouch);
    float fDistanceStool = GetDistanceToObject(oStool);

    object oSit;

    // if any of the objects are invalid (not there), change the return value to a high number so the distance math can work
    if (fDistanceChair == -1.0) fDistanceChair =1000.0;
    if (fDistanceGood == -1.0) fDistanceGood = 1000.0;
    if (fDistanceCouch == -1.0)fDistanceCouch = 1000.0;
    if (fDistanceStool == -1.0) fDistanceStool = 1000.0;

    // find out which object is closest to the PC
    if (fDistanceChair<fDistanceGood && fDistanceChair<fDistanceCouch && fDistanceChair<fDistanceStool) oSit=oChair;
    if (fDistanceGood<fDistanceChair && fDistanceGood<fDistanceCouch && fDistanceGood<fDistanceStool) oSit=oThroneGood;
    if (fDistanceCouch<fDistanceChair && fDistanceCouch<fDistanceGood && fDistanceCouch<fDistanceStool) oSit=oCouch;
    if (fDistanceStool<fDistanceChair && fDistanceStool<fDistanceGood && fDistanceStool<fDistanceCouch) oSit=oStool;


    // if no one is sitting in the object the PC is closest to, have him sit in it
    if (GetIsObjectValid(GetSittingCreature(oSit)) == FALSE) ActionSit(oSit);
}

void ew_sleep(object oPC)
{
    effect eLieDown = EffectSleep();
    effect eSnore = EffectVisualEffect (VFX_IMP_SLEEP);
    //do not do this its dangerous->effect eSleep = EffectLinkEffects (eLieDown, eSnore);
    //ApplyEffectToObject(DURATION_TYPE_INSTANT, eSleep, oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLieDown, oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eSnore, oPC);
}

void ew_dance(object oPC)
{
    AssignCommand(oPC, ActionPlayAnimation( ANIMATION_FIREFORGET_VICTORY2));
    DelayCommand(3.0, AssignCommand(oPC, ActionPlayAnimation( ANIMATION_LOOPING_TALK_LAUGHING, 3.0, 2.0)));
    DelayCommand(3.0, AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_LAUGH)));
    DelayCommand(5.0, AssignCommand(oPC, ActionPlayAnimation( ANIMATION_FIREFORGET_VICTORY1)));
    DelayCommand(8.5, AssignCommand(oPC, ActionPlayAnimation( ANIMATION_FIREFORGET_VICTORY3)));
    DelayCommand(11.0, AssignCommand(oPC, ActionPlayAnimation( ANIMATION_LOOPING_GET_MID, 3.0, 2.0)));
    DelayCommand(14.5, AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_LAUGH)));
    DelayCommand(13.0, AssignCommand(oPC, ActionPlayAnimation( ANIMATION_FIREFORGET_VICTORY3)));
}

void ew_dance2(object oPC)
{
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));
    DelayCommand(2.0, AssignCommand(oPC, ActionPlayAnimation( ANIMATION_LOOPING_TALK_FORCEFUL, 5.0, 4.0)));
    DelayCommand(3.0, AssignCommand(oPC, ActionPlayAnimation( ANIMATION_LOOPING_GET_LOW, 5.0, 4.0)));
    DelayCommand(3.1, AssignCommand(oPC, ActionPlayAnimation( ANIMATION_FIREFORGET_VICTORY3)));
    DelayCommand(3.2, AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_LAUGH)));
    DelayCommand(11.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 3.0, 4.0)));
    DelayCommand(12.0, AssignCommand(oPC, ActionPlayAnimation( ANIMATION_FIREFORGET_VICTORY3)));
}

void ew_dance3(object oPC)
{
    AssignCommand(oPC, ActionPlayAnimation( ANIMATION_FIREFORGET_BOW));
    DelayCommand(2.0, AssignCommand(oPC, ActionPlayAnimation( ANIMATION_LOOPING_TALK_LAUGHING, 4.0, 4.0)));
    DelayCommand(3.0, AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_LAUGH)));
    DelayCommand(5.0, AssignCommand(oPC, ActionPlayAnimation( ANIMATION_LOOPING_TALK_NORMAL,4.0, 4.0)));
    DelayCommand(8.5, AssignCommand(oPC, ActionPlayAnimation( ANIMATION_LOOPING_TALK_FORCEFUL,5.0,4.0)));
    DelayCommand(11.0, AssignCommand(oPC, ActionPlayAnimation( ANIMATION_LOOPING_GET_MID, 3.0, 4.0)));
    DelayCommand(12.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, 5.0, 4.0)));
    DelayCommand(13.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW)));
}

void ews_cat(object oPC)
{
    switch (Random(5)) {
        case 0: AssignCommand ( oPC, PlaySound("c_werecat_bat2")); break;
        case 1: AssignCommand ( oPC, PlaySound("c_werecat_bat1")); break;
        case 2: AssignCommand ( oPC, PlaySound("c_catlion_bat1")); break;
        case 3: AssignCommand ( oPC, PlaySound("c_catpanth_bat1")); break;
        case 4: AssignCommand ( oPC, PlaySound("c_cat_bat2")); break;
    }
}

void ews_wolf(object oPC)
{
   switch (Random(4)) {
      case 0: AssignCommand ( oPC, PlaySound("as_an_wolfhowl1")); break;
      case 1: AssignCommand ( oPC, PlaySound("as_an_wolfhowl2")); break;
      case 2: AssignCommand ( oPC, PlaySound("as_an_wolveshwl1")); break;
      case 3: AssignCommand ( oPC, PlaySound("as_an_wolveshow2")); break;
   }
}


void ews_growl(object oPC)
{
    switch (Random(4)) {
        case 0: AssignCommand ( oPC, PlaySound("c_zombwar_bat1")); break;
        case 1: AssignCommand ( oPC, PlaySound("c_slaadwek_bat2")); break;
        case 2: AssignCommand ( oPC, PlaySound("c_slaadwek_bat2")); break;
        case 3: AssignCommand ( oPC, PlaySound("c_slaadpow_bat1")); break;
    }
}

void ews_smoan(object oPC)
{
    switch (Random(2)) {
        case 0: AssignCommand ( oPC, PlaySound("c_wraith_bat1")); break;
        case 1: AssignCommand ( oPC, PlaySound("as_pl_zombiem3")); break;
    }
}

void ews_break(object oPC)
{
    switch (Random(7)) {
        case 0: AssignCommand( oPC, PlaySound("as_cv_barglass3")); break;
        case 1: AssignCommand( oPC, PlaySound("as_cv_claybreak1")); break;
        case 2: AssignCommand( oPC, PlaySound("as_cv_claybreak2")); break;
        case 3: AssignCommand( oPC, PlaySound("as_cv_claybreak3")); break;
        case 4: AssignCommand( oPC, PlaySound("as_cv_glasbreak3")); break;
        case 5: AssignCommand( oPC, PlaySound("as_cv_glasbreak2")); break;
        case 6: AssignCommand( oPC, PlaySound("as_cv_glasbreak1")); break;
    }
}

void ews_door(object oPC)
{
    switch (Random(2)) {
        case 0: AssignCommand ( oPC, PlaySound("as_sw_woodplate1")); break;
        case 1: AssignCommand ( oPC, PlaySound("as_dr_woodmedcl1")); break;
    }
}

void ews_creak(object oPC)
{
    switch (Random(2)) {
        case 0: AssignCommand ( oPC, PlaySound("as_cv_woodcreak2")); break;
        case 1: AssignCommand ( oPC, PlaySound("as_cv_florcreak2")); break;
    }
}

void ews_thunder(object oPC)
{
    switch (Random(7)) {
        case 0: AssignCommand ( oPC, PlaySound("as_wt_thundercl1")); break;
        case 1: AssignCommand ( oPC, PlaySound("as_wt_thundercl2")); break;
        case 2: AssignCommand ( oPC, PlaySound("as_wt_thundercl3")); break;
        case 3: AssignCommand ( oPC, PlaySound("as_wt_thundercl4")); break;
        case 4: AssignCommand ( oPC, PlaySound("as_wt_thunderds1")); break;
        case 5: AssignCommand ( oPC, PlaySound("as_wt_thunderds2")); break;
        case 6: AssignCommand ( oPC, PlaySound("as_wt_thunderds3")); break;
    }
}

void ews_twig(object oPC)
{
    switch (Random(5)) {
        case 0: AssignCommand ( oPC, PlaySound("fs_grass_hard3")); break;
        case 1: AssignCommand ( oPC, PlaySound("as_na_branchsnp1")); break;
        case 2: AssignCommand ( oPC, PlaySound("as_na_branchsnp2")); break;
        case 3: AssignCommand ( oPC, PlaySound("as_na_branchsnp3")); break;
        case 4: AssignCommand ( oPC, PlaySound("as_na_branchsnp4")); break;
    }
}

void roll_check(object oPC, int nRank, string nam)
{
   int nRoll=d20();
   int nResult=nRoll+nRank;
   string sRoll=IntToString(nRoll);
   string sRank=IntToString(nRank);
   string sResult=IntToString(nResult);
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   AssignCommand( oPC, SpeakString(nam+" Check, Roll: "+sRoll+" Modifier: "+sRank+" = "+sResult));
}

void roll_dice(object oPC, int nRoll, string nam)
{
   string sName = FixName(GetName(oPC));
   string sRoll=IntToString(nRoll);
   AssignCommand( oPC, ActionPlayAnimation (ANIMATION_LOOPING_GET_MID, 3.0, 3.0));
   DelayCommand( 2.0, AssignCommand( oPC, SpeakString(sName+" rolled a " +nam+" and gets a: "+sRoll)));
}

void DyeIt(object targ, int slot)
{
    object item = GetItemInSlot(slot, targ);
   if (item != OBJECT_INVALID) {
        location loc = GetLocation(GetObjectByTag("wp_dye"));
        object mod = CopyObject(item, loc);
        DestroyObject(mod, 2.0);
        mod = CopyItemAndModify(mod, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH1, Random(64));
        DestroyObject(mod, 2.0);
        mod = CopyItemAndModify(mod, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH2, Random(64));
        DestroyObject(mod, 2.0);
        mod = CopyItemAndModify(mod, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER1, Random(64));
        DestroyObject(mod, 2.0);
        mod = CopyItemAndModify(mod, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER2, Random(64));
        DestroyObject(mod, 2.0);
        mod = CopyItemAndModify(mod, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL1, Random(64));
        DestroyObject(mod, 2.0);
        mod = CopyItemAndModify(mod, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL2, Random(64));
        DestroyObject(mod, 2.0);
        AssignCommand(targ, DestroyObject(item));
        object new = CopyObject(mod, GetLocation(targ), targ);
        AssignCommand(targ, ActionEquipItem(new, slot));
   }
}

string AllowAdd(object scribe, string pname, string aname)
{
    string allow = GetCampaignString(GetModuleName(), "allow"+pname);
    if (allow == "") allow = "~0~~1~~2~~3~~4~~5~~6~~7~~8~~9~~10";
//allow = "~0~~1~~2~~3~~4~~5~~6~~7~~8~~9~~10";
    int p = FindSubString(allow, "~~");
    if (p < 1) {
        AssignCommand(scribe, SpeakString("cannot add, " + pname + "'s private message allow list is full!"));
        allow = "";
    } else {
        allow = GetStringLeft(allow, p) + aname + GetSubString(allow, p + 1, 500);
    }
    return allow;
}

void AllowDel(string player, string who) {
    string allow = GetCampaignString(GetModuleName(), "allow" + player);
    int l = GetStringLength(who);
    int p = FindSubString(allow, who + "~");
    if (p > 1) {
        allow = GetStringLeft(allow, p) + "~" + GetSubString(allow, p + l, 500);
    }
    SetCampaignString(GetModuleName(), "allow" + player, allow);
//SpeakString(allow);
}

object FindPlayer(string name)
{
    object oPlay = GetFirstPC();
    while(GetIsObjectValid(oPlay) == TRUE) {
        if (name == GetPCPlayerName(oPlay)) {
            return oPlay;
        }
        oPlay = GetNextPC();
    }
    return OBJECT_INVALID;
}

void DoAction(int n, object oPC) // Perform action the user selected from custom conversation
{
    string act = GetLocalString(oPC, "cc_act" + IntToString(n));
    int lev = GetLocalInt(oPC, "cc_level");
    effect TheEffect;
    if (act == "<<") {  // Previous menu
        SetLocalInt(oPC, "cc_level", lev-2);
        InitConv(oPC, GetLocalString(oPC, "cc_prev" + IntToString(lev-2)));
    } else if (act == "") { // No action
        // WriteTimestampedLogEntry("No action");
    } else if (GetStringLeft(act, 3) == "cc_") { // Handle sub conversations
        InitConv(oPC, GetSubString(act, 3, GetStringLength(act)-3));
    } else if (GetStringLeft(act, 2) == "s_") { // Handle summon type
        SetLocalString(oPC, "mtype", GetSubString(act, 2, GetStringLength(act)-2));
        InitConv(oPC, "qty");
    } else if (GetStringLeft(act, 2) == "q_") { // Handle summon qantity
        InitConv(oPC, "");   // end conversation
        location lSpawn = GetLocation(GetNearestObjectByTag("Spawn"));
        int i;
        object monster;
        TheEffect=EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, TheEffect, lSpawn);
        object cc_conv=GetLocalObject(oPC, "cc_conv");
        for(i = 0; i < StringToInt(GetSubString(act, 2, GetStringLength(act)-2)); i++) {
            monster = CreateObject(OBJECT_TYPE_CREATURE, GetLocalString(oPC, "mtype"), lSpawn, TRUE, "s_"+GetTag(cc_conv));
        }
    } else if (GetStringLeft(act, 2) == "p_") { // Handle polymorph
        TheEffect = EffectPolymorph(StringToInt(GetSubString(act, 2, GetStringLength(act)-2)));
        ApplyEffectToObject(DURATION_TYPE_INSTANT,TheEffect, oPC);
        TheEffect=EffectVisualEffect(VFX_DUR_SPELLTURNING);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,TheEffect, oPC);
        TheEffect=EffectHeal(200);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,TheEffect, oPC);
    } else if (GetStringLeft(act, 4) == "al_c") { // Align Chaotic
        int shift = StringToInt(GetSubString(act, 4, GetStringLength(act)-4));
        RemoveFromParty(oPC);
        AdjustAlignment(GetLocalObject(oPC, "target"), ALIGNMENT_CHAOTIC, shift);
        ExecuteScript("cc_align", OBJECT_SELF);
    } else if (GetStringLeft(act, 4) == "al_l") { // Align Lawful
        int shift = StringToInt(GetSubString(act, 4, GetStringLength(act)-4));
        RemoveFromParty(oPC);
        AdjustAlignment(GetLocalObject(oPC, "target"), ALIGNMENT_LAWFUL, shift);
        ExecuteScript("cc_align", OBJECT_SELF);
    } else if (GetStringLeft(act, 4) == "al_g") { // Align Good
        int shift = StringToInt(GetSubString(act, 4, GetStringLength(act)-4));
        RemoveFromParty(oPC);
        AdjustAlignment(GetLocalObject(oPC, "target"), ALIGNMENT_GOOD, shift);
        ExecuteScript("cc_align", OBJECT_SELF);
    } else if (GetStringLeft(act, 4) == "al_e") { // Align Evil
        int shift = StringToInt(GetSubString(act, 4, GetStringLength(act)-4));
        RemoveFromParty(oPC);
        AdjustAlignment(GetLocalObject(oPC, "target"), ALIGNMENT_EVIL, shift);
        ExecuteScript("cc_align", OBJECT_SELF);
    } else if (GetStringLeft(act, 3) == "ew_") { // Handle emote wand
        act = GetSubString(act, 3, GetStringLength(act)-3);
        if (act == "sit") {
            AssignCommand(oPC, ActionPlayAnimation( ANIMATION_LOOPING_SIT_CROSS, 1.0, 6000.0));
        } else if (act == "chair") {
            ew_chair(oPC);
        } else if (act == "sleep") {
            ew_sleep(oPC);
        } else if (act == "worship") {
            AssignCommand(oPC, ActionPlayAnimation( ANIMATION_LOOPING_WORSHIP, 1.0, 6000.0));
        } else if (act == "pray") {
            AssignCommand(oPC, ActionPlayAnimation( ANIMATION_LOOPING_MEDITATE, 1.0, 6000.0));
        } else if (act == "read") {
            AssignCommand(oPC, ActionPlayAnimation( ANIMATION_FIREFORGET_READ));
            DelayCommand(3.0, AssignCommand( oPC, ActionPlayAnimation( ANIMATION_FIREFORGET_READ)));
        } else if (act == "drunk") {
            AssignCommand(oPC, ActionPlayAnimation( ANIMATION_LOOPING_PAUSE_DRUNK, 1.0, 6000.0));
        } else if (act == "dance") {
            ew_dance(oPC);
        } else if (act == "dance2") {
            ew_dance2(oPC);
        } else if (act == "dance3") {
            ew_dance3(oPC);
        } else if (act == "dance4") {
            ExecuteScript("ew_dance4", oPC);
        } else if (act == "fart") {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 1.0f, 1.0f));

object oTarget;
oTarget = oPC;

//Visual effects can't be applied to waypoints, so if it is a WP
//apply to the WP's location instead

int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), oTarget));
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oTarget));

DelayCommand(2.0, SpeakString("Excuse me, did I just Break Wind?!!",TALKVOLUME_TALK));
DelayCommand(0.5,ActionDoCommand(PlaySound("as_cv_florcreak3")));
DelayCommand(2.2, AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_LAUGH)));
DelayCommand(2.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 4.0f)));
DelayCommand(4.5, SpeakString("Damn, that was a ripe one!!",TALKVOLUME_TALK));
        } else if (act == "funky_chick") {
             AssignCommand(oPC, ActionSpeakString("Do the Funky Chicken!!"));
 DelayCommand(1.0,ActionDoCommand(PlaySound("as_cv_lute1b")));
 DelayCommand(4.0,ActionDoCommand(PlaySound("as_cv_lute1b")));
 DelayCommand(7.0,ActionDoCommand(PlaySound("as_cv_lute1b")));
 DelayCommand(10.0,ActionDoCommand(PlaySound("as_cv_lute1b")));
 DelayCommand(13.0,ActionDoCommand(PlaySound("as_cv_lute1b")));
 DelayCommand(1.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE2, 1.0, 1.0f)));
 DelayCommand(2.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(3.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE2, 1.0, 1.0f)));
 DelayCommand(4.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(5.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 1.0f)));
 DelayCommand(6.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(7.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 1.0f)));
 DelayCommand(8.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(9.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE2, 1.0, 1.0f)));
 DelayCommand(10.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(11.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE2, 1.0, 1.0f)));
 DelayCommand(12.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(13.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 1.0f)));
 DelayCommand(14.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(15.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 1.0f)));
 DelayCommand(16.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0f)));
 DelayCommand(17.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 1.0f)));
 DelayCommand(19.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 1.0f)));
 DelayCommand(20.5,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE, 1.0, 1.0f)));
 DelayCommand(21.0, AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_CHEER)));
        } else if (act == "strip") {
            ExecuteScript("ew_strip", oPC);
        } else if (act == "strip2") {
            ExecuteScript("ew_strip2", oPC);
        } else if (act == "dead") {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 6000.0));
        } else if (act == "char") {
            roll_check(oPC, GetAbilityModifier(ABILITY_CHARISMA, oPC), "Charisma");
        } else if (act == "con") {
            roll_check(oPC, GetAbilityModifier(ABILITY_CONSTITUTION, oPC), "Constitution");
        } else if (act == "dex") {
            roll_check(oPC, GetAbilityModifier(ABILITY_DEXTERITY, oPC), "Dexterity");
        } else if (act == "int") {
            roll_check(oPC, GetAbilityModifier(ABILITY_INTELLIGENCE, oPC), "Intelligence");
        } else if (act == "str") {
            roll_check(oPC, GetAbilityModifier(ABILITY_STRENGTH, oPC), "Strength");
        } else if (act == "wis") {
            roll_check(oPC, GetAbilityModifier(ABILITY_WISDOM, oPC), "Wisdom");
        } else if (act == "trap") {
            roll_check(oPC, GetSkillRank(SKILL_DISABLE_TRAP, oPC), "Disable Trap");
        } else if (act == "disc") {
            roll_check(oPC, GetSkillRank(SKILL_DISCIPLINE, oPC), "Discipline");
        } else if (act == "listen") {
            roll_check(oPC, GetSkillRank(SKILL_LISTEN, oPC), "Listen");
        } else if (act == "lore") {
            roll_check(oPC, GetSkillRank(SKILL_LORE, oPC), "Lore");
        } else if (act == "open") {
            roll_check(oPC, GetSkillRank(SKILL_OPEN_LOCK, oPC), "Open Lock");
        } else if (act == "perf") {
            roll_check(oPC, GetSkillRank(SKILL_PERFORM, oPC), "Perform");
        } else if (act == "pers") {
            roll_check(oPC, GetSkillRank(SKILL_PERSUADE, oPC), "Persuade");
        } else if (act == "search") {
            roll_check(oPC, GetSkillRank(SKILL_PICK_POCKET, oPC), "Search");
        } else if (act == "spell") {
            roll_check(oPC, GetSkillRank(SKILL_SPELLCRAFT, oPC), "Spellcraft");
        } else if (act == "spot") {
            roll_check(oPC, GetSkillRank(SKILL_SPOT, oPC), "Spot");
        } else if (act == "conc") {
            roll_check(oPC, GetSkillRank(SKILL_CONCENTRATION, oPC), "Concentration");
        } else if (act == "hide") {
            roll_check(oPC, GetSkillRank(SKILL_HIDE, oPC), "Hide");
        } else if (act == "taunt") {
            roll_check(oPC, GetSkillRank(SKILL_TAUNT, oPC), "Taunt");
        } else if (act == "d4") {
            roll_dice(oPC, d4(), "d4");
        } else if (act == "d6") {
            roll_dice(oPC, d6(), "d6");
        } else if (act == "d8") {
            roll_dice(oPC, d8(), "d8");
        } else if (act == "d10") {
            roll_dice(oPC, d10(), "d10");
        } else if (act == "d12") {
            roll_dice(oPC, d12(), "d12");
        } else if (act == "d20") {
            roll_dice(oPC, d20(), "d20");
        } else if (act == "d100") {
            roll_dice(oPC, d100(), "d100");
        } else if (act == "dam") {
            ExecuteScript("ew_dammit", oPC);
        } else if (act == "flip") {
            ExecuteScript("ew_flipper", oPC);
        } else if (act == "fish") {
            ExecuteScript("ew_fish", oPC);
        } else if (act == "wow") {
            ExecuteScript("ew_wow", oPC);
        } else if (act == "fly1") {
            effect eFly = EffectDisappear();
            effect eFlyDown = EffectAppear();
            effect ePulseWind = EffectVisualEffect(VFX_IMP_PULSE_WIND);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFly, oPC );
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePulseWind, oPC );
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFlyDown, oPC );
        } else if (act == "fly2") {
            effect eFly = EffectDisappear();
            effect eFlyDown = EffectAppear();
            effect ePulseWind = EffectVisualEffect(VFX_IMP_PULSE_WIND);
            effect eTakeOff1 = EffectVisualEffect(VFX_FNF_FIREBALL);
            DelayCommand(0.6,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eTakeOff1, oPC));
            DelayCommand(0.5,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFly, oPC));
            DelayCommand(0.6,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePulseWind, oPC));
            DelayCommand(0.7,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFlyDown, oPC));
        } else if (act == "fly3") {
            effect edumb = EffectVisualEffect(VFX_IMP_BLIND_DEAF_M);
            effect edumb1 = EffectVisualEffect(VFX_IMP_HARM);
            effect edumb2 = EffectVisualEffect(VFX_IMP_PULSE_COLD);
            effect edumb3 = EffectVisualEffect(VFX_IMP_PULSE_FIRE);
            effect edumb4 = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
            effect edumb5 = EffectVisualEffect(VFX_IMP_UNSUMMON);
            effect edumb19 = EffectDisappear();
            effect edumb21 = EffectAppear();
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb,oPC));
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb1,oPC));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb2,oPC));
            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb3,oPC));
            DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb4,oPC));
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb5,oPC));
            DelayCommand(3.5,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,edumb19,oPC));
            DelayCommand(5.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,edumb21,oPC));
        } else if (act == "fly4") {
            effect edumb1 = EffectVisualEffect(VFX_IMP_HEAD_ACID);
            effect edumb2 = EffectVisualEffect(VFX_IMP_HEAD_COLD);
            effect edumb3 = EffectVisualEffect(VFX_IMP_HEAD_ELECTRICITY);
            effect edumb4 = EffectVisualEffect(VFX_IMP_HEAD_EVIL);
            effect edumb5 = EffectVisualEffect(VFX_IMP_HEAD_FIRE);
            effect edumb6 = EffectVisualEffect(VFX_IMP_HEAD_HEAL);
            effect edumb7 = EffectVisualEffect(VFX_IMP_HEAD_HOLY);
            effect edumb8 = EffectVisualEffect(VFX_IMP_HEAD_MIND);
            effect edumb9 = EffectVisualEffect(VFX_IMP_HEAD_NATURE);
            effect edumb10 = EffectVisualEffect(VFX_IMP_HEAD_ODD);
            effect edumb11 = EffectVisualEffect(VFX_IMP_HEAD_SONIC);
            effect edumb12 = EffectVisualEffect(VFX_IMP_HARM);
            effect edumb13 = EffectVisualEffect(VFX_IMP_PULSE_COLD);
            effect edumb14 = EffectVisualEffect(VFX_IMP_PULSE_FIRE);
            effect edumb15 = EffectVisualEffect(VFX_IMP_PULSE_HOLY);
            effect edumb16 = EffectVisualEffect(VFX_FNF_HOWL_ODD);
            effect edumb17 = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
            effect edumb18 = EffectVisualEffect(VFX_IMP_UNSUMMON);
            effect edumb19 = EffectDisappear();
            effect edumb20 = EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE);
            effect edumb21 = EffectAppear();
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb1,oPC));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb2,oPC));
            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb3,oPC));
            DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb4,oPC));
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb5,oPC));
            DelayCommand(3.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb6,oPC));
            DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb7,oPC));
            DelayCommand(4.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb8,oPC));
            DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb9,oPC));
            DelayCommand(5.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb10,oPC));
            DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb11,oPC));
            DelayCommand(6.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb12,oPC));
            DelayCommand(7.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb13,oPC));
            DelayCommand(7.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb14,oPC));
            DelayCommand(8.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb15,oPC));
            DelayCommand(8.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb16,oPC));
            DelayCommand(9.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb17,oPC));
            DelayCommand(9.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb18,oPC));
            DelayCommand(10.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,edumb19,oPC));
            DelayCommand(11.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,edumb20,oPC));
            DelayCommand(12.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,edumb21,oPC));
        } else if (act == "smoke") {
            ExecuteScript("ew_smoke", oPC);
        } else if (act == "back") {
            AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 30000.0));
        } else if (act == "front") {
            AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 30000.0));
        } else if (act == "fart") {
            DelayCommand(1.0, ExecuteScript("ew_flatuence", oPC));
        } else if (act == "freeze") {
            effect eff = GetFirstEffect(oPC);
            while (GetIsEffectValid(eff)) {
//SendMessageToPC(oPC, "eff = " + IntToString(GetEffectType(eff)) + " - " + IntToString(VFX_DUR_FREEZE_ANIMATION));
                if (GetEffectType(eff) == 74) {
                    RemoveEffect(oPC, eff);
                    return;
                }
                eff = GetNextEffect(oPC);
            }
            eff = EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION);
            DelayCommand(0.1f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eff, oPC));
        } else if (act == "lev1") {
            location loc = GetLocation(oPC);
            vector vect = GetPositionFromLocation(loc);
            vect.z = 10.0;
            vect.y += 5.0;
            loc = Location(GetAreaFromLocation(loc), vect, GetFacingFromLocation(loc));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisappearAppear(loc), oPC, 0.0);
//            AssignCommand(oPC, JumpToLocation(loc));
        }
    } else if (GetStringLeft(act, 4) == "ews_") { // Handle emote wand sounds
        act = GetSubString(act, 4, GetStringLength(act)-4);
        if (act == "cat") ews_cat(oPC);
        else if (act == "wolf") ews_wolf(oPC);
        else if (act == "cow") AssignCommand ( oPC, PlaySound("as_an_cow" + IntToString(Random(2)+1)));
        else if (act == "crow") AssignCommand ( oPC, PlaySound("as_an_crow" + IntToString(Random(2)+1)));
        else if (act == "owl") AssignCommand ( oPC, PlaySound("as_an_owlhoot" + IntToString(Random(2)+1)));
        else if (act == "mcough") AssignCommand ( oPC, PlaySound("as_pl_coughm" + IntToString(Random(7)+1)));
        else if (act == "mcry") AssignCommand ( oPC, PlaySound("as_pl_cryingm" + IntToString(Random(3)+1)));
        else if (act == "mdie") AssignCommand ( oPC, PlaySound("as_pl_screamm" + IntToString(Random(5)+1)));
        else if (act == "wscream") AssignCommand ( oPC, PlaySound("as_pl_screamf" + IntToString(Random(6)+1)));
        else if (act == "wcough") AssignCommand ( oPC, PlaySound("as_pl_coughf" + IntToString(Random(7)+1)));
        else if (act == "wcry") AssignCommand ( oPC, PlaySound("as_pl_cryingf" + IntToString(Random(3)+1)));
        else if (act == "growl") ews_growl(oPC);
        else if (act == "slaugh") AssignCommand ( oPC, PlaySound("as_pl_lafspook" + IntToString(Random(3)+1)));
        else if (act == "smoan") ews_smoan(oPC);
        else if (act == "break") ews_break(oPC);
        else if (act == "door") ews_door(oPC);
        else if (act == "creak") ews_creak(oPC);
        else if (act == "thunder") ews_thunder(oPC);
        else if (act == "twig") ews_twig(oPC);
    } else if (GetStringLeft(act, 3) == "as_") { // Handle emote wand direct sounds
        AssignCommand(oPC, PlaySound(act));
    } else if (GetStringLeft(act, 2) == "c_") { // Handle emote wand direct sounds
        AssignCommand(oPC, PlaySound(act));
     } else if (GetStringLeft(act, 3) == "sp_") { // Handle speak voicechat
        int typ = StringToInt(GetSubString(act, 3, GetStringLength(act)-3));
        DelayCommand(0.3, PlayVoiceChat(typ,oPC));
//        AssignCommand(oPC,ActionDoCommand(PlayVoiceChat(typ,oPC)));
     } else if (GetStringLeft(act, 3) == "gd_") { // Handle get drunk
        string nam = GetSubString(act, 3, GetStringLength(act)-3);
        ExecuteScript(nam, OBJECT_SELF);
        DelayCommand(30.0, SetCommandable(TRUE,oPC));
    } else if (GetStringLeft(act, 3) == "sb_") { // Handle scoreboard
        string typ = GetSubString(act, 3, GetStringLength(act)-3);
        if (typ == "scores") {
            object PC= GetFirstPC();
            string SpeakText = "Kill Counter\n";
                   SpeakText += "Yellow dots=Killed most monsters\nRed dots=Killed most players\nBlue dots=Died the most\n";
                   SpeakText += "MonsterPoints/PlayerKills/Deaths\n\n";

            while (PC!= OBJECT_INVALID)
            {
               if (GetIsDM(PC) == FALSE)
               {
                   SpeakText += FixName(GetName(PC)) + " ";
                   SpeakText += IntToString(GetLocalInt(PC,"monster")) + "/";
                   SpeakText += IntToString(GetLocalInt(PC,"killed")) + "/";
                   SpeakText += IntToString(GetLocalInt(PC,"died"));
                   SpeakText += "\n";
               }
               PC= GetNextPC();
            }
            AssignCommand(GetNearestObjectByTag("scoreboard", oPC), SpeakString(SpeakText));
        } else if (typ == "stats") {
            string name = FixName(GetName(oPC));
            int strength = GetAbilityScore(oPC, ABILITY_STRENGTH);
            int dexterity = GetAbilityScore(oPC, ABILITY_DEXTERITY);
            int charisma = GetAbilityScore(oPC, ABILITY_CHARISMA);
            int intelligence = GetAbilityScore(oPC, ABILITY_INTELLIGENCE);
            int constitution = GetAbilityScore(oPC, ABILITY_CONSTITUTION);
            int wisdom = GetAbilityScore(oPC, ABILITY_WISDOM);
            int Fortitude = GetFortitudeSavingThrow(oPC);
            int Will = GetWillSavingThrow(oPC);
            int Reflex = GetReflexSavingThrow(oPC);
            int AC = GetAC(oPC);
            int Age = GetAge(oPC);
            string stats = name + " has " + IntToString(strength) + " strength, " + IntToString(dexterity) + " dex, " + IntToString(charisma) + " charisma, " + IntToString(intelligence) + " int, " + IntToString(wisdom) + " wisdom, " + IntToString(constitution) + " constitution, " + IntToString(Fortitude) + " Fort. " + IntToString(Will) + " Will, " + IntToString(Reflex) + " Reflex, " + IntToString(AC) + " AC and is " + IntToString(Age) + " years old." ;
            AssignCommand(GetNearestObjectByTag("scoreboard", oPC), SpeakString(stats));
        } else if (typ == "toys") {
            int s, dm = isdm(oPC);
            int tcnt = GetLocalInt(GetModule(), "tcnt");
            int toys = GetLocalInt(oPC, "toys");
            if (toys == 0 && dm != TRUE) {
                SendMessageToPC(oPC, "None of the toys will work for you here!");
            } else {
                SendMessageToPC(oPC, "You may use the following toys here:");
            }
            for(s=0; s<tcnt; s++) {
                if ((toys & (1<<s)) != 0 || dm == TRUE) {
                    SendMessageToPC(oPC, GetLocalString(GetModule(), "tname"+IntToString(s)));
                }
            }
        } else if (typ == "leader") {
            object oLeader = GetFactionLeader(oPC);
            if (GetIsObjectValid(oLeader) == TRUE) {
                AssignCommand(oPC, JumpToObject(oLeader));
            }
        } else if (typ == "main") {
            object wp = GetWaypointByTag("WP_Main");
            if (GetIsObjectValid(wp) == TRUE) {
                AssignCommand(oPC, JumpToObject(wp));
            }
        } else if (typ == "emote") {
            CreateItemOnObject("emotewand", oPC);
        } else if (typ == "mat") {
            CreateItemOnObject("mat", oPC);
        } else if (typ == "dismounthorse") {
            CreateItemOnObject("dismounthorse", oPC);
        } else if (typ == "whostone") {
            CreateItemOnObject("whostone", oPC);
        }
    } else if (GetStringLeft(act, 3) == "pj_") { // Handle jump to player
        string nam = GetSubString(act, 3, GetStringLength(act)-3);
        // nam = GetStringLeft(nam, FindSubString(nam, " ("));
        object oPlay = GetFirstPC();
        while(GetIsObjectValid(oPlay) == TRUE) {
            if (nam == GetName(oPlay)) {
                AssignCommand(oPC, JumpToLocation(GetLocation(oPlay)));
            }
            oPlay = GetNextPC();
        }
    } else if (GetStringLeft(act, 3) == "aj_") { // Handle jump to area
        int cnt = StringToInt(GetSubString(act, 3, GetStringLength(act)-3));
        AssignCommand(oPC, JumpToObject(GetObjectByTag("jump", cnt)));
    } else if (GetStringLeft(act, 4) == "sel_") { // Handle select player
        string nam = GetSubString(act, 4, GetStringLength(act)-4);
        object oPlay = GetFirstPC();
        while(GetIsObjectValid(oPlay) == TRUE) {
            if (nam == GetName(oPlay)) {
                SetLocalString(OBJECT_SELF, "tool", GetLocalString(OBJECT_SELF, "action"));
                SetLocalObject(OBJECT_SELF, "target",oPlay);
                DelayCommand(1.0,ExecuteScript("x_activate", OBJECT_SELF));
                break;
            }
            oPlay = GetNextPC();
        }
    } else if (GetStringLeft(act, 3) == "xp_") { // Handle XP
        object oTarget = GetLocalObject(oPC, "target");
        int xp = StringToInt(GetSubString(act, 3, GetStringLength(act)-3));
        SetXP(oTarget, xp);
    } else if (GetStringLeft(act, 3) == "cs_") { // cast spell
        int spell = StringToInt(GetSubString(act, 3, 3));
        object oTarget = GetLocalObject(oPC, "target");
//SpeakString(GetName(oPC) + " - " + GetName(oTarget), TALKVOLUME_SHOUT);
        DelayCommand(0.5, AssignCommand(oTarget, ActionCastSpellAtObject(spell, oPC, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
        if (GetLocalObject(oPC, "old") != OBJECT_INVALID) ActionStartConversation(oPC, "customconv", TRUE);
    } else if (GetStringLeft(act, 3) == "dis") { // dispel
        int spell = SPELL_GREATER_DISPELLING;
        object oTarget = GetLocalObject(oPC, "target");
        AssignCommand(oTarget, ActionCastSpellAtObject(spell, oPC, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        AssignCommand(oTarget, ActionCastSpellAtLocation(spell, GetLocation(oPC), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        if (GetLocalObject(oPC, "old") != OBJECT_INVALID) ActionStartConversation(oPC, "customconv", TRUE);
    } else if (act == "me") { // I'll cast
        SetLocalObject(oPC, "old", GetLocalObject(oPC, "target"));
        SetLocalObject(oPC, "target", oPC);
        ClearAllActions(TRUE);
        InitConv(oPC, "sp" + IntToString(GetLocalInt(oPC, "spell")));
   } else if (act == "you") { // you cast
        SetLocalObject(oPC, "target", GetLocalObject(oPC, "old"));
        DeleteLocalObject(oPC, "old");
        ClearAllActions(TRUE);
        InitConv(oPC, "sp" + IntToString(GetLocalInt(oPC, "spell")));
    } else if (act == "ca_orig") { // go back to original appearance
        int ap = GetLocalInt(oPC, "old_ap");
        DelayCommand(0.5, SetCreatureAppearanceType(oPC, ap));
    } else if (GetStringLeft(act, 3) == "ca_") { // change appearance
        int ap = StringToInt(GetSubString(act, 3, 5));
        DelayCommand(0.5, SetCreatureAppearanceType(oPC, ap));
    } else if (GetStringLeft(act, 4) == "afa_") { // add favourite appearance
        int s = StringToInt(GetSubString(act, 4, 5));
//SpeakString(act + " s = " + IntToString(s)+ " app = " + IntToString(GetAppearanceType(oPC)));
        SetCampaignInt(GetModuleName(), "app" + IntToString(s), GetAppearanceType(oPC) + 1, oPC);
        SetLocalInt(oPC, "cc_level", GetLocalInt(oPC, "cc_level") - 2);
        InitConv(oPC, "favapp");
    } else if (GetStringLeft(act, 3) == "fa_") { // favourite appearance
        int ap = StringToInt(GetSubString(act, 3, 5));
        if (ap != -1) DelayCommand(0.5, SetCreatureAppearanceType(oPC, ap));
    } else if (GetStringLeft(act, 4) == "rec_") { // Jump to saved location
        string num = GetSubString(act, 4, 5);
        location loc = GetLocalLocation(oPC, "loc" + num);
        float delay = 0.1, gdelay = 0.1;
        if (GetName(GetAreaFromLocation(loc)) == GetName(GetArea(oPC))) delay = 2.0;
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oPC, 5.0);
        DelayCommand(delay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_MYSTICAL_EXPLOSION), oPC));
        DelayCommand(delay + 0.1, AssignCommand(oPC, JumpToLocation(loc)));
        DelayCommand(delay + 0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectAppear(), oPC));
    } else if (GetStringLeft(act, 4) == "sav_") { // Save location
        string num = GetSubString(act, 4, 5);
        SetLocalLocation(oPC, "loc" + num, GetLocation(oPC));
        SetLocalInt(oPC, "cc_level", GetLocalInt(oPC, "cc_level") - 1);
        AssignCommand(oPC, ActionCastFakeSpellAtObject(SPELL_GREATER_DISPELLING, oPC));
        DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_TIME_STOP), oPC));
        InitConv(oPC, "recall");
    } else if (GetStringLeft(act, 4) == "toy_") { // toymaker
        string typ = GetSubString(act, 4, GetStringLength(act)-4);
        object Target = GetLocalObject(oPC, "target");
        if (typ == "deactivate") {
            ZapToys(oPC, Target, 0);
        } else if (typ == "zap") {
            ZapToys(oPC, Target, 1);
        } else if (typ == "activate") {
            int s, toys = 0, tcnt = GetLocalInt(GetModule(), "tcnt");
            string ref;
            object item;
            for(s=0; s<tcnt; s++) {
                ref = GetLocalString(GetModule(), "tref"+IntToString(s));
                item = GetItemPossessedBy(Target, "toy_"+ref);
                if (item != OBJECT_INVALID) {
                    SendMessageToPC(oPC, GetName(item) + " activated for " + GetName(Target));
                    SendMessageToPC(Target, GetName(item) + " activated!");
                    toys |= (1<<s);
                }
            }
            SetLocalInt(Target, "toys", toys);
            SetCampaignInt(GetModuleName(), "toys", GetLocalInt(Target, "toys"), Target);
        } else {
            string msg = " activated for ";
            string ref = GetLocalString(GetModule(), "tref"+typ);
            object item = GetItemPossessedBy(Target, "toy_"+ref);
            if (item == OBJECT_INVALID) {
                item = CreateItemOnObject(ref, Target);
                msg = " given to ";
            }
            SetLocalInt(item, "id", StringToInt(typ));
            SetLocalInt(Target, "toys", GetLocalInt(Target, "toys") | (1<<StringToInt(typ)));
            SetCampaignInt(GetModuleName(), "toys", GetLocalInt(Target, "toys"), Target);
            SendMessageToPC(oPC, GetName(item) + msg + GetName(Target));
            SendMessageToPC(Target, GetName(item) + msg + GetName(Target));
        }
    } else if (GetStringLeft(act, 4) == "dye_") { // dye merchant
        string typ = GetSubString(act, 4, GetStringLength(act)-4);
        if (typ == "book") {
            CreateItemOnObject("dyecolorcodes", oPC);
        } else if (typ == "carm") {
            CopyItem(GetItemInSlot(INVENTORY_SLOT_CHEST, oPC), oPC);
        } else if (typ == "chelm") {
            CopyItem(GetItemInSlot(INVENTORY_SLOT_HEAD, oPC), oPC);
        } else if (typ == "arm") {
            DyeIt(oPC, INVENTORY_SLOT_CHEST);
        } else if (typ == "helm") {
            DyeIt(oPC, INVENTORY_SLOT_HEAD);
        } else {
            DelayCommand(1.0, OpenStore(GetObjectByTag(typ), oPC));
        }
    } else if (GetStringLeft(act, 4) == "msg_") { // message board
        string typ = GetSubString(act, 4, 20);
        if (typ == "new") {
            AssignCommand(GetNearestObjectByTag("scribe", oPC), SpeakString("Speak message title"));
            DeleteLocalString(oPC, "to");
            SetLocalString(oPC, "title", ".");
            InitConv(oPC, "");   // end conversation
        } else if (typ == "post") {
            int msgcnt = GetLocalInt(GetModule(), "msgcnt") + 1;
            SetLocalInt(GetModule(), "msgcnt", msgcnt);
            SetCampaignInt(GetModuleName(), "msgcnt", msgcnt);
            string msg = IntToString(msgcnt);
            SetCampaignString(GetModuleName(), "from" + msg, GetLocalString(oPC, "title"));
            SetCampaignString(GetModuleName(), "msg" + msg, GetLocalString(oPC, "msg"));
            SetLocalInt(oPC, "showmsg", msgcnt);
            SetLocalInt(oPC, "sel", msgcnt);
            SetLocalInt(oPC, "cc_level", 0);
            InitConv(oPC, "msg");
        } else if (typ == "back") {
            int m = GetLocalInt(oPC, "showmsg") - 10;
            SetLocalInt(oPC, "showmsg", m);
            SetLocalInt(oPC, "sel", m);
            SetLocalInt(oPC, "cc_level", 0);
            InitConv(oPC, "msg");
        } else if (typ == "del") {
            string msg = IntToString(GetLocalInt(oPC, "sel"));
            string title = GetCampaignString(GetModuleName(), "from" + msg);
            title = "<cþ  >** deleted **</c>" + GetSubString(title, FindSubString(title, " <c þ >by"), 100);
            SetCampaignString(GetModuleName(), "from" + msg, title);
            SetCampaignString(GetModuleName(), "msg" + msg, "message deleted by " + GetPCPlayerName(oPC));
            SetLocalInt(oPC, "cc_level", 0);
            InitConv(oPC, "msg");
        } else {
//AssignCommand(oPC, SpeakString("Sel=" + GetSubString(act, 4, 10)));
            SetLocalInt(oPC, "sel", StringToInt(GetSubString(act, 4, 10)));
            SetLocalInt(oPC, "cc_level", 0);
            InitConv(oPC, "msg");
        }
    } else if (GetStringLeft(act, 5) == "priv_") { // Handle Private Messages
        string typ = GetSubString(act, 5, 60);
        if (GetStringLeft(typ, 4) == "sel_") { // Handle select player to allow
            typ = GetSubString(typ, 4, 50);
            object creature = GetNearestObjectByTag("scribe", oPC);
            string allow = AllowAdd(creature, GetPCPlayerName(oPC), typ);
            string allow2 = AllowAdd(creature, typ, GetPCPlayerName(oPC));
            if (allow != "" && allow2 != "") {
//AssignCommand(creature, SpeakString(allow + " - " + allow2));
                creature = FindPlayer(typ);
                SetLocalObject(creature, "who", oPC);
                SetLocalString(creature, "allow", allow);
                SetLocalString(creature, "allow2", allow2);
                InitConv(oPC, "");
                SetLocalString(creature, "cc_event", "init_allow");
                ExecuteScript("cc_event", creature);
            }
        } else if (GetStringLeft(typ, 5) == "pmsg_") { // Handle select Priv Message
            SetLocalInt(oPC, "privsel", StringToInt(GetSubString(typ, 5, 10)));
            SetLocalInt(oPC, "cc_level", 0);
            InitConv(oPC, "priv");
        } else if (GetStringLeft(typ, 6) == "psend_") { // Handle send Priv Message
            string who = GetSubString(typ, 6, 50);
            SetLocalString(oPC, "to", who);
            AssignCommand(GetNearestObjectByTag("scribe", oPC), SpeakString("Speak message title"));
            SetLocalString(oPC, "title", ".");
            InitConv(oPC, "");   // end conversation
        } else if (GetStringLeft(typ, 5) == "ppost") { // Handle Post Private Message
            string to = GetLocalString(oPC, "to");
            int msgcnt = GetCampaignInt(GetModuleName(), "msgcnt" + to) + 1;
            SetCampaignInt(GetModuleName(), "msgcnt" + to, msgcnt);
            string msg = to + IntToString(msgcnt);
            SetCampaignString(GetModuleName(), "from" + msg, FixName(GetLocalString(oPC, "title")));
            SetCampaignString(GetModuleName(), "msg" + msg, GetLocalString(oPC, "msg"));
            SetLocalInt(oPC, "cc_level", 0);
            InitConv(oPC, "priv");
        } else if (GetStringLeft(typ, 3) == "yes") { // Handle Priv Message allow confirm
            object who = GetLocalObject(oPC, "who");
            SetCampaignString(GetModuleName(), "allow"+GetPCPlayerName(oPC), GetLocalString(oPC, "allow2"));
            SetCampaignString(GetModuleName(), "allow"+GetPCPlayerName(who), GetLocalString(oPC, "allow"));
            InitConv(oPC, "");
            SetLocalString(who, "cc_event", "init_priv");
            ExecuteScript("cc_event", who);
        } else if (GetStringLeft(typ, 5) == "prem_") { // remove name from allow list
            string who = GetSubString(typ, 5, 50);
            AllowDel(GetPCPlayerName(oPC), who);
            AllowDel(who, GetPCPlayerName(oPC));
            InitConv(oPC, "prem");
        } else if (typ == "back") {
            int m = GetLocalInt(oPC, "privshow") - 10;
            SetLocalInt(oPC, "privshow", m);
            SetLocalInt(oPC, "sel", m);
            SetLocalInt(oPC, "cc_level", 0);
            InitConv(oPC, "priv");
        }
    }
}

string SetMsg(int n, object oPC)
{
//    object oPC = GetLastSpeaker();
    string msg = GetLocalString(oPC, "cc_msg" + IntToString(n));

    if (msg != "") {
        SetCustomToken(CUSTOM_TOKEN + n, msg);
        return "1";
    }
    return "";
}

void main()
{
//    object oPC = GetLastSpeaker();
    object oPC = OBJECT_SELF;
    string e = GetLocalString(oPC, "cc_event");
// WriteTimestampedLogEntry("<" + GetName(oPC) + "> " + e);

    if (GetStringLeft(e, 4) == "chk_") {
        SetLocalString(oPC, "cc_event", SetMsg(StringToInt(GetSubString(e, 4, GetStringLength(e)-4)), oPC));
    } else if (GetStringLeft(e, 3) == "do_") {
        DoAction(StringToInt(GetSubString(e, 3, GetStringLength(e)-3)), oPC);
    } else if (GetStringLeft(e, 5) == "init_") {
        InitConv(oPC, GetSubString(e, 5, GetStringLength(e)-5));
        //BeginConversation("customconv", oPC);
        if (GetLocalInt(oPC, "emotesit") != 0) {
            DeleteLocalInt(oPC, "emotesit");
        } else {
            AssignCommand(oPC, ClearAllActions(TRUE));
        }
        AssignCommand(oPC, ActionStartConversation(oPC, "customconv", TRUE));
    }
}


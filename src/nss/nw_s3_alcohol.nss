void MakeDrunk(object oTarget, int nPoints)
{
  int iCurrent;

  iCurrent = GetLocalInt(oTarget,"alcohol");
  iCurrent += nPoints;
  SetLocalInt(oTarget,"alcohol",iCurrent);
}

void pentagram(location lTargetLoc, int nBeamFX=VFX_BEAM_COLD, float fDuration=9.0)
{
    int nEff = nBeamFX;
    object oArea = GetAreaFromLocation(lTargetLoc);
    // Define vertices for pentagram
    vector v = GetPositionFromLocation(lTargetLoc);
    v = Vector(v.x,v.y+7.0,v.z);
    location l1= Location(oArea,v,0.0);
    v = Vector(v.x-4.0,v.y-12.5,v.z);
    location l2= Location(oArea,v,0.0);
    v = Vector(v.x+10.5,v.y+8.0,v.z);
    location l3= Location(oArea,v,0.0);
    v = Vector(v.x-13,v.y,v.z);
    location l4= Location(oArea,v,0.0);
    v = Vector(v.x+10.5,v.y-8.0,v.z);
    location l5= Location(oArea,v,0.0);
    // Create verticies objects
    object oS1 = CreateObject(OBJECT_TYPE_PLACEABLE,"nonstaticinvis",l1);
    object oS2 = CreateObject(OBJECT_TYPE_PLACEABLE,"nonstaticinvis",l2);
    object oS3 = CreateObject(OBJECT_TYPE_PLACEABLE,"nonstaticinvis",l3);
    object oS4 = CreateObject(OBJECT_TYPE_PLACEABLE,"nonstaticinvis",l4);
    object oS5 = CreateObject(OBJECT_TYPE_PLACEABLE,"nonstaticinvis",l5);
    // Connect vertices with beams
    effect eVis1 = EffectBeam(nEff,oS1,BODY_NODE_CHEST);
    effect eVis2 = EffectBeam(nEff,oS2,BODY_NODE_CHEST);
    effect eVis3 = EffectBeam(nEff,oS3,BODY_NODE_CHEST);
    effect eVis4 = EffectBeam(nEff,oS4,BODY_NODE_CHEST);
    effect eVis5 = EffectBeam(nEff,oS5,BODY_NODE_CHEST);
    // Make pentagram visible
    DelayCommand(0.3,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis1,oS2,fDuration));
    DelayCommand(0.6,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis2,oS3,fDuration));
    DelayCommand(0.9,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis3,oS4,fDuration));
    DelayCommand(1.2,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis4,oS5,fDuration));
    DelayCommand(1.5,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis5,oS1,fDuration));
    // Remove objects
    DelayCommand(fDuration,DestroyObject(oS1));
    DelayCommand(fDuration,DestroyObject(oS2));
    DelayCommand(fDuration,DestroyObject(oS3));
    DelayCommand(fDuration,DestroyObject(oS4));
    DelayCommand(fDuration,DestroyObject(oS5));
}

void main()
{
    object oPC;
    int typ;
    oPC=GetSpellTargetObject();
    typ=GetSpellId();
    string oItem=GetName(GetItemActivated());
    if(typ==408 || typ== 407)oItem=GetName(GetSpellCastItem());

// SpeakString("here:" + IntToString(typ) + ", " + GetName(oPC) + ", " + oItem);
// SpeakString("here");

    if (typ == 413) {
        if (oItem == "Scurrd") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(124), oPC));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(125), oPC));
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(126), oPC));
            MakeDrunk(oPC, 4);
        } else if (oItem == "GutBuster") {
            AssignCommand(oPC, ClearAllActions(TRUE));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE), oPC);
            AssignCommand (oPC, PlaySound("as_pl_tavdrunkm3"));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(50, DAMAGE_TYPE_ACID, DAMAGE_POWER_NORMAL), oPC);
            DelayCommand(0.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 2.0, 5.0)));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE), oPC));
            DelayCommand(1.5, AssignCommand (oPC, PlaySound("as_pl_tavdrunkm3")));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(50, DAMAGE_TYPE_ACID, DAMAGE_POWER_NORMAL), oPC));
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE), oPC));
            DelayCommand(3.0, AssignCommand (oPC, PlaySound("as_pl_tavdrunkm3")));
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(50, DAMAGE_TYPE_ACID, DAMAGE_POWER_NORMAL), oPC));
            DelayCommand(4.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE), oPC));
            DelayCommand(4.5, AssignCommand (oPC, PlaySound("as_pl_tavdrunkm3")));
            DelayCommand(4.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(50, DAMAGE_TYPE_ACID, DAMAGE_POWER_NORMAL), oPC));
            MakeDrunk(oPC, 4);
        } else if (oItem == "Demon Brew") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), oPC));
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), oPC, 2.0));
            DelayCommand(3.5, AssignCommand(oPC, PlaySound("vs_fjalekm_dead")));
            if (GetGender(oPC) != GENDER_FEMALE) DelayCommand(3.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectPolymorph(POLYMORPH_TYPE_BALOR), oPC));
            else DelayCommand(3.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectPolymorph(POLYMORPH_TYPE_SUCCUBUS), oPC, 0.0f));
            MakeDrunk(oPC, 3);
        } else if (oItem == "Uncle Volo's Bathtub Gin") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_BREACH), oPC));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_FNF_PWSTUN), oPC));
            MakeDrunk(oPC, 4);
        } else if (oItem == "Wormwood Liqueur") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_FNF_NATURES_BALANCE), oPC));
            MakeDrunk(oPC, 4);
        } else if (oItem == "Choking Port") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_ELEMENTAL_PROTECTION), oPC));
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_FNF_IMPLOSION), oPC));
            MakeDrunk(oPC, 4);
        } else if (oItem == "Diablo's Breath Beer") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_FNF_SUNBEAM), oPC, 1.0));
            MakeDrunk(oPC, 2);
        } else if (oItem == "Dwarven Black Ale") {
            typ = 406;
        } else if (oItem == "Orcish Contest Brew") {
            typ = 406;
        } else if (oItem == "Elven Silvermead") {
            typ = 406;
        } else if (oItem == "Elverquest") {
            typ = 406;
        } else if (oItem == "Golden Sands Brew") {
            typ = 406;
        } else if (oItem == "Hobbit's Hock") {
            typ = 406;
        } else if (oItem == "Torm's True Beer") {
            typ = 406;
        } else if (oItem == "Brandywine") {
            typ = 407;
        } else if (oItem == "Calimsharian Amber Wine") {
            typ = 407;
        } else if (oItem == "Drow Azure Wine") {
            typ = 407;
        } else if (oItem == "Dwarven Ice Wine") {
            typ = 407;
        } else if (oItem == "Fire Wine") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_FNF_FIRESTORM), oPC));
            DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_FNF_FIREBALL), oPC));
            MakeDrunk(oPC, 3);
        } else if (oItem == "Winter Wine") {
            typ = 407;
        } else if (oItem == "Nethereal Ancient Wine") {
            typ = 407;
        } else if (oItem == "Joint") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_MAGIC_RESISTANCE_USE), oPC, 1.0));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(220 + Random(10)), oPC));
            MakeDrunk(oPC, 5);
        } else if (oItem == "Silver Haze") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_FROST_S), oPC, 1.0));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(144 + Random(4)), oPC));
            MakeDrunk(oPC, 5);
        } else if (oItem == "Worm Juice") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_SOUND_BURST), oPC));
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), oPC));
            DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_PWKILL), oPC));
            DelayCommand(0.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0f, 5.0f)));
            DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_IMP_DEATH), oPC));
            DelayCommand(6.0, AssignCommand(oPC, ActionSpeakString("What The Heck?")));
            MakeDrunk(oPC, 5);
        } else if (oItem == "Knockout") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_BREACH), oPC));
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DESTRUCTION), oPC));
            DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE), oPC));
            DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_DOOM), oPC));
            DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DOOM), oPC));
            DelayCommand(7.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.5f,7.0f)));
            SetCutsceneMode(oPC, TRUE);
            FadeToBlack(oPC, FADE_SPEED_SLOW);
            DelayCommand(15.0, SetCutsceneMode(oPC, FALSE));
            DelayCommand(13.0, FadeFromBlack(oPC, FADE_SPEED_SLOW));
            DelayCommand(16.0,AssignCommand(oPC, ActionSpeakString("I Must Have Passed Out!!")));
            MakeDrunk(oPC, 17);
        } else if (oItem == "Super Hard Licker") {
            effect eFlash = EffectVisualEffect (VFX_IMP_SPELL_MANTLE_USE);
            effect eFlash1 = EffectVisualEffect (VFX_DUR_TENTACLE);
            effect eflash2 = EffectVisualEffect (VFX_IMP_SUPER_HEROISM);
            effect eflash3 = EffectVisualEffect (VFX_FNF_FIREBALL);
            effect eFlash5 = EffectVisualEffect (VFX_FNF_SUMMON_MONSTER_1);
            effect eFlash6 = EffectVisualEffect (VFX_FNF_SUMMON_MONSTER_2);
            effect eFlash7 = EffectVisualEffect (VFX_FNF_STRIKE_HOLY);
            effect eFlash8 = EffectVisualEffect (VFX_FNF_SOUND_BURST);
            effect eFlash9 = EffectVisualEffect (VFX_FNF_NATURES_BALANCE);
            effect eFlash10 = EffectVisualEffect (VFX_FNF_LOS_NORMAL_10);
            effect eFlash11 = EffectVisualEffect (VFX_FNF_LOS_NORMAL_30);
            effect eFlash12 = EffectVisualEffect (VFX_FNF_LOS_EVIL_10);
            effect eFlash13 = EffectVisualEffect (VFX_FNF_LOS_EVIL_30);
            effect eFlash14 = EffectVisualEffect (VFX_FNF_LOS_HOLY_10);
            effect eFlash15 = EffectVisualEffect (VFX_FNF_LOS_HOLY_30);
            effect eFlash16 = EffectVisualEffect (VFX_FNF_HOWL_ODD);
            effect eFlash17 = EffectVisualEffect (VFX_IMP_IMPROVE_ABILITY_SCORE);
            effect eFlash18 = EffectVisualEffect (VFX_IMP_RAISE_DEAD);
            effect eFlash22 = EffectVisualEffect (VFX_DUR_MAGICAL_SIGHT);
            effect eFlash23 = EffectVisualEffect (VFX_DUR_GHOSTLY_PULSE);
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash22,oPC));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash1,oPC));
            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash1,oPC));
            DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash5,oPC));
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash6,oPC));
            DelayCommand(3.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash7,oPC));
            DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash8,oPC));
            DelayCommand(4.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash9,oPC));
            DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash10,oPC));
            DelayCommand(5.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash11,oPC));
            DelayCommand(6.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT,3.0,10.0)));
            DelayCommand(6.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash12,oPC));
            DelayCommand(7.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash13,oPC));
            DelayCommand(7.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash14,oPC));
            DelayCommand(8.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash15,oPC));
            DelayCommand(8.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash16,oPC));
            DelayCommand(9.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash18,oPC));
            DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash17,oPC));
            DelayCommand(10.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash,oPC));
            DelayCommand(11.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash23,oPC));
            MakeDrunk(oPC, 11);
        } else if (oItem == "Booya") {
            effect eFlash = EffectVisualEffect (VFX_IMP_FLAME_M);
            effect eFlash1 = EffectVisualEffect (VFX_DUR_GLOBE_INVULNERABILITY);
            effect eflash2 = EffectVisualEffect (VFX_IMP_HARM);
            effect eflash3 = EffectVisualEffect (VFX_FNF_IMPLOSION);
            effect eFlash5 = EffectVisualEffect (VFX_FNF_SUMMON_MONSTER_3);
            effect eFlash6 = EffectVisualEffect (VFX_FNF_SUMMON_UNDEAD);
            effect eFlash7 = EffectVisualEffect (VFX_FNF_STRIKE_HOLY);
            effect eFlash8 = EffectVisualEffect (VFX_FNF_SOUND_BURST);
            effect eFlash9 = EffectVisualEffect (VFX_FNF_MASS_HEAL);
            effect eFlash10 = EffectVisualEffect (VFX_FNF_LOS_NORMAL_10);
            effect eFlash11 = EffectVisualEffect (VFX_FNF_LOS_NORMAL_30);
            effect eFlash12 = EffectVisualEffect (VFX_FNF_LOS_EVIL_10);
            effect eFlash13 = EffectVisualEffect (VFX_FNF_LOS_EVIL_30);
            effect eFlash14 = EffectVisualEffect (VFX_FNF_LOS_HOLY_10);
            effect eFlash15 = EffectVisualEffect (VFX_FNF_LOS_HOLY_30);
            effect eFlash16 = EffectVisualEffect (VFX_FNF_HOWL_ODD);
            effect eFlash17 = EffectVisualEffect (VFX_IMP_IMPROVE_ABILITY_SCORE);
            effect eFlash18 = EffectVisualEffect (VFX_IMP_RAISE_DEAD);
            effect eFlash22 = EffectVisualEffect (VFX_DUR_MAGICAL_SIGHT);
            effect eFlash23 = EffectVisualEffect (VFX_DUR_GHOSTLY_VISAGE);
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash22,oPC));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash1,oPC));
            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash1,oPC));
            DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash5,oPC));
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash6,oPC));
            DelayCommand(3.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash7,oPC));
            DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash8,oPC));
            DelayCommand(4.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash9,oPC));
            DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash10,oPC));
            DelayCommand(5.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash11,oPC));
            DelayCommand(6.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT,3.0,10.0)));
            DelayCommand(6.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash12,oPC));
            DelayCommand(7.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash13,oPC));
            DelayCommand(7.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash14,oPC));
            DelayCommand(8.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash15,oPC));
            DelayCommand(8.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash16,oPC));
            DelayCommand(9.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash18,oPC));
            DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash17,oPC));
            DelayCommand(10.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash,oPC));
            DelayCommand(11.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash23,oPC));
            MakeDrunk(oPC, 11);
        } else if (oItem == "Test Tube") {
            effect eFlash = EffectVisualEffect (VFX_IMP_LIGHTNING_M);
            effect eFlash1 = EffectVisualEffect (VFX_DUR_PROT_SHADOW_ARMOR);
            effect eflash2 = EffectVisualEffect (VFX_IMP_DOOM);
            effect eflash3 = EffectVisualEffect (VFX_FNF_SMOKE_PUFF);
            effect eFlash5 = EffectVisualEffect (VFX_FNF_DISPEL);
            effect eFlash6 = EffectVisualEffect (VFX_FNF_SUMMON_UNDEAD);
            effect eFlash7 = EffectVisualEffect (VFX_FNF_STRIKE_HOLY);
            effect eFlash8 = EffectVisualEffect (VFX_FNF_DISPEL_DISJUNCTION);
            effect eFlash9 = EffectVisualEffect (VFX_FNF_MASS_HEAL);
            effect eFlash10 = EffectVisualEffect (VFX_FNF_LOS_NORMAL_10);
            effect eFlash11 = EffectVisualEffect (VFX_FNF_LOS_NORMAL_30);
            effect eFlash12 = EffectVisualEffect (VFX_FNF_LOS_EVIL_10);
            effect eFlash13 = EffectVisualEffect (VFX_FNF_WAIL_O_BANSHEES);
            effect eFlash14 = EffectVisualEffect (VFX_FNF_LOS_HOLY_10);
            effect eFlash15 = EffectVisualEffect (VFX_FNF_SUNBEAM);
            effect eFlash16 = EffectVisualEffect (VFX_COM_CHUNK_RED_LARGE);
            effect eFlash17 = EffectVisualEffect (VFX_IMP_IMPROVE_ABILITY_SCORE);
            effect eFlash18 = EffectVisualEffect (VFX_IMP_RAISE_DEAD);
            effect eFlash22 = EffectVisualEffect (VFX_DUR_INVISIBILITY);
            effect eFlash23 = EffectVisualEffect (VFX_COM_HIT_SONIC);
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash22,oPC));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash1,oPC));
            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash1,oPC));
            DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash5,oPC));
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash6,oPC));
            DelayCommand(3.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash7,oPC));
            DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash8,oPC));
            DelayCommand(4.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash9,oPC));
            DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash10,oPC));
            DelayCommand(5.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash11,oPC));
            DelayCommand(6.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT,3.0,10.0)));
            DelayCommand(6.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash12,oPC));
            DelayCommand(7.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash13,oPC));
            DelayCommand(7.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash14,oPC));
            DelayCommand(8.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash15,oPC));
            DelayCommand(8.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash16,oPC));
            DelayCommand(9.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash18,oPC));
            DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash17,oPC));
            DelayCommand(10.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash,oPC));
            DelayCommand(11.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,eFlash23,oPC));
            MakeDrunk(oPC, 11);
        }
    }
    if (typ == 406) {              // * Beer
        MakeDrunk(oPC, 2);
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_CONFUSION_S), oPC));
        DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_DAZED_S), oPC));
    } else if (typ == 407) {       // *Wine
        if (oItem == "Lilac Wine") {
            int typ = 215;
            if (Random(2) == 0) typ = 213;
            pentagram(GetLocation(oPC), typ, 3.0);
            typ = Random(4);
            if (typ < 3) typ += 139;
            else typ = 149;
            DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(typ), oPC, 2.0));
            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(55), oPC));
            MakeDrunk(oPC, 4);
        } else {
            MakeDrunk(oPC, 3);
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_HEAD_SONIC), oPC));
            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_HEAD_EVIL), oPC));
            DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_CONFUSION_S), oPC));
        }
    } else if (typ == 408) {       // * Spirits
        if (oItem == "Blue Martini") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(254), oPC, 1.5));
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(302), oPC));
            MakeDrunk(oPC, 4);
        } else if (oItem == "Fire and Ice") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(147), oPC, 2.0));
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(150), oPC));
            MakeDrunk(oPC, 4);
        } else if (oItem == "Lemon Squash") {
            typ = 188 + Random(3);
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(typ), oPC));
            typ = 194 + Random(10);
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(typ), oPC));
            MakeDrunk(oPC, 4);
        } else if (oItem == "Raspberry Kiss") {
            typ = 185 + Random(3);
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(typ), oPC));
            typ = 194 + Random(10);
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(typ), oPC));
            MakeDrunk(oPC, 4);
        } else if (oItem == "Vodka Gimlet") {
            typ = 191 + Random(3);
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(typ), oPC));
            typ = 194 + Random(10);
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(typ), oPC));
            MakeDrunk(oPC, 4);
        } else if (oItem == "Licorice Stick") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(1), oPC, 3.0));
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(146), oPC));
            MakeDrunk(oPC, 4);
        } else if (oItem == "Vodka Gimlet") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(254), oPC));
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(302), oPC));
            MakeDrunk(oPC, 4);
        } else if (oItem == "Maiden's Kiss Brandy") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(82), oPC, 1.0));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_FNF_SOUND_BURST), oPC));
            MakeDrunk(oPC, 4);
        } else if (oItem == "Moonshine") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_FLAME_S), oPC));
            DelayCommand(0.8, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_FNF_WORD), oPC));
            DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_FLAME_S), oPC));
            MakeDrunk(oPC, 4);
        } else if (oItem == "Climax") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_RESTORATION_GREATER), oPC));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_FNF_WAIL_O_BANSHEES), oPC));
            MakeDrunk(oPC, 4);
        } else if (oItem == "Orgasm Martini") {
            DelayCommand(0.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2), oPC));
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_FNF_BLINDDEAF), oPC));
            MakeDrunk(oPC, 4);
        } else {
            MakeDrunk(oPC, 4);
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_MAGBLUE), oPC));
            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_HEAD_ELECTRICITY), oPC));
        }
    }
}


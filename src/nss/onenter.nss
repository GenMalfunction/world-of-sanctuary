//This sends a message to the pc
void oReason(object oPC, string reason)
{
    DelayCommand(0.5,SendMessageToPC(oPC,"<c?ò?>" + reason));
}
//just part of scan 2 to destroy all items
void kill(object thing)
{
    DestroyObject(thing);
}
//returns the item count for a play as seems to stop if to many
int ItemCount(object oPC)
    {
    object oItem = GetFirstItemInInventory(oPC);
    int counts = 0;

    while(GetIsObjectValid(oItem))
    {
    counts++;
    oItem = GetNextItemInInventory(oPC);
    }
    return counts;
}

//if we find more than 150 items lets take control away from player and remove all items
void oScan2(object oPC)
{
    object oItem = GetFirstItemInInventory(oPC);
    while(GetIsObjectValid(oItem))
    {
    kill(oItem);
    oItem = GetNextItemInInventory(oPC);
    }

    int oSlot;
    for(oSlot = 0; oSlot < NUM_INVENTORY_SLOTS; oSlot++)
    {
    object oItem2 = GetItemInSlot(oSlot,oPC);
    kill(oItem2);
    }
}
//And this is what starts the script working
void main()
{
    object oPC = GetEnteringObject();

//If onenter is DM do nothing
    if(GetIsDM(oPC))
    {
    return;
    }
    int nCounts = ItemCount(oPC);
    if(nCounts > 150)
    {
    oReason(oPC,"Please Low your Item Count To below 150");
    oReason(oPC,"You have (" + IntToString(nCounts) + ")");
    oScan2(oPC);
    return;
    }


    DelayCommand(7.0,SetCommandable(TRUE,oPC));
    effect ekick  = EffectVisualEffect(VFX_IMP_HARM);
effect ekick2 = EffectVisualEffect(VFX_IMP_MIRV_FLAME);
effect ekick3 = EffectVisualEffect(VFX_IMP_GOOD_HELP);
effect ekick4 = EffectVisualEffect(VFX_IMP_GOOD_HELP);
effect ekick5 = EffectVisualEffect(VFX_IMP_GOOD_HELP);
effect ekick6 = EffectVisualEffect(VFX_IMP_GOOD_HELP);
effect ekick7 = EffectVisualEffect(VFX_IMP_GOOD_HELP);
effect ekick8 = EffectVisualEffect(VFX_IMP_GOOD_HELP);
effect ekick9 = EffectVisualEffect(VFX_IMP_GOOD_HELP);
effect ekick10 = EffectVisualEffect(VFX_IMP_GOOD_HELP);
effect ekick11 = EffectVisualEffect(VFX_IMP_GOOD_HELP);
effect ekick12 = EffectVisualEffect(VFX_IMP_GOOD_HELP);
effect ekick13 = EffectVisualEffect(VFX_IMP_EVIL_HELP);
//object oJail = GetObjectByTag("WP_Horror");//Make a waypoint in your jail and change its tag to WP_Jail
int Jail = 0 ;
if(GetIsPC(oPC))
/*If any of the following spells/feats are found manually added in a "SpecAbilityList"
then you will be sent to jail*/
if(GetHasSpell(SPELLABILITY_AA_ARROW_OF_DEATH,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AA_HAIL_OF_ARROWS,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AA_IMBUE_ARROW,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AA_SEEKER_ARROW_1,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AA_SEEKER_ARROW_2,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_ACTIVATE_ITEM,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AS_DARKNESS,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AS_GHOSTLY_VISAGE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AS_IMPROVED_INVISIBLITY,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AS_INVISIBILITY,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AURA_BLINDING,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AURA_COLD,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AURA_ELECTRICITY,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AURA_FEAR,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AURA_FIRE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AURA_HORRIFICAPPEARANCE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AURA_MENACE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AURA_OF_COURAGE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AURA_PROTECTION,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AURA_STUN,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AURA_UNEARTHLY_VISAGE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_AURA_UNNATURAL,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BARBARIAN_RAGE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BATTLE_MASTERY,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BG_BULLS_STRENGTH,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BG_CONTAGION,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BG_CREATEDEAD,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BG_FIENDISH_SERVANT,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BG_INFLICT_CRITICAL_WOUNDS,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BG_INFLICT_SERIOUS_WOUNDS,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_ABILITY_DRAIN_CHARISMA,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_ABILITY_DRAIN_CONSTITUTION,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_ABILITY_DRAIN_DEXTERITY,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_ABILITY_DRAIN_INTELLIGENCE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_ABILITY_DRAIN_STRENGTH,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_ABILITY_DRAIN_WISDOM,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_ACID,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_CHARM,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_COLD,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_CONFUSE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_DEATH,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_DISEASE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_DOMINATE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_FIRE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_KNOCKDOWN,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_LEVEL_DRAIN,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_LIGHTNING,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_PARALYZE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_POISON,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_SHARDS,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_SLOW,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_STUN,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BOLT_WEB,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_BREATH_PETRIFY,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_CHARMMONSTER,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_CONE_ACID,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_CONE_COLD,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_CONE_DISEASE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_CONE_FIRE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_CONE_LIGHTNING,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_CONE_POISON,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_CONE_SONIC,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DC_DIVINE_WRATH,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DETECT_EVIL,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DIVINE_PROTECTION,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DIVINE_STRENGTH,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DIVINE_TRICKERY,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DRAGON_BREATH_ACID,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DRAGON_BREATH_COLD,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DRAGON_BREATH_FEAR,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DRAGON_BREATH_FIRE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DRAGON_BREATH_GAS,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DRAGON_BREATH_LIGHTNING,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DRAGON_BREATH_NEGATIVE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DRAGON_BREATH_PARALYZE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DRAGON_BREATH_SLEEP,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DRAGON_BREATH_SLOW,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DRAGON_BREATH_WEAKEN,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DRAGON_FEAR,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DRAGON_WING_BUFFET,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_DW_DEFENSIVE_STANCE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_ELEMENTAL_SHAPE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_EMPTY_BODY,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_EPIC_CURSE_SONG,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_EPIC_IMPROVED_WHIRLWIND,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_EPIC_MIGHTY_RAGE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_EPIC_SHAPE_DRAGON,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_EPIC_SHAPE_DRAGONKIN,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_FEROCITY_1,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_FEROCITY_2,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_FEROCITY_3,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_GAZE_CHARM,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_GAZE_CONFUSION,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_GAZE_DAZE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_GAZE_DEATH,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_GAZE_DESTROY_CHAOS,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_GAZE_DESTROY_EVIL,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_GAZE_DESTROY_GOOD,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_GAZE_DESTROY_LAW,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_GAZE_DOMINATE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_GAZE_DOOM,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_GAZE_FEAR,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_GAZE_PARALYSIS,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_GAZE_PETRIFY,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_GAZE_STUNNED,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_GOLEM_BREATH_GAS,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_HELL_HOUND_FIREBREATH,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_HOWL_CONFUSE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_HOWL_DAZE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_HOWL_DEATH,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_HOWL_DOOM,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_HOWL_FEAR,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_HOWL_PARALYSIS,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_HOWL_SONIC,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_HOWL_STUN,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_INTENSITY_1,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_INTENSITY_2,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_INTENSITY_3,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_KRENSHAR_SCARE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_LAY_ON_HANDS,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_LESSER_BODY_ADJUSTMENT,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_MANTICORE_SPIKES,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_MEPHIT_SALT_BREATH,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_MEPHIT_STEAM_BREATH,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_MINDBLAST,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_MUMMY_BOLSTER_UNDEAD,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_NEGATIVE_PLANE_AVATAR,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PM_ANIMATE_DEAD,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PM_DEATHLESS_MASTER_TOUCH,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PM_SUMMON_GREATER_UNDEAD,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PM_SUMMON_UNDEAD,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PM_UNDEAD_GRAFT_1,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PM_UNDEAD_GRAFT_2,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_ABILITY_DRAIN_CHARISMA,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_ABILITY_DRAIN_CONSTITUTION,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_ABILITY_DRAIN_DEXTERITY,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_ABILITY_DRAIN_INTELLIGENCE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_ABILITY_DRAIN_STRENGTH,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_ABILITY_DRAIN_WISDOM,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_COLD,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_DEATH,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_DISEASE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_DROWN,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_FIRE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_HOLY,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_LEVEL_DRAIN,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_LIGHTNING,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_NEGATIVE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_POISON,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_SPORES,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_PULSE_WHIRLWIND,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_QUIVERING_PALM,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_RAGE_3,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_RAGE_4,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_RAGE_5,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_REMOVE_DISEASE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_ROGUES_CUNNING,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_SEAHAG_EVILEYE,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_SMITE_EVIL,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_SMOKE_CLAW,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_SUMMON_ANIMAL_COMPANION,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_SUMMON_CELESTIAL,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_SUMMON_FAMILIAR,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_SUMMON_MEPHIT,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_SUMMON_SLAAD,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_SUMMON_TANARRI,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_TOUCH_PETRIFY,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_TRUMPET_BLAST,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_TURN_UNDEAD,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_TYRANT_FOG_MIST,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_WHIRLWIND,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_WHOLENESS_OF_BODY,oPC)== TRUE ||
GetHasSpell(SPELLABILITY_WILD_SHAPE,oPC))
{
DelayCommand(2.5,AssignCommand(oPC,SpeakString("<cÈÈ>No Monster Abilities on Characters, now you get BOOTED!!",TALKVOLUME_TALK)));
Jail = 1 ;
}
if(Jail == 1 )
{


DelayCommand(3.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick,oPC));
DelayCommand(4.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick2,oPC));
DelayCommand(6.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick3,oPC));
DelayCommand(7.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick4,oPC));
DelayCommand(8.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick5,oPC));
DelayCommand(9.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick6,oPC));
DelayCommand(10.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick7,oPC));
DelayCommand(11.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick8,oPC));
DelayCommand(12.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick9,oPC));
DelayCommand(13.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick10,oPC));
DelayCommand(14.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick11,oPC));
DelayCommand(15.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick12,oPC));
DelayCommand(15.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick13,oPC));
DelayCommand(3.0,AssignCommand(oPC,SpeakString("<cÈÈ>AAAHHH NNOOO!!",TALKVOLUME_TALK)));
DelayCommand(4.0,AssignCommand(oPC,SpeakString("I am getting my ass Booted in 10 second's for having Monster Spells!!",TALKVOLUME_SHOUT)));
DelayCommand(6.0,AssignCommand(oPC,SpeakString("[10]",TALKVOLUME_TALK)));
DelayCommand(7.0,AssignCommand(oPC,SpeakString("[9]",TALKVOLUME_TALK)));
DelayCommand(8.0,AssignCommand(oPC,SpeakString("[8]",TALKVOLUME_TALK)));
DelayCommand(9.0,AssignCommand(oPC,SpeakString("[7]",TALKVOLUME_TALK)));
DelayCommand(10.0,AssignCommand(oPC,SpeakString("[6]",TALKVOLUME_TALK)));
DelayCommand(11.0,AssignCommand(oPC,SpeakString("[5]",TALKVOLUME_TALK)));
DelayCommand(12.0,AssignCommand(oPC,SpeakString("[4]",TALKVOLUME_TALK)));
DelayCommand(13.0,AssignCommand(oPC,SpeakString("[3]",TALKVOLUME_TALK)));
DelayCommand(14.0,AssignCommand(oPC,SpeakString("[2]",TALKVOLUME_TALK)));
DelayCommand(12.0,AssignCommand(oPC,SpeakString("[1]",TALKVOLUME_TALK)));
DelayCommand(15.5,AssignCommand(oPC,SpeakString("BYE BYE ALL!!!",TALKVOLUME_SHOUT)));
DelayCommand(6.0, AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_HOLD)));
DelayCommand(4.0, AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_BADIDEA)));
DelayCommand(12.0, AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_HELP)));
DelayCommand(15.0, AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_GOODBYE)));
DelayCommand(15.0, AssignCommand(oPC, PlayAnimation(ANIMATION_FIREFORGET_GREETING)));
DelayCommand(16.0,BootPC(oPC));

}
}

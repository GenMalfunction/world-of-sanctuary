//::**********************************************
//:: Script: pgs_inc_config
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        An INCLUDE script, which houses all of the
    configurable options for the 'Player Guild
    System'.  This script may be modified to the
    user's liking.

    Note: In order for any changes to take effect,
          you must re-build the module (Build ->
          Build Module)!
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: February 5/25/2006
//::**********************************************


//PGS_DBNAME_PC -
//    This variable allows you, the module builder, to select the naming
//    convention for the database name that will be assigned to each individual
//    player.  This is possible thanks to a sub-system I created and also
//    incorporated into this system as a way ease the process in saving
//    variables directly to a PC (without having to do wacky naming conventions).
//
//Note: Database names will be created in the following format (assuming a
//      default value for this variable): "Mod_PlayerIDxxx (where xxx is a unique
//      number that is assigned to all players entering the module.
const string PGS_DBNAME_PC = "MOD_PlayerID";

//PGS_DBNAME_GUILD -
//    This variable allows you to change the database naming convention for
//    the databases used to store guild-specific information.
//
//Note: Using the default value, a guild with an ID of 8 would have the following
//      database name: "MOD_Guild8".
const string PGS_DBNAME_GUILD = "MOD_Guild";

//PGS_DBNAME_UID -
//    This variable allows you to change the database name used to store all
//    player's unique ID number.
const string PGS_DBNAME_UID = "MOD_UID_System";

//PGS_DBNAME_MAIN -
//    This variable allows you to change the database name that is used to
//    store general PGS-related information.
const string PGS_DBNAME_MAIN = "MOD_PGS_Main";

//PGS_EXPORT_DELAY -
const float PGS_EXPORT_DELAY = 20.0f;
//    Used by the 'Unique ID System' (UID) to determine the delay for before
//    saving characters as they enter the server.

//PGS_NEW_GUILD_* -
//    These variables allow the module builder to control the requirements, from
//PCs, that are needed in order for them to create a guild.
//
//    Note: Setting any of these variables to 0 will disable that particular
//          requirement.
const int PGS_NEW_GUILD_LEVEL         = 40;  //Character level needed.
const int PGS_NEW_GUILD_CHARISMA      = 0;  //Charisma score needed.
const int PGS_NEW_GUILD_INTELLIGENCE  = 0;  //Intelligence score needed.
const int PGS_NEW_GUILD_PERSUADE      = 0;  //Persuade skill level needed.
const int PGS_NEW_GUILD_COST          = 0;  //Gold amount needed.

//PGS_MAX_NUM_GUILDS -
//    This variable controls the maximum number of guilds allowed to be active
//at any point in time.  Setting this value to 0 will disable this limitation.
const int PGS_MAX_NUM_GUILDS = 20;

//PGS_DEFAULT_RANK* -
//    These variables control the default rank names to be used when a new guild
//has been created.  The guild leader may change these at any time to more suit
//his/her guild's needs.
const string PGS_DEFAULT_RANK6 = "Warlord";
const string PGS_DEFAULT_RANK5 = "Champion";
const string PGS_DEFAULT_RANK4 = "Knight";
const string PGS_DEFAULT_RANK3 = "Squire";
const string PGS_DEFAULT_RANK2 = "Footman";
const string PGS_DEFAULT_RANK1 = "Soldier";

//PGS_ALLOW_FLAGS -
//    This variable determines whether or not guilds can associate it's members
//with a flag.  Guilds can choose their own flag color, and guild members can
//choose whether or not to show his/her guild flag.
const int PGS_ALLOW_FLAGS = TRUE;

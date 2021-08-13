# World of Sanctuary
Project to fix bugs and add enhancements to Diablo2-NWN mod Diablo Lord of Destruction

"Stay a while, and listen..." --Deckard Cain

# *INTRO*

Have you ever played Dungeons & Dragons? I'm not talking about version 4, or version 5, with their "epic this" and "epic that..." I'm talking the original pen and paper D&D, or AD&D (Advanced Dungeon & Dragons, arguably version 2.0) where 1st level characters had to scrabble and claw their way to growing strong enough to survive an argument with the city watch, and eventually, if you were lucky and played smart, you'd find yourself and your friends gathered around a table, all acting out their hero's part in facing down that week's big bad guy, feverishly rolling dice to determine whether they escaped the wrath of the dragon's fiery breath, or whether the fateful swing of their trusty sword connects to end the beast's reign of terror?

For many, Neverwinter Nights (NWN) is as close as they're ever going to get to the collaborative storytelling experience I describe above. The game does a pretty good job of encompassing the D&D v3.0 rule set into it's game engine, and comes stocked with a decent array of premade "modules," that is, adventures you can create a character for, and disembark into. Better, you can invite some friends to join you in a multi-player, cooperative adventure, or even test your favorite Barbarian's fighting ability against your buddy's favorite Wizard.

Best of all, when NWN was initially released, the developer (Bioware) included the "Aurora Toolset," enabling the player community to create new modules of their own! Coupled with a "Dungeon Master" client, this led to a generation of Neverwinter Nights players, DMs, and module creators that is alive, well, and very active, even seeing a resurgence, today!

The original release of NWN came in the era of Diablo2, an "action role-playing" style game. Diablo & Diablo2 were not set in the D&D universe, and the game mechanics didn't work the same. Many loved it all the same.

Some loved the idea of it so much, they set out to create Neverwinter Nights modules where players can relive the Diablo2 story.

# *The Module*

Queue Henk Blanken and his "Diablo Lord of Destruction - World of Sanctuary" Neverwinter Nights module. Henk created this module, ran it on a dedicated server full time for approximately seven years, continually tuning the content, and even adding to the story. The original Diablo 2 had four "Acts," where various quests and ultimate evils were confronted, and a fifth Act available via DLC. Henk, with the inspriation & input of his DMs and regular players, expanded the "World of Sanctuary" to TEN Acts, before life moved on, and he made the decision to cease operation of his "Persistent World" NWN module and move on to greener pastures. One of his then current active players, Stefano took over curatorship at that point, and has had the persisten world online over various periods in the intervening time. Sadly, Stefano now has also had to move on from curating and any possible "enhancement" of this module.

Full faith & credit to all who have been involved in the development, playtesting, and pure fun had with the module over the years, including but not limited to:
- Henk Blanken
- Henk's DM team:
-   DM Thielfin
-   DM O'dair
-   DM Poppy
-   DM Lego
-   DM <>
- Prominent Players:
-   Dr. V
-   Voolfie
-   Tank
-   Brak
-   L0BSTER
- Stefano Dobbin -- for curating the mod, keeping it online, and working on moving it forward

Henk's last update to the mod, labeled version 1.3, is enshrined on the Neverwinter Vault here: https://neverwintervault.org/project/nwn1/module/gameworld/world-sanctuary-diablo-ii-lord-destruction

# *The Project*

Queue "The Rogue Encampment Irregulars," an ad-hoc group of NWN players, DMs, and mod developers who have at various points in history played & loved "Diablo 2 Lord of Destruction - World of Sanctuary." The group's sole reason for being is to keep this module alive, and to put in our best effort at fixing any bugs that may still linger, and make some "quality of life" or "user friendliness" enhancements along the way.

This project will use the Nasher toolset to implement "revision control" on the bugfixes & enhancements made by Rogue Encampment Irregulars. Our present understanding is that Nasher exports a great many elements of the Aurora ".mod" file to JSON format, some elements are still binary BLOBs. And though in theory the JSON elements can be manipulated and imported back into the .mod format, if built-in limitations of the Toolset are exceeded, those changes are thrown out by the Toolset upon the next module build.

This project also intends to run a DEV server using the NWNXEE server. We experimented with running the vanilla nwserver Docker image from Beamdog, as well as NWNXEE, and our impression is that NWNXEE feels a tad more "responsive" for players, additional NWNXEE-enabled tweaks aside.


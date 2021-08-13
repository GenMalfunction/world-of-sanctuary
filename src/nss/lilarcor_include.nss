//::///////////////////////////////////////////////
//:: FileName lilarcor_include
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Sir Craven (SirCraven@gmx.net)
//:: Finished On: 9/13/2002 3:15:00 PM (V1.0)
//:://////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////
//
// THIS FILE CONTAINS ALL NECESSARY FUNCTIONS FOR LILARCOR, THE SENTIENT
// SWORD, TO WORK PROPERLY.
// DO NOT TOUCH UNLESS YOU KNOW WHAT YOU'RE DOING!
//
/////////////////////////////////////////////////////////////////////////

// *** IMPORTANT ***: If you change anything in this file you MUST compile
// the script that works with the data you just altered again, or the
// changes WON'T TAKE EFFECT!

// I.E. if you change any of the three variables below, the module's
// "OnHeartbeat" Script needs to be compiled again.


// These two variables control how long it takes for Lilarcor to say something.
// The delay below is noted in rounds (1 round is about 6 seconds real-time)
// and can be altered to any convenient value; the variables are needed in
// the "LilarcorSpeakOneLiner()" function (look there for details).
// If Lilarcor never seems to say anything, increase the values.
// If the sword talks too much, lower the variables.

int nLilarcorTalkDelayNormal = 2;   // Delay when not fighting
int nLilarcorTalkDelayCombat = 2;   // Delay when in combat, should be short
                                    // for 'flavor' reasons ;-)

// This variable determines the range from which a random number is picked;
// it is used in the "LilarcorSpeakOneLiner()" function (look there for
// details).
// This random number will be added to the delay when not in combat.
// I.E. if you wanted Lilarcor to say a one-liner every 10 to 30 rounds,
// (about one to three minutes real-time), you'd need to set
// "nLilarcorTalkDelayNormal" to 10 and "nLilarcorRandomDelay" to 20.

int nLilarcorRandomDelay = 1;


// Returns a starting value for the talkcounter. The counter is saved globally.

int StartLilarcorTalkCounter()
{
    return nLilarcorTalkDelayNormal + Random(nLilarcorRandomDelay + 1);
}


// This function needs to be called from the module's "OnAcquireItem" event.
// It will set a global variable so the game can locate Lilarcor's Owner
// at any time and initialise a counter (neeeded to determine when Lilarcor
// is supposed to speak a one-liner.

void LilarcorAcquired()
{
    object oSword = GetModuleItemAcquired();

    if ( GetTag(oSword) == "Lilarcor" )
    {
        object oWielder = GetItemPossessor(oSword);

        if ( GetIsObjectValid(oWielder) && GetIsPC(oWielder) )
        {
            AssignCommand(oWielder, ClearAllActions());
            AssignCommand(oWielder, SpeakString("[LILARCOR]: 'Whoo-Hoo! I've got a new owner! Let's celebrate and kill something!'", TALKVOLUME_TALK));
            DelayCommand(1.0, SetLocalObject(GetModule(), "oLilarcorsOwner", oWielder));
            DelayCommand(1.5, SetLocalInt(GetModule(), "nLilarcorTalkCounter", StartLilarcorTalkCounter()));
        }
    }
}


// This function will create an invisible object with an attached conversation
// file near the possessor of Lilarcor and start a conversation if Lilarcor's
// special power is activated; it needs to be called from the module's
// "OnActivateItem" Event.

void IsLilarcor()
{
    object oSword = GetItemActivated();
    if ( GetTag(oSword) == "Lilarcor" )
    {
        object oWielder = GetItemPossessor(oSword);

        if ( GetIsObjectValid(oWielder) && GetIsPC(oWielder) )
        {
            location locPC = GetLocation(oWielder);
            CreateObject(OBJECT_TYPE_PLACEABLE, "lilarcortalkobje", locPC);
            DelayCommand(1.0, AssignCommand(GetObjectByTag("LilarcorTalkObject"), ActionStartConversation(oWielder)));
        }
    }
}


// This function returns a random one-liner Lilarcor will speak
// when in combat and equipped by PC

string ChooseLilarcorOneLinerCombat()
{
    int nRandomLine = Random(33) + 1;

    switch(nRandomLine)
    {
        case  1: return "'You deal, I'll cut!'";
        case  2: return "'Let's see what's inside this one! Yeah!'";
        case  3: return "'Come get some!  Boo-yah!'";
        case  4: return "'Choke up, dolt, your grip is all wrong!'";
        case  5: return "'Hands up, kiddies, who wants to die?!'";
        case  6: return "'Mmmm... tastes like chicken!'";
        case  7: return "'Sissy fighter!  You grab, I'll scratch!'";
        case  8: return "'Muwahahaha-ha-ha!!'";
        case  9: return "'You can't be serious!'";
        case 10: return "'Ooo, that'll leave a mark!'";
        case 11: return "'Murder!  Death!!  KILL!!!'";
        case 12: return "'Who's your daddy!'";
        case 13: return "'We got a gusher!'";
        case 14: return "'Are YOU talking to ME?!!'";
        case 15: return "'Some of my finest work!'";
        case 16: return "'I'm the best at what I do, and what I do ain't pretty!'";
        case 17: return "'Yeah! Hit it!  Hit it again!'";
        case 18: return "'I am invincible!  Invincible, I say!'";
        case 19: return "'Wouldn't it be cool if you could dual-wield me?'";
        case 20: return "'YOINK!  Got yer nose!'";
        case 21: return "'My brother is a +12 Hackmaster!'";
        case 22: return "'I love the smell of daisies in the morning!'";
        case 23: return "'Swing harder!  Swing harder!!'";
        case 24: return "'Bring 'em on!  I ain't done!'";
        case 25: return "'Oh yeah!'";
        case 26: return "'Let's dance!'";
        case 27: return "'Kill it!  Kill it quick before they're all gone!'";
        case 28: return "'Kill kill kill!  Yeah!  Cool!!'";
        case 29: return "'...and this one's for grandma, who said I'd never amount to anything more than a butterknife!!'";
        case 30: return "'Hot butta!'";
        case 31: return "'You feel lucky, punk?'";
        case 32: return "'Oooh, I'm shaking! Haha!'";
        case 33: return "'Oooh, throw a coin in that fountain! Hahaha!'";
    }
    return "'Yeah! Hit it! Hit it again!'"; // failsafe return value
}


// This function returns a random one-liner Lilarcor will speak
// when not in combat and equipped by PC

string ChooseLilarcorOnelinerNonCombat()
{
    int nRandomLine = Random(21) + 1;

    switch(nRandomLine)
    {
        case  1: return "'I may be an intelligent sword, but I've had no formal edumication.'";
        case  2: return "'Can we go kill something now, huh?'";
        case  3: return "'How about now?  No?'";
        case  4: return "'Come on let's kill something NOW!'";
        case  5: return "'mmmm.... now?'";
        case  6: return "'What about now?'";
        case  7: return "'Now?  Please?  Pretty please?'";
        case  8: return "'I don't know what you were expecting, but as a sword I'm pretty one-dimensional in what I want.'";
        case  9: return "'Can we go whack something now?'";
        case 10: return "'Let's whack something eeeeevvvvillllll....'";
        case 11: return "'Why don't we go kill that over there?'";
        case 12: return "'You know, I was a Moonblade once.'";
        case 13: return "'You really need to clean me. I like to shine!'";
        case 14: return "'Are we going to kill something now, maybe?  Huh?'";
        case 15: return "'You know, my last owner always said I was sharp and edgy.  He was such an ass.'";
        case 16: return "'I don't chop wood. I am not an axe.'";
        case 17: return "'Now! Now! Kill something now!! Yeah!'";
        case 18: return "'Booooo-ring!'";
        case 19: return "'(sigh)'";
        case 20: return "'(double sigh)'";
        case 21: return "'Wanna go kill that over there? C'mon, let's kill somthin'!'";
    }
    return "'Booooo-ring!'"; // failsafe return value
}


// This function returns a random one-liner Lilarcor will speak
// when in combat and not equipped by PC

string ChooseLilarcorOneLinerCombatBackpack()
{
    int nRandomLine = Random(21) + 1;

    switch(nRandomLine)
    {
        case  1: return "'Y'know, I could really be of use right now!'";
        case  2: return "'Ahhh! I can't watch this!";
        case  3: return "'Let me out of your backpack, I'll swing me myself!'";
        case  4: return "'Where's the blood? I can't see anything in here!'";
        case  5: return "'DRAW me already!!!'";
        case  6: return "'I warn you! If you die and your enemies get their hands or claws on me I'LL KILL YOU!!!'";
        case  7: return "'What's that smell? You didn't wet yourself, did you?!'";
        case  8: return "'Had I fingernails I'd be chewing on them right now!'";
        case  9: return "'My grandma could swing me, why can't you?'";
        case 10: return "'That doesn't sound too good!'";
        case 11: return "'Without my help you're gonna lose!'";
        case 12: return "'I want something to kill, too!'";
        case 13: return "'Are you a monk or a sissy mage, or what? USE me already!'";
        case 14: return "'You should open your backpack, that smell would teach 'em!";
        case 15: return "'All that killing and I'M NO PART OF IT! Ahhhh!'";
        case 16: return "'Kill! Yeah, kill them all! Wait a second... you're doing this without me! Traitor!'";
        case 17: return "'Don't dare to die! I'm not interested in rotting in this pack forever!'";
        case 18: return "'I could wipe the floor with them! But noooo, I have to sit idly in your pack!'";
        case 19: return "'I want to kill one, too! Pretty please?'";
        case 20: return "'What have I done to deserve this? TO WATCH a fight!'";
        case 21: return "'Whack 'em already! I'm getting bored here.'";
    }
    return "'Let me out of your backpack, I'll swing me myself!'";
}


// This function returns a random one-liner Lilarcor will speak
// when not in combat and not equipped by PC

string ChooseLilarcorOnelinerNonCombatBackpack()
{
    int nRandomLine = Random(20) + 1;

    switch(nRandomLine)
    {
        case  1: return "'You DO know how to use a two-handed sword, right?'";
        case  2: return "'Y'know, you should clean your backpack more often.'";
        case  3: return "'Equip me already! I'm too beautiful to be hidden in your pack!'";
        case  4: return "'What's this? Something's scratching my surface! Make it stop!'";
        case  5: return "'Y'know, I've been thinking... you're not a puny mage, are you?'";
        case  6: return "'If you're not going to use me SELL me! Might have more luck with my next owner.'";
        case  7: return "'I have a complaint: there's nothing to kill for me here in your backpack!'";
        case  8: return "'(sigh)'";
        case  9: return "'(double-sigh)'";
        case 10: return "'Booooo-ring!'";
        case 11: return "'One sheep, two sheep... What?! I have to kill something and if its just time!'";
        case 12: return "'If I rust in here you're SO gonna pay...'";
        case 13: return "'Did I ever tell you about... err... forgot it, nevermind.'";
        case 14: return "'You should be more careful while walking - I might slice your pack open...'";
        case 15: return "'I'm bored. Why am I still in your backpack?'";
        case 16: return "'MUST. KILL. SOMETHING. Let me out!'";
        case 17: return "'Hey, you're not one of those pacifists, aren't you? 'Cause that would creep me out'";
        case 18: return "'Don't tell me you're fighting bare-handed! I need something to do!'";
        case 19: return "'(yawn)'";
        case 20: return "'How about we switch roles and I let YOU rot in my backpack?!'";
    }
    return "'You DO know how to use a two-handed sword, right?'";
}


// This function needs to be called from the module's "OnHeartBeat" event;
// it will make Lilarcor's possessor say a random one-liner that depends
// on wether the owner is in combat and has Lilarcor equipped or not.
// If the owner is resting or in a conversation, nothing will happen.

void LilarcorSpeakOneLiner()
{
    object oModule = GetModule();

    object oLilarcorOwner = GetLocalObject(oModule, "oLilarcorsOwner");

    if ( GetIsObjectValid(oLilarcorOwner) )  // if Lilarcor has an owner who's a PC
    {
        // (Counter gets initialized when Lilarcor is acquired)
        int nCounter = GetLocalInt(oModule, "nLilarcorTalkCounter"); // get current counter

        if ( GetIsInCombat(oLilarcorOwner) && (nCounter > nLilarcorTalkDelayCombat) ) // when fighting, lower counter
        {
            nCounter = 0;
//DEBUG, IGNORE THIS LINE        AssignCommand(oLilarcorOwner, SpeakString("nCounter has been set to 0", TALKVOLUME_SHOUT));
        }

//DEBUG, IGNORE THIS LINE        AssignCommand(oLilarcorOwner, SpeakString("nCounter has been read and is now " + IntToString(nCounter) , TALKVOLUME_SHOUT));

        if ( nCounter == 0 )
        {
            string sPrefix = "[LILARCOR]: ";    // Needed to make clear that the one-liner comes from Lilarcor, not the PC
            string sOneliner = "...";           // start with empty one-liner

            // if PC is not in a conversation and not resting...
            if ( !IsInConversation(oLilarcorOwner) && !GetIsResting(oLilarcorOwner) )
            {
                if ( GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oLilarcorOwner) == GetObjectByTag("Lilarcor") ) // if Lilarcor is equipped
                    if ( GetIsInCombat(oLilarcorOwner) )        // if Lilarcor's Owner is fighting, pick combat one-liner
                        sOneliner = ChooseLilarcorOneLinerCombat();
                     else                                        // if Lilarcor's owner is not in combat, pick non-combat one-liner
                        sOneliner = ChooseLilarcorOnelinerNonCombat();
                else                                                                                         // if Lilarcor is in the backpack
                     if ( GetIsInCombat(oLilarcorOwner) )        // if Lilarcor's Owner is fighting, pick combat (backpack) one-liner
                        sOneliner = ChooseLilarcorOneLinerCombatBackpack();
                     else                                        // if Lilarcor's owner is not in combat, pick non-combat (backpack) one-liner
                        sOneliner = ChooseLilarcorOnelinerNonCombatBackpack();
                // make the Owner say the one-liner
                AssignCommand(oLilarcorOwner, SpeakString(sPrefix + sOneliner, TALKVOLUME_TALK));

                if ( GetIsInCombat(oLilarcorOwner) )    // If in combat, use the short delay between one-liners
                    SetLocalInt(oModule, "nLilarcorTalkCounter", nLilarcorTalkDelayCombat);
                else                                    // else use the greater delay
                    SetLocalInt(oModule, "nLilarcorTalkCounter", StartLilarcorTalkCounter());
             }
        }
        else    // Count down to zero
        {
            nCounter = nCounter - 1;
//DEBUG, IGNORE THIS LINE AssignCommand(oLilarcorOwner, SpeakString("nCounter has been reduced is now " + IntToString(nCounter) , TALKVOLUME_SHOUT));
            SetLocalInt(oModule, "nLilarcorTalkCounter", nCounter);
        }
    }
}


// This function need to be called from the module's "OnUnAcquireItem" event.
// It will make Lilarcor's Owner say a final line and delete the no
// longer needed variables.

void LilarcorUnAcquired()
{
    object oSword = GetModuleItemLost();
    object oOldOwner = GetModuleItemLostBy();

    if ( GetTag(oSword) == "Lilarcor" )
    {
        if ( GetIsObjectValid(oOldOwner) && GetIsPC(oOldOwner) &&  GetLocalObject(GetModule(), "oLilarcorsOwner")==oOldOwner )
        {
            AssignCommand(oOldOwner, ClearAllActions());
            AssignCommand(oOldOwner, SpeakString("[LILARCOR]: 'Yeah, get rid of me! Perhaps my next owner will be more into the killing business.'", TALKVOLUME_SHOUT));
            DeleteLocalObject(GetModule(), "oLilarcorsOwner");
            DeleteLocalInt(GetModule(), "nLilarcorTalkCounter");
        }
    }
}

/*
ts_putter
by Tseramed aka Ken Demarest
(c) 2003 free to use. Credit must be given to author.

This puttering script makes NPCs putter around any area, fiddling
with barrels, reading at desks and book piles, drinking at kegs,
warming in front of a fire, workship at altars, sitting in chairs,
stools or couches, even picking up and putting away items you drop
on the floor. The good part is, you don't have to slather the area
with crazily named waypoints to make it happen (but you can, if
you want to).

To use it, just put it on an NPC's heartbeat. He will interact with
anything that is 'useable' in his area.

[[ wk_XXX ]]
You can also lay down waypoints, if you need them, with the prefix
'wk_' and the NPC will find them and do what they say (for example,
a waypoint in front of a camp fire called 'wk_sit'). If you use
a word at the end of 'wk_' that the script doesn't recognize, it
will pick from listen, pause, pause_tired and get_mid.

[[ Stalling ]]
If the NPC can't get to something, he will 'stall' in about 30
seconds and pick a new thing to interact with.

[[ tsWorkRadius ]]
To define the area the NPC will pick objects from, put down a
waypoint with 'tsWorkRadius' as its tag, and the radius ('25' for
example) as its name.

[[ tsWorkAvoid ]]
If you want the NPC to avoid an area, put down a waypoint with the
tag 'tsWorkAvoid' and with the name set to the radius to avoid
('10' for example) . This is helpful when there is a locked door
and you don't want the NPC to try to interact with anything behind
it.

[[ Interactions ]]
Normally, the NPC picks a useable item in his area, walks to it and
fiddles with it.  However, each time the NPC picks a new thing to
interact with, he may also choose one of two other actions.

1) Tidy up (default 50% chance). If something was dropped on the
   floor that wasn't there when the NPC spawned, the NPC will go
   pick it up and put it away in the next container he visits. Be
   warned that if the NPC is killed while carrying the object, and
   you're using Bioware's default death code, the item will
   DISAPPEAR upon the NPC's death. You can change the chance to tidy
   by altering the variable TS_CHANCE_TO_TIDY.

2) Gab with friends (default 15% chance). If there are other
   creatures nearby, and both the NPC and the friend are 'gabbable',
   then they'll go talk with the other 'person'. See the routine
   isGabbable() below to see who qualifies. Also, since an NPC
   who wishes to gab forces the other NPC to do the same, the
   chance for gabbing to occur is about double whatever you set.

Gabbing can happen when creatures are the same faction AND they
are:

a) Any two humanoid creatures with an intelligence of 6 or more
b) A Druid or ranger and any animal, beast or magical beast
c) A mage and any outsider or elemental (like a familiar)
d) A cleric and the undead

Note that this isn't meant to be restrictive, it is just to stop
inane things from happening, like your dog talking to your iron
golem. If you really want something to talk to something else, you
can also put a wk_talk waypoint in front of the (immobile) recipient.

Also, I took out the 'forceful' talk, because it looks like
an argument about to turn violent. If you want that, I assume you
will script it yourself.

*/

int TS_CHANCE_TO_TIDY = 50; // percent
int TS_CHANCE_TO_GAB  = 15; // percent

int ANIMATION_PUT_AWAY = 513;

int anyPlayersInArea( object who ) {
    object pc = GetNearestCreature( CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, who );
    if( !GetIsObjectValid(pc) )
        return 0;
    return 1;
}

int near( object thing1, object thing2, float maxDist ) {
    float dist = GetDistanceBetweenLocations( GetLocation(thing1), GetLocation(thing2) );
    if( !GetIsObjectValid( thing1 ) )
        return 0;
    if( !GetIsObjectValid( thing2 ) )
        return 0;
    if( dist < 0.0 )
        return 0;
    if( dist > maxDist )
        return 0;
    return 1;
}

float angleTo( vector v ) {
    float d = VectorMagnitude( v );
    if( d == 0.0 )
        return 0.0;

    float angle;

    if( v.x >= 0.0 )
        if( v.y >= 0.0 )
            angle = 90 - asin( v.x / d );
        else
            angle = 270 + asin( v.x / d );
    else
        if( v.y >= 0.0 )
            angle = 90 - asin( v.x / d );
        else
            angle = 270 + asin( v.x / d );
    return angle;
}

float facingTo( object src, object dest ) {
    vector srcPos = GetPosition(src);
    vector destPos = GetPosition(dest);
    vector v = destPos - srcPos;
    return angleTo( v );
}

void tell( string s ) {
    SendMessageToPC( GetFirstPC(), s );
}

object findItemOnFloor() {
    float radius = 99999.0;
    object radiusWp = GetLocalObject( OBJECT_SELF, "tsWorkRadius" );
    if( GetIsObjectValid( radiusWp ) ) {
        radius = StringToFloat( GetName(radiusWp) );
    }

    object item;
    int index = 1;
    while( index >= 0 ) {
        item = GetNearestObject( OBJECT_TYPE_ITEM, OBJECT_SELF, index );
        if( !GetIsObjectValid(item) ) {
            return OBJECT_INVALID;
        }

        if( GetIsObjectValid(radiusWp) && !near( item, radiusWp, radius ) ) {
            return OBJECT_INVALID;
        }

        if( !GetLocalInt( item, "tsAlreadyOnFloor" ) ) {
            return item;
        }
        ++index;
    }
    return OBJECT_INVALID;
}

int busy( object who ) {
    return GetIsInCombat(OBJECT_SELF) || IsInConversation(OBJECT_SELF);
}

int smartEnoughToSpeak( object who ) {
    return GetAbilityScore( who, ABILITY_INTELLIGENCE ) >= 6;
}

int raceThatCanSpeak( object who ) {
    int r = GetRacialType( who );
    if( r == RACIAL_TYPE_ABERRATION ||
        r == RACIAL_TYPE_ANIMAL ||
        r == RACIAL_TYPE_BEAST ||
        r == RACIAL_TYPE_CONSTRUCT ||
        r == RACIAL_TYPE_ELEMENTAL ||
        r == RACIAL_TYPE_MAGICAL_BEAST ||
        r == RACIAL_TYPE_UNDEAD ||
        r == RACIAL_TYPE_VERMIN )
        return 0;
    return 1;
}

int isRace( object who, int race1, int race2 = RACIAL_TYPE_INVALID, int race3 = RACIAL_TYPE_INVALID ) {
    int r = GetRacialType( who );
    if( r == race1 || r == race2 || r == race3 )
        return 1;
    return 0;
}

int isClass( object who, int class1, int class2 = RACIAL_TYPE_INVALID, int class3 = RACIAL_TYPE_INVALID ) {
    if( class1 != CLASS_TYPE_INVALID && GetLevelByClass(class1) > 0 )
        return 1;
    if( class2 != CLASS_TYPE_INVALID && GetLevelByClass(class2) > 0 )
        return 1;
    if( class3 != CLASS_TYPE_INVALID && GetLevelByClass(class3) > 0 )
        return 1;
    return 0;
}

int gabDruidSpeakToAnimal( object src, object target ) {
    if( isClass( src, CLASS_TYPE_DRUID, CLASS_TYPE_RANGER ) )
        if( isRace( target, RACIAL_TYPE_ANIMAL, RACIAL_TYPE_BEAST, RACIAL_TYPE_MAGICAL_BEAST ) )
            return 1;
    return 0;
}

int gabMageSpeakToOutsider( object src, object target ) {
    if( isClass( src, CLASS_TYPE_WIZARD, CLASS_TYPE_SORCERER ) )
        if( isRace( target, RACIAL_TYPE_OUTSIDER, RACIAL_TYPE_ELEMENTAL, RACIAL_TYPE_DRAGON ) )
            return 1;
    return 0;
}

int gabClericSpeakToUndead( object src, object target ) {
    if( isClass( src, CLASS_TYPE_CLERIC ) )
        if( isRace( target, RACIAL_TYPE_UNDEAD ) )
            return 1;
    return 0;
}

int isGabbable( object src, object target ) {
    // Note that the src has already been tested for brains and
    // racial speech before this is ever called.

    if( gabDruidSpeakToAnimal( src, target ) )
        return 1;

    if( gabMageSpeakToOutsider( src, target ) )
        return 1;

    if( gabClericSpeakToUndead( src, target ) )
        return 1;

    if( !smartEnoughToSpeak( target ) )
        return 0;

    if( !raceThatCanSpeak( target ) )
        return 0;

    return 1;
}

object findCreatureToGab() {
    float radius = 99999.0;
    object radiusWp = GetLocalObject( OBJECT_SELF, "tsWorkRadius" );
    if( GetIsObjectValid( radiusWp ) ) {
        radius = StringToFloat( GetName(radiusWp) );
    }

    object who;
    int index = 1;
    while( index >= 0 ) {
        who = GetNearestObject( OBJECT_TYPE_CREATURE, OBJECT_SELF, index );
        if( !GetIsObjectValid(who) ) {
            return OBJECT_INVALID;
        }

        if( GetIsObjectValid(radiusWp) && !near( who, radiusWp, radius ) ) {
            return OBJECT_INVALID;
        }

        if( GetFactionEqual( OBJECT_SELF, who ) && !busy(who) && isGabbable(OBJECT_SELF,who) ) {
            SetLocalObject( who, "tsGabRequestedBy", OBJECT_SELF );
            return who;
        }
        ++index;
    }
    return OBJECT_INVALID;
}

void addPlace( object what ) {
    // Put an "Avoid" waypoint in areas you don't want people to go.
    object avoid = GetNearestObjectByTag( "tsWorkAvoid", what );
    if( near( what, avoid, StringToFloat(GetName(avoid)) ) )
        return;

    int placeCount = GetLocalInt( OBJECT_SELF, "tsPlaceCount" );
    SetLocalObject( OBJECT_SELF, "tsPlace"+IntToString(placeCount), what );
    ++placeCount;
    SetLocalInt( OBJECT_SELF, "tsPlaceCount", placeCount );
}

void makePlaceList() {
    float radius = 99999.0;
    object radiusWp = GetNearestObjectByTag( "tsWorkRadius", OBJECT_SELF );
    if( GetIsObjectValid( radiusWp ) ) {
        radius = StringToFloat( GetName(radiusWp) );
        SetLocalObject( OBJECT_SELF, "tsWorkRadius", radiusWp );
    }
   // tell( GetName(OBJECT_SELF)+" place radius = "+FloatToString(radius,8,2) );

    object what = GetFirstObjectInArea( GetArea( OBJECT_SELF ) );
    while( GetIsObjectValid( what ) ) {
        if( !GetIsObjectValid(radiusWp) || near( what, radiusWp, radius ) ) {
            if( GetObjectType(what) == OBJECT_TYPE_PLACEABLE ) {
                if( GetHasInventory(what) || GetUseableFlag( what ) ) {
                    addPlace( what );
                }
            }
            if( GetObjectType(what) == OBJECT_TYPE_WAYPOINT ) {
                string tag = GetStringLowerCase( GetTag( what ) );
                if( GetStringLeft( tag, 3 ) == "wk_" ) {
                    addPlace( what );
                }
            }
            if( GetObjectType(what) == OBJECT_TYPE_ITEM ) {
                SetLocalInt( what, "tsAlreadyOnFloor", 1 );
            }
        }
        what = GetNextObjectInArea( GetArea( OBJECT_SELF ) );
    }
}

object pickPlaceToGo() {
    if( !GetLocalInt( OBJECT_SELF, "tsPlaceListMade" ) ) {
        makePlaceList();
        SetLocalInt( OBJECT_SELF, "tsPlaceListMade", 1 );
    }

    int reps = 4;   // 4 tries to find a valid place.
    while( reps > 0 ) {
        object place = OBJECT_INVALID;

        object gab = GetLocalObject( OBJECT_SELF, "tsGabRequestedBy" );
        if( GetIsObjectValid( gab ) ) {
            place = gab;
            DeleteLocalObject( OBJECT_SELF, "tsGabRequestedBy" );
        }

        if( !GetIsObjectValid( place ) && d100() < TS_CHANCE_TO_TIDY ) {
            place = findItemOnFloor();
        }

        if( !GetIsObjectValid( place ) && d100() < TS_CHANCE_TO_GAB ) {
            if( smartEnoughToSpeak( OBJECT_SELF ) && raceThatCanSpeak( OBJECT_SELF ) ) {
                place = findCreatureToGab();
            }
        }

        if( !GetIsObjectValid( place ) ) {
            int n = Random( GetLocalInt( OBJECT_SELF, "tsPlaceCount" ) );
            place = GetLocalObject( OBJECT_SELF, "tsPlace"+IntToString(n) );
        }

        if( GetIsObjectValid(place) && !GetIsTrapped(place) && !GetLocked(place) ) {
            SetLocalObject( OBJECT_SELF, "tsPlace", place );
            return place;
        }
        --reps;
    }
    return OBJECT_INVALID;
}

void resetPlace() {
   // tell( "Place reset" );
    DeleteLocalObject( OBJECT_SELF, "tsPlace" );
    DeleteLocalInt( OBJECT_SELF, "tsStallCount" );
}


object getItemToPutAway() {
    object item = GetFirstItemInInventory( OBJECT_SELF );
    while( GetIsObjectValid( item ) ) {
        if( GetLocalInt( item, "tsFoundOnFloor" ) ) {
            return item;
        }
        item = GetNextItemInInventory( OBJECT_SELF );
    }
    return OBJECT_INVALID;
}

void actionPutAway( object place ) {
    if( GetObjectType( place ) == OBJECT_TYPE_PLACEABLE && GetHasInventory( place ) ) {
        object item = getItemToPutAway();
        if( GetIsObjectValid( item ) ) {
           // tell( "Putting away "+GetName(item) );
            ActionGiveItem( item, place );
        }
    }
}

void actionPickUp( object place ) {
    if( GetObjectType( place ) == OBJECT_TYPE_ITEM ) {
       // tell( "Found "+GetName(place)+" on floor." );
        SetLocalInt( place, "tsFoundOnFloor", 1 );
        ActionPickUpItem( place );
    }
}

void setAnim( int animIndex, float animDuration, float animSpeed = 1.0 ) {
    SetLocalInt( OBJECT_SELF, "tsAnimIndex", animIndex );
    SetLocalFloat( OBJECT_SELF, "tsAnimDuration", animDuration );
    SetLocalFloat( OBJECT_SELF, "tsAnimSpeed", animSpeed );
}

// Pick animations based on what the object is./
void tryAnim( string tag, int animIndex, float animDuration, float animSpeed = 1.0 ) {
    if( GetLocalFloat( OBJECT_SELF, "tsAnimDuration" ) == 0.0 ) {
        object place = GetLocalObject( OBJECT_SELF, "tsPlace" );
        string placeTag  = GetStringLowerCase( GetTag( place ) );
        string placeName = GetStringLowerCase( GetTag( place ) );
        tag = GetStringLowerCase( tag );
        if( FindSubString( placeTag, tag ) >= 0 || FindSubString( placeName, tag ) >= 0) {
            setAnim( animIndex, animDuration, animSpeed );
        }
    }
}

int hasAbility( int abilityIndex, int requiredScore ) {
    return GetAbilityScore( OBJECT_SELF, abilityIndex ) >= requiredScore;
}

void pickAnim( object place ) {
    SetLocalFloat( OBJECT_SELF, "tsAnimDuration", 0.0 );

    if( GetObjectType( place ) == OBJECT_TYPE_CREATURE ) {
        switch( Random( 4 ) ) {
            case 0: case 1: setAnim( ANIMATION_LOOPING_TALK_NORMAL, 18.0 ); break;
            case 2: setAnim( ANIMATION_LOOPING_TALK_PLEADING, 6.0 ); break;
            case 3: setAnim( ANIMATION_LOOPING_TALK_LAUGHING, 6.0 ); break;
        }
        return;
    }

    if( GetObjectType( place ) == OBJECT_TYPE_ITEM ) {
        setAnim( ANIMATION_LOOPING_GET_LOW, 4.0 );
        return;
    }

    tryAnim( "fire", ANIMATION_LOOPING_SIT_CROSS, 12.0 );
    tryAnim( "oven", ANIMATION_LOOPING_SIT_CROSS, 12.0 );
    tryAnim( "chair", ANIMATION_LOOPING_SIT_CHAIR, 12.0 );
    tryAnim( "stool", ANIMATION_LOOPING_SIT_CHAIR, 12.0 );
    tryAnim( "couch", ANIMATION_LOOPING_SIT_CHAIR, 12.0 );
//    anim( for people, talk to them.
    tryAnim( "altar", ANIMATION_LOOPING_WORSHIP, 12.0 );
    if( hasAbility( ABILITY_INTELLIGENCE, 8 ) ) {
        tryAnim( "book", ANIMATION_FIREFORGET_READ, 6.0 );
        tryAnim( "desk", ANIMATION_FIREFORGET_READ, 6.0 );
    }
    else {
        tryAnim( "book", ANIMATION_LOOPING_GET_MID, 6.0 );
        tryAnim( "desk", ANIMATION_LOOPING_GET_MID, 6.0 );
    }
    tryAnim( "lookout", ANIMATION_LOOPING_LOOK_FAR, 6.0 );
    tryAnim( "keg", ANIMATION_FIREFORGET_DRINK, 6.0 );
    tryAnim( "well", ANIMATION_FIREFORGET_DRINK, 6.0 );

    // These tags might be found on workstation tags that start
    // with "wk_' for example, wk_bow
    tryAnim( "_bow", ANIMATION_FIREFORGET_BOW, 6.0 );
    tryAnim( "_sit", ANIMATION_LOOPING_SIT_CROSS, 18.0 );
    if( hasAbility( ABILITY_INTELLIGENCE, 8 ) )
        tryAnim( "_read", ANIMATION_FIREFORGET_READ, 6.0 );
    tryAnim( "_drink", ANIMATION_FIREFORGET_DRINK, 6.0 );
    tryAnim( "_get_mid", ANIMATION_LOOPING_GET_MID, 6.0 );
    tryAnim( "_get_low", ANIMATION_LOOPING_GET_LOW, 6.0 );
    tryAnim( "_greet", ANIMATION_FIREFORGET_GREETING, 6.0 );
    tryAnim( "_salute", ANIMATION_FIREFORGET_SALUTE, 6.0 );
    tryAnim( "_sleep", ANIMATION_LOOPING_DEAD_FRONT, 30.0 );
    tryAnim( "_look_far", ANIMATION_LOOPING_LOOK_FAR, 6.0 );
    tryAnim( "_talk", ANIMATION_LOOPING_TALK_NORMAL, 12.0 );
    tryAnim( "_worship", ANIMATION_LOOPING_WORSHIP, 12.0 );

    if( GetLocalFloat( OBJECT_SELF, "tsAnimDuration" ) == 0.0 ) {
        if( GetObjectType( place ) == OBJECT_TYPE_PLACEABLE && GetHasInventory( place ) ) {
            setAnim( ANIMATION_LOOPING_GET_MID, 3.0 );
        }
    }

    if( GetLocalFloat( OBJECT_SELF, "tsAnimDuration" ) == 0.0 ) {
        // We haven't picked an animation yet, so choose one.
        switch( Random( 4 ) ) {
            case 0: setAnim( ANIMATION_LOOPING_LISTEN, 6.0 ); break;
            case 1: setAnim( ANIMATION_LOOPING_PAUSE_TIRED, 6.0 ); break;
            case 2: setAnim( ANIMATION_LOOPING_PAUSE, 4.0 ); break;
            case 3: setAnim( ANIMATION_LOOPING_GET_MID, 3.0 ); break;
        }
    }
}

void facePlace() {
    object place = GetLocalObject( OBJECT_SELF, "tsPlace" );
    //tell( "facing "+GetName(place) );
    SetFacing( facingTo( OBJECT_SELF, place ) );
}

void faceAlign() {
    object place = GetLocalObject( OBJECT_SELF, "tsPlace" );
    //tell( "aligning facing with "+GetName(place) );
    SetFacing( GetFacing(place) );
}

void playAnimation() {
    int animIndex = GetLocalInt( OBJECT_SELF, "tsAnimIndex" );
    float animDuration = GetLocalFloat( OBJECT_SELF, "tsAnimDuration" );
    float animSpeed = GetLocalFloat( OBJECT_SELF, "tsAnimSpeed" );
    object place = GetLocalObject( OBJECT_SELF, "tsPlace" );

    //tell( "animation "+IntToString(animIndex) );

    if( animIndex == ANIMATION_LOOPING_SIT_CHAIR ) {
        if( !GetIsObjectValid( GetSittingCreature(place) ) ) {
            ActionDoCommand( faceAlign() );
            // This action will last indefinitely, so we must force it to end.
            ActionDoCommand( DelayCommand( 12.0, resetPlace() ) );
            ActionSit( place );
/*
            switch( d4() ) {
                case 0: case 1: break;
                case 2: ActionPlayAnimation( ANIMATION_FIREFORGET_READ, 1.0, 2.0 ); break;
                case 3: ActionPlayAnimation( ANIMATION_FIREFORGET_DRINK, 1.0, 2.0 ); break;
            }
*/
        }
    }
    else {
        ActionPlayAnimation( animIndex, animSpeed, animDuration );
    }
    ActionDoCommand( actionPutAway( place ) );
    ActionDoCommand( actionPickUp( place ) );

    ActionDoCommand( resetPlace() );
}

void pickPlaceAndAct() {
    object place = pickPlaceToGo();
    ClearAllActions();
    ActionMoveToObject( place, FALSE, 0.5 );

    if( GetObjectType( place ) == OBJECT_TYPE_WAYPOINT )
        ActionDoCommand( faceAlign() );
    else
        ActionDoCommand( facePlace() );
    ActionWait( 1.0 );
    //tell( "moving to "+GetName(place) );

    pickAnim( place );
    playAnimation();
}

void main() {
    if( !anyPlayersInArea( OBJECT_SELF ) )
        return;

    //turnDebug( 1 );

    if( busy(OBJECT_SELF) )
        return;

    object place = GetLocalObject( OBJECT_SELF, "tsPlace" );
    if( !GetIsObjectValid(place) ) {
        // Pick a place to go to and interact.
        pickPlaceAndAct();
    }
    else {
        // If somebody wants to talk to me, let it interrupt whatever I was doing.
        object gab = GetLocalObject( OBJECT_SELF, "tsGabRequestedBy" );
        if( GetIsObjectValid( gab ) ) {
            resetPlace();
            pickPlaceAndAct();
            return;
        }

        int stallCount = GetLocalInt( OBJECT_SELF, "tsStallCount" );
        if( stallCount >= 5 ) {
            resetPlace();
        }
        else {
            ++stallCount;
            SetLocalInt( OBJECT_SELF, "tsStallCount", stallCount );
        }
    }
}


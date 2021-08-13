#include "x2_inc_compon"
// Ben W-Husey
// Placeable contents
// Cantrips and 1st level wizard scrolls
// 6th September

void main()
{
     if (!( GetLocalInt( OBJECT_SELF, "nEmptied") ==1))
    {
    string sItem = "nw_it_medkit001";
    int nStack=1;
    int rnd = 0;
    rnd = Random(67);
    if (rnd < 1)
    { sItem = "nw_it_sparscr003";                   // Daze
      nStack=2;}
    else if (rnd <2 )
    { sItem = "nw_it_sparscr004";                   //Light
      nStack=2;}
    else if (rnd <3 )
    { sItem = "nw_it_sparscr002";                   //Ray of Frost
      nStack=2;}
    else if (rnd <4 )
    { sItem = "nw_it_sparscr001";                   //Resistance
      nStack=2;}
    else if (rnd <6) sItem = "nw_it_sparscr112";    //Burning Hands
    else if (rnd <8) sItem = "nw_it_sparscr107";    //Charm Person
    else if (rnd <10) sItem = "nw_it_sparscr110";   //Color Spray
    else if (rnd <12) sItem = "nw_it_sparscr101";   //Endure Elements
    else if (rnd <14) sItem = "nw_it_sparscr103";   //Grease
    else if (rnd <16) sItem = "nw_it_sparscr106";   //Identify
    else if (rnd <18) sItem = "nw_it_sparscr104";   //Mage armour
    else if (rnd <20) sItem = "nw_it_sparscr109";   //Magic Missile
    else if (rnd <22) sItem = "nw_it_sparscr102";   //Protection from Alignment
    else if (rnd <24) sItem = "nw_it_sparscr111";   //Ray of Enfeeblement
    else if (rnd <26) sItem = "nw_it_sparscr108";   //Sleep
    else if (rnd <28) sItem = "nw_it_sparscr105";   //Summon Creature I
    else if (rnd <29) sItem = "doom";               //snap doom
    else if (rnd <30 )
    { sItem = "x1_it_sparscr001";                   //
      nStack=2;}
    else if (rnd <31 )
    { sItem = "x1_it_sparscr002";                   //
      nStack=2;}
    else if (rnd <32 )
    { sItem = "x1_it_sparscr003";                   //
      nStack=2;}
    else if (rnd <33 )
    { sItem = "x1_it_spdvscr001";                   //
      nStack=2;}
    else if (rnd <35) sItem = "x1_it_sparscr101";   //Exp. Retreat
    else if (rnd <37) sItem = "x1_it_sparscr102";   //Amplify
    else if (rnd <39) sItem = "x1_it_sparscr103";   //Shield
    else if (rnd <41) sItem = "x1_it_spdvscr102";   //Divine Favour
    else if (rnd <43) sItem = "x1_it_spdvscr103";   //Entropic Shield
    else if (rnd <45) sItem = "x1_it_spdvscr104";   //Inflict LW
    else if (rnd <47) sItem = "x1_it_spdvscr105";   //Shield of Faith
    else if (rnd <49) sItem = "x1_it_spdvscr106";   //Magic Fang
    else if (rnd <51) sItem = "x1_it_spdvscr107";   //Camouflage
    else if (rnd <53) sItem = "x1_it_spdvscr101";   //Bane
    else if (rnd <55 )
    { sItem = "x2_it_cfm_bscrl";                   //Blank
      nStack=2;}
    else if (rnd <57) sItem = "x2_it_spdvscr101";
    else if (rnd <59) sItem = "x2_it_sparscr101";   //
    else if (rnd <61) sItem = "x2_it_sparscr102";   //
    else if (rnd <63) sItem = "x2_it_sparscr103";   //
    else if (rnd <65) sItem = "x2_it_sparscr104";   //
    else if (rnd <67) sItem = "x2_it_sparscr105";   //

        CreateItemOnObject(sItem, OBJECT_SELF, nStack);
    }
    SetLocalInt( OBJECT_SELF, "nEmptied", 1);
    if (GetObjectType(OBJECT_SELF)==OBJECT_TYPE_PLACEABLE) craft_drop_placeable();
}


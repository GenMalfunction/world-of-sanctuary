#include "x2_inc_compon"
// Ben W-Husey
// Placeable contents
// Cantrips, 1st & 2nd level wizard scrolls (Multiples)
// 6th September

void main()
{
     if (!( GetLocalInt( OBJECT_SELF, "nEmptied") ==1))
    {
int counter=0;
int iNumb=0;
int rnd2= Random(10)+1;
    if (rnd2<6) {
        counter=1;
    } else if (rnd2 <10 )   {
        counter=2;
    } else if (rnd2 <11 )   {
        counter=3;
    }

while (iNumb<counter)
    {
    string sItem = "nw_it_medkit001";
    int nStack=1;
    int rnd = 0;
       rnd = Random(115);
        if (rnd < 1)
        { sItem = "nw_it_sparscr003";               // Daze
          nStack=2;}
        else if (rnd <2 )
        { sItem = "nw_it_sparscr004";               //Light
          nStack=2;}
        else if (rnd <3 )
        { sItem = "nw_it_sparscr002";               //Ray of Frost
        nStack=2;}
        else if (rnd <4 )
        { sItem = "nw_it_sparscr001";               //Resistance
        nStack=2;}
        else if (rnd <6 ) sItem = "nw_it_sparscr112"; //Burning Hands
        else if (rnd <8 ) sItem = "nw_it_sparscr107"; //Charm Person
        else if (rnd <10 ) sItem = "nw_it_sparscr110"; //Color Spray
        else if (rnd <12 ) sItem = "nw_it_sparscr101"; //Endure Elements
        else if (rnd <14 ) sItem = "nw_it_sparscr103"; //Grease
        else if (rnd <16 ) sItem = "nw_it_sparscr106"; //Identify
        else if (rnd <18 ) sItem = "nw_it_sparscr104"; //Mage armour
        else if (rnd < 20) sItem = "nw_it_sparscr109"; //Magic Missile
        else if (rnd < 22) sItem = "nw_it_sparscr102"; //Protection from Alignment
        else if (rnd < 24) sItem = "nw_it_sparscr111"; //Ray of Enfeeblement
        else if (rnd < 26) sItem = "nw_it_sparscr108"; //Sleep
        else if (rnd < 28) sItem = "nw_it_sparscr105"; //Summon Creature I
        else if (rnd < 29) sItem = "nw_it_sparscr216"; //Knock
        else if (rnd < 30) sItem = "nw_it_sparscr211"; //Blindness / Deafness
        else if (rnd < 31) sItem = "nw_it_sparscr212"; //Bull's Strength
        else if (rnd < 32) sItem = "nw_it_sparscr213"; //Cat's Grace
        else if (rnd < 33) sItem = "nw_it_sparscr217"; //Clarity
        else if (rnd < 34) sItem = "nw_it_sparscr206"; //Darkness
        else if (rnd < 35) sItem = "nw_it_sparscr214"; //Darkvision
        else if (rnd < 36) sItem = "nw_it_sparscr215"; //Endurance
        else if (rnd < 37) sItem = "nw_it_sparscr208"; //Ghostly Visage
        else if (rnd < 38) sItem = "nw_it_sparscr209"; //Ghoul Touch
        else if (rnd < 39) sItem = "nw_it_sparscr207"; //Invisibility
        else if (rnd < 40) sItem = "nw_it_sparscr218"; //Lesser Dispel
        else if (rnd < 41) sItem = "nw_it_sparscr202"; //Melf's Acid Arrow
        else if (rnd < 42) sItem = "nw_it_sparscr201"; //Resist Elements
        else if (rnd < 43) sItem = "nw_it_sparscr210"; //Scare
        else if (rnd < 44) sItem = "nw_it_sparscr205"; //See Invisibility
        else if (rnd < 45) sItem = "nw_it_sparscr203"; //Summon Creature II
        else if (rnd < 46) sItem = "nw_it_sparscr204"; //Web
        else if (rnd < 48) sItem = "greaterknock";     //snap Greater Knock
        else if (rnd <52 ) sItem = "nw_it_spdvscr201"; //snap Lesser Restoration
        else if (rnd <53 ) sItem = "nw_it_spdvscr203"; //snap Silence
        else if (rnd <54 ) sItem = "nw_it_spdvscr204"; //snap Sound Burst
        else if (rnd <55 ) sItem = "nw_it_spdvscr301"; //snap Remove Blindness / Deafness
        else if (rnd <58 ) sItem = "nw_it_spdvscr302"; //snap Remove Disease
        else if (rnd <61 ) sItem = "nw_it_spdvscr402"; //snap Neutralize Poison
        else if (rnd <63 ) sItem = "doom";              //snap doom
        else if (rnd <65 ) sItem = "cureseriouswound"; //snap cure serious wounds
   else if (rnd <66 )
    { sItem = "x1_it_sparscr001";                   //
      nStack=2;}
    else if (rnd <67 )
    { sItem = "x1_it_sparscr002";                   //
      nStack=2;}
    else if (rnd <68 )
    { sItem = "x1_it_sparscr003";                   //
      nStack=2;}
    else if (rnd <69 )
    { sItem = "x1_it_spdvscr001";                   //
      nStack=2;}
    else if (rnd <71) sItem = "x1_it_sparscr101";   //Exp. Retreat
    else if (rnd <73) sItem = "x1_it_sparscr102";   //Amplify
    else if (rnd <75) sItem = "x1_it_sparscr103";   //Shield
    else if (rnd <77) sItem = "x1_it_spdvscr102";   //Divine Favour
    else if (rnd <79) sItem = "x1_it_spdvscr103";   //Entropic Shield
    else if (rnd <81) sItem = "x1_it_spdvscr104";   //Inflict LW
    else if (rnd <83) sItem = "x1_it_spdvscr105";   //Shield of Faith
    else if (rnd <85) sItem = "x1_it_spdvscr106";   //Magic Fang
    else if (rnd <87) sItem = "x1_it_spdvscr107";   //Camouflage
    else if (rnd <89) sItem = "x1_it_spdvscr101";   //Bane
    else if (rnd <90) sItem = "x1_it_spdvscr201";   //Inflict MW
    else if (rnd <91) sItem = "x1_it_spdvscr202";   //Blood Frenzy
    else if (rnd <92) sItem = "x1_it_spdvscr203";   //One with the Land
    else if (rnd <93) sItem = "x1_it_spdvscr204";   //Aura of Glory
    else if (rnd <94) sItem = "x1_it_sparscr201";   //Balagorn's
    else if (rnd <95) sItem = "x1_it_sparscr202";   //Tasha's
    else if (rnd <97 )
    { sItem = "x2_it_cfm_bscrl";                   //Blank
      nStack=Random(4)+1;}
    else if (rnd <99) sItem = "x2_it_spdvscr101";
    else if (rnd <101) sItem = "x2_it_sparscr101";   //
    else if (rnd <103) sItem = "x2_it_sparscr102";   //
    else if (rnd <105) sItem = "x2_it_sparscr103";   //
    else if (rnd <107) sItem = "x2_it_sparscr104";   //
    else if (rnd <109) sItem = "x2_it_sparscr105";   //
    else if (rnd <110) sItem = "x2_it_sparscr201";   //
    else if (rnd <111) sItem = "x2_it_sparscr202";   //
    else if (rnd <112) sItem = "x2_it_sparscr203";   //
    else if (rnd <113) sItem = "x2_it_sparscr204";   //
    else if (rnd <114) sItem = "x2_it_sparscr205";   //
    else if (rnd <115) sItem = "x2_it_sparscr206";   //


        CreateItemOnObject(sItem, OBJECT_SELF, nStack);
        iNumb ++;
    }
    }
    SetLocalInt( OBJECT_SELF, "nEmptied", 1);
    if (GetObjectType(OBJECT_SELF)==OBJECT_TYPE_PLACEABLE) craft_drop_placeable();
}


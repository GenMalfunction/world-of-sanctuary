#include "x2_inc_compon"
// Ben W-Husey
// Placeable contents
// Cantrips, 3rd & 4th level wizard scrolls (Multiples)
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
    rnd = Random(104);
        if (rnd < 1) sItem = "nw_it_sparscr307";      //Clairaudience & Clairvoyance
        else if (rnd <4 ) sItem = "nw_it_sparscr301"; //Dispell Magic
        else if (rnd <6 ) sItem = "nw_it_sparscr309"; //Fireball
        else if (rnd <8 ) sItem = "nw_it_sparscr304"; //Flame Arrow
        else if (rnd <10 )sItem = "nw_it_sparscr312"; //Haste
        else if (rnd <12 )sItem = "nw_it_sparscr308"; //Hold Person
        else if (rnd <14 )sItem = "nw_it_sparscr314"; //Invisibility Sphere
        else if (rnd <16 )sItem = "nw_it_sparscr310"; //Lightning Bolt
        else if (rnd <18 )sItem = "nw_it_sparscr302"; //Magic Circle against Alignment
        else if (rnd <20 )sItem = "nw_it_sparscr303"; //Protection from Elements
        else if (rnd <22 )sItem = "nw_it_sparscr313"; //Slow
        else if (rnd <24 )sItem = "nw_it_sparscr305"; //Stinking Cloud
        else if (rnd <26 )sItem = "nw_it_sparscr306"; //Summon Creature III
        else if (rnd <28 )sItem = "nw_it_sparscr311"; //Vampiric Touch
        else if (rnd <30 )sItem = "nw_it_sparscr414"; //Bestow Curse
        else if (rnd <32 )sItem = "nw_it_sparscr405"; //Charm Monster
        else if (rnd <34 )sItem = "nw_it_sparscr406"; //Confusion
        else if (rnd <36 )sItem = "nw_it_sparscr411"; //Contagion
        else if (rnd <38 )sItem = "nw_it_sparscr416"; //Elemental Shield
        else if (rnd <40 )sItem = "nw_it_sparscr412"; //Enervation
        else if (rnd <42 )sItem = "nw_it_sparscr413"; //Fear
        else if (rnd <44 )sItem = "nw_it_sparscr408"; //Improved Invisibility
        else if (rnd <46 )sItem = "nw_it_sparscr417"; //Lesser Spell Breach
        else if (rnd <48 )sItem = "nw_it_sparscr401"; //Minor Globe of Invulnerability
        else if (rnd <50 )sItem = "nw_it_sparscr409"; //Phantasmal Killer
        else if (rnd <52 )sItem = "nw_it_sparscr415"; //Polymorph Self
        else if (rnd <54 )sItem = "nw_it_sparscr402"; //Remove Curse
        else if (rnd <56 )sItem = "nw_it_sparscr410"; //Shadow Conjuration
        else if (rnd <58 )sItem = "nw_it_sparscr403"; //Stoneskin
        else if (rnd <60 )sItem = "nw_it_sparscr404"; //Summon Creature IV
        else if (rnd <62 )sItem = "nw_it_sparscr407"; //Wall of Fire
        else if (rnd <64 )sItem = "flamelash";        //Add snap Flame Lash
        else if (rnd <66 )sItem = "x1_it_sparscr301"; //Displace
        else if (rnd <68 )sItem = "x1_it_sparscr302"; //Wounding Whispers
        else if (rnd <70 )sItem = "x1_it_sparscr303"; //Wind
        else if (rnd <72 )sItem = "x1_it_spdvscr301"; //Continual Flame
        else if (rnd <74 )sItem = "x1_it_spdvscr302"; //Inflict SW
        else if (rnd <76 )sItem = "x1_it_spdvscr303"; //G. Magic Fang
        else if (rnd <78 )sItem = "x1_it_spdvscr304"; //Spike Growth
        else if (rnd <80 )sItem = "x1_it_spdvscr305"; //Quillfire
        else if (rnd <82 )sItem = "x1_it_sparscr401"; //Isaac's
       else if (rnd <84 )sItem = "x2_it_spdvscr301"; //
        else if (rnd <86 )sItem = "x2_it_spdvscr302"; //
        else if (rnd <88 )sItem = "x2_it_spdvscr303"; //
        else if (rnd <90 )sItem = "x2_it_spdvscr304"; //
        else if (rnd <92 )sItem = "x2_it_spdvscr305"; //
        else if (rnd <94 )sItem = "x2_it_sparscr301"; //
        else if (rnd <96 )sItem = "x2_it_sparscr302"; //
        else if (rnd <98 )sItem = "x2_it_sparscr303"; //
        else if (rnd <100 )sItem = "x2_it_sparscr304"; //
        else if (rnd <102 )sItem = "x2_it_spdvscr401"; //
        else if (rnd <104 )sItem = "x2_it_spdvscr406"; //
        CreateItemOnObject(sItem, OBJECT_SELF, nStack);
        iNumb ++;
    }   //end of while
    }   // end of if emptied
    SetLocalInt( OBJECT_SELF, "nEmptied", 1);
    if (GetObjectType(OBJECT_SELF)==OBJECT_TYPE_PLACEABLE) craft_drop_placeable();
} // end of main





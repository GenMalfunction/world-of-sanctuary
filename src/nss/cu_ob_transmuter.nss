//20th October 2002
//Ben W-Husey
//Transmutes gems into magic items and places them in another container.

void main()
{

effect eFirst = EffectVisualEffect(VFX_IMP_GOOD_HELP);
object oTarget = GetObjectByTag("GemBrazier")  ;

//Action 1 - Greenstone, Fire Agate, Amethyst - Socketed Light Armor [8]
if ( GetLocalInt(GetPCSpeaker(), "nGem1") == 1 && GetLocalInt(GetPCSpeaker(), "nGem2") == 1 &&  GetLocalInt(GetPCSpeaker(), "nGem3") == 1)
    {
    string sItem = "statuering" ;
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eFirst, oTarget);
    CreateItemOnObject(sItem,oTarget,1);
    SetLocalInt(GetPCSpeaker(), "nGem1", 0);
    SetLocalInt(GetPCSpeaker(), "nGem2", 0);
    SetLocalInt(GetPCSpeaker(), "nGem3", 0);
    }

//Action 2 - Fire Agate, Amethyst, Phenelope - Socketed Heavy Armor [8]
if ( GetLocalInt(GetPCSpeaker(), "nGem2") == 1 && GetLocalInt(GetPCSpeaker(), "nGem3") == 1 &&  GetLocalInt(GetPCSpeaker(), "nGem4") == 1)
    {
    string sItem = "amberwand" ;
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eFirst, oTarget);
    CreateItemOnObject(sItem,oTarget,1);
    SetLocalInt(GetPCSpeaker(), "nGem2", 0);
    SetLocalInt(GetPCSpeaker(), "nGem3", 0);
    SetLocalInt(GetPCSpeaker(), "nGem4", 0);
    }
//Action 3 - Amethyst, Phenelope, Malachite - Socketed Basterd Sword [8]
if ( GetLocalInt(GetPCSpeaker(),  "nGem3") == 1 && GetLocalInt(GetPCSpeaker(), "nGem4") == 1 &&  GetLocalInt(GetPCSpeaker(), "nGem5") == 1)
    {
    string sItem = "wswbs006" ;
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eFirst, oTarget);
    CreateItemOnObject(sItem,oTarget,1);
    SetLocalInt(GetPCSpeaker(), "nGem3", 0);
    SetLocalInt(GetPCSpeaker(), "nGem4", 0);
    SetLocalInt(GetPCSpeaker(), "nGem5", 0);
    }
//Action 4
if ( GetLocalInt(GetPCSpeaker(), "nGem5") == 1 && GetLocalInt(GetPCSpeaker(), "nGem1") == 1)
    {
    string sItem = "pp" ;
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eFirst, oTarget);
    CreateItemOnObject(sItem,oTarget,1);
    SetLocalInt(GetPCSpeaker(), "nGem5", 0);
    SetLocalInt(GetPCSpeaker(), "nGem1", 0);
    }
//Action 5
if ( GetLocalInt(GetPCSpeaker(), "nGem6") == 1 && GetLocalInt(GetPCSpeaker(), "nGem4") == 1)
    {
    string sItem = "pp" ;
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eFirst, oTarget);
    CreateItemOnObject(sItem,oTarget,1);
    SetLocalInt(GetPCSpeaker(), "nGem4", 0);
    SetLocalInt(GetPCSpeaker(), "nGem6", 0);
    }
//Action 6
if ( GetLocalInt(GetPCSpeaker(), "nGem5") == 1 && GetLocalInt(GetPCSpeaker(), "nGem2") == 1)
    {
    string sItem = "pp" ;
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eFirst, oTarget);
    CreateItemOnObject(sItem,oTarget,1);
    SetLocalInt(GetPCSpeaker(), "nGem5", 0);
    SetLocalInt(GetPCSpeaker(), "nGem2", 0);
    }
}

//nw_it_gem001; 1  // Greenstone
//nw_it_gem002; 2  // Fire Agate
//nw_it_gem003; 3  // Amethyst
//nw_it_gem004; 4  // Phenelope
//nw_it_gem007; 5  // Malachite
//nw_it_gem009; 6  // Fire Opal
//nw_it_gem010; 7  // Topaz
//nw_it_gem013; 8  // Alexandrite
//nw_it_gem014; 9  // Aventurine
//nw_it_gem015; 10 // Fluorspar
//nw_it_gem011; 11 // Garnet

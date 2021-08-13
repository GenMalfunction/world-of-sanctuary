void ApplyEffects()
{
// apply visualisation effects to thones
    object Target = GetObjectByTag("ded1o1", 0);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR)), Target);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR)), Target);

    Target = GetObjectByTag("SummitSilverspeed2", 0);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR)), Target);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR)), Target);

    Target = GetObjectByTag("ViperKF", 0);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR)), Target);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR)), Target);

    Target = GetObjectByTag("GlynnPerry", 0);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR)), Target);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR)), Target);

    Target = GetObjectByTag("WNxMelphis", 0);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROT_STONESKIN)), Target);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS)), Target);

    Target = GetObjectByTag("BrutusFreespirit", 0);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR)), Target);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR)), Target);

    Target = GetObjectByTag("TheMaskedLord", 0);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR)), Target);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR)), Target);

    Target = GetObjectByTag("welcomesign", 0);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROT_EPIC_ARMOR_2)), Target);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_GLOW_ORANGE)), Target);

    //Target = GetObjectByTag("mthrone", 1); // increase number by one for each member throne
    //ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROT_STONESKIN)), Target);
    //ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS)), Target);

// apply visualisation effects to scoreboards
    int s = 0;
    while(s<100) {
        Target = GetObjectByTag("scoreboard", s);
        if (Target == OBJECT_INVALID) {
            s=100;
        } else {
            s++;
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PROT_PREMONITION)), Target);
        }
    }
}

void InitToy(string name, string ref)
{
    int tcnt = GetLocalInt(GetModule(), "tcnt");
    SetLocalString(GetModule(), "tname"+IntToString(tcnt), name);
    SetLocalString(GetModule(), "tref"+IntToString(tcnt), ref);
    SetLocalInt(GetModule(), "tcnt", tcnt+1);
}

void Toys()
{
    InitToy("Toy Manager", "maker");
    InitToy("Bring It On", "bring");
    InitToy("Get Over Here", "getoverhere");
    InitToy("Area Jump", "ajump");
    InitToy("DM Jump", "djump");
    InitToy("Player Jump", "pjump");
    InitToy("Be Seated", "beseated");
    InitToy("Tag Along", "tagalong");
    InitToy("Large Hammer (The End)", "theend");
    InitToy("Bye Bye", "bye");
    InitToy("Little Horror MkI", "horror1");
    InitToy("Little Horror MkII", "horror2");
    InitToy("Little Horror MkIII", "horror3");
    InitToy("Stungun 1", "stungun1");
    InitToy("Stungun 2", "stungun2");
    InitToy("Polymorph em", "poly");
    InitToy("Level em", "levelem");
    InitToy("Can Opener", "thecanopener");
    InitToy("Butterfingers", "butterfingers");
    InitToy("Reload Module", "reload");
    InitToy("Examine Player", "examine");
    InitToy("Strip Player", "strip");
//    InitToy("", "");
}

void AddDM(string name)
{
    if (name == "") return;
    int dcnt = GetLocalInt(GetModule(), "dcnt");
    SetLocalString(GetModule(), "dname"+IntToString(dcnt), name);
    SetLocalInt(GetModule(), "dcnt", dcnt+1);
}

void main()
{
    AddDM("ded 1o1"); // please do not delete this line
    AddDM("Summit Silverspeed 2");
    AddDM("Brutus Freespirit");
// place your login name between the quotes
// Copy & paste the following line to add more DM's
    AddDM("");

    ApplyEffects();
    Toys();
    if (Get2DAString("appearance", "LABEL", 1000) == "Wemic") {
        SetLocalInt(GetModule(), "CEP", 1);
    } else {
        SetLocalInt(GetModule(), "CEP", 0);
    }
      // set module options
  SetLocalInt(OBJECT_SELF,"OPTION_WPAlwaysUseable" ,TRUE);
  SetLocalInt(OBJECT_SELF,"OPTION_RestTimer"       ,0);
  SetLocalInt(OBJECT_SELF,"OPTION_RespawnWhereDied",TRUE);

  // activate trash can system
  // (loot bags are being destroyed after specific amount of time)
  // (see: mod_trashcan_usr)
  DelayCommand(10.0,SignalEvent(OBJECT_SELF,EventUserDefined(9000)));
}

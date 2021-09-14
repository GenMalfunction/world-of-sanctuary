/* Script created by L0BSTER - Wrote 20/4/2014
//
// rewrote.. so now the chest will work properly, players will need to split
// runes into singles of three once the user closes the chest it will convert.
//
// I am sure there might have been a more cleaner way but...
//
// I got tired waiting for others to do it.. not to sound rude.
//
// Enjoy x
//
/////// EDITED 4/8/2018 - 2019 //////
// Have relooked at the script and I have gone and cleaned it.
//
// Tried making it look consistent and polished it, so it functions correctly
//
// Since the Containers (Box/Bag) are no-drop and Plot, the chest will send
//
// these items straight into your toon's backpack //
//
// Minor updates by Gen.Malfunction 20210816
// *tweaked the "cannot combine these items" message emitted by the chest
//
*/

void DestroyInventory(object oSource)
{
    int i;
      object oInvent;
        oInvent=GetFirstItemInInventory(oSource);
        while (GetIsObjectValid(oInvent)) {
             if (GetBaseItemType(oInvent) == BASE_ITEM_LARGEBOX)
                    DestroyInventory(oInvent);
                   DestroyObject(oInvent,1.0f);
                    oInvent=GetNextItemInInventory(oSource);
        }
}

void create(string sRef,object oChest , int iStackSize)
{
    CreateItemOnObject(sRef,oChest,iStackSize);
}

void main()
{

  object oChest = OBJECT_SELF;
  object oPC = GetLastClosedBy();
  object oFirstItem=GetFirstItemInInventory(oChest);
  object oSecondItem=GetNextItemInInventory(oChest);
  object oThirdItem=GetNextItemInInventory(oChest);
//
//#El Rune 1
if     (GetTag(oFirstItem)=="El"  &&
        GetTag(oSecondItem)=="El"  &&
        GetTag(oThirdItem)=="El")
      {
        DestroyInventory(oChest);
        DelayCommand(0.1f,create("monkarmor006",oChest,1));
        SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Armor");
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
      }
//
//#Eld Rune 2
else if (GetTag(oFirstItem)=="Eld"  &&
         GetTag(oSecondItem)=="Eld"  &&
         GetTag(oThirdItem)=="Eld")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("rarewarsword",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune War Sword");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Tir Rune 3
else if (GetTag(oFirstItem)=="Tir"  &&
         GetTag(oSecondItem)=="Tir"  &&
         GetTag(oThirdItem)=="Tir")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("peltalunata002",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Shield");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Nef Rune 4
else if (GetTag(oFirstItem)=="Nef"  &&
         GetTag(oSecondItem)=="Nef"  &&
         GetTag(oThirdItem)=="Nef")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("cloakoffreedo003",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Cloak");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Eth Rune 5
else if (GetTag(oFirstItem)=="Eth"  &&
         GetTag(oSecondItem)=="Eth"  &&
         GetTag(oThirdItem)=="Eth")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("natalyasmark001",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Kama");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Ith Rune 6
else if (GetTag(oFirstItem)=="Ith"  &&
         GetTag(oSecondItem)=="Ith"  &&
         GetTag(oThirdItem)=="Ith")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("djinnslayer003",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Rapier");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Tal Rune 7
else if (GetTag(oFirstItem)=="Tal"  &&
         GetTag(oSecondItem)=="Tal"  &&
         GetTag(oThirdItem)=="Tal")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("monkfists006",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Gauntlet");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Ral Rune 8
else if (GetTag(oFirstItem)=="Ral"  &&
         GetTag(oSecondItem)=="Ral"  &&
         GetTag(oThirdItem)=="Ral")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("amuletofdivin002",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Amulet");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Ort Rune 9
else if (GetTag(oFirstItem)=="Ort"  &&
         GetTag(oSecondItem)=="Ort"  &&
         GetTag(oThirdItem)=="Ort")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("wswsc004",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Scimitar");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Thul Rune 10
else if (GetTag(oFirstItem)=="Thul"  &&
         GetTag(oSecondItem)=="Thul"  &&
         GetTag(oThirdItem)=="Thul")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("023",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Helm");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Amn Rune 11
else if (GetTag(oFirstItem)=="Amn"  &&
         GetTag(oSecondItem)=="Amn"  &&
        GetTag(oThirdItem)=="Amn")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("peasantcrown002",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Helm");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Sol Rune 12
else if (GetTag(oFirstItem)=="Sol"  &&
         GetTag(oSecondItem)=="Sol"  &&
         GetTag(oThirdItem)=="Sol")
        {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("burizadokyano001",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Crossbow");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
        }
//
//#Shael Rune 13
else if (GetTag(oFirstItem)=="Shael"  &&
         GetTag(oSecondItem)=="Shael"  &&
         GetTag(oThirdItem)=="Shael")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("wplmsc014",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Scythe");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Dol Rune 14
else if (GetTag(oFirstItem)=="Dol"  &&
         GetTag(oSecondItem)=="Dol"  &&
         GetTag(oThirdItem)=="Dol")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("wdbmax014",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Double Axe");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Hel Rune 15
else if (GetTag(oFirstItem)=="Hel"  &&
         GetTag(oSecondItem)=="Hel"  &&
         GetTag(oThirdItem)=="Hel")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("wdbmma014",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Mace");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Io Rune 16
else if (GetTag(oFirstItem)=="Io"  &&
       GetTag(oSecondItem)=="Io"  &&
       GetTag(oThirdItem)=="Io")
      {
        DestroyInventory(oChest);
        DelayCommand(0.1f,create("warhammerofth001",oChest,1));
        SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Hammer");
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
      }
//
//#Lum Rune 17
else if (GetTag(oFirstItem)=="Lum"  &&
       GetTag(oSecondItem)=="Lum"  &&
       GetTag(oThirdItem)=="Lum")
      {
        DestroyInventory(oChest);
        DelayCommand(0.1f,create("azurewrath003",oChest,1));
        SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Short Sword");
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
      }
//
//#Ko Rune 18
else if (GetTag(oFirstItem)=="Ko"  &&
         GetTag(oSecondItem)=="Ko"  &&
         GetTag(oThirdItem)=="Ko")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("tearhuanch001",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Boots");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Fal Rune 19
else if (GetTag(oFirstItem)=="Fal"  &&
         GetTag(oSecondItem)=="Fal"  &&
         GetTag(oThirdItem)=="Fal")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("bracersofdead001",oChest,1));
        SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Bracer");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Lem Rune 20
else if (GetTag(oFirstItem)=="Lem"  &&
         GetTag(oSecondItem)=="Lem"  &&
         GetTag(oThirdItem)=="Lem")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("undeadguardbo002",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Bow");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Pul Rune 21
else if (GetTag(oFirstItem)=="Pul"  &&
         GetTag(oSecondItem)=="Pul"  &&
         GetTag(oThirdItem)=="Pul")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("heavenlygarb003",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Armor");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Um Rune 22
else if (GetTag(oFirstItem)=="Um"  &&
         GetTag(oSecondItem)=="Um"  &&
         GetTag(oThirdItem)=="Um")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("grandfather002",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Greatsword");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Mal Rune 23
else if (GetTag(oFirstItem)=="Mal"  &&
         GetTag(oSecondItem)=="Mal"  &&
         GetTag(oThirdItem)=="Mal")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("bulkathostrib001",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Sickle");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Ist Rune 24
else if (GetTag(oFirstItem)=="Ist"  &&
         GetTag(oSecondItem)=="Ist"  &&
        GetTag(oThirdItem)=="Ist")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("backstabberbl001",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Dagger");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Gul Rune 25
else if (GetTag(oFirstItem)=="Gul"  &&
         GetTag(oSecondItem)=="Gul"  &&
         GetTag(oThirdItem)=="Gul")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("orckingsbasta004",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Bastard Sword");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Vex Rune 26
else if (GetTag(oFirstItem)=="Vex"  &&
         GetTag(oSecondItem)=="Vex"  &&
         GetTag(oThirdItem)=="Vex")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("it_contain002",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Bag");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Ohm Rune 27
else if (GetTag(oFirstItem)=="Ohm"  &&
         GetTag(oSecondItem)=="Ohm"  &&
         GetTag(oThirdItem)=="Ohm")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("blunderborecl003",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Club");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Lo Rune 28
else if (GetTag(oFirstItem)=="Lo"  &&
       GetTag(oSecondItem)=="Lo"  &&
       GetTag(oThirdItem)=="Lo")
      {
        DestroyInventory(oChest);
        DelayCommand(0.1f,create("methodofdeath002",oChest,1));
        SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Morningstar");
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
      }
//
//#Sur Rune 29
else if (GetTag(oFirstItem)=="Sur"  &&
         GetTag(oSecondItem)=="Sur"  &&
         GetTag(oThirdItem)=="Sur")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("thestoneofjor001",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Ring");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Ber Rune 30
else if (GetTag(oFirstItem)=="Ber"  &&
         GetTag(oSecondItem)=="Ber"  &&
         GetTag(oThirdItem)=="Ber")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("it_mbelt019",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Belt");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Jah Rune 31
else if (GetTag(oFirstItem)=="Jah"  &&
         GetTag(oSecondItem)=="Jah"  &&
         GetTag(oThirdItem)=="Jah")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("thestoneofjor999",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Ring");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Cham Rune 32
else if (GetTag(oFirstItem)=="Cham"  &&
         GetTag(oSecondItem)=="Cham"  &&
         GetTag(oThirdItem)=="Cham")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("amuletofdivin003",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Amulet");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Zod Rune 33
else if (GetTag(oFirstItem)=="Zod"  &&
        GetTag(oSecondItem)=="Zod"  &&
        GetTag(oThirdItem)=="Zod")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("it_mbelt020",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Belt");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
      }
//
//#Xod Rune 34
else if (GetTag(oFirstItem)=="Xod"  &&
       GetTag(oSecondItem)=="Xod"  &&
       GetTag(oThirdItem)=="Xod")
      {
        DestroyInventory(oChest);
        DelayCommand(0.1f,create("balancetothef002",oChest,1));
        SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Great Sword");
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
      }
//
//#Xid Rune 35
else if (GetTag(oFirstItem)=="Xid"  &&
         GetTag(oSecondItem)=="Xid"  &&
         GetTag(oThirdItem)=="Xid")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("wswls005",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Long Sword");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Gar Rune 36
else if (GetTag(oFirstItem)=="Gar"  &&
         GetTag(oSecondItem)=="Gar"  &&
         GetTag(oThirdItem)=="Gar")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("gulrunegreataxe",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Great Axe");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Fur Rune 37
else if (GetTag(oFirstItem)=="Fur"  &&
         GetTag(oSecondItem)=="Fur"  &&
         GetTag(oThirdItem)=="Fur")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("falrunearmor",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Armor");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Imu Rune 38
else if (GetTag(oFirstItem)=="Imu"  &&
         GetTag(oSecondItem)=="Imu"  &&
         GetTag(oThirdItem)=="Imu")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("imurunebrace",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Bracer");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Tyhl Rune 39
else if (GetTag(oFirstItem)=="tyhl"  &&
         GetTag(oSecondItem)=="tyhl"  &&
         GetTag(oThirdItem)=="tyhl")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("testrunehelmet",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Helm");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Rhul Rune 40
else if (GetTag(oFirstItem)=="rhul"  &&
         GetTag(oSecondItem)=="rhul"  &&
         GetTag(oThirdItem)=="rhul")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("testruneshield",oChest,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Shield");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }

/////////////////////////
// The Bag Runes/////////
/////////////////////////
//
//#Amm Rune 41
else if (GetTag(oFirstItem)=="ammorune"  &&
         GetTag(oSecondItem)=="ammorune"  &&
         GetTag(oThirdItem)=="ammorune")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("ammo",oPC,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Ammo Chest");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Arm Rune 42
else if (GetTag(oFirstItem)=="armorrune"  &&
       GetTag(oSecondItem)=="armorrune"  &&
       GetTag(oThirdItem)=="armorrune")
      {
        DestroyInventory(oChest);
        DelayCommand(0.1f,create("Armor",oPC,1));
        SendMessageToPC (oPC, "The Horadric Cube has made a - Armor Chest");
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
      }
//
//#Clo Rune 43
else if (GetTag(oFirstItem)=="clothingrune"  &&
         GetTag(oSecondItem)=="clothingrune"  &&
         GetTag(oThirdItem)=="clothingrune")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("clothing",oPC,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Clothing Chest");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Gem Rune 44
else if (GetTag(oFirstItem)=="gemsrune"  &&
         GetTag(oSecondItem)=="gemsrune"  &&
         GetTag(oThirdItem)=="gemsrune")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("gems",oPC,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Gems Chest");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Jew Rune 45
else if (GetTag(oFirstItem)=="jewelryrune"  &&
         GetTag(oSecondItem)=="jewelryrune"  &&
         GetTag(oThirdItem)=="jewelryrune")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("jewelry",oPC,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Jewelry Chest");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Key Rune 46
else if (GetTag(oFirstItem)=="keyrune"  &&
         GetTag(oSecondItem)=="keyrune"  &&
         GetTag(oThirdItem)=="keyrune")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("key",oPC,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Key Chest");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Run Rune 47
else if (GetTag(oFirstItem)=="runerune"  &&
         GetTag(oSecondItem)=="runerune"  &&
         GetTag(oThirdItem)=="runerune")
       {
         DestroyInventory(oChest);
         DelayCommand(0.1f,create("rune",oPC,1));
         SendMessageToPC (oPC, "The Horadric Cube has made a - Rune Chest");
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
       }
//
//#Wea Rune 48
else if (GetTag(oFirstItem)=="weaponrune"  &&
       GetTag(oSecondItem)=="weaponrune"  &&
       GetTag(oThirdItem)=="weaponrune")
      {
        DestroyInventory(oChest);
        DelayCommand(0.1f,create("weapon",oPC,1));
        SendMessageToPC (oPC, "The Horadric Cube has made a - Weapon Chest");
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DISPEL), oChest);
      }
//
//// end of script ///
//

//
// catch-all for combination of runes matching no recipe
//
else {
        SendMessageToPC (oPC, "The Horadric Cube cannot combine these items! Double the runes you placed inside the chest...");
     }

}

//
//  Carrion Eater heartbeat by Braneloc.
//
//

#include "trash_include"

// just a boring debug text
void debug(string whatever);
// eat anything in inventory
void digest();
// sniff up a PC
void sniff(object who);

void digest()
{
    // eat stuff
     object item=GetFirstItemInInventory(OBJECT_SELF);
     int burp=0;
     while (GetIsObjectValid(item))
     {
        DestroyObject(item);
        burp=1;
        item=GetNextItemInInventory(OBJECT_SELF);
     }
    // eat gold
     int gold=GetGold(OBJECT_SELF);
     if (gold != 0)
     {
        TakeGold(gold,OBJECT_SELF,TRUE);
        burp=1;
     }
     // did I eat something ?
     if (burp==1)
        {
        //ActionSpeakString("I'll pick this up!");
        //PlaySound("vs_nchildm2");
        }
}

void sniff(object who)
{   // sniff the PC
    //ActionSpeakString("Sup?");
    //PlaySound("vs_nchildm2");
    SetLocalObject(OBJECT_SELF,"lastsniff",who);
    SetLocalInt(OBJECT_SELF,"mode",0);
}

void main()
{
    CheckStuck();
    LootUp();
    ActionDoCommand(digest());

    // nothing do do, sniff out any PCs.
    if (GetLocalInt(OBJECT_SELF,"mode") == 0)
    {
       //ActionRandomWalk();
        object who=GetNearestPC();
        if (GetLocalObject(OBJECT_SELF,"lastsniff") != who)
        {
            SetLocalInt(OBJECT_SELF,"mode",3);
            ActionMoveToObject(who);
            ActionDoCommand(sniff(who));
        }
    }

    // nothing to do, go to sleep.
    if (GetLocalInt(OBJECT_SELF,"mode") == 0)
    {
        if (GetLocalInt(OBJECT_SELF,"sleep")==0)
        {
            //ActionRest();
            SetLocalInt(OBJECT_SELF,"sleep",1);
            //effect snore=EffectVisualEffect(94);
            //ApplyEffectToObject(DURATION_TYPE_INSTANT,snore,OBJECT_SELF);

        }
    } else {
       SetLocalInt(OBJECT_SELF,"sleep",0);
    }
    //ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectPetrify(),OBJECT_SELF);
//ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectVisualEffect(VFX_DUR_MAGIC_RESISTANCE),OBJECT_SELF);
//ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectVisualEffect(VFX_IMP_MAGBLUE),OBJECT_SELF);
//ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE),OBJECT_SELF);
//ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectVisualEffect(VFX_DUR_GHOSTLY_PULSE),OBJECT_SELF);

}

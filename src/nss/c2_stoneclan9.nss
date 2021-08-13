#include "NW_O2_CONINCLUDE"
#include "NW_I0_GENERIC"

void main()
{
      SetSpawnInCondition(NW_FLAG_SHOUT_ATTACK_MY_TARGET);
effect eEffect = EffectVisualEffect(VFX_DUR_PROT_STONESKIN, FALSE);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, OBJECT_SELF, 0.0);
      DelayCommand(600.0, DestroyObject(OBJECT_SELF));
  SetListeningPatterns();
    WalkWayPoints();
    }


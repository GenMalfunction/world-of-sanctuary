void main()
{
    object oBenchPew = OBJECT_SELF;
    //Make sure no one is in <span class="highlight">chair</span>, if not sitdown.
    if(!GetIsObjectValid(GetSittingCreature(oBenchPew)))
        {
        ActionSit( GetNearestObjectByTag( "BenchPew"));
        }
}

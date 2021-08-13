void main()
{
    object oCouch1 = OBJECT_SELF;
    //Make sure no one is in <span class="highlight">chair</span>, if not sitdown.
    if(!GetIsObjectValid(GetSittingCreature(oCouch1)))
        {
        AssignCommand(GetLastUsedBy(),ActionSit(oCouch1));
        }
}

void main()
{
    object oChair = OBJECT_SELF;
    //Make sure no one is in <span class="highlight">chair</span>, if not sitdown.
    if(!GetIsObjectValid(GetSittingCreature(oChair)))
        {
        AssignCommand(GetLastUsedBy(),ActionSit(oChair));
        }
}

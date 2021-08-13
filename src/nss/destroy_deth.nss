void main()
{
    object oDropped = GetModuleItemLost();
    string sDTag;
    if( GetIsObjectValid(oDropped ))
    {
       sDTag=GetTag(oDropped);
       if( sDTag=="deathamulet" ) DestroyObject( oDropped );
    }
}

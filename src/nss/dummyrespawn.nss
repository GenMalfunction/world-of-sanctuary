//Put on placeable OnDeath Script


void main()
{
location lDummy= GetLocation(OBJECT_SELF);
CreateObject(OBJECT_TYPE_PLACEABLE,"CMBTDUMMY",lDummy,FALSE);
}

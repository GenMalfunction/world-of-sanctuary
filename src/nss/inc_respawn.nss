void RespawnObject(string sTag, int iType, location lLoc)
{
// ResRef must be derivable from Tag
string sResRef = GetStringLowerCase(GetStringLeft(sTag, 16));
CreateObject(iType, sResRef, lLoc);
}

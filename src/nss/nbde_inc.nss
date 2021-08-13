//void main(){}

// don't change....
const int NBDE_VARTYPE_INT = 1;
const int NBDE_VARTYPE_FLOAT = 2;
const int NBDE_VARTYPE_STRING = 3;
const int NBDE_VARTYPE_VECTOR = 4;
const int NBDE_VARTYPE_LOCATION = 5;

const string NBDE_DATABASE_ITEM_VARNAME = "+++_DATABASE_ITEM_+++";

// This stores an int out to the specified campaign database
// The database name IS case sensitive and it must be the same for both set and get functions.
// If you want a variable to pertain to a specific player in the game, provide a player object.
//
// improvements to original bioware function:
// vastly improved writing speed...
// there is no limit on the length of sVarname (original function is limited to 32 chars)
// sVarname must NOT be unique. you can use the same sVarname with a different data-type
void NBDE_SetCampaignInt(string sCampaignName, string sVarname, int nInt, object oPlayer = OBJECT_INVALID);

// This stores a float out to the specified campaign database
// The database name IS case sensitive and it must be the same for both set and get functions.
// If you want a variable to pertain to a specific player in the game, provide a player object.
//
// improvements to original bioware function:
// vastly improved writing speed...
// there is no limit on the length of sVarname (original function is limited to 32 chars)
// sVarname must NOT be unique. you can use the same sVarname with a different data-type
void NBDE_SetCampaignFloat(string sCampaignName, string sVarname, float flFloat, object oPlayer = OBJECT_INVALID);

// This stores a string out to the specified campaign database
// The database name IS case sensitive and it must be the same for both set and get functions.
// If you want a variable to pertain to a specific player in the game, provide a player object.
//
// improvements to original bioware function:
// vastly improved writing speed...
// there is no limit on the length of sVarname (original function is limited to 32 chars)
// sVarname must NOT be unique. you can use the same sVarname with a different data-type
void NBDE_SetCampaignString(string sCampaignName, string sVarname, string sString, object oPlayer = OBJECT_INVALID);

// This stores a location out to the specified campaign database
// The database name IS case sensitive and it must be the same for both set and get functions.
// If you want a variable to pertain to a specific player in the game, provide a player object.
//
// improvements to original bioware function:
// vastly improved writing speed...
// there is no limit on the length of sVarname (original function is limited to 32 chars)
// sVarname must NOT be unique. you can use the same sVarname with a different data-type
//
// original function is not very reliable, because it is using the areas object-id, which is
// a runtime generated ID. stored locations can get invalid if you change the area layout via toolset.
// (e.g. deleting old areas)
//
// this function is 100% reliable, as long as you use unique TAGs for your areas
void NBDE_SetCampaignLocation(string sCampaignName, string sVarname, location locLocation, object oPlayer = OBJECT_SELF);

// This stores a vector out to the specified campaign database
// The database name IS case sensitive and it must be the same for both set and get functions.
// If you want a variable to pertain to a specific player in the game, provide a player object.
//
// improvements to original bioware function:
// vastly improved writing speed...
// there is no limit on the length of sVarname (original function is limited to 32 chars)
// sVarname must NOT be unique. you can use the same sVarname with a different data-type
void NBDE_SetCampaignVector(string sCampaignName, string sVarname, vector vVector, object oPlayer = OBJECT_SELF);

// This will read an int from the specified campaign database
// The database name IS case sensitive and it must be the same for both set and get functions.
// If you want a variable to pertain to a specific player in the game, provide a player object.
//
// improvements to original bioware function:
// improved reading speed...
// there is no limit on the length of sVarname (original function is limited to 32 chars)
// sVarname must NOT be unique. you can use the same sVarname with a different data-type
int NBDE_GetCampaignInt(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID);

// This will read a float from the specified campaign database
// The database name IS case sensitive and it must be the same for both set and get functions.
// If you want a variable to pertain to a specific player in the game, provide a player object.
//
// improvements to original bioware function:
// improved reading speed...
// there is no limit on the length of sVarname (original function is limited to 32 chars)
// sVarname must NOT be unique. you can use the same sVarname with a different data-type
float NBDE_GetCampaignFloat(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID);

// This will read a string from the specified campaign database
// The database name IS case sensitive and it must be the same for both set and get functions.
// If you want a variable to pertain to a specific player in the game, provide a player object.
//
// improvements to original bioware function:
// improved reading speed...
// there is no limit on the length of sVarname (original function is limited to 32 chars)
// sVarname must NOT be unique. you can use the same sVarname with a different data-type
string NBDE_GetCampaignString(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID);

// This will read a location from the specified campaign database
// The database name IS case sensitive and it must be the same for both set and get functions.
// If you want a variable to pertain to a specific player in the game, provide a player object.
//
// improvements to original bioware function:
// improved reading speed...
// there is no limit on the length of sVarname (original function is limited to 32 chars)
// sVarname must NOT be unique. you can use the same sVarname with a different data-type
//
// original function is not very reliable, because it is using the areas object-id, which is
// a runtime generated ID. stored locations can get invalid if you change the area layout via toolset.
// (e.g. deleting old areas)
//
// this function is 100% reliable, as long as you use unique TAGs for your areas
location NBDE_GetCampaignLocation(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID);

// This will read a vector from the specified campaign database
// The database name IS case sensitive and it must be the same for both set and get functions.
// If you want a variable to pertain to a specific player in the game, provide a player object.
//
// improvements to original bioware function:
// improved reading speed...
// there is no limit on the length of sVarname (original function is limited to 32 chars)
// sVarname must NOT be unique. you can use the same sVarname with a different data-type
vector NBDE_GetCampaignVector(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID);

// this will remove an integer from the specified campaign database
//
// improvements to original bioware function:
// this will physically delete the variable from the database, not only flagging it
// database will shrink in size
// no need to pack your database ever
void NBDE_DeleteCampaignInt(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID);

// this will remove a float from the specified campaign database
//
// improvements to original bioware function:
// this will physically delete the variable from the database, not only flagging it
// database will shrink in size
// no need to pack your database ever
void NBDE_DeleteCampaignFloat(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID);

// this will remove a string from the specified campaign database
//
// improvements to original bioware function:
// this will physically delete the variable from the database, not only flagging it
// database will shrink in size
// no need to pack your database ever
void NBDE_DeleteCampaignString(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID);

// this will remove a location from the specified campaign database
//
// improvements to original bioware function:
// this will physically delete the variable from the database, not only flagging it
// database will shrink in size
// no need to pack your database ever
void NBDE_DeleteCampaignLocation(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID);

// this will remove a vector from the specified campaign database
//
// improvements to original bioware function:
// this will physically delete the variable from the database, not only flagging it
// database will shrink in size
// no need to pack your database ever
void NBDE_DeleteCampaignVector(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID);

// this will flush a database to disk with a SINGLE StoreCampaignObject() call
void NBDE_FlushSingleCampaignDatabase(string sCampaignName);

// serialize location to string
string NBDE_LocationToString(location lLoc)
{
  // serialization garbage... more or less "redo if it screws" code
  string sLoc = IntToString(FloatToInt(GetPositionFromLocation(lLoc).x*100));
  sLoc = (GetStringLength(sLoc) < 5) ? sLoc + GetStringLeft("     ",5 - GetStringLength(sLoc)) : GetStringLeft(sLoc,5);
  sLoc += IntToString(FloatToInt(GetPositionFromLocation(lLoc).y*100));
  sLoc = (GetStringLength(sLoc) < 10) ? sLoc + GetStringLeft("     ",10 - GetStringLength(sLoc)) : GetStringLeft(sLoc,10);
  sLoc += IntToString(FloatToInt(GetPositionFromLocation(lLoc).z*100));
  sLoc = (GetStringLength(sLoc) < 15) ? sLoc + GetStringLeft("     ",15 - GetStringLength(sLoc)) : GetStringLeft(sLoc,15);
  sLoc += IntToString(FloatToInt(GetFacingFromLocation(lLoc)*100));
  sLoc = (GetStringLength(sLoc) < 20) ? sLoc + GetStringLeft("     ",20 - GetStringLength(sLoc)) : GetStringLeft(sLoc,20);
  sLoc += GetTag(GetAreaFromLocation(lLoc));
  sLoc = (GetStringLength(sLoc) < 52) ? sLoc + GetStringLeft("                                ",52 - GetStringLength(sLoc)) : GetStringLeft(sLoc,52);
  return sLoc;
}

// de-serialize string to location
location NBDE_StringToLocation(string sLoc)
{
  // fast de-serialize code using padded strings
  // get location
  vector vVec;
  vVec.x = StringToFloat(GetStringLeft(sLoc,5)) / 100;
  vVec.y = StringToFloat(GetSubString(sLoc,5,5)) / 100;
  vVec.z = StringToFloat(GetSubString(sLoc,10,5)) / 100;;
  int nPad = FindSubString(GetSubString(sLoc, 20,32)," ");
  return Location(GetObjectByTag((nPad != -1) ? GetSubString(sLoc, 20,nPad) : GetSubString(sLoc, 20,32)), vVec, StringToFloat(GetSubString(sLoc,15,5)) / 100);
}

string NBDE_VectorToString(vector vVec)
{
  string sVec = IntToString(FloatToInt(vVec.x*100));
  sVec = (GetStringLength(sVec) < 5) ? sVec + GetStringLeft("     ",5 - GetStringLength(sVec)) : GetStringLeft(sVec,5);
  sVec += IntToString(FloatToInt(vVec.y*100));
  sVec = (GetStringLength(sVec) < 10) ? sVec + GetStringLeft("     ",10 - GetStringLength(sVec)) : GetStringLeft(sVec,10);
  sVec += IntToString(FloatToInt(vVec.z*100));
  sVec = (GetStringLength(sVec) < 15) ? sVec + GetStringLeft("     ",15 - GetStringLength(sVec)) : GetStringLeft(sVec,15);
  return sVec;
}

vector NBDE_StringToVector(string sVec)
{
  vector vVec;
  vVec.x = StringToFloat(GetStringLeft(sVec,5)) / 100;
  vVec.y = StringToFloat(GetSubString(sVec,5,5)) / 100;
  vVec.z = StringToFloat(GetSubString(sVec,10,5)) / 100;
  return vVec;
}

// returns player key with hopefully safe delimiter
string NBDE_GetPlayerKey(object oPC)
{
  return GetName(oPC)+"¤"+GetPCPlayerName(oPC);
}

void NBDE_FlushSingleCampaignDatabase(string sCampaignName)
{
  // get database vault, it holds all database items
  object oVault = GetObjectByTag("NBDE_VAULT");
  if(GetIsObjectValid(oVault))
  {
    // get database item
    object oDatabase = GetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName);
    // store the whole database via one single StoreCampaignObject call
    // all variables on the item get stored with the item
    if(GetIsObjectValid(oDatabase))
    {
      // delete database on each flush to keep it compact and clean
      DestroyCampaignDatabase(sCampaignName);
      // store database
      StoreCampaignObject(sCampaignName, NBDE_DATABASE_ITEM_VARNAME , oDatabase);
    }
    else
    {
      // try to load the database
      oDatabase = RetrieveCampaignObject(sCampaignName, NBDE_DATABASE_ITEM_VARNAME, GetLocation(oVault), oVault);
      if(GetIsObjectValid(oDatabase))
        SetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName, oDatabase);
      else
        WriteTimestampedLogEntry("NBDE> Error: Unknown Database ["+sCampaignName+"]");
    }
  }
  else // vault container missing
    WriteTimestampedLogEntry("NBDE> Error: Missing NBDE Database Vault Container");
}

void NBDE_SetCampaignVariable(string sCampaignName, string sVarname, int nInt = 0, float fFloat = 0.0, string sString = "", object oPlayer = OBJECT_INVALID, int nVarType = NBDE_VARTYPE_INT)
{
  // get database vault, it holds all database items
  object oVault = GetObjectByTag("NBDE_VAULT");
  // get player key if needed
  string sPlayerKey = (GetIsObjectValid(oPlayer)) ? NBDE_GetPlayerKey(oPlayer) : "";
  // get database item
  object oDatabase = GetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName);
  // load database item or create new one if needed
  if(!GetIsObjectValid(oDatabase))
  {
    // try to load the item
    oDatabase = RetrieveCampaignObject(sCampaignName, NBDE_DATABASE_ITEM_VARNAME, GetLocation(oVault), oVault);
    // not found ? create it
    if(!GetIsObjectValid(oDatabase)) oDatabase = CreateItemOnObject("nbde_database", oVault);
    // index item for fast access
    SetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName, oDatabase);
  }
  // set variable on database item
  switch(nVarType)
  {
    case NBDE_VARTYPE_INT: SetLocalInt(oDatabase, sPlayerKey + sVarname, nInt); break;
    case NBDE_VARTYPE_FLOAT: SetLocalFloat(oDatabase, sPlayerKey + sVarname, fFloat); break;
    case NBDE_VARTYPE_STRING: SetLocalString(oDatabase, sPlayerKey + sVarname, sString); break;
  }
}

void NBDE_SetCampaignInt(string sCampaignName, string sVarname, int nInt, object oPlayer = OBJECT_INVALID)
{
  NBDE_SetCampaignVariable(sCampaignName, sVarname, nInt, 0.0, "", oPlayer, NBDE_VARTYPE_INT);
}

void NBDE_SetCampaignFloat(string sCampaignName, string sVarname, float flFloat, object oPlayer = OBJECT_INVALID)
{
  NBDE_SetCampaignVariable(sCampaignName, sVarname, 0, flFloat, "", oPlayer, NBDE_VARTYPE_FLOAT);
}

void NBDE_SetCampaignString(string sCampaignName, string sVarname, string sString, object oPlayer = OBJECT_INVALID)
{
  NBDE_SetCampaignVariable(sCampaignName, sVarname, 0, 0.0, sString, oPlayer, NBDE_VARTYPE_STRING);
}

void NBDE_SetCampaignLocation(string sCampaignName, string sVarname, location locLocation, object oPlayer = OBJECT_SELF)
{
  // get database vault, it holds all database items
  object oVault = GetObjectByTag("NBDE_VAULT");
  // get player key if needed
  string sPlayerKey = (GetIsObjectValid(oPlayer)) ? NBDE_GetPlayerKey(oPlayer) : "";

  // get database item
  object oDatabase = GetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName);
  // load database item or create new one if needed
  if(!GetIsObjectValid(oDatabase))
  {
    // try to load the item
    oDatabase = RetrieveCampaignObject(sCampaignName, NBDE_DATABASE_ITEM_VARNAME, GetLocation(oVault), oVault);
    // not found ? create it
    if(!GetIsObjectValid(oDatabase)) oDatabase = CreateItemOnObject("nbde_database", oVault);
    // index item for fast access
    SetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName, oDatabase);
  }
  SetLocalString(oDatabase, "¥Æ¥" + sPlayerKey + sVarname, NBDE_LocationToString(locLocation));
}

void NBDE_SetCampaignVector(string sCampaignName, string sVarname, vector vVector, object oPlayer = OBJECT_SELF)
{
  // get database vault, it holds all database items
  object oVault = GetObjectByTag("NBDE_VAULT");
  // get player key if needed
  string sPlayerKey = (GetIsObjectValid(oPlayer)) ? NBDE_GetPlayerKey(oPlayer) : "";

  // get database item
  object oDatabase = GetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName);
  // load database item or create new one if needed
  if(!GetIsObjectValid(oDatabase))
  {
    // try to load the item
    oDatabase = RetrieveCampaignObject(sCampaignName, NBDE_DATABASE_ITEM_VARNAME, GetLocation(oVault), oVault);
    // not found ? create it
    if(!GetIsObjectValid(oDatabase)) oDatabase = CreateItemOnObject("nbde_database", oVault);
    // index item for fast access
    SetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName, oDatabase);
  }
  SetLocalString(oDatabase, "ø£ø" + sPlayerKey + sVarname, NBDE_VectorToString(vVector));
}

int NBDE_GetCampaignInt(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID)
{
  // get database vault, it holds all database items
  object oVault = GetObjectByTag("NBDE_VAULT");
  // get player key if needed
  string sPlayerKey = (GetIsObjectValid(oPlayer)) ? NBDE_GetPlayerKey(oPlayer) : "";
  // get database item
  object oDatabase = GetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName);
  if(!GetIsObjectValid(oDatabase))
  {
    // one time load
    oDatabase = RetrieveCampaignObject(sCampaignName, NBDE_DATABASE_ITEM_VARNAME, GetLocation(oVault), oVault);
    // index item for fast access
    if(GetIsObjectValid(oDatabase)) SetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName, oDatabase);
  }
  // get variable from database item
  return GetLocalInt(oDatabase, sPlayerKey + sVarname);
}

float NBDE_GetCampaignFloat(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID)
{
  // get database vault, it holds all database items
  object oVault = GetObjectByTag("NBDE_VAULT");
  // get player key if needed
  string sPlayerKey = (GetIsObjectValid(oPlayer)) ? NBDE_GetPlayerKey(oPlayer) : "";
  // get database item
  object oDatabase = GetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName);
  if(!GetIsObjectValid(oDatabase))
  {
    // one time load
    oDatabase = RetrieveCampaignObject(sCampaignName, NBDE_DATABASE_ITEM_VARNAME, GetLocation(oVault), oVault);
    // index item for fast access
    if(GetIsObjectValid(oDatabase)) SetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName, oDatabase);
  }
  // get variable from database item
  return GetLocalFloat(oDatabase, sPlayerKey + sVarname);
}

string NBDE_GetCampaignString(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID)
{
  // get database vault, it holds all database items
  object oVault = GetObjectByTag("NBDE_VAULT");
  // get player key if needed
  string sPlayerKey = (GetIsObjectValid(oPlayer)) ? NBDE_GetPlayerKey(oPlayer) : "";
  // get database item
  object oDatabase = GetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName);
  if(!GetIsObjectValid(oDatabase))
  {
    // one time load
    oDatabase = RetrieveCampaignObject(sCampaignName, NBDE_DATABASE_ITEM_VARNAME, GetLocation(oVault), oVault);
    // index item for fast access
    if(GetIsObjectValid(oDatabase)) SetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName, oDatabase);
  }
  // get variable from database item
  return GetLocalString(oDatabase, sPlayerKey + sVarname);
}

location NBDE_GetCampaignLocation(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID)
{
  // get database vault, it holds all database items
  object oVault = GetObjectByTag("NBDE_VAULT");
  // get player key if needed
  string sPlayerKey = (GetIsObjectValid(oPlayer)) ? NBDE_GetPlayerKey(oPlayer) : "";
  // get database item
  object oDatabase = GetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName);
  if(!GetIsObjectValid(oDatabase))
  {
    // one time load
    oDatabase = RetrieveCampaignObject(sCampaignName, NBDE_DATABASE_ITEM_VARNAME, GetLocation(oVault), oVault);
    // index item for fast access
    if(GetIsObjectValid(oDatabase)) SetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName, oDatabase);
  }
  // get location from database item
  return NBDE_StringToLocation(GetLocalString(oDatabase, "¥Æ¥" + sPlayerKey + sVarname));
}

vector NBDE_GetCampaignVector(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID)
{
  // get database vault, it holds all database items
  object oVault = GetObjectByTag("NBDE_VAULT");
  // get player key if needed
  string sPlayerKey = (GetIsObjectValid(oPlayer)) ? NBDE_GetPlayerKey(oPlayer) : "";
  // get database item
  object oDatabase = GetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName);
  if(!GetIsObjectValid(oDatabase))
  {
    // one time load
    oDatabase = RetrieveCampaignObject(sCampaignName, NBDE_DATABASE_ITEM_VARNAME, GetLocation(oVault), oVault);
    // index item for fast access
    if(GetIsObjectValid(oDatabase)) SetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName, oDatabase);
  }
  // get location from database item
  return NBDE_StringToVector(GetLocalString(oDatabase, "ø£ø" + sPlayerKey + sVarname));
}

void NBDE_DeleteCampaignVariable(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID, int nVarType = NBDE_VARTYPE_INT)
{
  // get database vault, it holds all database items
  object oVault = GetObjectByTag("NBDE_VAULT");
  // get player key if needed
  string sPlayerKey = (GetIsObjectValid(oPlayer)) ? NBDE_GetPlayerKey(oPlayer) : "";
  // get database item
  object oDatabase = GetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName);
  // empty cache ? load it
  if(!GetIsObjectValid(oDatabase))
  {
     // load database (one-time)
     oDatabase = RetrieveCampaignObject(sCampaignName, NBDE_DATABASE_ITEM_VARNAME, GetLocation(oVault), oVault);
     // not found ? no database > return
     if(!GetIsObjectValid(oDatabase)) return;
     // index item for fast access
     SetLocalObject(oVault, "NBDE_DATABASE_"+sCampaignName, oDatabase);
  }
  // delete variable from database item
  switch(nVarType)
  {
    case NBDE_VARTYPE_INT: DeleteLocalInt(oDatabase, sPlayerKey + sVarname); break;
    case NBDE_VARTYPE_FLOAT: DeleteLocalFloat(oDatabase, sPlayerKey + sVarname); break;
    case NBDE_VARTYPE_STRING: DeleteLocalString(oDatabase, sPlayerKey + sVarname); break;
    case NBDE_VARTYPE_LOCATION: DeleteLocalString(oDatabase, "¥Æ¥" + sPlayerKey + sVarname); break;
    case NBDE_VARTYPE_VECTOR: DeleteLocalString(oDatabase, "ø£ø" + sPlayerKey + sVarname); break;
  }
}

void NBDE_DeleteCampaignInt(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID)
{
  NBDE_DeleteCampaignVariable(sCampaignName, sVarname, oPlayer, NBDE_VARTYPE_INT);
}

void NBDE_DeleteCampaignFloat(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID)
{
  NBDE_DeleteCampaignVariable(sCampaignName, sVarname, oPlayer, NBDE_VARTYPE_FLOAT);
}

void NBDE_DeleteCampaignString(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID)
{
  NBDE_DeleteCampaignVariable(sCampaignName, sVarname, oPlayer, NBDE_VARTYPE_STRING);
}

void NBDE_DeleteCampaignLocation(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID)
{
  NBDE_DeleteCampaignVariable(sCampaignName, sVarname, oPlayer, NBDE_VARTYPE_LOCATION);
}

void NBDE_DeleteCampaignVector(string sCampaignName, string sVarname, object oPlayer = OBJECT_INVALID)
{
  NBDE_DeleteCampaignVariable(sCampaignName, sVarname, oPlayer, NBDE_VARTYPE_VECTOR);
}


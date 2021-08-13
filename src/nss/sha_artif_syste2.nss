//This is a very out-dated database system for storing artifacts. It's best that you not use it
//as it is somewhat unreliable.

const int ENABLE_ARTIFACT_SYSTEM = FALSE;
string ARTIFACT_DATABASE = "ARTIFACT_DB";
string ARTIFACT_TAG = "RHUN_ARTIFACT";
string ARTIFACT_COUNT = "ARTIFACT_COUNT";
string ARTIFACT_CHEST_TAG = "ARTIFACT_CHEST";
string ARTIFACT_DETECT_DB = "ARTIFACT_DETECT_DB";
void WriteToArtifactLogDB(object oItem, object oCreature, int iCategory);
object GetArtifactChest()
{
   object oChest = GetObjectByTag(ARTIFACT_CHEST_TAG);
   return oChest;
}
int GetIsArtifact(object oItem)
{
   string sTag = GetTag(oItem);
   if(FindSubString(sTag, ARTIFACT_TAG) >= 0)
   {
      return TRUE;
   }
   return FALSE;
}
int ArtifactCount()
{
  return GetCampaignInt(ARTIFACT_DATABASE, ARTIFACT_COUNT);
}
void SetArtifactCount(int iCount)
{
   SetCampaignInt(ARTIFACT_DATABASE, ARTIFACT_COUNT, iCount);
}
void DecreaseArtifactCount()
{
  int iCount = ArtifactCount();
  iCount--;
  SetArtifactCount(iCount);
}
void IncreaseArtifactCount()
{
  int iCount = ArtifactCount();
  iCount = iCount + 1;
  SetArtifactCount(iCount);
}
void StoreArtifact(object oArtifact)
{
    int iCount = ArtifactCount();
    StoreCampaignObject(ARTIFACT_DATABASE, ARTIFACT_TAG + IntToString(iCount + 1), oArtifact);
}

object RetrieveArtifact(int iNumber, object oNewOwner)
{
    location lOwnerLoc = GetLocation(oNewOwner);
    object oItem = RetrieveCampaignObject(ARTIFACT_DATABASE, ARTIFACT_TAG + IntToString(iNumber), lOwnerLoc, oNewOwner);
    return oItem;
}

void OnArtifactAcquire()
{
    object oItem = GetModuleItemAcquired();
    object oCreature = GetModuleItemAcquiredBy();
    if(GetIsDM(oCreature))
    {  return; }
    if(GetIsArtifact(oItem))
    {
       if(GetIsPC(oCreature))
       {
          WriteToArtifactLogDB(oItem, oCreature, 200);
       }
       else
       {
          WriteToArtifactLogDB(oItem, oCreature, 100);
       }

    }
}



int ArtifactPickedUpCount()
{
   int iCount = GetCampaignInt(ARTIFACT_DETECT_DB, "ARTS_PICKED_COUNT");
   return iCount;
}

void SetPickedUpArtifactCount(int iCount)
{
  SetCampaignInt(ARTIFACT_DETECT_DB, "ARTS_PICKED_COUNT", iCount);
}

void IncreasePickedUpCount()
{
   int iCount =  ArtifactPickedUpCount();
   iCount++;
   SetPickedUpArtifactCount(iCount);
}
void DecreasePickedUpCount()
{
   int iCount =  ArtifactPickedUpCount();
   iCount--;
   SetPickedUpArtifactCount(iCount);
}

int ArtifactSpawnedCount()
{
   int iCount = GetCampaignInt(ARTIFACT_DETECT_DB, "ARTS_COUNT");
   return iCount;
}

void SetSpawnedArtifactCount(int iCount)
{
  SetCampaignInt(ARTIFACT_DETECT_DB, "ARTS_COUNT", iCount);
}

void IncreaseSpawnedCount()
{
   int iCount =  ArtifactSpawnedCount();
   iCount++;
   SetSpawnedArtifactCount(iCount);
}
void DecreaseSpawnedCount()
{
   int iCount =  ArtifactSpawnedCount();
   iCount--;
   SetSpawnedArtifactCount(iCount);
}

void WriteToArtifactLogDB(object oItem, object oCreature, int iCategory)
{

   //spawned on creature
   if(iCategory == 100)
   {
       int iCount =  ArtifactSpawnedCount();
       SetCampaignString(ARTIFACT_DETECT_DB, "ARTIFACT_ITEM_" + IntToString(iCount + 1), GetName(oItem));
       SetCampaignString(ARTIFACT_DETECT_DB, "ARTIFACT_ITEM_ON_" + IntToString(iCount + 1), GetName(oCreature));
       IncreaseSpawnedCount();
   }
   else if(iCategory == 200)
   {
       //Added since AcquireItem events fires onEntry as well >.<
       int Spawned = GetCampaignInt(ARTIFACT_DETECT_DB, "ARTIFACT_" + GetResRef(oItem));
       if(Spawned)
       { return; }

       int iCount = ArtifactPickedUpCount();
       SetCampaignString(ARTIFACT_DETECT_DB, "ARTIFACT_PICKEDUP_" + IntToString(iCount + 1), GetName(oItem));
       SetCampaignString(ARTIFACT_DETECT_DB, "ARTIFACT_PICKEDUP_BY_" + IntToString(iCount + 1), GetName(oCreature));
       SetCampaignInt(ARTIFACT_DETECT_DB, "ARTIFACT_" + GetResRef(oItem), TRUE);
       IncreasePickedUpCount();
   }
}

void ReadArtifactDBLogToUser(object oPC)
{
    SendMessageToPC(oPC, "------Reading Artifact DB Log: ------");
    int iCount =  ArtifactSpawnedCount();
    string ItemName;
    string Owner;
    int i = 1;
    SendMessageToPC(oPC, " ");
    SendMessageToPC(oPC, "List of Spawned Items and Creatures who spawned them:");
    SendMessageToPC(oPC, " ");
    while(i != iCount)
    {
       if(iCount == 0)
       { break; }
       ItemName = GetCampaignString(ARTIFACT_DETECT_DB, "ARTIFACT_ITEM_" + IntToString(i));
       Owner = GetCampaignString(ARTIFACT_DETECT_DB, "ARTIFACT_ITEM_ON_" + IntToString(i));
       SendMessageToPC(oPC, IntToString(i) + ".     " + ItemName + " was spawned on: " + Owner);
       i++;
    }
    iCount =  ArtifactPickedUpCount();
    i = 1;
    SendMessageToPC(oPC, " ");
    SendMessageToPC(oPC, "List of Pickedup Items and Players who acquired them:");
    SendMessageToPC(oPC, " ");
    while(i != iCount)
    {
       if(iCount == 0)
       { break; }
       ItemName = GetCampaignString(ARTIFACT_DETECT_DB, "ARTIFACT_PICKEDUP_" + IntToString(i));
       Owner =  GetCampaignString(ARTIFACT_DETECT_DB, "ARTIFACT_PICKEDUP_BY_" + IntToString(i));
       SendMessageToPC(oPC, IntToString(i) + ".     " + ItemName + " was pickedup by: " + Owner);
       i++;
    }
    SendMessageToPC(oPC, " ");
    SendMessageToPC(oPC, "-----------End of List------------");
}
object SpawnArtifactOnCreature(int iRandom, object Owner)
{
  int iMax = ArtifactCount();
  //out of artifacts
  if(iMax == 0)
  {
     return OBJECT_INVALID;
  }
  object oArtifact = RetrieveArtifact(iRandom, Owner);
  //If it is not the last artifact in the order...
  if(iRandom != iMax)
  {
      object oChest = GetArtifactChest();
      object LastArtifact = RetrieveArtifact(iMax, oChest);
      StoreCampaignObject(ARTIFACT_DATABASE, ARTIFACT_TAG + IntToString(iRandom), LastArtifact);
      SetPlotFlag(LastArtifact, FALSE);
      DestroyObject(LastArtifact);
   }
  DecreaseArtifactCount();
  return oArtifact;
}

void InitializeArtifactContainer()
{
  if(!ENABLE_ARTIFACT_SYSTEM)
  { return; }

  object oCont = GetArtifactChest();
  //Do this only once.
  if(!GetLocalInt(oCont, "CHEST_INITIALIZED"))
  {
      //Chest initializes only once -ever.
      if(GetCampaignInt(ARTIFACT_DATABASE, "CHEST_LOADED"))
      {
        SetLocalInt(oCont, "CHEST_INITIALIZED", TRUE);
        //Get rid of the existing artifacts that have been added to the database,
        //but in the container.
        object oItem = GetFirstItemInInventory(oCont);
        while(GetIsObjectValid(oItem))
        {
           SetPlotFlag(oItem, FALSE);
           DestroyObject(oItem, 0.1);
           oItem = GetNextItemInInventory(oCont);
        }
        return;
      }
      else
      {
         object oItem = GetFirstItemInInventory(oCont);
         while(GetIsObjectValid(oItem))
          {
             StoreArtifact(oItem);
             IncreaseArtifactCount();
             SetPlotFlag(oItem, FALSE);
             DestroyObject(oItem, 0.1);
             oItem = GetNextItemInInventory(oCont);
          }
        SetCampaignInt(ARTIFACT_DATABASE, "CHEST_LOADED", TRUE);

      }
  }
  else
  {
     return;
  }
}

void ArtifactChestOnClose()
{
   object oCont = OBJECT_SELF;
   object oUser = GetLastClosedBy();
   SendMessageToPC(oUser, "Adding items to the artifact chest...");
   object oItem = GetFirstItemInInventory (oCont);
   int Count = ArtifactCount();
   while(GetIsObjectValid(oItem))
   {
     StoreArtifact(oItem);
     DestroyObject(oItem, 0.1);
     Count++;
     oItem = GetNextItemInInventory(oCont);
   }
   SetArtifactCount(Count);
   SendMessageToPC(oUser, "Items were added to the artifact chest successfully.");
}

void SendArtifactCountMessage(object oPlayer)
{
   SendMessageToPC(oPlayer, "Server Artifact Count: " + IntToString(ArtifactCount()));
}

void DeleteArtifactDatabase()
{
   DestroyCampaignDatabase(ARTIFACT_DATABASE);
   DestroyCampaignDatabase(ARTIFACT_DETECT_DB);
}

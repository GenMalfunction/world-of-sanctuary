// Stops all camera movements immediately
    // oPC              the player whose camera movements you want to stop
    // iParty           sets whether to stop the camera of only oPC (0), all the players in oPC's party (1) or all the players on the server (2)
// DO NOT CHANGE THE FOLLOWING SETTINGS!
    // bAuto            sets whether the function should stop all camera movement (TRUE) or only ones with an id lower than iCamID (FALSE)
    // iCamID           the ID of the last camera move you want to stop (this is only needed if bAuto is set to FALSE)
void GestaltStopCameraMoves(object oPC, int iParty = 0, int bAuto = TRUE, int iCamID = 0);

// Gets the vector linking object A to object B
vector GetVectorAB(object oA, object oB);

// Finds the horizontal distance between two objects, ignoring any vertical component
float GetHorizontalDistanceBetween(object oA, object oB);

// Finds the compass direction from the PC to a target object
float GestaltGetDirection(object oTarget, object oPC);

// Turns a character and/or their camera to face the specified target object
    // oTarget          the object to face
    // fRange           the distance between the player and the camera
    // fPitch           the vertical tilt of the camera
                        // NOTE that fRange and/or fPitch can be set to -1.0 to keep the camera's range and/or pitch unchanged
    // oPC              the character you want to move
                        // NOTE that this can be an NPC, as long as iFace == 2
    // iFace            sets whether the camera (0), the character (2) or both (1) turn to face the specified direction
                        // NOTE that fRange and fPitch won't do anything if iFace == 2, as only the character is being moved
    // iParty           sets whether to move the camera of only oPC (0), all the players in oPC's party (1) or all the players on the server (2)
    // iCamID           the ID of the camera movement - DO NOT CHANGE THIS!
void GestaltFaceTarget(object oTarget, float fRange, float fPitch, object oPC, int iFace, int iParty = 0, int iCamID = 0);

// Moves the camera smoothly from one position to another over the specified time
    // STARTING TIME -
        // fDelay           how many seconds to wait before starting the movement
    // STARTING CONDITIONS -
        // fDirection       initial direction (0.0 = due east)
        // fRange           initial distance between player and camera
        // fPitch           initial pitch (vertical tilt)
    // FINAL CONDITIONS -
        // fDirection2      finishing direction
        // fRange2          finishing distance
        // fPitch2          finishing tilt
    // TIME SETTINGS -
        // fTime            number of seconds it takes camera to complete movement
        // fFrameRate       number of movements per second (governs how smooth the motion is)
    // MISC SETTINGS -
        // oPC              the PC you want to apply the camera movement to
        // iClockwise       set to 1 if you want the camera to rotate clockwise, 0 for anti-clockwise, or 2 for auto-select
        // iFace            sets whether the camera (0), the character (2) or both (1) turn to face the specified direction
        // iParty           sets whether to move the camera of only oPC (0), all the players in oPC's party (1) or all the players on the server (2)
void GestaltCameraMove(float fDelay, float fDirection, float fRange, float fPitch, float fDirection2, float fRange2, float fPitch2, float fTime, float fFrameRate, object oPC, int iClockwise = 0, int iFace = 0, int iParty = 0);

// Produces smooth transitions between different camera movements by setting initial and final speeds
// The function then interpolates between the two so that the movement rate changes smoothly over the
//  duration of the movement.
    // STARTING TIME -
        // fDelay           how many seconds to wait before starting the movement
    // MOVEMENT RATES AT START OF MOTION -
        // fdDirection1     how fast the camera's compass direction should change by in degrees per second
                            // positive numbers produce an anti-clockwise movement, negative anti-clockwise
        // fdRange1         how fast the camera's range should change in meters per second
                            // positive numbers move the camera away from the player, negative towards them
        // fdPitch1         how fast the camera's pitch should change in degrees per second
                            // positive numbers tilt the camera down towards the ground, negative up towards vertical
    // MOVEMENT RATES AT END OF MOTION -
        // fdDirection2     how fast the camera's compass direction should change by in degrees per second
                            // positive numbers produce an anti-clockwise movement, negative anti-clockwise
        // fdRange2         how fast the camera's range should change in meters per second
                            // positive numbers move the camera away from the player, negative towards them
        // fdPitch2         how fast the camera's pitch should change in degrees per second
                            // positive numbers tilt the camera down towards the ground, negative up towards vertical
    // TIME SETTINGS -
        // fTime            number of seconds it should take the camera to complete movement
        // fFrameRate       number of movements per second (governs how smooth the motion is)
    // MISC SETTINGS -
        // oPC              the player whose camera you want to move
        // iParty           sets whether to move the camera of only oPC (0), all the players in oPC's party (1) or all the players on the server (2)
        // iSync            sets whether to use separate camera starting positions for every player (0) or sync them all to oPC's camera position (1)
void GestaltCameraSmooth(float fDelay, float fdDirection1, float fdRange1, float fdPitch1, float fdDirection2, float fdRange2, float fdPitch2, float fTime, float fFrameRate, object oPC, int iParty = 0, int iSync = 1);

// Turns the camera and/or player between two objects
// NOTE that this will only work properly if the player and target objects are stationary while the function is active
    // STARTING TIME -
        // fDelay           how many seconds to wait before starting the movement
    // STARTING CONDITIONS -
        // oStart           object to face at start of movement
        // fRange           initial distance between player and camera
        // fPitch           initial pitch (vertical tilt)
    // FINAL CONDITIONS -
        // oEnd             object to finish movement facing
        // fRange2          finishing distance
        // fPitch2          finishing tilt
    // TIME SETTINGS -
        // fTime            number of seconds it takes camera to complete movement
        // fFrameRate       number of movements per second (governs how smooth the motion is)
    // MISC SETTINGS -
        // oPC              the player whose camera you want to move
        // iClockwise       set to 1 if you want the camera to rotate clockwise, 0 for anti-clockwise, or 2 for auto-select
        // iFace            controls whether the camera (0), the character (2) or both (1) turn
        // iParty           sets whether to move the camera of only oPC (0), all the players in oPC's party (1) or all the players on the server (2)
void GestaltCameraFace(float fDelay, object oStart, float fRange, float fPitch, object oEnd, float fRange2, float fPitch2, float fTime, float fFrameRate, object oPC, int iClockwise = 0, int iFace = 0, int iParty = 0);

// Tracks a moving object, turning the player's camera so that it always faces towards it
    // STARTING TIME -
        // fDelay           how many seconds to wait before starting the movement
    // TARGET -
        // oTrack           object to track the movement of
    // STARTING CONDITIONS -
        // fRange           initial distance between player and camera
        // fPitch           initial pitch (vertical tilt)
    // FINAL CONDITIONS -
        // fRange2          finishing distance
        // fPitch2          finishing tilt
    // TIME SETTINGS -
        // fTime            how long the camera will track the object for
        // fFrameRate       number of movements per second (governs how smooth the motion is)
    // MISC SETTINGS -
        // oPC              the PC you want to apply the camera movement to
        // iFace            controls whether the camera (0), the character (2) or both (1) turn
        // iParty           sets whether to move the camera of only oPC (0), all the players in oPC's party (1) or all the players on the server (2)
void GestaltCameraTrack(float fDelay, object oTrack, float fRange, float fPitch, float fRange2, float fPitch2, float fTime, float fFrameRate, object oPC, int iFace = 0, int iParty = 0);

// Gives the illusion of the camera being fixed in one place and rotating to face the player as they move
    // oPC              the PC you want to apply the camera movement to
    // fFrameRate       number of movements per second (governs how smooth the motion is)
//
// To setup a fixed camera position, place a waypoint with a unique tag in your area
    // Set the camera's tag as a LocalString "sGestaltFixedCamera" on the PC to let them know to use that camera
    // Set a LocalFloat "fGestaltFixedCamera" on the PC to set the camera's vertical position
    // Set "sGestaltFixedCamera" to "" to pause the tracking, or to "STOP" to end the tracking
void GestaltFixedCamera(object oPC, float fFrameRate = 50.0);




void GestaltDebugOutput(object oPC)
{
    // Get the current position of oPC's camera
    float fDirection = GetLocalFloat(oPC,"fCameraDirection");
    float fRange = GetLocalFloat(oPC,"fCameraRange");
    float fPitch = GetLocalFloat(oPC,"fCameraPitch");

    // Fire a message to say where the camera is
    AssignCommand(oPC,SpeakString(FloatToString(fDirection) + ", " + FloatToString(fRange) + ", " + FloatToString(fPitch)));
}



void GestaltStopCameraMoves(object oPC, int iParty = 0, int bAuto = TRUE, int iCamID = 0)
{
    object oParty;
    string sCam;
    int iCount;

    if (iParty == 1)      { oParty = GetFirstFactionMember(oPC); }
    else if (iParty == 2) { oParty = GetFirstPC(); }
    else                  { oParty = oPC; }

    while (GetIsObjectValid(oParty))
        {
        if (bAuto)
            { iCamID = GetLocalInt(oParty,"iCamCount"); }

        iCount = iCamID;

        while (iCount > 0)
            {
            // Find the camera movement
            sCam = "iCamStop" + IntToString(iCount);
            SetLocalInt(oParty,sCam,1);
            iCount--;

            // Uncomment the line below to get a message in the game confirming each id which is cancelled
            // AssignCommand(oParty,SpeakString("Camera movement id " + IntToString(iCount) + "has been stopped"));
            }

        if (iParty == 1)                       { oParty = GetNextFactionMember(oParty,TRUE); }
        else if (iParty == 2)                  { oParty = GetNextPC(); }
        else                                   { return; }
        }
}



vector GetVectorAB(object oA, object oB)
{
    vector vA = GetPosition(oA);
    vector vB = GetPosition(oB);
    vector vDelta = (vA - vB);
    return vDelta;
}



float GetHorizontalDistanceBetween(object oA, object oB)
{
    vector vHorizontal = GetVectorAB(oA,oB);
    float fDistance = sqrt(pow(vHorizontal.x,2.0) + pow(vHorizontal.y,2.0));
    return fDistance;
}



float GestaltGetDirection(object oTarget, object oPC)
{
    vector vdTarget = GetVectorAB(oTarget,oPC);
    float fDirection = VectorToAngle(vdTarget);
    return fDirection;
}



void GestaltCameraPoint(float fDirection, float fRange, float fPitch, float fdDirection, float fdRange, float fdPitch, float fd2Direction, float fd2Range, float fd2Pitch, float fCount, object oPC, int iCamID, int iFace = 0)
{
    // Check whether this camera movement has been stopped
    string sCam = "iCamStop" + IntToString(iCamID);
    if (GetLocalInt(oPC,sCam) == 1)
        { return; }

    // Work out where to point the camera
    fDirection = fDirection + ((fd2Direction * pow(fCount,2.0)) / 2) + (fdDirection * fCount);
    fRange = fRange + ((fd2Range * pow(fCount,2.0)) / 2) + (fdRange * fCount);
    fPitch = fPitch + ((fd2Pitch * pow(fCount,2.0)) / 2) + (fdPitch * fCount);

    // Reset fDirectionNew if it's gone past 0 or 360 degrees
    while (fDirection < 0.0)    { fDirection = (fDirection + 360.0); }
    while (fDirection > 360.0)  { fDirection = (fDirection - 360.0); }

    // Set the camera and/or player facing, according to iFace
    if (iFace < 2)        { AssignCommand(oPC,SetCameraFacing(fDirection,fRange,fPitch)); }
    if (iFace > 0)        { AssignCommand(oPC,SetFacing(fDirection)); }

    // Store the current position of the camera
    SetLocalFloat(oPC,"fCameraDirection",fDirection);
    SetLocalFloat(oPC,"fCameraRange",fRange);
    SetLocalFloat(oPC,"fCameraPitch",fPitch);
}



void GestaltFaceTarget(object oTarget, float fRange, float fPitch, object oPC, int iFace, int iParty = 0, int iCamID = 0)
{
    // Check whether this camera movement has been stopped
    string sCam = "iCamStop" + IntToString(iCamID);
    if (iCamID > 0 && GetLocalInt(oPC,sCam) == 1)
        { return; }

    float fDirection;
    object oParty;

    if (iParty == 1)      { oParty = GetFirstFactionMember(oPC); }
    else if (iParty == 2) { oParty = GetFirstPC(); }
    else                  { oParty = oPC; }

    while (GetIsObjectValid(oParty))
        {
        fDirection = GestaltGetDirection(oTarget,oParty);

        if (iFace < 2)        { AssignCommand(oParty,SetCameraFacing(fDirection,fRange,fPitch)); }
        if (iFace > 0)        { AssignCommand(oParty,SetFacing(fDirection)); }

        if (iParty == 1)                       { oParty = GetNextFactionMember(oParty,TRUE); }
        else if (iParty == 2)                  { oParty = GetNextPC(); }
        else                                   { return; }
        }
}



float GestaltGetPanRate(float fDirection, float fDirection2, float fTicks, int iClockwise)
{
    // Calculates how far the camera needs to move each to tick to go from fDirection to fDirection2
    // in fTicks steps, correcting as necessary to account for clockwise or anti-clockwise movement

    float fdDirection;

    if (iClockwise == 0)
        {
        if (fDirection > fDirection2)               { fdDirection = ((fDirection2 + 360.0 - fDirection) / fTicks); }
        else                                        { fdDirection = ((fDirection2 - fDirection) / fTicks); }
        }

    if (iClockwise == 1)
        {
        if (fDirection2 > fDirection)               { fdDirection = ((fDirection2 - fDirection - 360.0) / fTicks); }
        else                                        { fdDirection = ((fDirection2 - fDirection) / fTicks); }
        }

    if (iClockwise == 2)
        {
        float fCheck = fDirection2 - fDirection;
        if (fCheck > 180.0)                         { fdDirection = ((fDirection2 - fDirection - 360.0) / fTicks); }
        else if (fCheck < -180.0)                   { fdDirection = ((fDirection2 + 360.0 - fDirection) / fTicks); }
        else                                        { fdDirection = ((fDirection2 - fDirection) / fTicks); }
        }

    return fdDirection;
}



void GestaltCameraMove(float fDelay, float fDirection, float fRange, float fPitch, float fDirection2, float fRange2, float fPitch2, float fTime, float fFrameRate, object oPC, int iClockwise = 0, int iFace = 0, int iParty = 0)
{
    // Get timing information
    float fTicks = (fTime * fFrameRate);
    float fdTime = (fTime / fTicks);
    float fStart = fDelay;
    float fCount;

    float fdDirection = GestaltGetPanRate(fDirection,fDirection2,fTicks,iClockwise);
    float fdRange = ((fRange2 - fRange) / fTicks);
    float fdPitch = ((fPitch2 - fPitch) / fTicks);

    int iCamID;
    object oParty;

    if (iParty == 1)      { oParty = GetFirstFactionMember(oPC); }
    else if (iParty == 2) { oParty = GetFirstPC(); }
    else                  { oParty = oPC; }

    while (GetIsObjectValid(oParty))
        {
        // Set the camera to top down mode
        SetCameraMode(oParty,CAMERA_MODE_TOP_DOWN);

        // Give the camera movement a unique id code so that it can be stopped
        iCamID = GetLocalInt(oParty,"iCamCount") + 1;
        SetLocalInt(oParty,"iCamCount",iCamID);

        // reset variables
        fCount = 0.0;
        fDelay = fStart;

        // Uncomment the line below to get a message in the game telling you the id of this camera movement
        // AssignCommand(oParty,SpeakString("Camera id - " + IntToString(iCamID)));

        // After delay, stop any older camera movements and start this one
        DelayCommand(fStart,GestaltStopCameraMoves(oParty,0,FALSE,iCamID - 1));

        while (fCount <= fTicks)
            {
            DelayCommand(fDelay,GestaltCameraPoint(fDirection,fRange,fPitch,fdDirection,fdRange,fdPitch,0.0,0.0,0.0,fCount,oParty,iCamID,iFace));
            fCount = (fCount + 1.0);
            fDelay = fStart + (fCount * fdTime);
            }

        if (iParty == 1)                       { oParty = GetNextFactionMember(oParty,TRUE); }
        else if (iParty == 2)                  { oParty = GetNextPC(); }
        else                                   { return; }
        }
}



void GestaltCameraSmoothStart(float fdDirection1, float fdRange1, float fdPitch1, float fdDirection2, float fdRange2, float fdPitch2, float fTime, float fFrameRate, object oParty, object oSync, int iCamID)
{
    // Get starting position for camera
    float fDirection = GetLocalFloat(oSync,"fCameraDirection");
    float fRange = GetLocalFloat(oSync,"fCameraRange");
    float fPitch = GetLocalFloat(oSync,"fCameraPitch");

    // Get timing information
    float fTicks = (fTime * fFrameRate);
    float fdTime = (fTime / fTicks);
    float fDelay = 0.0;
    float fCount = 0.0;

    // Get camera speed and acceleration
    float fdDirection = fdDirection1 / fFrameRate;
    float fdRange = fdRange1 / fFrameRate;
    float fdPitch = fdPitch1 / fFrameRate;

    float fd2Direction = (fdDirection2 - fdDirection1) / ((fTicks - 1) * fFrameRate);
    float fd2Range = (fdRange2 - fdRange1) / ((fTicks - 1) * fFrameRate);
    float fd2Pitch = (fdPitch2 - fdPitch1) / ((fTicks - 1) * fFrameRate);

    // Start camera movement
    while (fCount < fTicks)
        {
        DelayCommand(fDelay,GestaltCameraPoint(fDirection,fRange,fPitch,fdDirection,fdRange,fdPitch,fd2Direction,fd2Range,fd2Pitch,fCount,oParty,iCamID));
        fCount = (fCount + 1.0);
        fDelay = (fCount * fdTime);
        }

    // Uncomment the line below to display the starting position of the camera movement
    // GestaltDebugOutput(oSync);

    // Uncomment the line below to display the finishing position of the camera movement
    // DelayCommand(fDelay,GestaltDebugOutput(oSync));
}



void GestaltCameraSmooth(float fDelay, float fdDirection1, float fdRange1, float fdPitch1, float fdDirection2, float fdRange2, float fdPitch2, float fTime, float fFrameRate, object oPC, int iParty = 0, int iSync = 1)
{
    object oParty;
    object oSync;
    int iCamID;

    if (iParty == 1)      { oParty = GetFirstFactionMember(oPC); }
    else if (iParty == 2) { oParty = GetFirstPC(); }
    else                  { oParty = oPC; }

    while (GetIsObjectValid(oParty))
        {
        // Work out whose camera position to use as the starting position
        if (iSync == 1)   { oSync = oPC; }
        else              { oSync = oParty; }

        // Set the camera to top down mode
        SetCameraMode(oParty,CAMERA_MODE_TOP_DOWN);

        // Give the camera movement a unique id code so that it can be stopped
        iCamID = GetLocalInt(oParty,"iCamCount") + 1;
        SetLocalInt(oParty,"iCamCount",iCamID);

        // Uncomment the line below to get a message in the game telling you the id of this camera movement
        // AssignCommand(oParty,SpeakString("Camera id - " + IntToString(iCamID)));

        // After delay, stop any older camera movements and start this one
        DelayCommand(fDelay,GestaltStopCameraMoves(oParty,0,FALSE,iCamID - 1));
        DelayCommand(fDelay,GestaltCameraSmoothStart(fdDirection1,fdRange1,fdPitch1,fdDirection2,fdRange2,fdPitch2,fTime,fFrameRate,oParty,oSync,iCamID));

        if (iParty == 1)                       { oParty = GetNextFactionMember(oParty,TRUE); }
        else if (iParty == 2)                  { oParty = GetNextPC(); }
        else                                   { return; }
        }
}



void GestaltCameraFace(float fDelay, object oStart, float fRange, float fPitch, object oEnd, float fRange2, float fPitch2, float fTime, float fFrameRate, object oPC, int iClockwise = 0, int iFace = 0, int iParty = 0)
{
    // Get timing information
    float fCount = 0.0;
    float fStart = fDelay;
    float fTicks = (fTime * fFrameRate);
    float fdTime = (fTime / fTicks);

    float fDirection;
    float fDirection2;

    float fdDirection;
    float fdRange = ((fRange2 - fRange) / fTicks);
    float fdPitch = ((fPitch2 - fPitch) / fTicks);

    object oParty;
    int iCamID;

    // Get first player
    if (iParty == 1)      { oParty = GetFirstFactionMember(oPC); }
    else if (iParty == 2) { oParty = GetFirstPC(); }
    else                  { oParty = oPC; }

    while (GetIsObjectValid(oParty))
        {
        // Set the camera to top down mode
        SetCameraMode(oParty,CAMERA_MODE_TOP_DOWN);

        // Give the camera movement a unique id code so that it can be stopped
        iCamID = GetLocalInt(oParty,"iCamCount") + 1;
        SetLocalInt(oParty,"iCamCount",iCamID);

        // reset variables
        fCount = 0.0;
        fDelay = fStart;

        // Work out rotation rate for this player
        fDirection = GestaltGetDirection(oStart,oParty);
        fDirection2 = GestaltGetDirection(oEnd,oParty);
        fdDirection = GestaltGetPanRate(fDirection,fDirection2,fTicks,iClockwise);

        // After delay, stop any older camera movements and start this one
        DelayCommand(fStart,GestaltStopCameraMoves(oParty,0,FALSE,iCamID - 1));

        while (fCount <= fTicks)
            {
            DelayCommand(fDelay,GestaltCameraPoint(fDirection,fRange,fPitch,fdDirection,fdRange,fdPitch,0.0,0.0,0.0,fCount,oParty,iCamID,iFace));
            fCount = (fCount + 1.0);
            fDelay = fStart + (fCount * fdTime);
            }

        if (iParty == 1)                       { oParty = GetNextFactionMember(oParty,TRUE); }
        else if (iParty == 2)                  { oParty = GetNextPC(); }
        else                                   { return; }
        }
}



void GestaltCameraTrack(float fDelay, object oTrack, float fRange, float fPitch, float fRange2, float fPitch2, float fTime, float fFrameRate, object oPC, int iFace = 0, int iParty = 0)
{
    // Get timing information
    float fCount;
    float fStart = fDelay;
    float fTicks = (fTime * fFrameRate);
    float fdTime = (fTime / fTicks);

    float fSRange = fRange;
    float fSPitch = fPitch;

    float fdRange = ((fRange2 - fRange) / fTicks);
    float fdPitch = ((fPitch2 - fPitch) / fTicks);

    object oParty;
    int iCamID;

    if (iParty == 1)      { oParty = GetFirstFactionMember(oPC); }
    else if (iParty == 2) { oParty = GetFirstPC(); }
    else                  { oParty = oPC; }

    while (GetIsObjectValid(oParty))
        {
        // Set the camera to top down mode
        SetCameraMode(oParty,CAMERA_MODE_TOP_DOWN);

        // Give the camera movement a unique id code so that it can be stopped
        iCamID = GetLocalInt(oParty,"iCamCount") + 1;
        SetLocalInt(oParty,"iCamCount",iCamID);

        // reset variables
        fCount = 0.0;
        fDelay = fStart;
        fRange = fSRange;
        fPitch = fSPitch;

        // After delay, stop any older camera movements and start this one
        DelayCommand(fStart,GestaltStopCameraMoves(oParty,0,FALSE,iCamID - 1));

        while (fCount <= fTicks)
            {
            DelayCommand(fDelay,GestaltFaceTarget(oTrack,fRange,fPitch,oParty,iFace,0,iCamID));
            fPitch = (fPitch + fdPitch);
            fRange = (fRange + fdRange);
            fCount = (fCount + 1.0);
            fDelay = fStart + (fCount * fdTime);
            }

        if (iParty == 1)                       { oParty = GetNextFactionMember(oParty,TRUE); }
        else if (iParty == 2)                  { oParty = GetNextPC(); }
        else                                   { return; }
        }
}



void GestaltFixedCamera(object oPC, float fFrameRate = 50.0)
{
    // Thanks to Tenchi Masaki for the idea for this function
    string sCamera = GetLocalString(oPC,"sGestaltFixedCamera");     // Gets the camera position to use
    if (sCamera == "STOP")                                          // Camera tracking is turned off, stop script and don't recheck
        { return; }
    if (sCamera == "")                                              // Camera tracking is inactive, stop script but recheck in a second
        {
        DelayCommand(1.0,GestaltFixedCamera(oPC,fFrameRate));
        return;
        }

    float fHeight = GetLocalFloat(oPC,"fGestaltFixedCamera");       // Gets the camera height to use
    if (fHeight == 0.0)         { fHeight = 10.0; }                 // Defaults camera height to 10.0 if none has been set yet

    object oCamera = GetObjectByTag(sCamera);
    float fDelay = 1.0 / fFrameRate;
    float fRange = GetHorizontalDistanceBetween(oPC,oCamera);

    float fAngle = GestaltGetDirection(oPC,oCamera);                // Works out angle between camera and player
    float fPitch = atan(fRange/fHeight);                            // Works out vertical tilt
    float fDistance = sqrt(pow(fHeight,2.0) + pow(fRange,2.0));     // Works out camera distance from player
    if (fDistance > 30.0)       { fDistance = 30.0; }               // Sets distance to 30.0 if player is too far away
    if (fDistance < 5.0)        { fDistance = 5.0; }                // Sets distance to 5.0 if player is too close

    AssignCommand(oPC,SetCameraFacing(fAngle,fDistance,fPitch));
    DelayCommand(fDelay,GestaltFixedCamera(oPC,fFrameRate));
}

void main()
{
switch (GetUserDefinedEventNumber()) {
case 200:
    ExportAllCharacters();
    SpeakString("www.worldofsanctuary.nl", TALKVOLUME_SHOUT);
    DelayCommand(400.0, SignalEvent(OBJECT_SELF, EventUserDefined(200)));
    break;
case 220:
    ExportAllCharacters();
/*  SpeakString("Screenshot competition, send in your screenshots and win beautiful prizes, see the forum for more information", TALKVOLUME_SHOUT);*/
/*  SpeakString("Star Wars fun Weekend in the Ancient's Arena", TALKVOLUME_SHOUT);*/
/*  SpeakString("Double fun Weekend is started, drops increased with 50% and you recieve 200% more Xp.", TALKVOLUME_SHOUT);*/
/*  SpeakString("We are celebrating our six year's anniversary with a double fun week event that give you 100% more drops and 400% more Xp join in from november 15th", TALKVOLUME_SHOUT);*/
/*  SpeakString("Double fun weekend, this weekend you will receive 50% more change on item drops and you recieve a 200% xp bonus in the World of Sanctuary. Join this Double Fun Weekend and check in from Thursday Sep. 30 from 20:00 GMT, through 20:00 GMT on Sunday Okt. 3.", TALKVOLUME_SHOUT);*/
/*  SpeakString("This weekend you will receive 10% more XP in the World of Sanctuary. Check in from Friday Jun 6 from 20:00 GMT, through 20:00 GMT on Sunday Jun 8.", TALKVOLUME_SHOUT);*/
/*  SpeakString("10% XP bonus week at the World of Sanctuary. Visit the website to read all about the next bonus event weekend", TALKVOLUME_SHOUT);*/
/*  SpeakString("Warning !!! please get your items out of your chest and your mony from the bank, we are going to reset the system next week", TALKVOLUME_SHOUT);*/
    DelayCommand(500.0, SignalEvent(OBJECT_SELF, EventUserDefined(220)));
    break;
case 230:
    SpeakString("MODULE RELOADING IN 5 MIN", TALKVOLUME_SHOUT);
    DelayCommand(0.2f,SpeakString("MODULE RELOADING IN 5 MIN", TALKVOLUME_SHOUT));
    DelayCommand(0.4f,SpeakString("MODULE RELOADING IN 5 MIN", TALKVOLUME_SHOUT));
    DelayCommand(0.6f,SpeakString("MODULE RELOADING IN 5 MIN", TALKVOLUME_SHOUT));
    DelayCommand(60.0f,SpeakString("MODULE RELOADING IN 4 MIN", TALKVOLUME_SHOUT));
    DelayCommand(60.2f,SpeakString("MODULE RELOADING IN 4 MIN", TALKVOLUME_SHOUT));
    DelayCommand(60.4f,SpeakString("MODULE RELOADING IN 4 MIN", TALKVOLUME_SHOUT));
    DelayCommand(60.6f,SpeakString("MODULE RELOADING IN 4 MIN", TALKVOLUME_SHOUT));
    DelayCommand(120.0f,SpeakString("MODULE RELOADING IN 3 MIN", TALKVOLUME_SHOUT));
    DelayCommand(120.2f,SpeakString("MODULE RELOADING IN 3 MIN", TALKVOLUME_SHOUT));
    DelayCommand(120.4f,SpeakString("MODULE RELOADING IN 3 MIN", TALKVOLUME_SHOUT));
    DelayCommand(120.6f,SpeakString("MODULE RELOADING IN 3 MIN", TALKVOLUME_SHOUT));
    DelayCommand(180.0f,SpeakString("MODULE RELOADING IN 2 MIN", TALKVOLUME_SHOUT));
    DelayCommand(180.2f,SpeakString("MODULE RELOADING IN 2 MIN", TALKVOLUME_SHOUT));
    DelayCommand(180.4f,SpeakString("MODULE RELOADING IN 2 MIN", TALKVOLUME_SHOUT));
    DelayCommand(180.6f,SpeakString("MODULE RELOADING IN 2 MIN", TALKVOLUME_SHOUT));
    DelayCommand(240.0f,SpeakString("MODULE RELOADING IN 1 MIN", TALKVOLUME_SHOUT));
    DelayCommand(240.2f,SpeakString("MODULE RELOADING IN 1 MIN", TALKVOLUME_SHOUT));
    DelayCommand(240.4f,SpeakString("MODULE RELOADING IN 1 MIN", TALKVOLUME_SHOUT));
    DelayCommand(240.6f,SpeakString("MODULE RELOADING IN 1 MIN", TALKVOLUME_SHOUT));
    DelayCommand(270.0f,SpeakString("MODULE RELOADING IN 30 SEC", TALKVOLUME_SHOUT));
    DelayCommand(280.0f,SpeakString("MODULE RELOADING IN 20 SEC", TALKVOLUME_SHOUT));
    DelayCommand(290.0f,SpeakString("MODULE RELOADING IN 10", TALKVOLUME_SHOUT));
    DelayCommand(291.0f,SpeakString("MODULE RELOADING IN 9", TALKVOLUME_SHOUT));
    DelayCommand(292.0f,SpeakString("MODULE RELOADING IN 8", TALKVOLUME_SHOUT));
    DelayCommand(293.0f,SpeakString("MODULE RELOADING IN 7", TALKVOLUME_SHOUT));
    DelayCommand(294.0f,SpeakString("MODULE RELOADING IN 6", TALKVOLUME_SHOUT));
    DelayCommand(295.0f,SpeakString("MODULE RELOADING IN 5", TALKVOLUME_SHOUT));
    DelayCommand(296.0f,SpeakString("MODULE RELOADING IN 4", TALKVOLUME_SHOUT));
    DelayCommand(297.0f,SpeakString("MODULE RELOADING IN 3", TALKVOLUME_SHOUT));
    DelayCommand(298.0f,SpeakString("MODULE RELOADING IN 2", TALKVOLUME_SHOUT));
    DelayCommand(299.0f,SpeakString("MODULE RELOADING IN 1", TALKVOLUME_SHOUT));
    DelayCommand(300.0f,StartNewModule("Diablo Lord of Destruction"));
    break;
}  /* switch  */
}

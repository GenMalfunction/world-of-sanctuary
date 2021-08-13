///////////
//Trash Talk Script v1.0
///////////
//This script rolls 1d10 and allows a NPC to speak based on
//Which statement the number belongs to.
///////////
//Script by Lenkyl Greatstorm
//Date Created: 6/24/02
///////////
string sSayThis;
int iTalkVolume = TALKVOLUME_TALK;
int iRollTen = d10(1);
int iTalkFlag = 0;
void main()
{
if(d100(1) > 71)            //Gives this script a 30% chance of completing
    {                       //Its execution.  Call it my anti-spam code.  (c:
    if(iRollTen != 0)       //Just in case a 0 slips in though I don't think
        {                   //It's possible.
        switch(iRollTen)    //Jump to the rolled statement number.
            {
            case 1:
            sSayThis = "Wizards just get in the way.";
            break;
            case 2:
            sSayThis = "I hear that some ogre is gonna fight in the arena later.";
            break;
            case 3:
            sSayThis = "We just came from there.  Lots of bloodshed.";
            break;
            case 4:
            sSayThis = "I'll need another ale soon.";
            break;
            case 5:
            sSayThis = "If I draw my blade...he'll be sorry.";
            break;
            case 6:
            sSayThis = "Some of us are going to pay Dordach a visit.";
            break;
            case 7:
            sSayThis = "Then I said...what are you going to do about it?";
            break;
            case 8:
            sSayThis = "I knew he wasnt' ready to go.";
            break;
            case 9:
            sSayThis = "Next time you go, I'll come with you.";
            break;
            case 10:
            sSayThis = "I'll be you 20 gold he takes him in the arena.";
            break;
            } //End Switch Statement
        SpeakString(sSayThis, iTalkVolume);       //Make the NPC talk
        }  //End If Statement
    }  //End If Statement
}  //End Main

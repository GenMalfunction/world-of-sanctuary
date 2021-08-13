/******************************************************************************/
/*                String Manipulation Functions - string_inc                  */
/******************************************************************************/
/*                     Copyright(c) Krynnhaven - Xanas                        */
/*                        Created: January 18, 2004                           */
/*                        Updated: January 19, 2004                           */
/******************************************************************************/


// Returns a word (based on space or ' mark) in a string - used for listener commands
string ReturnWord(string sString, int iWordNumber, string sDelimeter=" ");

string ReturnWord(string sString, int iWordNumber, string sDelimiter=" ")
{
   int iSub, iSub2, done;
   int iCount = 1;                     //this is a string to decompile
   string sWord, sText;                //01234567
   while(!done)                        //    45 7
   {
        iCount++;
        iSub = FindSubString(sString, sDelimiter);
        if(iSub == -1)
        {
            done=TRUE;
            if(iCount == iWordNumber)
                sWord=sString;
        }
        else if(iWordNumber == 1)
        {
            sWord = GetSubString(sString, 0, iSub); done=TRUE;
        }
        else
        {
            iSub+=1; sText = GetSubString(sString, iSub, GetStringLength(sString));
            WriteTimestampedLogEntry(sText);
            iSub2=FindSubString(sText, sDelimiter);
            if(iSub2 == -1) iSub2 = GetStringLength(sString);
            if(iCount == iWordNumber)
            { sWord = GetSubString(sText, 0, iSub2); done=TRUE;}
        }
        sString = GetSubString(sString, iSub, GetStringLength(sString));
        WriteTimestampedLogEntry(IntToString(iCount)+" :count word: "+IntToString(iWordNumber));

   }
   return sWord;
}

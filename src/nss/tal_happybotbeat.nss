void main()
{
int roll=d12(),roll1=d2(),roll2=d3();
switch(roll2){
case 1:PlaySound("as_na_steamlong1");break;
case 2://PlaySound("as_na_steamlong2");break;
case 3:break;
}
if(roll1==1)return;
switch(roll){
case 1: SpeakString("Bmm chh bmm bmm bmm chh...happy bot..");break;
case 2: SpeakString("Do you prefer Dex fighters over Str fighters?");break;
case 3: SpeakString("HAAAAAAAAAAPPY BOT!");break;
case 4: ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0f, 2.0f);break;
case 5: SpeakString("If you pooped on the floor, would janbot pick it up?");break;
case 6: SpeakString("Pikachu!");break;
case 7: SpeakString("*Whiiiirr* I'm janitor bot! Not really.");break;
case 8: ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0f, 2.0f);break;
case 9: SpeakString("What is an object?");break;
case 10:SpeakString("No fair, I want sunglasses like janbot!");break;
case 11:SpeakString("Click and Whirl, Click and Whirl!");break;
case 12:ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0f, 2.0f);break;
}

ExecuteScript("careat_heart", OBJECT_SELF);
//ActionRandomWalk();
}

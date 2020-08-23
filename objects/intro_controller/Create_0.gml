/// @description
if live_call() return live_result;


begin_ = true;

timer4 = SEC*.1;
alpha = 1;
var i = 0;
list = ds_list_create();

ds_list_add(list, 
  "[fa_center][scale,.5]Ok, I messed up big time today![/scale]"
, "[fa_center][scale,.5]I'm suppose to hang out with my friends today[/scale]"
, "[fa_center][scale,.5]But on the way thought I saw one of em[/scale]"
, "[fa_center][scale,.5]So I sneaked up behind em and went...[/scale]"
, "[fa_center][scale,.5][shake][wave][rainbow]Suprise Hug!!![/scale]"
, "[fa_center][scale,.5]While squeezing tight I notice they smelled \"off\"[/scale]"

, "[fa_center][scale,.5]Oh no! That wasn't my friend![/scale]"
, "[fa_center][scale,.5]It was the Grouchy Village Wizard[/scale]"
, "[fa_center][scale,.5]He EXPLODED[/scale]"
, "[fa_center][scale,.5]\"AAAAAAAAAAAAAAAAAAAAAA\"[/scale]"
, "[fa_center][scale,.5]\"I TOLD YOU TO STOP HUGGING ME\"[/scale]"
, "[fa_center][scale,.5]\"THE FIRST [c_yellow]5[c_white] HUGS MIGHT HAVE BEEN ACCIDENTS\"[/scale]"
, "[fa_center][scale,.5]\"BUT AT THIS POINT IT'S CLEAR [c_yellow]YOUR WORD MEANS NOTHING[/scale]"
, "[fa_center][scale,.5]He raised his staff towards the sky[/scale]"
, "[fa_center][scale,.5]and unleashed a [c_red]curse[c_white] on everyone[/scale]"
, "[fa_center][scale,.5]my legs dissapeared[/scale]"
, "[fa_center][scale,.5]and my hugging arms[/scale]"
, "[fa_center][scale,.5]\"HAHA YOU'LL NEVER BE ABLE TO HUG ANYONE NOW\"[/scale]"
, "[fa_center][scale,.5]and turned everyone into a freaking square[/scale]"
, "[fa_center][scale,.5]The worst shape in the world[/scale]"

, "[fa_center][scale,.5]But I have a secret[/scale]"
, "[fa_center][scale,.5]I [c_yellow]stole[c_white] something from that Wizard[/scale]"
, "[fa_center][scale,.5]A Stone Tablet"
, "[fa_center][scale,.5]I don't know what it does"
, "[fa_center][scale,.5]But maybe you can use it to help[/scale]"
, "[fa_center][scale,.5]Please reunite me with my friends[/scale]"
, "[fa_center][scale,.5]And I'll love you forever.[/scale]"
);

state = 0; 

event_user(0);
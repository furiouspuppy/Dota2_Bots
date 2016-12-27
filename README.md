##My Dota2 Bots

With 7.00 came a long awaited supported AI for writing our own bots, I play a LOT of bot games with friends so I couldn't resist taking a crack at it.  Gives me an excuse to learn LUA as well.

##Current Bots Under Development
Meepo - playable/rough - Laning is pretty much default for 1 clone and the rest jungle/steal runes/over commit.  TODO's Fights,Skill decisions,more efficient rune/jungle,escape

Puck - playable/rough - TODO's Orb Tracking for jaunt

##Current General Modes Under Development
Jungling - Team wide jungle camp tracking, easy to use vectors

Item Purchase - Set up for easily adding a new bot with just an item/skill build list

Utilities - Ya know... Stuff!

##Playing with bots

Copy the files into the dota installation under a folder 'vscripts/bots' that does not exist by default.  You will know you are in the right place when there is a bots_example folder.
i.e. C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\game\dota\scripts\vscripts\bots
Once you have the files in the right location you should be able to create a lobby in Dota2 and if you edit the settings under bot settings you need to set both teams bots to local dev script an select the game mode of choice.  Currently I have hero_selection.lua files for

1v1 solo mid with just bots

5v5 all pick with just bots

5v5 all pick with a player at radiant top slot (position 1)

5v5 all pick with 2 players in radiant slot 1 and 2

The hero_selection-mode.lua files are in the folder.  You must rename the desired file to hero_selection.lua!
Otherwise just add a bot I support to your favorite hero select file and away you go.

##Important Info
I am playing within the default modes that we have the option of overwriting for now.  This has it's limitations and my bots still fall victim to the decision making of the default bot code quite often.  Pretty sure Meepo thinks he's Sterling Archer... only there are 5 of him...  Oh and occasionally 1 clone will buy in by himself without meepo prime or his fellow clones!  Guess the devs hadn't thought about Meepo yet in the default bot code.

Also, I have using some _generic files.  This also has side effects.  I have modes for rune/ward/item disabled so bots should no longer get stuck in jungles or rosh pits however they will also never ward, pick up runes (aegis?) etc.
The big one other bot coders might need to watch out for is that I override item_purchase_generic.lua and have it setup where there is a builds folder with files for every bot.  If a bot isn't implemented yet it will just have "NOT IMPLEMENTED" in that file.  THAT IS IMPORTANT and the game may crash without that.  It also means every unit will try and call it, so be prepared for death wards, necronomicons etc. to generate console errors of the 'missing file' kind.  This will not affect game play that i've ever seen.


## References I use
http://dev.dota2.com/forumdisplay.php?f=497

https://www.reddit.com/r/dota2AI/ 

https://developer.valvesoftware.com/wiki/Dota_Bot_Scripting

http://docs.moddota.com/lua_bots/

Also, there are multiple discord discussion channels in the forums linked above.  The people there are a big help and may recognize several chunks of code in here from those communities.  Thanks Guys!

##Contributors

Jump on in guys, there are over 100 Heroes in Dota2 and they aren't all writing their own code!  I'm open to any discussion on overall dev direction, individual bot code, builds, wants/wishes but right now I'm only one guy.  Anyone that wants to help is appreciated.  There is a bot tournament or possibly set of tournaments as soon as Jan/Feb.  If you'd like to join forces let me know.

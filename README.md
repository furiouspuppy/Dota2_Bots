##My Dota2 Bots

With 7.00 came a long awaited supported AI for writing our own bots, I play a LOT of bot games with friends so I couldn't resist taking a crack at it.  Gives me an excuse to learn LUA as well.

##Updates!
Added a 50% chance for bots to ignore their called rune.  Feels good but needs iteration

Changed hero_selection.lua Now works for 5v5 All Pick with players in any slot(or none)

hero_selection1.lua remains for 1v1 option

You can now force bots out of lane by standing near T1 tower before 0:15 into game

##Current Bots Under Development
Meepo - playable - Laning is pretty much default for 1 clone and the rest jungle/gather runes.  

Puck - playable/rough - TODO's Orb Tracking for jaunt

Clockwerk - rough - TODO's need fight awareness and much skill work

##Current General Modes Under Development
Jungling - Team wide jungle camp tracking, easy to use vectors

Runes - Bots can 'call' runes to be theirs and go and collect them.  Will also grab any rune it walks by that is available. Has a 50% chance they will ignore their called rune, this was a feel decision because every rune being fought for on every cycle just wasn't right. 

Item Purchase - Set up for easily adding a new bot with just an item/skill build list

Utilities - Now adds bot scope functions to CDOTA_bot_script to call using npcBot:func() left other functions in utilities module to be used with require()

##How To Install

UPDATE: Workshop is live you can now create a lobby and use workshop too to find WIP- Bots by FuriousPuppy instead of the following.

1. [Download](https://github.com/furiouspuppy/Dota2_Bots/archive/master.zip) the latest version
2. Unzip and rename the folder to **"bots"**
3. Move it to **"C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\game\dota\scripts\vscripts\**"
4. Server Location: Local Host, Bot Settings/Radient Bots and Dire Bots: Local Dev Script

Available hero_selections:

default hero_selection = 5v5 all pick tested with all bots or 1-2 players but should work for any # of players

hero_selection1 = 1v1 solo mid with just bots - rename to hero_selection to use


##Important Info
I am playing within the default modes that we have the option of overwriting for now.  This has it's limitations and my bots still fall victim to the decision making of the default bot code quite often.  Pretty sure Meepo thinks he's Sterling Archer... only there are 5 of him... 

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

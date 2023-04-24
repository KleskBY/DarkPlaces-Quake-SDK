

			Tutor Bot v1.0
			~~~~~~~~~~~~~~


			A one-file deathmatch opponent


			by Darryl "coffee" Atchison




			Summary
			~~~~~~~

		Yes, you read correctly, this one file acts as an
	almost-fully-functional bot that you can easily plug into
	deathmatch patches and mods. Or you can customize him and
	create new games by following the tutorials at

	http://www.planetquake.com/minion/tutorial/main.htm

		The Tutor Bot travels maps extremely well. He uses
	all of Quake's weapons. He attacks you in various ways.	In
	addition, he understands teamplay.
		He is called the Tutor Bot because you can learn how
	a deathmatch bot works with him. The programming is made to be
	short and simple. It is not made to be the smartest bot.
		This source code contains many remarks explaining the
	subroutines. This code, and the tutorials as well, are written
	in simple, brief language. This is a public project.




			Instructions
			~~~~~~~~~~~~


	1. Open up the QuakeC PROGS.SRC file, and insert the words
		"tutor.qc" without quotes after the words "misc.qc"


	2. Open up the file CLIENT.QC and scroll down to ClientObituary().
		You'll see an early line looking like this:		

		if (targ.classname == "player")

	Change it to this:

		if (targ.classname == "player" || targ.classname == "bot")
	
	About 20 lines down, you see this line:

		if (attacker.classname == "player")

	Change it to this:

		if (attacker.classname == "player" || attacker.classname == "bot")


	3. Open up WEAPONS.QC and add this line to the top of the file:

		void(float teem) create_bot;

	Then, down below, add these lines to ImpulseCommands():

		if (self.impulse == 100)
			create_bot(1);
		if (self.impulse == 101)
			create_bot(2);


	4. Compile as you normally would. In normal deathmatch, use
		impulse	100 to create a bot. Set teamplay to 1 and
		restart for team mode. Then use impulse 100 to create
		a friend bot, and impulse 101 for an enemy bot.




			Subroutines
			~~~~~~~~~~~

		Here are the major artificial intelligence routines.
	I didn't explain all of them, nor did I explain his animation
	and weapons code. That's just technical stuff. You should know
	what all that stuff looks like, but you don't need to
	understand each line.


	bot_search_for_items() He checks all the entities within 1500
		units of where he's standing. He'll search for an
		item for 30 seconds.

	bot_grab_items() This is one of the secrets of the Tutor Bot's
		success. He doesn't actually touch an item; if he's
		close enough to his goalentity, he just pretends to
		pick it up by making it invisible. He will also mark
		that item not to look for it again for 60 seconds.

	check_for_water() The Quake engine doesn't know when bots are
		in water, so he has to check a spot in front of him
		to see if it's water, slime or lava. He swims by
		upward velocity, or speed.

	check_for_ledge() The id function movetogoal() will avoid
		ledges, so again we must check a point in front of him
		to see if it's air. If so, he jumps.

	bot_look_for_players() Copied from id's FindTarget(). He will
		not make teammates into enemies.

	bot_look_for_bots() Bots are not clients, so he must look for
		them manually. In fact, he looks at every bot to see
		if they are in his site.

	bot_stand() Here is where he stands and turns a bit.

	coffee_move() Probably my most powerful subroutine. The bot will
		run along walls and turn at their corners. He can travel
		a long distance with this code. He only uses it when
		he doesn't have a goalentity. The "self.button1" is a
		variable I borrowed from id to hold his turning angle.

	bot_walk() He looks for players, bots and items here. If he has
		a goal item, he'll move to it. If not, he'll run around.

	bot_run_slide() A cool strafing routine.

	bot_strafe() This allows him to move even while he is shooting.
		He may strafe, duck, move forward, or back up, 
		depending on his weapon. Ducking is optional.

	bot_run() He is fighting here. If he loses site of the player,
		he'll give up. If the enemy is visible, he'll fire.

	give_random_weapon() The other secret of the Tutor Bot. You could
		call this a cheat. Non-players aren't usually allowed
		to touch items, so this subroutine keeps us from having
		to change all that code. You can customize it, though.

	bot_bestweapon() Selecting the most powerful gun he has.

	bot_set_currentammo() Readying the proper ammunition.

	th_respawn() He's almost ready to be reborn.

	bot_pain() Happens when he's shot.

	bot_die() Making him into one dead bot.

	bot_attack() His central attack function, here he looks to see
		what gun he's holding and what animation scene to play.

	respawn_bot() Putting him back into game, and making him
		whole again.	

	create_bot() Spawning an entity that will look, sound, act and
		smell just like a player.




			Purpose
			~~~~~~~

		Yes, there is a purpose to the Tutor Bot. I've been
	fiddling with A.I. now for one year, but I've released only
	a small fraction of the ideas in my head. I'm tired of being
	one of the only Quake developers who works on deathmatch games
	exclusively for single players. I want you to make me some.
		There are a load of neat patches on cdrom.com for
	deathmatch play; the Tutor Bot could bring them to single
	players. In addition, there are a ton of full-blown team mods
	that are just begging for bots.
		I realize the Tutor Bot is simple, sometimes dumb. And
	I'm sure you'll get a lot of weird results combining it with some
	patches. But I wrote him to be simple and short, so you could
	understand the code and change it if you want.
		I am planning a whole series of A.I. tutorials on how
	to add special effects, weapons, improvement, and rules to
	the Tutor Bot, so that will be fun too.
		I hope developers and first-time coders alike will
	take this and enjoy it and make something great with it. Every
	Quake mod should have a bot.




			Author
			~~~~~~

		Darryl "coffee" Atchison

	Email: coffee@planetquake.com
	ICQ Chat: 2716002
	Home page: http://www.planetquake.com/minion/
	AI Lessons: http://www.planetquake.com/minion/tutorial/main.htm

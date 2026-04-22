/* EMOTE DATUMS */
/datum/emote/living
	mob_type_allowed_typecache = /mob/living
	mob_type_blacklist_typecache = list(/mob/living/brain)

/datum/emote/living/blush
	key = "blush"
	key_third_person = "blushes"
	message = "blushes."

/datum/emote/living/pray
	key = "pray"
	key_third_person = "prays"
	message = "молится."
	restraint_check = FALSE
	emote_type = EMOTE_VISIBLE
	// We let people pray unconcious for death-gasp style prayers in crit.
	stat_allowed = list(CONSCIOUS, UNCONSCIOUS)

/mob/living/carbon/human/verb/emote_pray()
	set name = "Молиться"
	set category = "Emotes"

	emote("pray", intentional = TRUE)

//Also see how prayers work in '/code/datums/gods/_patron.dm' for how patrons hear and filter prayers based on profanity, etc.
/datum/emote/living/pray/run_emote(mob/user, params, type_override, intentional)
	var/mob/living/carbon/follower = user
	var/datum/patron/patron = follower.patron

	var/prayer = input("Whisper your prayer:", "Prayer") as text|null
	if(!prayer)
		return

	//If God can hear your prayer (long enough, no bad words, etc.)
	if(patron.hear_prayer(follower, prayer))
		if(follower.has_flaw(/datum/charflaw/addiction/godfearing))
			// Stops prayers if you don't meet your patron's requirements to pray.
			if(!patron?.can_pray(follower))
				return
			else
				follower.sate_addiction()

	/* admin stuff - tells you the followers name, key, and what patron they follow */
	var/follower_ident = "[follower.key]/([follower.real_name]) (follower of [patron])"
	message_admins("[follower_ident] [ADMIN_SM(follower)] [ADMIN_FLW(follower)] prays: [span_info(prayer)]")
	user.log_message("(follower of [patron]) prays: [prayer]", LOG_GAME)

	follower.whisper(prayer)

	if(SEND_SIGNAL(follower, COMSIG_CARBON_PRAY, prayer) & CARBON_PRAY_CANCEL)
		return

	for(var/mob/living/LICKMYBALLS in hearers(2,src))	// Lickmyballs = person in crit.
		LICKMYBALLS.succumb_timer = world.time			//..succumb timer does nothing rn btw..

/datum/emote/living/meditate
	key = "meditate"
	key_third_person = "meditates"
	message = "медитирует."
	restraint_check = FALSE
	emote_type = EMOTE_VISIBLE

/mob/living/carbon/human/verb/emote_meditate()
	set name = "Медитировать"
	set category = "Emotes"

	emote("meditate", intentional = TRUE)

/datum/emote/living/meditate/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(do_after(user, 1 MINUTES))
		user.add_stress(/datum/stressevent/meditation)
		to_chat(user, span_green("My meditations were rewarding."))

/datum/emote/living/bow
	key = "bow"
	key_third_person = "bows"
	message = "кланяется."
	message_param = "кланяется %t."
	restraint_check = TRUE
	emote_type = EMOTE_VISIBLE
	targetrange = 4

/datum/emote/living/bow/adjacentaction(mob/user, mob/target)
	. = ..()
	if(isliving(user))
		if(target && ishuman(target))
			var/mob/living/carbon/human/H = target
			if(HAS_TRAIT(H, TRAIT_NOBLE))
				H.add_stress(/datum/stressevent/noble_bowed_to)

/mob/living/carbon/human/verb/emote_bow()
	set name = "Поклониться"
	set category = "Emotes"

	emote("bow", intentional = TRUE, targetted = TRUE)

/datum/emote/living/burp
	key = "burp"
	key_third_person = "burps"
	message = "рыгает."
	message_muffled = "makes a muffled noise."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_burp()
	set name = "Рыгнуть"
	set category = "Noises"

	emote("burp", intentional = TRUE)

/datum/emote/living/choke
	key = "choke"
	key_third_person = "chokes"
	message = "давится!"
	emote_type = EMOTE_AUDIBLE
	ignore_silent = TRUE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_choke()
	set name = "Подавиться"
	set category = "Noises"

	emote("choke", intentional = TRUE)

/datum/emote/living/cross
	key = "crossarms"
	key_third_person = "crossesarms"
	message = "скрещивает руки."
	restraint_check = TRUE
	emote_type = EMOTE_VISIBLE

/mob/living/carbon/human/verb/emote_crossarms()
	set name = "Скрестить руки"
	set category = "Emotes"

	emote("crossarms", intentional = TRUE)

/datum/emote/living/collapse
	key = "collapse"
	key_third_person = "collapses"
	message = "collapses."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/datum/emote/living/collapse/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Unconscious(40)

/datum/emote/living/whisper
	key = "whisper"
	key_third_person = "whispers"
	message = "whispers."
	message_mime = "appears to whisper."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/datum/emote/living/aggro
	key = "aggro"
	key_third_person = "aggro"
	message = ""
	nomsg = TRUE
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/datum/emote/living/cough
	key = "cough"
	key_third_person = "coughs"
	message = "кашляет."
	message_muffled = "makes a muffled noise."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_cough()
	set name = "Кашель"
	set category = "Noises"

	emote("cough", intentional = TRUE)

/datum/emote/living/clearthroat
	key = "clearthroat"
	key_third_person = "clearsthroat"
	message = "прокашливается."
	message_muffled = "makes a muffled noise."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_clearthroat()
	set name = "Прокашляться"
	set category = "Noises"

	emote("clearthroat", intentional = TRUE)

/datum/emote/living/dance
	key = "dance"
	key_third_person = "dances"
	message = "танцует."
	restraint_check = TRUE
	emote_type = EMOTE_VISIBLE

/mob/living/carbon/human/verb/emote_dance()
	set name = "Танцевать"
	set category = "Emotes"

	emote("dance", intentional = TRUE)

/datum/emote/living/deathgasp
	key = ""
	key_third_person = ""
	message = "gasps out their last breath."
	message_monkey = "lets out a faint chimper as it collapses and stops moving..."
	message_simple =  "falls limp."
	stat_allowed = UNCONSCIOUS

/datum/emote/living/deathgasp/run_emote(mob/user, params, type_override, intentional)
	var/mob/living/simple_animal/S = user
	if(istype(S) && S.deathmessage)
		message_simple = S.deathmessage
	. = ..()
	message_simple = initial(message_simple)
	if(. && user.deathsound)
		if(isliving(user))
			var/mob/living/L = user
			if(!L.can_speak_vocal() || L.oxyloss >= 50)
				return //stop the sound if oxyloss too high/cant speak
		playsound(user, user.deathsound, 200, TRUE, TRUE)

/datum/emote/living/drool
	key = "drool"
	key_third_person = "drools"
	message = "пускает слюни."
	emote_type = EMOTE_VISIBLE

/mob/living/carbon/human/verb/emote_drool()
	set name = "Пускать слюни"
	set category = "Emotes"

	emote("drool", intentional = TRUE)

/datum/emote/living/faint
	key = "faint"
	key_third_person = "faints"
	message = "падает в обморок."
	emote_type = EMOTE_VISIBLE

/mob/living/carbon/human/verb/emote_faint()
	set name = "Обморок"
	set category = "Emotes"

	emote("faint", intentional = TRUE)

/datum/emote/living/faint/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/L = user
		if(L.get_complex_pain() > (L.STACON * 9))
			L.setDir(2)
			L.SetUnconscious(200)
		else
			L.Knockdown(10)

/datum/emote/living/flap
	key = "flap"
	key_third_person = "flaps"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message = "flaps their wings."
	restraint_check = TRUE
	var/wing_time = 20

/datum/emote/living/carbon/human/flap/can_run_emote(mob/user, status_check = TRUE , intentional)
	return FALSE

/datum/emote/living/flap/aflap
	key = "aflap"
	key_third_person = "aflaps"
	message = "flaps their wings ANGRILY!"
	restraint_check = TRUE
	wing_time = 10

/datum/emote/living/carbon/human/aflap/can_run_emote(mob/user, status_check = TRUE , intentional)
	return FALSE

/datum/emote/living/frown
	key = "frown"
	key_third_person = "frowns"
	message = "хмурится."
	emote_type = EMOTE_VISIBLE
/mob/living/carbon/human/verb/emote_frown()
	set name = "Нахмуриться"
	set category = "Emotes"

	emote("frown", intentional = TRUE)

/datum/emote/living/gag
	key = "gag"
	key_third_person = "gags"
	message = "давится."
	emote_type = EMOTE_AUDIBLE
	ignore_silent = TRUE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_gag()
	set name = "Подавиться(Слабо)"
	set category = "Noises"

	emote("gag", intentional = TRUE)

/datum/emote/living/gasp
	key = "gasp"
	key_third_person = "gasps"
	message = "шокируется!"
	message_muffled = "makes a muffled noise."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_gasp()
	set name = "Шок"
	set category = "Noises"

	emote("gasp", intentional = TRUE)

/datum/emote/living/breathgasp
	key = "breathgasp"
	key_third_person = "breathgasps"
	message = "gasps for air!"
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/datum/emote/living/giggle
	key = "giggle"
	key_third_person = "giggles"
	message = "хихикает."
	message_mime = "giggles silently!"
	message_muffled = "makes a muffled giggle."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/datum/emote/living/giggle/run_emote(mob/living/user, params, type_override, intentional)
	. = ..()
	if(.)
		// Apply Xylix buff to those with the trait who hear the giggling
		// Only apply if the hearer is not the one laughing
		for(var/mob/living/carbon/human/H in hearers(7, user))
			if(H == user || !H.client)
				continue
			if(HAS_TRAIT(H, TRAIT_XYLIX) && !H.has_status_effect(/datum/status_effect/buff/xylix_joy))
				H.apply_status_effect(/datum/status_effect/buff/xylix_joy)
				to_chat(H, span_info("The giggling brings a smile to my face, and fortune to my steps!"))

/mob/living/carbon/human/verb/emote_giggle()
	set name = "Хихикать"
	set category = "Noises"

	emote("giggle", intentional = TRUE)

/datum/emote/living/chuckle
	key = "chuckle"
	key_third_person = "chuckles"
	message = "хохочет."
	message_muffled = "makes a muffled chuckle."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/datum/emote/living/chuckle/run_emote(mob/living/user, params, type_override, intentional)
	. = ..()
	if(.)
		// Apply Xylix buff to those with the trait who hear the chuckling
		// Only apply if the hearer is not the one chuckling
		for(var/mob/living/carbon/human/H in hearers(7, user))
			if(H == user || !H.client)
				continue
			if(HAS_TRAIT(H, TRAIT_XYLIX) && !H.has_status_effect(/datum/status_effect/buff/xylix_joy))
				H.apply_status_effect(/datum/status_effect/buff/xylix_joy)
				to_chat(H, span_info("The chuckling brings a smile to my face, and fortune to my steps!"))

/mob/living/carbon/human/verb/emote_chuckle()
	set name = "Хохот"
	set category = "Noises"

	emote("chuckle", intentional = TRUE)

/datum/emote/living/glare
	key = "glare"
	key_third_person = "glares"
	message = "сверкает."
	message_param = "сверкает перед %t."
	emote_type = EMOTE_VISIBLE

/mob/living/carbon/human/verb/emote_glare()
	set name = "Сверкать"
	set category = "Emotes"

	emote("glare", intentional = TRUE)

/datum/emote/living/grin
	key = "grin"
	key_third_person = "grins"
	message = "скалит зубы."
	emote_type = EMOTE_VISIBLE
/mob/living/carbon/human/verb/emote_grin()
	set name = "Скалить зубы"
	set category = "Emotes"

	emote("grin", intentional = TRUE)

/datum/emote/living/groan
	key = "groan"
	key_third_person = "groans"
	message = "тяжело вздыхает."
	message_muffled = "makes a muffled groan."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_groan()
	set name = "Тяж. Вздох"
	set category = "Noises"

	emote("groan", intentional = TRUE)

/datum/emote/living/grimace
	key = "grimace"
	key_third_person = "grimaces"
	message = "морщится."
	emote_type = EMOTE_VISIBLE
/mob/living/carbon/human/verb/emote_grimace()
	set name = "Морщиться"
	set category = "Emotes"

	emote("grimace", intentional = TRUE)

/datum/emote/living/jump // i see absolutely zero fucking reason for why this shit doesnt print an emote and a runechat text, jump_fixed on the other hand works juuust fine
	key = "jump"
	key_third_person = "jumps"
	restraint_check = TRUE

/datum/emote/living/jump_deathless //literally doesnt have a 'UH!!' sound, thats it
	key = "jump_deathless"
	key_third_person = "jumps"
	restraint_check = TRUE

/datum/emote/living/jump_fixed // see above
	key = "jump_fixed"
	key_third_person = "jumps"
	message = "прыгает!"
	restraint_check = TRUE

/datum/emote/living/leap
	key = "leap"
	key_third_person = "leaps"
	restraint_check = TRUE
	only_forced_audio = TRUE

/datum/emote/living/leap_deathless //literally doesnt have a 'UH!!' sound, thats it
	key = "leap_deathless"
	key_third_person = "leaps"
	restraint_check = TRUE
	only_forced_audio = TRUE

/datum/emote/living/kiss
	key = "kiss"
	key_third_person = "kisses"
	message = "посылает воздушный поцелуй."
	message_param = "целует %t."
	emote_type = EMOTE_VISIBLE
	use_params_for_runechat = TRUE

/mob/living/carbon/human/verb/emote_kiss()
	set name = "Поцелуй"
	set category = "Emotes"

	emote("kiss", intentional = TRUE, targetted = TRUE)

/datum/emote/living/kiss/adjacentaction(mob/user, mob/target)
	. = ..()
	message_param = initial(message_param) // re
	if(!user || !target)
		return
	if(ishuman(user) && ishuman(target))
		var/mob/living/carbon/human/H = user
		var/do_change
		if(target.loc == user.loc)
			do_change = TRUE
		if(!do_change)
			if(H.pulling == target)
				do_change = TRUE
		if(do_change)
			if(H.zone_selected == BODY_ZONE_PRECISE_MOUTH)
				message_param = "глубоко целует %t."
			else if(H.zone_selected == BODY_ZONE_PRECISE_EARS)
				message_param = "целует ушки %t."
				var/mob/living/carbon/human/E = target
				if(iself(E) || ishalfelf(E) || isdarkelf(E))
					if(!E.cmode)
						to_chat(target, span_love("It tickles..."))
			else if(H.zone_selected == BODY_ZONE_PRECISE_R_EYE || H.zone_selected == BODY_ZONE_PRECISE_L_EYE)
				message_param = "kisses %t on the brow."
			else if(H.zone_selected == BODY_ZONE_PRECISE_SKULL)
				message_param = "целует %t в лобик."
			else
				message_param = "целует %t в [parse_zone(H.zone_selected)]."
	playsound(target, pick('sound/vo/kiss (1).ogg','sound/vo/kiss (2).ogg'), 100, FALSE, -1)
	if(user.mind)
		record_round_statistic(STATS_KISSES_MADE)

/datum/emote/living/lick
	key = "lick"
	key_third_person = "licks"
	message = "облизывает свои губы."
	message_param = "лижет %t."
	emote_type = EMOTE_VISIBLE
	use_params_for_runechat = TRUE

/mob/living/carbon/human/verb/emote_lick()
	set name = "Лизнуть"
	set category = "Emotes"

	emote("lick", intentional = TRUE, targetted = TRUE)

/datum/emote/living/lick/adjacentaction(mob/user, mob/target)
	. = ..()
	message_param = initial(message_param)
	if(!user || !target)
		return
	if(ishuman(user) && ishuman(target))
		var/mob/living/carbon/human/J = user
		var/do_change
		if(target.loc == user.loc)
			do_change = TRUE
		if(!do_change)
			if(J.pulling == target)
				do_change = TRUE
		if(do_change)
			if(J.zone_selected == BODY_ZONE_PRECISE_MOUTH)
				message_param = "licks %t's lips."
			else if(J.zone_selected == BODY_ZONE_PRECISE_EARS)
				message_param = "licks the ear of %t."
				var/mob/living/carbon/human/O = target
				if(iself(O) || ishalfelf(O) || isdarkelf(O))
					if(!O.cmode)
					/*	if (O.has_flaw(/datum/charflaw/addiction/lovefiend))
							to_chat(target, span_love("That feels... <b>good</b>..."))
						else*/
						to_chat(target, span_love("That tickles..."))
			else if(J.zone_selected == BODY_ZONE_PRECISE_GROIN)
				message_param = "licks %t between the legs."
				to_chat(target, span_love("It is somewhat stimulating..."))
			else if(J.zone_selected == BODY_ZONE_HEAD)
				message_param = "licks %t's cheek."
			else
				message_param = "licks %t's [parse_zone(J.zone_selected)]."
	playsound(target, pick("sound/vo/lick.ogg"), 100, FALSE, -1)

/datum/emote/living/spit
	key = "spit"
	key_third_person = "spits"
	message = "плюёт себе под ноги."
	message_param = "плюёт в %t."
	emote_type = EMOTE_VISIBLE

/mob/living/carbon/human/verb/emote_spit()
	set name = "Плюнуть"
	set category = "Emotes"

	emote("spit", intentional = TRUE, targetted = TRUE)


/datum/emote/living/spit/run_emote(mob/user, params, type_override, intentional)
	message_param = initial(message_param) // reset
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.mouth)
			if(H.mouth.spitoutmouth)
				H.visible_message(span_warning("[H] spits out [H.mouth]."))
				H.dropItemToGround(H.mouth, silent = FALSE)
			return
	..()

/datum/emote/living/spit/adjacentaction(mob/user, mob/target)
	. = ..()
	if(!user || !target)
		return
	if(user.gender == MALE)
		playsound(target, pick('sound/vo/male/gen/spit.ogg'), 100, FALSE, -1)
	else
		playsound(target, pick('sound/vo/female/gen/spit.ogg'), 100, FALSE, -1)


/datum/emote/living/hug
	key = "hug"
	key_third_person = "hugs"
	message = ""
	message_param = "hugs %t."
	emote_type = EMOTE_VISIBLE
	restraint_check = TRUE

/mob/living/carbon/human/verb/emote_hug()
	set name = "Обнять"
	set category = "Emotes"

	emote("hug", intentional = TRUE, targetted = TRUE)

/datum/emote/living/hug/adjacentaction(mob/user, mob/target)
	. = ..()
	if(!user || !target)
		return
	if(ishuman(target))
		playsound(target, pick('sound/body/hug.ogg'), 100, FALSE, -1)
		if(user.mind)
			record_round_statistic(STATS_HUGS_MADE)
			SEND_SIGNAL(user, COMSIG_MOB_HUGGED, target)

/datum/emote/living/holdbreath
    key = "hold"
    key_third_person = "holds"
    message = null

/mob/living/carbon/human/verb/emote_hold()
    set name = "Задержать дыхание"
    set category = "Emotes"
    emote("hold", intentional = TRUE)

/datum/emote/living/holdbreath/can_run_emote(mob/living/user, status_check = TRUE, intentional)
    . = ..()
    if(!.)
        return FALSE
    return TRUE

/datum/emote/living/holdbreath/run_emote(mob/user, params, type_override, intentional)
    if(!ishuman(user))
        return FALSE

    var/mob/living/carbon/human/H = user
    var/is_holding = HAS_TRAIT(H, TRAIT_HOLDBREATH)

    if(is_holding)
        REMOVE_TRAIT(H, TRAIT_HOLDBREATH, "[type]")
        H.visible_message(
            span_notice("[H] stops holding [H.p_their()] breath."),
            span_notice("You stop holding your breath.")
        )
    else
        ADD_TRAIT(H, TRAIT_HOLDBREATH, "[type]")
        H.visible_message(
            span_notice("[H] begins to hold [H.p_their()] breath."),
            span_notice("You begin to hold your breath.")
        )

    return TRUE

/datum/emote/living/slap
	key = "slap"
	key_third_person = "slaps"
	message = ""
	message_param = "шлёпает %t по лицу."
	emote_type = EMOTE_VISIBLE
	restraint_check = TRUE


/datum/emote/living/slap/run_emote(mob/user, params, type_override, intentional)
	message_param = initial(message_param)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.zone_selected == BODY_ZONE_PRECISE_GROIN)
			message_param = "шлёпает %t' по заднице!"
		else if(H.zone_selected == BODY_ZONE_PRECISE_SKULL)
			message_param = "даёт %t' подзатыльник!"
		else if(H.zone_selected == BODY_ZONE_PRECISE_L_HAND || H.zone_selected == BODY_ZONE_PRECISE_R_HAND)
			message_param = "шлёпает %t' по ладони!"
	..()

/mob/living/carbon/human/verb/emote_slap()
	set name = "Шлёпнуть"
	set category = "Emotes"

	emote("slap", intentional = TRUE, targetted = TRUE)

/datum/emote/living/slap/adjacentaction(mob/user, mob/target)
	. = ..()
	if(!user || !target)
		return
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		H.flash_fullscreen("redflash3")
		H.AdjustSleeping(-50)
		playsound(target, 'sound/foley/slap.ogg', 100, TRUE, -1)

/datum/emote/living/pinch
	key = "pinch"
	key_third_person = "pinches"
	message = ""
	message_param = "щипает %t."
	emote_type = EMOTE_VISIBLE
	restraint_check = TRUE

/datum/emote/living/pinch/adjacentaction(mob/user, mob/target)
	. = ..()
	if(!user || !target)
		return
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		H.flash_fullscreen("redflash1")

/mob/living/carbon/human/verb/emote_pinch()
	set name = "Щипать"
	set category = "Emotes"

	emote("pinch", intentional = TRUE, targetted = TRUE)

/datum/emote/living/laugh/run_emote(mob/user, params, type_override, intentional, targetted)
	. = ..()
	if(. && user.mind)
		record_round_statistic(STATS_LAUGHS_MADE)

/datum/emote/living/laugh
	key = "laugh"
	key_third_person = "laughs"
	message = "смеётся."
	message_mime = "тихо смеётся!"
	message_muffled = "makes a muffled laugh."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/datum/emote/living/laugh/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/laugh/run_emote(mob/living/user, params, type_override, intentional)
	. = ..()
	if(.)
		// Apply Xylix buff to those with the trait who hear the laughter
		// Only apply if the hearer is not the one laughing
		for(var/mob/living/carbon/human/H in hearers(7, user))
			if(H == user || !H.client)
				continue
			if(HAS_TRAIT(H, TRAIT_XYLIX) && !H.has_status_effect(/datum/status_effect/buff/xylix_joy))
				H.apply_status_effect(/datum/status_effect/buff/xylix_joy)
				to_chat(H, span_info("The laughter brings a smile to my face, and fortune to my steps!"))

/mob/living/carbon/human/verb/emote_laugh()
	set name = "Смех"
	set category = "Noises"

	emote("laugh", intentional = TRUE)

/datum/emote/living/look
	key = "look"
	key_third_person = "looks"
	message = "куда-то смотрит."
	message_param = "смотрит на %t."

/datum/emote/living/nod
	key = "nod"
	key_third_person = "nods"
	message = "кивает."
	message_param = "кивает %t."
	emote_type = EMOTE_VISIBLE
/mob/living/carbon/human/verb/emote_nod()
	set name = "Кивать"
	set category = "Emotes"

	emote("nod", intentional = TRUE)

/datum/emote/living/point
	key = "point"
	key_third_person = "points"
	message = "указывает."
	message_param = "указывает на %t."
	restraint_check = TRUE

/datum/emote/living/point/run_emote(mob/user, params, type_override, intentional)
	message_param = initial(message_param) // reset
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_num_arms() == 0)
			if(H.get_num_legs() != 0)
				message_param = "tries to point at %t with a leg, <span class='danger'>falling down</span> in the process!"
				H.Paralyze(20)
			else
				message_param = "<span class='danger'>bumps [user.p_their()] head on the ground</span> trying to motion towards %t."
				H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5)
	..()

/datum/emote/living/pout
	key = "pout"
	key_third_person = "pouts"
	message = "pouts."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/datum/emote/living/scream
	key = "scream"
	key_third_person = "screams"
	message = "кричит!"
	message_mime = "acts out a scream!"
	message_muffled = "makes a muffled noise in attempt to scream!"
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_scream()
	set name = "Крик"
	set category = "Noises"

	emote("scream", intentional = TRUE)

/datum/emote/living/scream/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		if(intentional)
			if(!C.stamina_add(10))
				to_chat(C, span_warning("I try to scream but my voice fails me."))
				. = FALSE

/datum/emote/living/scream/run_emote(mob/user, params, type_override, intentional, targetted)
	. = ..()
	if(. && user.mind)
		record_featured_stat(FEATURED_STATS_SCREAMERS, user)

/datum/emote/living/scream/painscream
	key = "painscream"
	message = "screams in pain!"
	emote_type = EMOTE_AUDIBLE
	only_forced_audio = TRUE
	show_runechat = FALSE

/datum/emote/living/scream/painscream/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(.)
		for(var/mob/living/carbon/human/L in viewers(7,user))
			if(L == user)
				continue
			if(L.has_flaw(/datum/charflaw/addiction/sadist))
				L.sate_addiction()

/datum/emote/living/scream/strain
	key = "strain"
	message = "strains themselves!"
	emote_type = EMOTE_AUDIBLE
	only_forced_audio = TRUE
	show_runechat = FALSE

/datum/emote/living/scream/agony
	key = "agony"
	message = "screams in agony!"
	emote_type = EMOTE_AUDIBLE
	only_forced_audio = TRUE
	show_runechat = FALSE

/datum/emote/living/scream/agony/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(.)
		for(var/mob/living/carbon/human/L in viewers(7,user))
			if(L == user)
				continue
			if(L.has_flaw(/datum/charflaw/addiction/sadist))
				L.sate_addiction()

/datum/emote/living/scream/firescream
	key = "firescream"
	nomsg = TRUE
	emote_type = EMOTE_AUDIBLE
	only_forced_audio = TRUE
	show_runechat = FALSE

/datum/emote/living/scream/firescream/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(.)
		for(var/mob/living/carbon/human/L in viewers(7,user))
			if(L == user)
				continue
			if(L.has_flaw(/datum/charflaw/addiction/sadist))
				L.sate_addiction()

/datum/emote/living/aggro
	key = "aggro"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	only_forced_audio = TRUE
	show_runechat = FALSE

/datum/emote/living/idle
	key = "idle"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	only_forced_audio = TRUE
	show_runechat = FALSE

/datum/emote/living/death
	key = "death"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	only_forced_audio = TRUE
	stat_allowed = UNCONSCIOUS
	mob_type_ignore_stat_typecache = list(/mob/living)
	show_runechat = FALSE

/datum/emote/living/pain
	key = "pain"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	only_forced_audio = TRUE
	show_runechat = FALSE

/datum/emote/living/drown
	key = "drown"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	only_forced_audio = TRUE
	ignore_silent = TRUE
	show_runechat = FALSE

/datum/emote/living/paincrit
	key = "paincrit"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	only_forced_audio = TRUE
	show_runechat = FALSE

/datum/emote/living/embed
	key = "embed"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	only_forced_audio = TRUE
	show_runechat = FALSE

/datum/emote/living/painmoan
	key = "painmoan"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	only_forced_audio = TRUE
	show_runechat = FALSE

/datum/emote/living/groin
	key = "groin"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	only_forced_audio = TRUE
	show_runechat = FALSE

/datum/emote/living/fatigue
	key = "fatigue"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	only_forced_audio = TRUE
	show_runechat = FALSE

/datum/emote/living/jump
	key = "jump"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	only_forced_audio = TRUE
	show_runechat = FALSE

/datum/emote/living/haltyell
	key = "haltyell"
	message = "shouts a halt!"
	emote_type = EMOTE_AUDIBLE
	only_forced_audio = TRUE
	show_runechat = FALSE

/datum/emote/living/rage
	key = "rage"
	message = "кричит в ярости!"
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_rage()
	set name = "Ярость"
	set category = "Noises"

	emote("rage", intentional = TRUE)

/datum/emote/living/rage/run_emote(mob/user, params, type_override, intentional, targetted)
	. = ..()
	if(. && user.mind)
		record_round_statistic(STATS_WARCRIES)

/datum/emote/living/attnwhistle
	key = "attnwhistle"
	message = "свистит!"
	message_muffled = "makes a muffled noise."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_attnwhistle()
	set name = "Свист"
	set category = "Noises"

	emote("attnwhistle", intentional = TRUE)

/datum/emote/living/choke
	key = "choke"
	key_third_person = "chokes"
	message = "chokes!"
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/datum/emote/living/scowl
	key = "scowl"
	key_third_person = "scowls"
	message = "scowls."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/datum/emote/living/shakehead
	key = "shakehead"
	key_third_person = "shakeshead"
	message = "мотает головой."
	emote_type = EMOTE_VISIBLE

/mob/living/carbon/human/verb/emote_shakehead()
	set name = "Мотать головой"
	set category = "Emotes"

	emote("shakehead", intentional = TRUE)


/datum/emote/living/shiver
	key = "shiver"
	key_third_person = "shiver"
	message = "дрожит."
	emote_type = EMOTE_VISIBLE

/mob/living/carbon/human/verb/emote_shiver()
	set name = "Дрожать"
	set category = "Emotes"

	emote("shiver", intentional = TRUE)


/datum/emote/living/sigh
	key = "sigh"
	key_third_person = "sighs"
	message = "вздыхает."
	message_muffled = "makes a muffled sigh."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_sigh()
	set name = "Вздох"
	set category = "Noises"

	emote("sigh", intentional = TRUE)

/datum/emote/living/whistle
	key = "whistle"
	key_third_person = "whistles"
	message = "насвистывает."
	message_muffled = "makes a muffled noise."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_whistle()
	set name = "Насвистывать"
	set category = "Noises"

	emote("whistle", intentional = TRUE)

/datum/emote/living/hmm
	key = "hmm"
	key_third_person = "hmms"
	message = "хмыкает."
	message_muffled = "makes a muffled hmm."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_hmm()
	set name = "Хмм"
	set category = "Noises"

	emote("hmm", intentional = TRUE)

/datum/emote/living/huh
	key = "huh"
	key_third_person = "huhs"
	message_muffled = "makes a muffled noise."
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_huh()
	set name = "Хах?"
	set category = "Noises"

	emote("huh", intentional = TRUE)

/datum/emote/living/hum
	key = "hum"
	key_third_person = "hums"
	message = "гудит."
	emote_type = EMOTE_AUDIBLE
	message_muffled = "makes a muffled hum."
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_hum()
	set name = "Гудеть"
	set category = "Noises"

	emote("hum", intentional = TRUE)

/datum/emote/living/smile
	key = "smile"
	key_third_person = "smiles"
	message = "улыбается."
	emote_type = EMOTE_VISIBLE
/mob/living/carbon/human/verb/emote_smile()
	set name = "Улыбнуться"
	set category = "Emotes"

	emote("smile", intentional = TRUE)

/datum/emote/living/sneeze
	key = "sneeze"
	key_third_person = "sneezes"
	message = "sneezes."
	message_muffled = "makes a muffled sneeze."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/datum/emote/living/shh
	key = "shh"
	key_third_person = "shhs"
	message = "чшикает."
	message_muffled = "makes a muffled shh."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_shh()
	set name = "Чш-ш"
	set category = "Noises"

	emote("shh", intentional = TRUE)

/datum/emote/living/smug
	key = "smug"
	key_third_person = "smugs"
	message = "grins smugly."

/datum/emote/living/sniff
	key = "sniff"
	key_third_person = "sniffs"
	message = "sniffs."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/datum/emote/living/snore
	key = "snore"
	key_third_person = "snores"
	message = "snores."
	message_mime = "sleeps soundly."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS
	snd_range = -4
	show_runechat = FALSE

/datum/emote/living/stare
	key = "stare"
	key_third_person = "stares"
	message = "stares."
	message_param = "stares at %t."

/datum/emote/living/strech
	key = "stretch"
	key_third_person = "stretches"
	message = "stretches their arms."

/datum/emote/living/sulk
	key = "sulk"
	key_third_person = "sulks"
	message = "sulks down sadly."

/datum/emote/living/sway
	key = "sway"
	key_third_person = "sways"
	message = "sways around dizzily."

/datum/emote/living/tremble
	key = "tremble"
	key_third_person = "trembles"
	message = "trembles in fear!"

/datum/emote/living/twitch
	key = "twitch"
	key_third_person = "twitches"
	message = "twitches violently."

/datum/emote/living/twitch_s
	key = "twitch_s"
	message = "twitches."
	stat_allowed = UNCONSCIOUS
	mob_type_ignore_stat_typecache = list(/mob/living/carbon/human)

/datum/emote/living/warcry
	key = "warcry"
	key_third_person = "warcrys"
	message = "издаёт боевой крик!"
	emote_type = EMOTE_AUDIBLE
	message_muffled = "makes a muffled shout!"
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_warcry()
	set name = "Боевой крик"
	set category = "Noises"

	emote("warcry", intentional = TRUE)

/datum/emote/living/wave
	key = "wave"
	key_third_person = "waves"
	message = "waves."

/datum/emote/living/whimper
	key = "whimper"
	key_third_person = "whimpers"
	message = "всхлипывает."
	message_mime = "appears hurt."
	message_muffled = "makes a muffled whimper."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_whimper()
	set name = "Всхлипывать"
	set category = "Noises"

	emote("whimper", intentional = TRUE)

/datum/emote/living/wsmile
	key = "wsmile"
	key_third_person = "wsmiles"
	message = "smiles weakly."

/datum/emote/living/yawn
	key = "yawn"
	key_third_person = "yawns"
	message = "зевает."
	message_muffled = "тихо зевает."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_yawn()
	set name = "Зевать"
	set category = "Noises"

	emote("yawn", intentional = TRUE)

/datum/emote/living/custom
	key = "me"
	key_third_person = "custom"
	show_runechat = TRUE
#ifdef MATURESERVER
	message_param = "%t"
#endif
	//mute_time = 1 - RATWOOD CHANGE, I don't want spammers.
/datum/emote/living/custom/can_run_emote(mob/user, status_check, intentional)
	. = ..() && intentional

/datum/emote/living/custom/proc/check_invalid(mob/user, input)
	. = TRUE
	if(copytext(input,1,5) == "says")
		to_chat(user, span_danger("Invalid emote."))
	else if(copytext(input,1,9) == "exclaims")
		to_chat(user, span_danger("Invalid emote."))
	else if(copytext(input,1,6) == "yells")
		to_chat(user, span_danger("Invalid emote."))
	else if(copytext(input,1,5) == "asks")
		to_chat(user, span_danger("Invalid emote."))
	else
		. = FALSE

/datum/emote/living/custom/run_emote(mob/user, params, type_override = null, intentional = FALSE)
	if(!can_run_emote(user, TRUE, intentional))
		return FALSE
	if(is_banned_from(user.ckey, "Emote"))
		to_chat(user, span_boldwarning("I cannot send custom emotes (banned)."))
		return FALSE
	else if(QDELETED(user))
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, span_boldwarning("I cannot send IC messages (muted)."))
		return FALSE
	else if(!params)
		var/custom_emote = copytext(sanitize(input("What does your character do?") as text|null), 1, MAX_MESSAGE_LEN)
		if(custom_emote && !check_invalid(user, custom_emote))
/*			var/type = input("Is this a visible or hearable emote?") as null|anything in list("Visible", "Hearable")
			switch(type)
				if("Visible")
					emote_type = EMOTE_VISIBLE
				if("Hearable")
					emote_type = EMOTE_AUDIBLE
				else
					alert("Unable to use this emote, must be either hearable or visible.")
					return*/
			message = custom_emote
			emote_type = EMOTE_VISIBLE
	else
		message = params
		if(type_override)
			emote_type = type_override
	. = ..()
	message = null
	emote_type = EMOTE_VISIBLE

/datum/emote/living/custom/replace_pronoun(mob/user, message)
	return message

/datum/emote/living/help
	key = "help"

/datum/emote/living/help/run_emote(mob/user, params, type_override, intentional)
/*	var/list/keys = list()
	var/list/message = list("Available emotes, you can use them with say \"*emote\": ")

	for(var/key in GLOB.emote_list)
		for(var/datum/emote/P in GLOB.emote_list[key])
			if(P.key in keys)
				continue
			if(P.can_run_emote(user, status_check = FALSE , intentional = TRUE))
				keys += P.key

	keys = sortList(keys)

	for(var/emote in keys)
		if(LAZYLEN(message) > 1)
			message += ", [emote]"
		else
			message += "[emote]"

	message += "."

	message = jointext(message, "")

	to_chat(user, message)*/

/datum/emote/beep
	key = "beep"
	key_third_person = "beeps"
	message = "beeps."
	message_param = "beeps at %t."
	sound = 'sound/blank.ogg'
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon)
/*
/datum/emote/living/circle
	key = "circle"
	key_third_person = "circles"
	restraint_check = TRUE

/datum/emote/living/circle/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	var/obj/item/circlegame/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, span_notice("I make a circle with your hand."))
	else
		qdel(N)
		to_chat(user, span_warning("I don't have any free hands to make a circle with."))

/datum/emote/living/slap
	key = "slap"
	key_third_person = "slaps"
	restraint_check = TRUE

/datum/emote/living/slap/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	var/obj/item/slapper/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, span_notice("I ready your slapping hand."))
	else
		to_chat(user, span_warning("You're incapable of slapping in your current state."))
*/

/datum/emote/living/shake
	key = "shake"
	key_third_person = "shakes"
	message = "качает головой."
	emote_type = EMOTE_VISIBLE

/mob/living/carbon/human/verb/emote_shake()
	set name = "Качать головой"
	set category = "Emotes"

	emote("shake", intentional = TRUE)

/datum/emote/living/squint
	key = "squint"
	key_third_person = "squints"
	message = "щурится."
	emote_type = EMOTE_VISIBLE

/mob/living/carbon/human/verb/emote_squint()
	set name = "Щуриться"
	set category = "Emotes"

	emote("squint", intentional = TRUE)

/datum/emote/living/meow
	key = "meow"
	key_third_person = "meows!"
	message = "мяукает!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled sound!"
	vary = TRUE
	show_runechat = FALSE
	is_animal = TRUE

/mob/living/carbon/human/verb/emote_meow()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue))
		set name = "(Ж) Мяу"
		set category = "Animal"
		emote("meow", intentional = TRUE, animal = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/caw
	key = "caw"
	key_third_person = "caws!"
	message = "каркает!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled sound!"
	vary = TRUE
	show_runechat = FALSE
	is_animal = TRUE

/mob/living/carbon/human/verb/emote_caw()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue) || istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/harpy))
		set name = "(Ж) Каркать"
		set category = "Animal"
		emote("caw", intentional = TRUE, animal = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/peep
	key = "peep"
	key_third_person = "peeps!"
	message = "пищит!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled sound!"
	vary = TRUE
	show_runechat = FALSE
	is_animal = TRUE

/mob/living/carbon/human/verb/emote_peep()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue) || istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/harpy))
		set name = "(Ж) Пищать"
		set category = "Animal"
		emote("peep", intentional = TRUE, animal = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/hoot
	key = "hoot"
	key_third_person = "hoots!"
	message = "ухает!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled sound!"
	vary = TRUE
	show_runechat = FALSE
	is_animal = TRUE

/mob/living/carbon/human/verb/emote_hoot()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue) || istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/harpy))
		set name = "(Ж) Ухать"
		set category = "Animal"
		emote("hoot", intentional = TRUE, animal = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/squeak
	key = "squeak"
	key_third_person = "squeaks!"
	message = "пищит!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled sound!"
	vary = TRUE
	show_runechat = FALSE
	is_animal = TRUE

/mob/living/carbon/human/verb/emote_squeak()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue))
		set name = "(Ж) Писк"
		set category = "Animal"
		emote("squeak", intentional = TRUE, animal = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/hiss
	key = "hiss"
	key_third_person = "hisses!"
	message = "шипит!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled sound!"
	vary = TRUE
	show_runechat = FALSE
	is_animal = TRUE

/mob/living/carbon/human/verb/emote_hiss()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue))
		set name = "(Ж) Шипеть"
		set category = "Animal"
		emote("hiss", intentional = TRUE, animal = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/phiss
	key = "phiss"
	key_third_person = "hisses!"
	message = "шипит!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled sound!"
	vary = TRUE
	show_runechat = FALSE
	is_animal = TRUE

/mob/living/carbon/human/verb/emote_phiss()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue))
		set name = "(Ж) Шипеть2"
		set category = "Animal"
		emote("phiss", intentional = TRUE, animal = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/roar
	key = "roar"
	key_third_person = "roars!"
	message = "рычит!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled sound!"
	vary = TRUE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_roar()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue))
		set name = "(Ж) Рычать2"
		set category = "Animal"
		emote("roar", intentional = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/howl
	key = "howl"
	key_third_person = "howls!"
	message = "воет!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled sound!"
	vary = TRUE
	show_runechat = FALSE
	is_animal = TRUE

/mob/living/carbon/human/verb/emote_howl()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue))
		set name = "(Ж) Выть"
		set category = "Animal"
		emote("howl", intentional = TRUE, animal = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/cackle
	key = "cackle"
	key_third_person = "cackles!"
	message = "кудахтает!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled sound!"
	vary = TRUE
	show_runechat = FALSE
	is_animal = TRUE

/mob/living/carbon/human/verb/emote_cackle()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue))
		set name = "(Ж) Кудахтать"
		set category = "Animal"
		emote("cackle", intentional = TRUE, animal = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/snap
	key = "snap"
	key_third_person = "finger snaps!"
	message = "щёлкает пальцами,"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_snap()
	set name = "Щёлк. Пальцами"
	set category = "Noises"

	emote("snap", intentional = TRUE)

/datum/emote/living/blink
	key = "blink"
	key_third_person = "blinks."
	message = "моргает."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_blink()
	set name = "Моргнуть"
	set category = "Noises"

	emote("blink", intentional = TRUE)

/datum/emote/living/snap2
	key = "snap2"
	key_third_person = "щёлкает пальцами!"
	message = "щёлкает пальцами."
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_snap2()
	set name = "Щёлк. Пальцами2"
	set category = "Noises"

	emote("snap2", intentional = TRUE)

/datum/emote/living/snap3
	key = "snap3"
	key_third_person = "щёлкает пальцами!"
	message = "щёлкает пальцами."
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_snap3()
	set name = "Щёлк. Пальцами3"
	set category = "Noises"

	emote("snap3", intentional = TRUE)

/datum/emote/living/purr
	key = "purr"
	key_third_person = "purrs!"
	message = "мурлыкает!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled sound!"
	vary = TRUE
	show_runechat = FALSE
	is_animal = TRUE

/mob/living/carbon/human/verb/emote_purr()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue))
		set name = "(Ж) Мурлыкать"
		set category = "Animal"
		emote("purr", intentional = TRUE, animal = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/moo
	key = "moo"
	key_third_person = "moos!"
	message = "му-укает!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled sound!"
	vary = TRUE
	show_runechat = FALSE
	is_animal = TRUE

/mob/living/carbon/human/verb/emote_moo()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue))
		set name = "(Ж) Му-у"
		set category = "Animal"
		emote("moo", intentional = TRUE, animal = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/bark
	key = "bark"
	key_third_person = "barks!"
	message = "лает!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled sound!"
	vary = TRUE
	show_runechat = FALSE
	is_animal = TRUE

/mob/living/carbon/human/verb/emote_bark()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue))
		set name = "(Ж) Лаять"
		set category = "Animal"
		emote("bark", intentional = TRUE, animal = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/growl
	key = "growl"
	key_third_person = "growls!"
	message = "рычит!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled sound!"
	vary = TRUE
	show_runechat = FALSE
	is_animal = TRUE

/mob/living/carbon/human/verb/emote_growl()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue))
		set name = "(Ж) Рычать"
		set category = "Animal"
		emote("growl", intentional = TRUE, animal = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/bleat
	key = "bleat"
	key_third_person = "bleats!"
	message = "мычит!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled sound!"
	vary = TRUE
	show_runechat = FALSE
	is_animal = TRUE

/mob/living/carbon/human/verb/emote_bleat()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue))
		set name = "(Ж) Мычать"
		set category = "Animal"
		emote("bleat", intentional = TRUE, animal = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/chitter
	key = "chitter"
	key_third_person = "chitters!"
	message = "щебечет!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	message_muffled = "makes a muffled chitter!"
	vary = TRUE
	show_runechat = FALSE
	is_animal = TRUE

/mob/living/carbon/human/verb/emote_chitter()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/moth))
		set name = "(Ж) Щебетать"
		set category = "Animal"
		emote("chitter", intentional = TRUE, animal = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/flutter
	key = "flutter"
	key_third_person = "flutters!"
	message = "трепещет!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/emote_flutter()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/moth))
		set name = "(Ж) Трепетать"
		set category = "Animal"
		emote("flutter", intentional = TRUE)
	else
		to_chat(usr, span_warning("Your back doesn't do that"))
		return

/datum/emote/living/fsalute
	key = "fsalute"
	key_third_person = "salutes their faith."
	message = "показывает Салют Веры!"
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/datum/emote/living/fsalute/run_emote(mob/living/user, params, type_override, intentional, targetted, animal)
	. = ..()
	if(. && !isnull(user.patron))
		user.play_overhead_indicator('icons/mob/overhead_effects.dmi', "stress", 15, MUTATIONS_LAYER, private = user.patron.type, soundin = 'sound/magic/holyshield.ogg', y_offset = 32)

/mob/living/carbon/human/verb/emote_fsalute()
	set name = "Салют Веры"
	set category = "Emotes"

	emote("fsalute", intentional =  TRUE)

/datum/emote/living/ffsalute
	key = "ffsalute"
	key_third_person = "salutes their faith."
	message = "показывает Салют Веры!"
	emote_type = EMOTE_AUDIBLE
	show_runechat = TRUE

/datum/emote/living/ffsalute/run_emote(mob/living/user, params, type_override, intentional, targetted, animal)
	if(HAS_TRAIT(user, TRAIT_XYLIX))
		. = ..()

/mob/living/carbon/human/proc/emote_ffsalute()
	set name = "Лживый Салют Веры"
	set category = "Emotes"

	emote("ffsalute", intentional =  TRUE)

/datum/emote/living/yip
	key = "yip"
	key_third_person = "yips"
	message = "уип!"
	emote_type = EMOTE_AUDIBLE
	message_muffled = "makes a muffled yip!"
	is_animal = TRUE
	show_runechat = FALSE
/mob/living/carbon/human/verb/yip()
	set name = "Уип"
	set category = "Noises"
	emote("yip", intentional = TRUE)

/datum/emote/living/yap
	key = "yap"
	key_third_person = "yaps"
	message = "яп!"
	emote_type = EMOTE_AUDIBLE
	message_muffled = "makes a muffled yap!"
	is_animal = TRUE
	show_runechat = FALSE
/mob/living/carbon/human/verb/yap()
	set name = "Яп"
	set category = "Noises"
	emote("yap", intentional = TRUE)

/datum/emote/living/gulp
	key = "gulp"
	key_third_person = "gulps"
	message = "сглатывает."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/gulp()
	set name = "Сглотнуть"
	set category = "Noises"

	emote("gulp", intentional = TRUE)

/datum/emote/living/crack
	key = "crack"
	key_third_person = "cracks"
	message = "разминает кулаки."
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/crack()
	set name = "Разм. Кулаки"
	set category = "Noises"

	emote("crack", intentional = TRUE)

/datum/emote/living/salute
	key = "salute"
	key_third_person = "отдаёт честь."
	message = "отдаёт честь!"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/salute()
	set name = "Отдать честь"
	set category = "Noises"

	emote("salute", intentional = TRUE)

/datum/emote/living/sniff
	key = "sniff"
	key_third_person = "sniffs"
	message = "сопит."
	emote_type = EMOTE_AUDIBLE
	show_runechat = FALSE

/mob/living/carbon/human/verb/sniff()
	set name = "Сопение"
	set category = "Noises"

	emote("sniff", intentional = TRUE)

/datum/emote/living/praysuicide/run_emote(mob/user, params, type_override, intentional)
    if(!user)
        return FALSE

    var/mob/living/L = user


    to_chat(L, span_danger("I pray to my patron for my death... and I am heard."))


    var/lastmsg = params
    if(!lastmsg)
        lastmsg = input("Произнеси свои последние слова:", "Последние слова") as text|null
    if(!lastmsg)
        return FALSE

    L.whisper(lastmsg)

    if(iscarbon(L))
        var/mob/living/carbon/C = L
        C.adjustOxyLoss(200)
    else if(isliving(L))
        L.death()
    else
        to_chat(L, span_warning("Nothing happens."))

    return TRUE

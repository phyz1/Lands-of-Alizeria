GLOBAL_LIST_EMPTY(outlawed_players)
GLOBAL_LIST_EMPTY(lord_decrees)
GLOBAL_LIST_EMPTY(court_agents)
GLOBAL_LIST_INIT(laws_of_the_land, initialize_laws_of_the_land())

/proc/initialize_laws_of_the_land()
	var/list/laws = strings("laws_of_the_land.json", "lawsets")
	var/list/lawsets_weighted = list()
	for(var/lawset_name as anything in laws)
		var/list/lawset = laws[lawset_name]
		lawsets_weighted[lawset_name] = lawset["weight"]
	var/chosen_lawset = pickweight(lawsets_weighted)
	return laws[chosen_lawset]["laws"]

/obj/structure/roguemachine/titan
	name = "throat"
	desc = "He who wears the crown holds the key to this strange thing. If all else fails, demand the \"secrets of the throat!\""
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = ""
	density = FALSE
	blade_dulling = DULLING_BASH
	integrity_failure = 0.5
	max_integrity = 0
	anchored = TRUE
	var/mode = 0


/obj/structure/roguemachine/titan/obj_break(damage_flag)
	..()
	cut_overlays()
//	icon_state = "[icon_state]-br"
	set_light(0)
	return

/obj/structure/roguemachine/titan/Destroy()
	lose_hearing_sensitivity()
	set_light(0)
	return ..()

/obj/structure/roguemachine/titan/Initialize()
	. = ..()
	icon_state = null
	become_hearing_sensitive()
//	var/mutable_appearance/eye_lights = mutable_appearance(icon, "titan-eyes")
//	eye_lights.plane = ABOVE_LIGHTING_PLANE //glowy eyes
//	eye_lights.layer = ABOVE_LIGHTING_LAYER
//	add_overlay(eye_lights)
	set_light(5)

/obj/structure/roguemachine/titan/Hear(message, atom/movable/speaker, message_language, raw_message, radio_freq, list/spans, message_mode, message)
//	. = ..()
	if(speaker == src)
		return
	if(speaker.loc != loc)
		return
	if(obj_broken)
		return
	if(!ishuman(speaker))
		return
	var/mob/living/carbon/human/H = speaker
	var/nocrown
	if(!istype(H.head, /obj/item/clothing/head/roguetown/crown/serpcrown))
		nocrown = TRUE
	var/notlord = TRUE
	if(SSticker.rulermob == H || SSticker.regentmob == H)
		notlord = FALSE

	if(mode)
		if(findtext(message, "отмена"))
			mode = 0
			return
	if(findtext(message, "призвать корону")) //This must never fail, thus place it before all other modestuffs.
		if(!SSroguemachine.crown)
			new /obj/item/clothing/head/roguetown/crown/serpcrown(src.loc)
			say("Корона призвана!")
			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			playsound(src, 'sound/misc/hiss.ogg', 100, FALSE, -1)
		if(SSroguemachine.crown)
			var/obj/item/clothing/head/roguetown/crown/serpcrown/I = SSroguemachine.crown
			if(!I)
				I = new /obj/item/clothing/head/roguetown/crown/serpcrown(src.loc)
			if(I && !ismob(I.loc))//You MUST MUST MUST keep the Crown on a person to prevent it from being summoned (magical interference)
				var/area/crown_area = get_area(I)
				if(crown_area && istype(crown_area, /area/rogue/indoors/town/vault) && notlord) //Anti throat snipe from vault
					say("Корона находится в хранилище.")
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					return
				I.anti_stall()
				I = new /obj/item/clothing/head/roguetown/crown/serpcrown(src.loc)
				say("Корона призвана!")
				playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
				playsound(src, 'sound/misc/hiss.ogg', 100, FALSE, -1)
				return
			if(ishuman(I.loc))
				var/mob/living/carbon/human/HC = I.loc
				if(HC.stat != DEAD)
					if(I in HC.held_items)
						say("[HC.real_name] holds the crown!")
						playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
						return
					if(HC.head == I)
						say("[HC.real_name] wears the crown!")
						playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
						return
				else
					HC.dropItemToGround(I, TRUE) //If you're dead, forcedrop it, then move it.
			I.forceMove(src.loc)
			say("Корона призвана!")
			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			playsound(src, 'sound/misc/hiss.ogg', 100, FALSE, -1)
	if(findtext(message, "призвать ключ"))
		if(nocrown)
			say("Тебе нужна корона.")
			playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
			return
		if(!SSroguemachine.key)
			new /obj/item/roguekey/lord(src.loc)
			say("Ключ призван!")
			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			playsound(src, 'sound/misc/hiss.ogg', 100, FALSE, -1)
		if(SSroguemachine.key)
			var/obj/item/roguekey/lord/I = SSroguemachine.key
			if(!I)
				I = new /obj/item/roguekey/lord(src.loc)
			if(I && !ismob(I.loc))
				I.anti_stall()
				I = new /obj/item/roguekey/lord(src.loc)
				say("Ключ призван!")
				playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
				playsound(src, 'sound/misc/hiss.ogg', 100, FALSE, -1)
				return
			if(ishuman(I.loc))
				var/mob/living/carbon/human/HC = I.loc
				if(HC.stat != DEAD)
					say("[HC.real_name] holds the key!")
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					return
				else
					HC.dropItemToGround(I, TRUE) //If you're dead, forcedrop it, then move it.
			I.forceMove(src.loc)
			say("Ключ призван!")
			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			playsound(src, 'sound/misc/hiss.ogg', 100, FALSE, -1)
	switch(mode)
		if(0)
			if(findtext(message, "помощь"))
				say("Мои команды: Издать Указ, Сделать Объявление, Установить Налоги, Объявить Преступника, Призвать Корону, Призвать Ключ, Издать Закон, Отменить Закон, Убрать Законы, Отменить Указы, Стать Наместником, Отмена.")
				playsound(src, 'sound/misc/machinelong.ogg', 100, FALSE, -1)
			if(findtext(message, "сделать объявление"))
				if(nocrown)
					say("Тебе нужна корона.")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				if(!SScommunications.can_announce(H))
					say("Мне нужно передохнуть!")
					return
				say("Говори, они услышат.")
				playsound(src, 'sound/misc/machineyes.ogg', 100, FALSE, -1)
				mode = 1
				return
			if(findtext(message, "издать указ"))
				if(!SScommunications.can_announce(H))
					say("Мне нужно передохнуть!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				if(notlord || nocrown)
					say("ТЫ НЕ МОЙ ЛОРД!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				say("Говори, они подчинятся.")
				playsound(src, 'sound/misc/machineyes.ogg', 100, FALSE, -1)
				mode = 2
				return
			if(findtext(message, "отменить указы"))
				if(notlord || nocrown)
					say("ТЫ НЕ МОЙ ЛОРД!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				say("Все указы были отменены!")
				playsound(src, 'sound/misc/machineyes.ogg', 100, FALSE, -1)
				purge_decrees()
				return
			if(findtext(message, "издать закон"))
				if(notlord || nocrown)
					say("ТЫ НЕ МОЙ ЛОРД!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				say("Говори, они последуют.")
				playsound(src, 'sound/misc/machineyes.ogg', 100, FALSE, -1)
				mode = 4
				return
			if(findtext(message, "отменить закон"))
				if(notlord || nocrown)
					say("ТЫ НЕ МОЙ ЛОРД!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				var/message_clean = replacetext(message, "remove law", "")
				var/law_index = text2num(message_clean) || 0
				if(!law_index || !GLOB.laws_of_the_land[law_index])
					say("Такого закона нет!")
					return
				say("Этот закон убран!")
				playsound(src, 'sound/misc/machineyes.ogg', 100, FALSE, -1)
				remove_law(law_index)
				return
			if(findtext(message, "убрать законы"))
				if(notlord || nocrown)
					say("ТЫ НЕ МОЙ ЛОРД!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				say("Все законы были отменены!")
				playsound(src, 'sound/misc/machineyes.ogg', 100, FALSE, -1)
				purge_laws()
				return
			if(findtext(message, "объявить преступника"))
				if(notlord || nocrown)
					say("ТЫ НЕ МОЙ ЛОРД!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				say("Кого объявляем?")
				playsound(src, 'sound/misc/machinequestion.ogg', 100, FALSE, -1)
				mode = 3
				return
			if(findtext(message, "установить налоги"))
				if(notlord || nocrown)
					say("ТЫ НЕ МОЙ ЛОРД!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				say("Новым процентом налогов будет...")
				playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
				give_tax_popup(H)
				return
			if(findtext(message, "стать наместником"))
				if(nocrown)
					say("Тебе нужна корона.")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				if(SSticker.rulermob && SSticker.rulermob == H) //failsafe for edge cases
					say("Никто кроме вас не займёт меня, мой лорд.")
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					SSticker.regentmob = null
					return
				if(SSticker.rulermob != null)
					say("Настоящий лорд уже есть на этой земле.")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				if(!(HAS_TRAIT(H, TRAIT_NOBLE)))
					say("ТЫ?! ЖАЛКИЙ СМЕРД?! ВЛАДЕТЬ МНОЙ?!?! ДА ПОШЁЛ ТЫ!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				if(HAS_TRAIT(H, TRAIT_OUTLANDER))
					say("Ты кто такой? Проваливай, странник.")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				if(SSticker.regentday == GLOB.dayspassed)
					say("Наместник уже был назначен в этот дае!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				if(SSticker.regentmob == H)
					say("Ты уже наместник!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				become_regent(H)
				return

		if(1)
			make_announcement(H, raw_message)
			mode = 0
		if(2)
			make_decree(H, raw_message)
			mode = 0
		if(3)
			declare_outlaw(H, message)
			mode = 0
		if(4)
			if(!SScommunications.can_announce(speaker))
				return
			make_law(raw_message)
			mode = 0

/obj/structure/roguemachine/titan/proc/give_tax_popup(mob/living/carbon/human/user)
	if(!Adjacent(user))
		return
	var/newtax = input(user, "Установить новый процент налогов (1-99)", src, SStreasury.tax_value*100) as null|num
	if(newtax)
		if(!Adjacent(user))
			return
		if(findtext(num2text(newtax), "."))
			return
		newtax = CLAMP(newtax, 1, 99)
		SStreasury.tax_value = newtax / 100
		priority_announce("Процент налогов отныне составляет [newtax]%.", "Указ Щедрого Наместника", pick('sound/misc/royal_decree.ogg', 'sound/misc/royal_decree2.ogg'), "Captain")


/obj/structure/roguemachine/titan/proc/make_announcement(mob/living/user, raw_message)
	if(!SScommunications.can_announce(user))
		return
	try_make_rebel_decree(user)

	SScommunications.make_announcement(user, FALSE, raw_message)

/obj/structure/roguemachine/titan/proc/try_make_rebel_decree(mob/living/user)
	if(!SScommunications.can_announce(user))
		return
	var/datum/antagonist/prebel/P = user.mind?.has_antag_datum(/datum/antagonist/prebel)
	if(P)
		if(P.rev_team)
			if(P.rev_team.members.len < 3)
				to_chat(user, "<span class='warning'>I need more folk on my side to declare victory.</span>")
			else
				for(var/datum/objective/prebel/obj in user.mind.get_all_objectives())
					obj.completed = TRUE
				if(!SSmapping.retainer.head_rebel_decree)
					user.mind.adjust_triumphs(1)
				SSmapping.retainer.head_rebel_decree = TRUE

/obj/structure/roguemachine/titan/proc/make_decree(mob/living/user, raw_message)
	var/datum/antagonist/prebel/rebel_datum = user.mind?.has_antag_datum(/datum/antagonist/prebel)
	if(rebel_datum)
		if(rebel_datum.rev_team?.members.len < 3)
			to_chat(user, "<span class='warning'>I need more folk on my side to declare victory.</span>")
		else
			for(var/datum/objective/prebel/obj in user.mind.get_all_objectives())
				obj.completed = TRUE
			if(!SSmapping.retainer.head_rebel_decree)
				user.mind.adjust_triumphs(1)
			SSmapping.retainer.head_rebel_decree = TRUE
	record_round_statistic(STATS_LAWS_AND_DECREES_MADE)
	SScommunications.make_announcement(user, TRUE, raw_message)

/obj/structure/roguemachine/titan/proc/declare_outlaw(mob/living/user, raw_message)
	if(!SScommunications.can_announce(user))
		return
	if(user.job)
		if(!istype(SSjob.GetJob(user.job), /datum/job/roguetown/lord))
			return
	else
		return
	return make_outlaw(raw_message)

/proc/make_outlaw(raw_message)
	if(raw_message in GLOB.outlawed_players)
		GLOB.outlawed_players -= raw_message
		priority_announce("[raw_message] более не является преступником на землях Ализерии.", "The [SSticker.rulertype] Decrees", 'sound/misc/royal_decree.ogg', "Captain")
		return FALSE
	var/found = FALSE
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H.real_name == raw_message)
			found = TRUE
	if(!found)
		return FALSE
	GLOB.outlawed_players += raw_message
	priority_announce("[raw_message] объявлен преступником! Приказано поймать его живым или мёртвым!", "The [SSticker.rulertype] Decrees", 'sound/misc/royal_decree2.ogg', "Captain")
	return TRUE

/proc/make_law(raw_message)
	GLOB.laws_of_the_land += raw_message
	priority_announce("[length(GLOB.laws_of_the_land)]. [raw_message]", "A LAW IS DECLARED", pick('sound/misc/new_law.ogg', 'sound/misc/new_law2.ogg'), "Captain")
	record_round_statistic(STATS_LAWS_AND_DECREES_MADE)

/proc/remove_law(law_index)
	if(!GLOB.laws_of_the_land[law_index])
		return
	var/law_text = GLOB.laws_of_the_land[law_index]
	GLOB.laws_of_the_land -= law_text
	priority_announce("[law_index]. [law_text]", "A LAW IS ABOLISHED", pick('sound/misc/new_law.ogg', 'sound/misc/new_law2.ogg'), "Captain")
	record_round_statistic(STATS_LAWS_AND_DECREES_MADE, -1)

/proc/purge_laws()
	GLOB.laws_of_the_land = list()
	priority_announce("Все законы были отменены!", "LAWS PURGED", 'sound/misc/lawspurged.ogg', "Captain")

/proc/purge_decrees()
	GLOB.lord_decrees = list()
	priority_announce("Все указы наместника были отменены!", "DECREES PURGED", pick('sound/misc/royal_decree.ogg', 'sound/misc/royal_decree2.ogg'), "Captain")

/proc/become_regent(mob/living/carbon/human/H)
	priority_announce("[H.name], the [H.get_role_title()], sits as the regent of the realm.", "A New Regent Resides", pick('sound/misc/royal_decree.ogg', 'sound/misc/royal_decree2.ogg'), "Captain")
	SSticker.regentmob = H
	SSticker.regentday = GLOB.dayspassed

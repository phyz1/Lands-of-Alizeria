/datum/virtue/utility/noble
	name = "Дворянин"
	desc = "Будь то по праву рождения, либо по решению лорда - я обладаю статусом дворянина."
	restricted = TRUE
	races = list(/datum/species/golem/metal, /datum/species/golem/porcelain, /datum/species/goblinp, /datum/species/kobold)
	added_traits = list(TRAIT_NOBLE)
	added_skills = list(list(/datum/skill/misc/reading, 1, 6))
	added_stashed_items = list("Heirloom Amulet" = /obj/item/clothing/neck/roguetown/ornateamulet/noble)

/datum/virtue/utility/noble/apply_to_human(mob/living/carbon/human/recipient)
	SStreasury.noble_incomes[recipient] += 15
	var/obj/item/pouch = new /obj/item/storage/belt/rogue/pouch/coins/virtuepouch(get_turf(recipient))
	recipient.put_in_hands(pouch, forced = TRUE)

/datum/virtue/utility/noble/handle_traits(mob/living/carbon/human/recipient)
	..()
	if(HAS_TRAIT(recipient, TRAIT_PEASANTMILITIA))
		to_chat(recipient, "Your noble upbringing left you without the experience to truly wield a common man's tools.")
		REMOVE_TRAIT(recipient, TRAIT_PEASANTMILITIA, JOB_TRAIT)
		REMOVE_TRAIT(recipient, TRAIT_PEASANTMILITIA, ADVENTURER_TRAIT)


/datum/virtue/utility/blueblooded
	name = "Голубокровный"
	desc = "С самого рождения я воспитывался в благородной семье, и благодаря этому обладаю исключительной красотой и положением в обществе, хотя и не имею никаких материальных благ."
	restricted = TRUE
	races = list(/datum/species/golem/metal, /datum/species/golem/porcelain, /datum/species/goblinp, /datum/species/kobold)
	added_traits = list(TRAIT_NOBLE, TRAIT_BEAUTIFUL, TRAIT_GOODLOVER)
	added_skills = list(list(/datum/skill/misc/reading, 1, 6))
	added_stashed_items = list("Heirloom Amulet" = /obj/item/clothing/neck/roguetown/ornateamulet/noble, "Hand Mirror" = /obj/item/handmirror)

/datum/virtue/utility/blueblooded/handle_traits(mob/living/carbon/human/recipient)
	..()
	if(HAS_TRAIT(recipient, TRAIT_UNSEEMLY))
		to_chat(recipient, "Your social grace is cancelled out! You become normal.")
		REMOVE_TRAIT(recipient, TRAIT_BEAUTIFUL, TRAIT_VIRTUE)
		REMOVE_TRAIT(recipient, TRAIT_UNSEEMLY, TRAIT_VIRTUE)
	if(HAS_TRAIT(recipient, TRAIT_PEASANTMILITIA))
		to_chat(recipient, "Your noble upbringing left you without the experience to truly wield a common man's tools.")
		REMOVE_TRAIT(recipient, TRAIT_PEASANTMILITIA, JOB_TRAIT)
		REMOVE_TRAIT(recipient, TRAIT_PEASANTMILITIA, ADVENTURER_TRAIT)

/datum/virtue/utility/socialite
	name = "Проницательный"
	desc = "Я преуспеваю в общении, легко читаю эмоции других и очаровываю окружающих. Мое присутствие всегда ощущается на любом мероприятии."
	custom_text = "Наделяет эмпатическим пониманием."
	added_traits = list(TRAIT_GOODLOVER, TRAIT_EMPATH)

/datum/virtue/utility/beautiful
	name = "Красивый"
	desc = "Куда бы я ни пошёл, на меня оборачиваются, такова моя природная красота. Я также хорош в постели, хотя об этом принято не говорить."
	custom_text = "Incompatible with Ugly virtue."
	added_traits = list(TRAIT_BEAUTIFUL, TRAIT_GOODLOVER)
	added_stashed_items = list(
		"Hand Mirror" = /obj/item/handmirror)

/datum/virtue/utility/beautiful/handle_traits(mob/living/carbon/human/recipient)
	..()
	if(HAS_TRAIT(recipient, TRAIT_UNSEEMLY))
		to_chat(recipient, "Your social grace is cancelled out! You become normal.")
		REMOVE_TRAIT(recipient, TRAIT_BEAUTIFUL, TRAIT_VIRTUE)
		REMOVE_TRAIT(recipient, TRAIT_UNSEEMLY, TRAIT_VIRTUE)

/datum/virtue/utility/deadened
	name = "Опустошённый"
	desc = "Какой-то ужасный инцидент омрачил мое прошлое, а сейчас я ничего не чувствую."
	added_traits = list(TRAIT_NOMOOD)

/datum/virtue/utility/light_steps
	name = "Лёгкая подступь"
	desc = "Годы скитаний сделали мои шаги тихими, а сгорбленную походку - более быстрой."
	added_traits = list(TRAIT_LIGHT_STEP)
	added_skills = list(list(/datum/skill/misc/sneaking, 3, 6))

/*/datum/virtue/utility/resident
	name = "Resident"
	desc = "I'm a resident of Scarlet Reach. I have an account in the city's treasury and a home in the city."
	added_traits = list(TRAIT_RESIDENT)

/datum/virtue/utility/resident/apply_to_human(mob/living/carbon/human/recipient)
	var/mapswitch = 0
	if(SSmapping.config.map_name == "Alizeria")
		mapswitch = 1
	else if(SSmapping.config.map_name == "Dun World")
		mapswitch = 2

	if(mapswitch == 0)
		return
	if(HAS_TRAIT(recipient, TRAIT_OUTLANDER))
		to_chat(recipient, "You may have originated from another land, but you have lived here long enough and become a true citizen.")
		REMOVE_TRAIT(recipient, TRAIT_OUTLANDER, JOB_TRAIT)
	if(recipient.mind?.assigned_role == "Adventurer" || recipient.mind?.assigned_role == "Mercenary" || recipient.mind?.assigned_role == "Court Agent")
		// Find tavern area for spawning
		var/area/spawn_area
		for(var/area/A in world)
			if(istype(A, /area/rogue/indoors/town/tavern))
				spawn_area = A
				break

		if(spawn_area)
			var/target_z = 3 //ground floor of tavern for dun manor / world
			var/target_y = 70 //dun manor
			var/list/possible_chairs = list()

			if(mapswitch == 2)
				target_y = 234 //dun world huge

			for(var/obj/structure/chair/C in spawn_area)
				//z-level 3, wooden chair, and Y > north of tavern backrooms
				var/turf/T = get_turf(C)
				if(T && T.z == target_z && T.y > target_y && istype(C, /obj/structure/chair/wood/rogue) && !T.density && !T.is_blocked_turf(FALSE))
					possible_chairs += C

			if(length(possible_chairs))
				var/obj/structure/chair/chosen_chair = pick(possible_chairs)
				recipient.forceMove(get_turf(chosen_chair))
				chosen_chair.buckle_mob(recipient)
				to_chat(recipient, span_notice("As a resident of Scarlet Reach, you find yourself seated at a chair in the local tavern."))
			else
				var/list/possible_spawns = list()
				for(var/turf/T in spawn_area)
					if(T.z == target_z && T.y > (target_y + 4) && !T.density && !T.is_blocked_turf(FALSE))
						possible_spawns += T

				if(length(possible_spawns))
					var/turf/spawn_loc = pick(possible_spawns)
					recipient.forceMove(spawn_loc)
					to_chat(recipient, span_notice("As a resident of Scarlet Reach, you find yourself in the local tavern."))*/

/*/datum/virtue/utility/failed_squire
	name = "Failed Squire"
	desc = "I was once a squire in training, but failed to achieve knighthood. Though my dreams of glory were dashed, I retained my knowledge of equipment maintenance and repair, including how to polish arms and armor."
	added_traits = list(TRAIT_SQUIRE_REPAIR)
	added_stashed_items = list(
		"Hammer" = /obj/item/rogueweapon/hammer/iron,
		"Polishing Cream" = /obj/item/polishing_cream,
		"Fine Brush" = /obj/item/armor_brush
	)

/datum/virtue/utility/failed_squire/apply_to_human(mob/living/carbon/human/recipient)
	to_chat(recipient, span_notice("Though you failed to become a knight, your training in equipment maintenance and repair remains useful."))
	to_chat(recipient, span_notice("You can retrieve your hammer and polishing tools from a tree, statue, or clock."))*/

/datum/virtue/utility/linguist
	name = "Интеллектуал"
	desc = "Я провел свою жизнь в окружении различных книг или искушенных иностранцев, будь то в путешествиях или в других ситуациях, которые выпали на мою долю. Я научился нескольким языкам и уму-разуму и постоянно веду дневник. Я могу точно определить мастерство людей."
	custom_text = "Максимизирует преимущества Assess за счет увеличения характеристик цели. Позволяет выбрать один из 3 языков для изучения при вступлении. +1 INT."
	added_traits = list(TRAIT_INTELLECTUAL)
	added_skills = list(list(/datum/skill/misc/reading, 3, 6))
	added_stashed_items = list(
		"Quill" = /obj/item/natural/feather,
		"Scroll" = /obj/item/paper/scroll,
		"Unfinished Skillbook" = /obj/item/skillbook/unfinished
	)

/datum/virtue/utility/linguist/apply_to_human(mob/living/carbon/human/recipient)
	recipient.change_stat("intelligence", 1)
	addtimer(CALLBACK(src, .proc/linguist_apply, recipient), 50)

/datum/virtue/utility/linguist/proc/linguist_apply(mob/living/carbon/human/recipient)
	var/static/list/selectable_languages = list(
		/datum/language/elvish,
		/datum/language/dwarvish,
		/datum/language/orcish,
		/datum/language/hellspeak,
		/datum/language/draconic,
		/datum/language/celestial,
		/datum/language/grenzelhoftian,
		/datum/language/kazengunese,
		/datum/language/otavan,
		/datum/language/etruscan,
		/datum/language/gronnic,
		/datum/language/aavnic,
		/datum/language/abyssal
	)

	var/list/choices = list()
	for(var/language_type in selectable_languages)
		if(recipient.has_language(language_type))
			continue
		var/datum/language/a_language = new language_type()
		choices[a_language.name] = language_type

	if(length(choices))	//If this isn't true then we have no new languages learn -- we probably picked archivist
		var/lang_count = 3
		var/count = lang_count
		for(var/i in 1 to lang_count)
			var/chosen_language = input(recipient, "Choose your extra spoken language.", "VIRTUE: [count] LEFT") as null|anything in choices
			if(chosen_language)
				var/language_type = choices[chosen_language]
				recipient.grant_language(language_type)
				choices -= chosen_language
				to_chat(recipient, span_info("I recall my knowledge of [chosen_language]..."))
				count--

/datum/virtue/utility/deathless
	name = "Бессмертный"
	desc = "Какая-то дьявольская магия сделала меня внутренне нежизнеспособным - я не испытываю голода и не дышу."
	added_traits = list(TRAIT_NOHUNGER, TRAIT_NOBREATH)
/*
/datum/virtue/utility/deathless/apply_to_human(mob/living/carbon/human/recipient)
	recipient.mob_biotypes |= MOB_UNDEAD
*/
/datum/virtue/utility/blacksmith
	name = "Ученик кузнеца"
	desc = "В юности я работал под началом искусного кузнеца, оттачивая свое мастерство на наковальне."
	added_skills = list(list(/datum/skill/craft/crafting, 2, 2),
						list(/datum/skill/craft/weaponsmithing, 2, 2),
						list(/datum/skill/craft/armorsmithing, 2, 2),
						list(/datum/skill/craft/blacksmithing, 2, 2),
						list(/datum/skill/craft/smelting, 2, 2)
	)

/datum/virtue/utility/hunter
	name = "Ученик охотника"
	desc = "В юности я тренировался под руководством опытного охотника, учился разделывать животных и работать с кожей."
	added_skills = list(list(/datum/skill/craft/crafting, 2, 2),
						list(/datum/skill/craft/traps, 2, 2),
						list(/datum/skill/labor/butchering, 2, 2),
						list(/datum/skill/misc/sewing, 2, 2),
						list(/datum/skill/craft/tanning, 2, 2),
						list(/datum/skill/misc/tracking, 2, 2)
	)

/datum/virtue/utility/artificer
	name = "Ученик ремесленника"
	desc = "В юности я работал под руководством квалифицированного мастера, изучая строительство и инженерное дело."
	added_skills = list(list(/datum/skill/craft/crafting, 2, 2),
						list(/datum/skill/craft/carpentry, 2, 2),
						list(/datum/skill/craft/masonry, 2, 2),
						list(/datum/skill/craft/engineering, 2, 2),
						list(/datum/skill/craft/smelting, 2, 2),
						list(/datum/skill/misc/ceramics, 2, 2)
	)
	added_stashed_items = list(
		"Hammer" = /obj/item/rogueweapon/hammer/wood,
		"Chisel" = /obj/item/rogueweapon/chisel,
		"Hand Saw" = /obj/item/rogueweapon/handsaw
	)

/datum/virtue/utility/physician
	name = "Ученик лекаря"
	desc = "В юности я работал под руководством опытного лекаря, изучая медицину и алхимию."
	added_stashed_items = list("Medicine Pouch" = /obj/item/storage/belt/rogue/pouch/medicine)
	added_skills = list(list(/datum/skill/craft/crafting, 2, 2),
						list(/datum/skill/craft/alchemy, 2, 2),
						list(/datum/skill/misc/medicine, 2, 2)
	)

/datum/virtue/utility/feral_appetite
	name = "Звериный аппетит"
	desc = "Сырая, токсичная или испорченная пища не беспокоит мою превосходную пищеварительную систему."
	added_traits = list(TRAIT_NASTY_EATER)

/datum/virtue/utility/night_vision
	name = "Кошачье зрение"
	desc = "У меня есть глаза, способные видеть сквозь непроглядную тьму. Несовместимо с дальтонизмом."
	added_traits = list(TRAIT_DARKVISION)
	custom_text = "Добавляет кнопку, позволяющую регулировать ночное зрение, чтобы лучше видеть в темноте."

/datum/virtue/utility/night_vision/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.charflaw)
		if(recipient.charflaw.type == /datum/charflaw/colorblind)
			to_chat(recipient, "Your eyes have become permanently colorblind.")
		else
			recipient.verbs += /mob/living/carbon/human/proc/toggleblindness

/datum/virtue/utility/performer
	name = "Исполнитель"
	desc = "Музыка, артистизм и умение демонстрировать себя пронесли меня через всю жизнь. Я спрятал свой любимый инструмент, знаю, как доставить удовольствие любому, к кому прикоснусь, и как расшевелить тех, кто задирает нос."
	custom_text = "Появляется с припрятанным инструментом по вашему выбору. Вы выбираете инструмент после появления в игре."
	added_traits = list(TRAIT_NUTCRACKER, TRAIT_GOODLOVER)
	added_skills = list(list(/datum/skill/misc/music, 4, 6))

/datum/virtue/utility/performer/apply_to_human(mob/living/carbon/human/recipient)
    addtimer(CALLBACK(src, .proc/performer_apply, recipient), 50)

/datum/virtue/utility/performer/proc/performer_apply(mob/living/carbon/human/recipient)
	var/list/instruments = list()
	for(var/instrument_type in subtypesof(/obj/item/rogue/instrument))
		if(instrument_type == /obj/item/rogue/instrument/harp/handcarved)
			continue //Skip the donator personal item harp.
		var/obj/item/rogue/instrument/instr = new instrument_type()
		instruments[instr.name] = instrument_type
		qdel(instr)  // Clean up the temporary instance

	var/chosen_name = input(recipient, "What instrument did I stash?", "STASH") as null|anything in instruments
	if(chosen_name)
		var/instrument_type = instruments[chosen_name]
		recipient.mind?.special_items[chosen_name] = instrument_type

/datum/virtue/utility/larcenous
	name = "Взломщик"
	desc = "Независимо от того, просили ли вас об этом, или по зову сердца, вы ищете вещи, которые вам не принадлежат. Вы знаете, как обращаться с замком, и припрятали связку отмычек как раз для такого случая."
	added_stashed_items = list("Lockpick Ring" = /obj/item/lockpickring/mundane)
	added_skills = list(list(/datum/skill/misc/lockpicking, 3, 6))

/datum/virtue/utility/swiftfingers
	name = "Быстрые пальцы"
	desc = "У вас природный талант незаметно запускать руки в карманы других людей или развязывать пояс. Вы знаете, как отобрать вещи у их владельцев гораздо проще, чем большинство путешественников."
	added_skills = list(list(/datum/skill/misc/stealing, 3, 4))

/datum/virtue/utility/granary
	name = "Хитрый снабженец"
	desc = "Вы достаточно поработали в доках или поблизости от них, чтобы на всякий случай украсть мешок с припасами, который наверняка никто не хватится. В свободное время вы также изучали кулинарные и рыболовные советы."
	added_stashed_items = list("Bag of Food" = /obj/item/storage/roguebag/food)
	added_skills = list(list(/datum/skill/craft/cooking, 3, 6),
						list(/datum/skill/labor/fishing, 2, 6))

/datum/virtue/utility/forester
	name = "Лесник"
	desc = "Лес - это ваш дом, или, по крайней мере, так было раньше. Вам всегда хочется вернуться и снова бродить на свободе, и вы не забыли свои знания о том, как быть самодостаточным."
	added_stashed_items = list("Trusty hoe" = /obj/item/rogueweapon/hoe)
	added_skills = list(list(/datum/skill/craft/cooking, 2, 2),
						list(/datum/skill/misc/athletics, 2, 2),
						list(/datum/skill/labor/farming, 2, 2),
						list(/datum/skill/labor/fishing, 2, 2),
						list(/datum/skill/labor/lumberjacking, 2, 2)
	)

/datum/virtue/utility/mining
	name = "Ученик шахтера"
	desc = "Темные шахты, влажный запах гноя и долгие часы работы мне не чужды. Я держу кирку и фонарь при себе, и меня научили, как правильно вести добычу."
	added_stashed_items = list(
		"Steel Pickaxe" = /obj/item/rogueweapon/pick/steel,
		"Lamptern" = /obj/item/flashlight/flare/torch/lantern)
	added_skills = list(list(/datum/skill/labor/mining, 3, 6))

/datum/virtue/utility/ugly
	name = "Уродство"
	desc = "Будь то привычки вашей семьи в утробе матери и вне ее, ваш собственный выбор или жестокий рок Ксиликса, смотреть на вас было невыносимо. Застряв в невидимых ямах и расщелинах города, вы привыкли к отвратительным запахам жизни, которые часто преследуют вас. Трупы не воняют для вас, и это единственная компания, которую вы можете найти."
	custom_text = "Несовместимо с 'Красивый'."
	added_traits = list(TRAIT_UNSEEMLY, TRAIT_NOSTINK)

/datum/virtue/utility/ugly/handle_traits(mob/living/carbon/human/recipient)
	..()
	if(HAS_TRAIT(recipient, TRAIT_BEAUTIFUL))
		to_chat(recipient, "Your repulsiveness is cancelled out! You become normal.")
		REMOVE_TRAIT(recipient, TRAIT_BEAUTIFUL, TRAIT_VIRTUE)
		REMOVE_TRAIT(recipient, TRAIT_UNSEEMLY, TRAIT_VIRTUE)

/datum/virtue/utility/secondvoice
	name = "Второй голос"
	desc = "В результате игры, обмана или из-за необходимости кардинально изменить себя вы обрели второй, совершенный голос. Вы можете переключаться между ними в любой момент."
	custom_text = "Открывает доступ к новой вкладке 'Достоинства'. В ней будут опции для настройки и изменения вашего голоса."

/datum/virtue/utility/secondvoice/apply_to_human(mob/living/carbon/human/recipient)
	recipient.verbs += /mob/living/carbon/human/proc/changevoice
	recipient.verbs += /mob/living/carbon/human/proc/swapvoice
	recipient.verbs += /mob/living/carbon/human/proc/changeaccent

/datum/virtue/utility/keenears
	name = "Острый слух"
	desc = "Прячась от властей, близких или благодаря щедрому дару богов, вы развили острый слух и можете распознавать говорящих, даже когда они находятся вне поля зрения, а их шепот звучит громче."
	added_traits = list(TRAIT_KEENEARS)
	custom_text = "Вы можете узнавать знакомых людей, которые разговаривают, даже когда они находятся вне поля зрения. Вы можете слышать, как люди обычно разговаривают над вами и под вами, независимо от препятствий на пути. Вы можете слышать шепот рядом с вами."

/datum/virtue/utility/tracker
	name = "Сыщик"
	desc = "Вы давно поняли, что умение найти человека так же полезно для соблюдения закона, как и для того, чтобы уклониться от него."
	added_skills = list(list(/datum/skill/misc/tracking, 3, 6))
	added_traits = list(TRAIT_SLEUTH)
	custom_text = "- Щелкнув правой кнопкой мыши по треку, вы отметите человека, который его создал <i>(Требуются экспертные навыки, не исключающие это достоинство)</i>.\n- Другие найденные треки будут автоматически выделены как принадлежащие им, а также самому пользователю, если в данный момент он не скрывается или не становится невидимым.\n- Сокращает время восстановления при отслеживании, позволяет сразу же проверять трек, а перемещение больше не отменяет отслеживание."

/datum/virtue/utility/bronzearm_r
	name = "Бронзовая рука (R)"
	desc = "Благодаря связям или богатству моя рука была заменена на руку из бронзы и шестеренок, которая может хватать и удерживать предметы. В результате я немного освоил инженерное дело."
	custom_text = "Заменяет вашу правую руку бронзовым протезом. Несовместимо с правой деревянной рукой."
	added_skills = list(list(/datum/skill/craft/engineering, 1, 6))

/datum/virtue/utility/bronzearm_r/apply_to_human(mob/living/carbon/human/recipient)
	. = ..()
	var/obj/item/bodypart/O = recipient.get_bodypart(BODY_ZONE_R_ARM)
	if(O)
		O.drop_limb()
		qdel(O)
	if(recipient.charflaw)
		if(recipient.charflaw.type == /datum/charflaw/limbloss/arm_r)
			to_chat(recipient, span_info("По своей глупости я поверил шарлатану, который хотел обменять мою деревянную руку на бронзовую. Она развалилась. Теперь у меня вообще нет руки."))
		else
			var/obj/item/bodypart/r_arm/prosthetic/bronzeright/L = new()
			L.attach_limb(recipient)

/datum/virtue/utility/bronzearm_l
	name = "Бронзовая рука (L)"
	desc = "Благодаря связям или богатству моя рука была заменена на руку из бронзы и шестеренок, которая может хватать и удерживать предметы. В результате я немного освоил инженерное дело."
	custom_text = "Заменяет вашу правую руку бронзовым протезом. Несовместимо с правой деревянной рукой."
	added_skills = list(list(/datum/skill/craft/engineering, 1, 6))

/datum/virtue/utility/bronzearm_l/apply_to_human(mob/living/carbon/human/recipient)
	. = ..()
	var/obj/item/bodypart/O = recipient.get_bodypart(BODY_ZONE_L_ARM)
	if(O)
		O.drop_limb()
		qdel(O)
	if(recipient.charflaw)
		if(recipient.charflaw.type == /datum/charflaw/limbloss/arm_l)
			to_chat(recipient, span_info("По своей глупости я поверил шарлатану, который хотел обменять мою деревянную руку на бронзовую. Она развалилась. Теперь у меня вообще нет руки."))
		else
			var/obj/item/bodypart/l_arm/prosthetic/bronzeleft/L = new()
			L.attach_limb(recipient)

/datum/virtue/utility/woodwalker
	name = "Житель лесов"
	desc = "После долгих лет тренировок в дикой местности я научился уверенно передвигаться по лесу, не ломая веток. Я могу даже легко наступать на листья, не падая, и могу собрать в два раза больше продуктов с кустов."
	added_traits = list(TRAIT_WOODWALKER, TRAIT_OUTDOORSMAN)

/datum/virtue/racial/elfd/spider
	name = "(Тёмный эльф) Любитель пауков"
	desc = "В самых темных глубинах подземья меня научили секретам драйдеров. Мне показали способы приготовления зелий и ядов, а также искусство прохождения сквозь паутину. Пауки считают меня одним из своих."
	races = list(/datum/species/elf/dark)
	custom_text = "Only available to dark elves."
	added_traits = list(TRAIT_WEBWALK)
	added_skills = list(list(/datum/skill/craft/alchemy, 2, 4),
						list(/datum/skill/labor/butchering, 2, 2)
	)
	added_stashed_items = list(
		"Spider Honey" = /obj/item/reagent_containers/food/snacks/rogue/honey/spider,
		"Spider Gland" = /obj/item/reagent_containers/spidervenom_inert
)

/datum/virtue/racial/elfd/spider/apply_to_human(mob/living/carbon/human/recipient)
	recipient.faction += "spiders"

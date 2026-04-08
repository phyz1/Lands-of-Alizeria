/datum/stressevent/psyprayer
	timer = 30 MINUTES
	stressadd = -2
	desc = span_green("Боги улыбаются мне.")

/datum/stressevent/viewsinpunish
	timer = 5 MINUTES
	stressadd = -2
	desc = span_green("Я видел как был наказан грешник!")

/datum/stressevent/joke
	timer = 30 MINUTES
	stressadd = -2
	desc = span_green("Я услышал хорошую шутку.")

/datum/stressevent/tragedy
	timer = 30 MINUTES
	stressadd = -2
	desc = span_green("Жизнь не так уж и плоха...")

/datum/stressevent/blessed
	timer = 60 MINUTES
	stressadd = -2
	desc = span_green("Я чувствую чье-то успокаивающее присутствие.")

/datum/stressevent/triumph
	timer = 10 MINUTES
	stressadd = -5
	desc = span_boldgreen("Я обрёл свой ТРИУМФ!")

/datum/stressevent/drunk
	timer = 1 MINUTES
	stressadd = -2
	desc = list(span_green("Акоголь заглушает боль."),span_green("Алкоголь - мой настоящий друг."))

/datum/stressevent/pweed
	timer = 1 MINUTES
	stressadd = -2
	desc = list(span_green("Успокаивающий дым.."),span_green("Ароматный дым..."))

/datum/stressevent/menthasmoke
	timer = 1 MINUTES
	stressadd = -1
	desc = list(span_blue("Приятный холод у меня в горле."))

/datum/stressevent/weed
	timer = 5 MINUTES
	stressadd = -4
	desc = span_blue("Сладкий лист...")

/datum/stressevent/high
	timer = 5 MINUTES
	stressadd = -4
	desc = span_blue("Так высоко... Выше меня только небо!")

/datum/stressevent/stuffed
	timer = 20 MINUTES
	stressadd = -1
	desc = span_green("Я сыт! Приятное ощущение.")

/datum/stressevent/hydrated
	timer = 10 MINUTES
	stressadd = -1
	desc = span_green("Я не испытываю жажды. Это хорошо.")

/datum/stressevent/prebel
	timer = 5 MINUTES
	stressadd = -5
	desc = span_boldgreen("ДОЛОЙ ТИРАНИЮ!")

/datum/stressevent/music
	timer = 1 MINUTES
	stressadd = -1
	desc = span_green("Эта музыка хороша.")

/datum/stressevent/music/two
	stressadd = -2
	desc = span_green("Отличная музыка!")
	timer = 2 MINUTES

/datum/stressevent/music/three
	stressadd = -2
	desc = span_green("Эта музыка позволяет мне забыть о плохом.")
	timer = 4 MINUTES

/datum/stressevent/music/four
	stressadd = -3
	desc = span_green("Замечательная музыка!")
	timer = 6 MINUTES

/datum/stressevent/music/five
	stressadd = -3
	timer = 8 MINUTES
	desc = span_green("Эта музыка - лучшее, что я когда-либо слышал!")

/datum/stressevent/music/six
	stressadd = -4
	timer = 10 MINUTES
	desc = span_boldgreen("Эта музыка - БОЖЕСТВЕННА!")

/datum/stressevent/vblood
	stressadd = -5
	desc = span_boldred("Девственная кровь!")
	timer = 5 MINUTES

/datum/stressevent/bathwater
	stressadd = -1
	desc = span_blue("Тёплая вода...")
	timer = 1 MINUTES

/datum/stressevent/bathwater/on_apply(mob/living/user)
	. = ..()
	if(user.client)
		record_round_statistic(STATS_BATHS_TAKEN)
		// SEND_SIGNAL(user, COMSIG_BATH_TAKEN)

/datum/stressevent/beautiful
	stressadd = -2
	desc = span_green("Я увидел кого-то красивого!")
	timer = 2 MINUTES

/datum/stressevent/night_owl
	stressadd = -3
	desc = span_green("Замечательная ночь...")
	timer = 20 MINUTES

/datum/stressevent/ozium
	stressadd = -99
	desc = span_blue("Пыль позволяет забыть о мире.")
	timer = 2 MINUTES

/datum/stressevent/moondust
	stressadd = -6
	desc = span_boldgreen("Приятная лунная пыль.")
	timer = 4 MINUTES

/datum/stressevent/starsugar
	stressadd = -1
	desc = span_boldgreen("Моё сердце сейчас разорвётся. Я готов бежать хоть до края света!")
	timer = 4 MINUTES

/datum/stressevent/moondust_purest
	stressadd = -8
	desc = span_boldgreen("ОТЛИЧНАЯ ЛУННАЯ ПЫЛЬ!")
	timer = 4 MINUTES

/datum/stressevent/campfire
	stressadd = -1
	desc = span_green("Приятный огонь.")
	timer = 5 MINUTES

/datum/stressevent/puzzle_easy
	stressadd = -1
	desc = span_green("Этот пазл был довольно лёгок.")
	timer = 10 MINUTES

/datum/stressevent/puzzle_medium
	stressadd = -2
	desc = span_green("Этот пазл был достаточно сложен. Было интересно.")
	timer = 10 MINUTES

/datum/stressevent/puzzle_hard
	stressadd = -3
	desc = span_green("Этот пазл был реально сложен. Удивительно, что я смог его решить.")
	timer = 10 MINUTES

/datum/stressevent/puzzle_impossible
	stressadd = -4
	desc = span_boldgreen("Этот пазл был полон нерешаемых загадок и даже так - я смог их решить. Я чувствую удивление богов над собой.")
	timer = 15 MINUTES

/datum/stressevent/noble_lavish_food
	stressadd = -4
	desc = span_green("Воистину, еда подобная мне.")
	timer = 30 MINUTES

/datum/stressevent/wine_okay
	stressadd = -1
	desc = span_green("Этот напиток был неплох.")
	timer = 10 MINUTES

/datum/stressevent/wine_good
	stressadd = -2
	desc = span_green("Этот напиток был хорош.")
	timer = 10 MINUTES

/datum/stressevent/wine_great
	stressadd = -3
	desc = span_blue("Отличный напиток!")
	timer = 10 MINUTES

/datum/stressevent/favourite_food
	stressadd = -1
	desc = span_green("Моя любимая еда! Обожаю!")
	timer = 5 MINUTES

/datum/stressevent/favourite_food/can_apply(mob/living/user)
	. = ..()
	if(!.)
		return FALSE
	if(user.has_stress_event(/datum/stressevent/favourite_food))
		return FALSE
	else if(ishuman(user))
		var/mob/living/carbon/human/human_eater = user
		if(human_eater.culinary_preferences && human_eater.culinary_preferences[CULINARY_FAVOURITE_FOOD])
			var/favorite_food_type = human_eater.culinary_preferences[CULINARY_FAVOURITE_FOOD]
			var/obj/item/reagent_containers/food/snacks/favorite_food_instance = favorite_food_type
			timer = timer * max(initial(favorite_food_instance.faretype), 1)
			return TRUE

/datum/stressevent/favourite_drink
	stressadd = -1
	desc = span_green("Мой любимый напиток!")
	timer = 5 MINUTES

/datum/stressevent/favourite_drink/can_apply(mob/living/user)
	. = ..()
	if(!.)
		return FALSE
	if(user.has_stress_event(/datum/stressevent/favourite_drink))
		return FALSE
	else if(ishuman(user))
		var/mob/living/carbon/human/human_drinker = user
		if(human_drinker.culinary_preferences && human_drinker.culinary_preferences[CULINARY_FAVOURITE_DRINK])
			var/favorite_drink_type = human_drinker.culinary_preferences[CULINARY_FAVOURITE_DRINK]
			var/datum/reagent/consumable/favorite_drink_instance = favorite_drink_type
			timer = timer * max(1 + initial(favorite_drink_instance.quality), 1)
			return TRUE

/datum/stressevent/hated_food
	stressadd = 1
	desc = span_red("Я сьел ненавистную мне еду! Фу!")
	timer = 10 MINUTES

/datum/stressevent/hated_food/can_apply(mob/living/user)
	. = ..()
	if(!.)
		return FALSE
	if(user.has_stress_event(/datum/stressevent/hated_food))
		return FALSE

/datum/stressevent/hated_drink
	stressadd = 1
	desc = span_red("Я выпил что-то ужасное моему вкусу! Фу!")
	timer = 10 MINUTES

/datum/stressevent/hated_drink/can_apply(mob/living/user)
	. = ..()
	if(!.)
		return FALSE
	if(user.has_stress_event(/datum/stressevent/hated_drink))
		return FALSE

/datum/stressevent/meditation
	timer = 10 MINUTES
	stressadd = -1
	desc = span_green("Я чувствую умиротворение.")

/datum/stressevent/bathcleaned
    timer = 20 MINUTES
    stressadd = -3
    desc = span_green("Я чувствую себя безупречно!")

/datum/stressevent/bath
    timer = 10 MINUTES
    stressadd = -1
    desc = span_green("Я идеально чист.")


/datum/stressevent/pacified
	timer = 30 MINUTES
	stressadd = -5
	desc = span_green("Я позабыл обо всех своих проблемах.")


/datum/stressevent/peacecake
	timer = 5 MINUTES
	stressadd = -3
	desc = span_green("Мои проблемы исчезают сами собой.")

/datum/stressevent/noble_bowed_to
	timer = 5 MINUTES
	stressadd = -3
	desc = span_green("Кое-кто проявил ко мне уважение, которого я заслуживаю как дворянин.")

/datum/stressevent/noble_bowed_to/can_apply(mob/living/user)
	return HAS_TRAIT(user, TRAIT_NOBLE)

/datum/stressevent/perfume
	stressadd = -1
	desc = span_green("Успокаивающий аромат окутывает меня.")
	timer = 10 MINUTES

/datum/stressevent/astrata_grandeur
	timer = 30 MINUTES
	stressadd = -2
	desc = span_green("Свет Астраты ярко сияет во мне. Я не должен позволять другим забывать об этом.")

/datum/stressevent/graggar_culling_finished
	stressadd = -1
	desc = span_green("Я одержал верх над своим соперником! Грагар теперь благоволит мне!")
	timer = INFINITY

/datum/stressevent/eoran_blessing
	stressadd = -1
	desc = span_info("Эора освятила меня своим сиянием.")
	timer = 5 MINUTES

/datum/stressevent/eoran_blessing_greater
	stressadd = -2
	desc = span_info("Благочестивая Эора озарила меня своим сиянием.")
	timer = 10 MINUTES

/datum/stressevent/guillotinekill
	stressadd = -5
	desc = span_green("Прекрасное исполнение.")
	timer = 10 MINUTES

/datum/stressevent/gazeuponme
	stressadd = -5
	desc = span_green("Под пристальным взглядом Десяти - я продолжаю быть еретиком... Мой покровитель гордится мной!")
	timer = 999 MINUTES

/datum/stressevent/sermon
	stressadd = -5
	desc = span_green("Я чувствую вдохновение от этой проповеди.")
	timer = 20 MINUTES

/datum/stressevent/blessed_weapon
	stressadd = -3
	timer = 999 MINUTES
	desc = span_green("У меня в руках СВЯТОЕ оружие!")

/datum/stressevent/champion
	stressadd = -3
	desc = span_green("Я нахожусь рядом со своим подопечным!")
	timer = 1 MINUTES

/datum/stressevent/ward
	stressadd = -3
	desc = span_green("Я нахожусь рядом со своим сиром! Как волнительно!")
	timer = 1 MINUTES

/datum/stressevent/goodloving
	timer = 5 MINUTES
	stressadd = -3
	desc = "<span class='green'>Это было чудесно!</span>"

/datum/stressevent/empath_happy
	stressadd = -2
	desc = span_green("Кому-то хорошо, а значит и мне тоже!")
	timer = 2 MINUTES

/datum/stressevent/empath_superhappy
	stressadd = -4
	desc = span_green("Я видел кого-то крайне счастливого! Теперь и я такой же!")
	timer = 3 MINUTES

/datum/stressevent/soulchurnerdestroyed
	timer = 10 MINUTES
	stressadd = -40
	desc = span_green("Этот отвратительный ящик был уничтожен, а его пленники освобождены.")

/datum/stressevent/soulchurnerdestroyed_psydon
	timer = 5 MINUTES
	stressadd = -2
	desc = span_green("Шкатулка с душами была уничтожена. Я чувствую облегчение.")

/datum/stressevent/vampiric_nostalgia
	stressadd = -2
	desc = span_green("Астрата и ее пристальный взгляд могут обжигать тебя сейчас, но ты смутно помнишь, когда это было приятно твоей коже.")
	timer = 20 SECONDS

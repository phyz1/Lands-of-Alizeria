/datum/charflaw/lawless
	name = "Преступник"
	desc = "Я всегда считал, что закон создан что бы его нарушать. Что же, это сыграло со мной в злую шутку. (Играя на ролях, где заранее предусмотрена награда за вашу голову - ваше преступление будет выбрано случайным)"

/datum/charflaw/lawless/on_mob_creation(mob/user)
	addtimer(CALLBACK(src, PROC_REF(set_up), user), 15 SECONDS)

/datum/charflaw/lawless/proc/set_up(mob/living/carbon/human/user)
	var/my_crime
	var/bounty_amount
	var/bounty_total
	var/face_known
	var/bounty_poster

	if (has_bounty(user) || (user.job && user.job == "Wretch") || (user.advjob && user.advjob == "Wanted") || (user.job && user.job == "Bandit"))
		// no doubling up on this stuff, you just get a random flaw instead.
		var/list/flaws_without_random = GLOB.character_flaws.Copy()
		flaws_without_random -= "Random or No Flaw"
		var/datum/charflaw/our_new_flaw = GLOB.character_flaws[pick(flaws_without_random)]
		user.charflaw = new our_new_flaw()
		user.charflaw.on_mob_creation(user)
		to_chat(user, span_warning("The thrill of lawlessness is not enough anymore... fate renders my flaw to be: <b>[user.charflaw.name]</b>."))
		return

	if (user && user.mind)
		face_known = alert(user, "Известно ли властям ваше лицо?", "", "Да", "Нет")
		if (!face_known)
			face_known = "Да"
		bounty_poster = input(user, "Кто именно вас разыскивает?", "Награда за голову от:") as anything in list("Жандармерия Фиертона", "Гильдия свободных наёмников", "Святой орден")
		if (!bounty_poster)
			bounty_poster = "Жандармерия Фиертона"
		my_crime = input(user, "За что вас разыскивают?", "Преступление") as text|null
		if (!my_crime)
			my_crime = "Преступления против Короны"
		var/list/bounty_cats = list("Проступок", "Преступление", "Угроза")
		bounty_amount = input(user, "Насколько серьёзны ваши преступления?", "Награда за поимку:") as anything in bounty_cats
		switch (bounty_amount)
			if ("Проступок")
				bounty_total = rand(51, 100)
			if ("Преступление")
				bounty_total = rand(101, 150)
			if ("Угроза")
				bounty_total = rand(150, 200)

		if (!bounty_amount)
			bounty_total = rand(51, 200)

		if (face_known == "Да")
			add_bounty(user.real_name, bounty_total, FALSE, my_crime, bounty_poster)
			if (bounty_poster == "Жандармерия Фиертона")
				GLOB.outlawed_players += user.real_name
			else
				GLOB.excommunicated_players += user.real_name
		else
			var/race = user.dna.species
			var/gender = user.gender
			var/list/d_list = user.get_mob_descriptors()
			var/descriptor_height = build_coalesce_description_nofluff(d_list, user, list(MOB_DESCRIPTOR_SLOT_HEIGHT), "%DESC1%")
			var/descriptor_body = build_coalesce_description_nofluff(d_list, user, list(MOB_DESCRIPTOR_SLOT_BODY), "%DESC1%")
			var/descriptor_voice = build_coalesce_description_nofluff(d_list, user, list(MOB_DESCRIPTOR_SLOT_VOICE), "%DESC1%")
			add_bounty_noface(user.real_name, race, gender, descriptor_height, descriptor_body, descriptor_voice, bounty_total, FALSE, my_crime, bounty_poster)

		to_chat(user, span_notice("Я натворил дел и теперь за мою голову объявлена награда... Лучше залечь на дно."))
	else
		addtimer(CALLBACK(src, PROC_REF(set_up), user), 10 SECONDS)

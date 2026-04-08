/datum/virtue/items/rich
	name = "Богатый и проницательный"
	desc = "Благодаря удаче или продуманному планированию я приобрел значительное состояние. А также я знаю как определить насколько богат или беден человек."
	added_traits = list(TRAIT_SEEPRICES)
	added_skills = list(list(/datum/skill/misc/reading, 1, 6))	//So the spell would work
	custom_text = "Дает заклинание, позволяющее определить, сколько у человека денег при себе и в его кошельке."

/datum/virtue/items/rich/apply_to_human(mob/living/carbon/human/recipient)
	var/obj/item/pouch = new /obj/item/storage/belt/rogue/pouch/coins/virtuepouch(get_turf(recipient))
	recipient.put_in_hands(pouch, forced = TRUE)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/invoked/appraise/secular)

/datum/virtue/items/arsonist
	name = "Пироман"
	desc = "Мне нравится смотреть, как горит мир, и я припрятал две мощные зажигательные бомбы, чтобы добиться этого."
	added_skills = list(list(/datum/skill/craft/alchemy, 1, 6))
	added_stashed_items = list("Firebomb #1" = /obj/item/bomb,
								"Firebomb #2" = /obj/item/bomb
	)

/datum/job/roguetown/shophand
	title = "Port Merchant"
	flag = SHOPHAND
	department_flag = YEOMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALIZ_ALL_RACES
	tutorial = "Ты - один из главных конкурентов городского торговца. У тебя имеется собственная лавка, однако меньше размером, а ещё она находится в весьма проходимом месте. Вопрос лишь в том, когда твоё 'удачное' вложение даст о себе знать?"
	outfit = /datum/outfit/job/shophand
	display_order = JDO_SHOPHAND
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null
	round_contrib_points = 2
	social_rank = SOCIAL_RANK_PEASANT

	job_traits = list(TRAIT_SEEPRICES_SHITTY)

	advclass_cat_rolls = list(CTAG_SHOPHAND = 2)
	job_subclasses = list(
		/datum/advclass/shophand
	)

/datum/advclass/shophand
	name = "Port Merchant"
	tutorial = "Ты - один из главных конкурентов городского торговца. У тебя имеется собственная лавка, однако меньше размером, а ещё она находится в весьма проходимом месте. Вопрос лишь в том, когда твоё 'удачное' вложение даст о себе знать?"
	outfit = /datum/outfit/job/shophand/basic
	category_tags = list(CTAG_SHOPHAND)

	subclass_stats = list(
		STATKEY_SPD = 1,
		STATKEY_INT = 1,
		STATKEY_LCK = 1
	)

	subclass_skills = list(
		//worse skills than a normal peasant, generally, with random bad combat skill
		/datum/skill/misc/stealing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/shophand/basic/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	if(should_wear_femme_clothes(H))
		pants = /obj/item/clothing/under/roguetown/tights
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/blue
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltl = /obj/item/roguekey/alizeria/portshop
		backr = /obj/item/storage/backpack/rogue/satchel
	else if(should_wear_masc_clothes(H))
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltl = /obj/item/roguekey/alizeria/portshop
		backr = /obj/item/storage/backpack/rogue/satchel

	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/appraise/secular)
	if(prob(33))
		H.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
	else if(prob(33))
		H.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
	else //the legendary shopARM
		H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		H.change_stat("strength", 1)

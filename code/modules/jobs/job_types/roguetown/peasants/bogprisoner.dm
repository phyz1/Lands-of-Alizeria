/datum/job/roguetown/prisonerb
	title = "Prisoner (Bog)"
	flag = PRISONERB
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0


	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	tutorial = "Каково это — быть крысой в клетке? Ты один и полностью во власти своих похитителей, которых держат как заложника. Ты проводишь свои дни в ожидании того единственного шанса, когда кто-нибудь придет заплатить за тебя выкуп. Можешь начинать молиться любому богу, в котором находишь утешение."

	outfit = /datum/outfit/job/prisonerb
	bypass_jobban = TRUE
	display_order = JDO_PRISONERB
	give_bank_account = 10
	min_pq = -14
	max_pq = null
	can_random = FALSE

	cmode_music = 'sound/music/combat_bum.ogg'

/datum/outfit/job/prisonerb/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/gorget/cursed_collar
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/music, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.change_stat("intelligence", 1)
	H.change_stat("fortune", 2)
	if(H.mind)
		var/datum/antagonist/new_antag = new /datum/antagonist/prisoner()
		H.mind.add_antag_datum(new_antag)
	ADD_TRAIT(H, TRAIT_BANDITCAMP, TRAIT_GENERIC)
	if(should_wear_masc_clothes(H))
		H.change_stat("strength", -1)
		pants = /obj/item/clothing/under/roguetown/tights/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
		armor = /obj/item/clothing/suit/roguetown/shirt/tunic/random
	else if(should_wear_femme_clothes(H))
		H.change_stat("strength", -1)
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/random
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random

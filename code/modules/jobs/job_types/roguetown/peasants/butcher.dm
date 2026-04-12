/datum/job/roguetown/butcher
// IF YOU'RE READING THIS, THIS VERSION OF BUTCHER IS UNUSED!! YOU'RE LOOKIKG FOR "tbutcher.dm"!!!!!
	title = "Butcher"
	flag = BUTCHER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_ALL_KINDS
	allowed_ages = ALL_AGES_LIST
	tutorial = "Одни говорят, что ты странный тип, другие — что ты жулик, а третьи считают тебя гением в искусстве изготовления сосисок. Без твоих умелых рук и работы с ножом большая часть мяса скота в округе сгнила бы, прежде чем её можно было бы съесть."

	outfit = /datum/outfit/job/beastmaster
	display_order = JDO_BUTCHER
	give_bank_account = TRUE
	min_pq = -10
	max_pq = null
	round_contrib_points = 2

/datum/outfit/job/beastmaster/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/labor/butchering, 5, TRUE)
	beltl = /obj/item/rogueweapon/huntingknife/cleaver
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	backl = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	backpack_contents = list(
		/obj/item/kitchen/spoon,
		/obj/item/reagent_containers/food/snacks/rogue/truffles,
		/obj/item/reagent_containers/powder/salt = 3,
		/obj/item/reagent_containers/food/snacks/rogue/meat/coppiette = 2,
		)
	if(should_wear_femme_clothes(H))
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	else if(should_wear_masc_clothes(H))
		pants = /obj/item/clothing/under/roguetown/trou
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather

	H.change_stat("strength", 1)
	H.change_stat("endurance", 1)
	H.change_stat("intelligence", -1)

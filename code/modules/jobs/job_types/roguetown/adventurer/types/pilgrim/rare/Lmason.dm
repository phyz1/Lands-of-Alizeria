//dwarf master mason

/datum/advclass/grandmastermason
	name = "Grandmaster Mason"
	tutorial = "Ты великий мастер-каменщик, построивший замки и целые города своими руками. В этом мире нет ничего, что ты не смог бы построить. Твоё кредо и упорный труд открыли все секреты камня."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/adventurer/grandmastermason
	category_tags = list(CTAG_TOWNER)
	maximum_possible_slots = 1
	pickprob = 5

	subclass_stats = list(
		STATKEY_CON = 2,
		STATKEY_INT = 2,
		STATKEY_SPD = 2,
		STATKEY_END = 2,
		STATKEY_STR = 1
	)

	subclass_skills = list(
	/datum/skill/combat/axes = SKILL_LEVEL_JOURNEYMAN,
	/datum/skill/combat/maces = SKILL_LEVEL_APPRENTICE,
	/datum/skill/labor/lumberjacking = SKILL_LEVEL_JOURNEYMAN,
	/datum/skill/labor/mining = SKILL_LEVEL_JOURNEYMAN,
	/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
	/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
	/datum/skill/craft/crafting = SKILL_LEVEL_MASTER,
	/datum/skill/craft/carpentry = SKILL_LEVEL_EXPERT,
	/datum/skill/craft/masonry = SKILL_LEVEL_LEGENDARY,
	/datum/skill/craft/engineering = SKILL_LEVEL_MASTER,
	/datum/skill/misc/lockpicking = SKILL_LEVEL_JOURNEYMAN,
	/datum/skill/craft/smelting = SKILL_LEVEL_LEGENDARY,
	/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
	/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
	/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
	/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
	/datum/skill/craft/smelting = SKILL_LEVEL_LEGENDARY,
	/datum/skill/misc/ceramics = SKILL_LEVEL_EXPERT,
	)

/datum/outfit/job/adventurer/grandmastermason/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/hatblu
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	cloak = /obj/item/clothing/cloak/apron/waist/bar
	pants = /obj/item/clothing/under/roguetown/trou
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltl = /obj/item/rogueweapon/pick
	backr = /obj/item/rogueweapon/stoneaxe/woodcut
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(
						/obj/item/flashlight/flare/torch = 1,
						/obj/item/recipe_book/builder = 1,
						)

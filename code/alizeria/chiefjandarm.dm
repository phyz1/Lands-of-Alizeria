/datum/job/roguetown/marshgen
	title = "Marshall of Gendarmes"
	flag = MARSHGEN
	department_flag = MERCENARIES
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALIZ_NOBLE_RACES_W_DWARF
	tutorial = "Относительно недавно ты прибыл вместе с действующим наместником на этот остров, перед этим дав клятву вместе со своими людьми - защищать и оберегать корону, а также её подданых. Укоренившееся общество Ализерии было неочень радо вашему прибытию на всё готовое и какой-то момент времени вам приходилось подавлять народные волнения. Благо эти времена прошли и на улицах отныне царит относительный порядок, однако сможете ли вы его сохранить?"
	display_order = JDO_MARSHGEN
	selection_color = JCOLOR_MERCENARY
	always_show_on_latechoices = TRUE
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	allowed_patrons = CODEX

	outfit = /datum/outfit/job/marshgen
	advclass_cat_rolls = list(CTAG_MARSHGEN = 21)
	give_bank_account = 120
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	social_rank = SOCIAL_RANK_NOBLE

	cmode_music = 'sound/music/combat_guard.ogg'

	job_traits = list(TRAIT_STEELHEARTED, TRAIT_HEAVYARMOR, TRAIT_NOBLE, TRAIT_ANTIMAGIC, TRAIT_JUSTICARSIGHT)
	job_subclasses = list(
		/datum/advclass/marshgen
	)

/datum/job/roguetown/marshgen/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/marshgen
	name = "Marshall of Gendarmes"
	tutorial = "Относительно недавно ты прибыл вместе с действующим наместником на этот остров, перед этим дав клятву вместе со своими людьми - защищать и оберегать корону, а также её подданых. Укоренившееся общество Ализерии было неочень радо вашему прибытию на всё готовое и какой-то момент времени вам приходилось подавлять народные волнения. Благо эти времена прошли и на улицах отныне царит относительный порядок, однако сможете ли вы его сохранить?"
	category_tags = list(CTAG_MARSHGEN)
	subclass_stats = list(
		STATKEY_STR = 2,
		STATKEY_INT = 2,
		STATKEY_CON = 1,
		STATKEY_PER = 2,
		STATKEY_END = 3,
	)

	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_LEGENDARY,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_MASTER,
		/datum/skill/combat/bows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_MASTER,
		/datum/skill/combat/unarmed = SKILL_LEVEL_MASTER,
		/datum/skill/craft/traps = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN, //Paperwork RP
		/datum/skill/misc/athletics = SKILL_LEVEL_MASTER,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/tracking = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_LEGENDARY,
	)
	subclass_languages = list(
		/datum/language/otavan
	)

/datum/outfit/job/marshgen
	name = "Marshall of Gendarmes"
	has_loadout = TRUE
	jobtype = /datum/job/roguetown/marshgen

/datum/outfit/job/marshgen/pre_equip(mob/living/carbon/human/H)
	..()
	if(should_wear_femme_clothes(H))
		head = /obj/item/clothing/head/roguetown/jandarms/cief
		cloak = /obj/item/clothing/cloak/jandarms/cief
		backr = /obj/item/storage/backpack/rogue/satchel
		backl = /obj/item/quiver/pylipistol
		armor = /obj/item/clothing/suit/roguetown/armor/alizeria/jandarms/chief/armor
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
		gloves = /obj/item/clothing/gloves/roguetown/alizeria/noblegloves
		id = /obj/item/scomstone
		beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
		belt = /obj/item/storage/belt/rogue/leather/plaquegold
		beltl = /obj/item/rogueweapon/sword/rapier/dec
		pants = /obj/item/clothing/under/roguetown/tights/alizeria/jandarms/instructor
		shoes = /obj/item/clothing/shoes/roguetown/boots/jandarms/cief
		wrists = /obj/item/storage/keyring/alizeria/janmashall
	if(should_wear_masc_clothes(H))
		head = /obj/item/clothing/head/roguetown/jandarms/cief
		cloak = /obj/item/clothing/cloak/jandarms/cief/alt
		backr = /obj/item/storage/backpack/rogue/satchel
		backl = /obj/item/quiver/pylipistol
		armor = /obj/item/clothing/suit/roguetown/armor/alizeria/jandarms/chief/jacket
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
		pants = /obj/item/clothing/under/roguetown/tights/alizeria/jandarms/instructor
		shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
		beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
		belt = /obj/item/storage/belt/rogue/leather/plaquegold
		beltl = /obj/item/rogueweapon/sword/rapier/dec
		id = /obj/item/scomstone
		gloves = /obj/item/clothing/gloves/roguetown/angle
		wrists = /obj/item/storage/keyring/alizeria/janmashall

	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/haste)
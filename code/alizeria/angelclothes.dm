/obj/item/clothing/shoes/roguetown/boots/blacksteel/aliz/angel/boots
	name = "angel boots"
	desc = "Boots forged of durable blacksteel."
	body_parts_covered = FEET|TAIL_LAMIA
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "angelboots"
	item_state = "angelboots"
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)
	color = null
	blocksound = PLATEHIT
	max_integrity = 2000
	armor = list("blunt" = 200, "slash" = 200, "stab" = 200, "piercing" = 200, "fire" = 200, "acid" = 200)
	armor = ARMOR_PLATE_BSTEEL
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/blacksteel
	resistance_flags = FIRE_PROOF
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/head/roguetown/helmet/blacksteel/modern/aliz/angel/crown
	name = "angel crown"
	desc = "An armet forged of durable blacksteel, utilizing a modern design."
	body_parts_covered = FULL_HEAD
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "angelcrown"
	item_state = "angelcrown"
	flags_inv = HIDEEARS|HIDEFACE|HIDESNOUT
	flags_cover = HEADCOVERSMOUTH
	armor = ARMOR_PLATE_BSTEEL
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)
	block2add = FOV_BEHIND
	max_integrity = 2000
	armor = list("blunt" = 200, "slash" = 200, "stab" = 200, "piercing" = 200, "fire" = 200, "acid" = 200)
	smeltresult = /obj/item/ingot/blacksteel
	smelt_bar_num = 2
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/suit/roguetown/armor/plate/aliz/angel/armor
	name = "angel armor"
	desc = "A suit of Full Plate smithed from durable blacksteel. With an internally layered gambeson, the piercing and blunt protection is unmatched among its heavy-plated peers."
	body_parts_covered = COVERAGE_FULL
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "angelarmor"
	item_state = "angelarmor"
	sleevetype = "angelarmor"
	armor = ARMOR_PLATE_BSTEEL
	allowed_race = CLOTHED_RACES_TYPES
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)
	blocking_behavior = null
	max_integrity = 2000
	armor = list("blunt" = 200, "slash" = 200, "stab" = 200, "piercing" = 200, "fire" = 200, "acid" = 200)
	smeltresult = /obj/item/ingot/blacksteel
	equip_delay_self = 1 SECONDS
	unequip_delay_self = 1 SECONDS
	equip_delay_other = 1 SECONDS
	strip_delay = 1 SECONDS
	smelt_bar_num = 4
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/cloak/jandarms/aliz/angel/coat
	name = "angel coat"
	desc = "Роскошный плащ, что хорошо греет владельца."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "angelcoat"
	item_state = "angelcoat"
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "angelcoat"
	slot_flags = ITEM_SLOT_CLOAK
	sellprice = 50
	nodismemsleeves = TRUE
	slot_flags = ITEM_SLOT_CLOAK
	allowed_race = NON_DWARVEN_RACE_TYPES
	allowed_sex = list(FEMALE)
	armor = list("blunt" = 200, "slash" = 200, "stab" = 200, "piercing" = 200, "fire" = 200, "acid" = 200)
	max_integrity = 2000
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)

/obj/item/clothing/gloves/roguetown/blacksteel/modern/aliz/angel/gloves
	name = "angel gloves"
	desc = "A set of plate gauntlets forged of blacksteel, using a modern design."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "angelgloves"
	item_state = "angelgloves"
	armor = ARMOR_PLATE_BSTEEL
	prevent_crits = list(BCLASS_CHOP, BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	resistance_flags = FIRE_PROOF
	blocksound = PLATEHIT
	armor = list("blunt" = 200, "slash" = 200, "stab" = 200, "piercing" = 200, "fire" = 200, "acid" = 200)
	max_integrity = 2000
	blade_dulling = DULLING_BASH
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/blacksteel
	unarmed_bonus = 10
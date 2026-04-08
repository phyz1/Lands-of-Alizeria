
/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/gun
	name = "singleshot pistol"
	desc = "Дешёвый пистоль, созданный для обеспечения минимальных нужд патрульных жандармов. Вмещает в себя одну пулю, способную ранить одну цель."
	icon = 'icons/roguetown/weapons/ranged32.dmi'
	icon_state = "pistol_oneshot0"
	item_state = "pistol_oneshot"
	experimental_onhip = TRUE
	experimental_onback = TRUE
	possible_item_intents = list(/datum/intent/shoot/aliz/gun, /datum/intent/arc/aliz/gun, INTENT_GENERIC)
	mag_type = /obj/item/ammo_box/magazine/internal/shot/pyla
	slot_flags = ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_BULKY
	randomspread = 1
	spread = 0
	can_parry = TRUE
	var/chargingspeed = 20
	var/reloadtime = 20
	var/onehanded = FALSE
	var/movingreload = TRUE
	var/hasloadedsprite = FALSE
	force = 10
	var/cocked = FALSE
	cartridge_wording = "pyla"
	load_sound = 'sound/alizeria/guns/clad_v_patronnik.ogg'
	fire_sound = 'sound/alizeria/guns/shot.ogg'
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/steel
	resistance_flags = FIRE_PROOF
	obj_flags = UNIQUE_RENAME
	damfactor = 2
	accfactor = 1.1
	hasloadedsprite = TRUE
	onehanded = TRUE

/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/gun/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -4,"sy" = -6,"nx" = 9,"ny" = -6,"wx" = -6,"wy" = -4,"ex" = 4,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 90,"wturn" = 93,"eturn" = -12,"nflip" = 0,"sflip" = 1,"wflip" = 0,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/datum/intent/shoot/aliz/gun
	chargedrain = 0 //no drain to aim a crossbow
	var/basetime = 40

/datum/intent/shoot/aliz/gun/can_charge()
	if(mastermob?.next_move > world.time)
		if(mastermob.client.last_cooldown_warn + 10 < world.time)
			to_chat(mastermob, span_warning("Ещё не готово!"))
			mastermob.client.last_cooldown_warn = world.time
			return FALSE
		if(mastermob && masteritem)
			var/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/gun/c_bow = masteritem
			if(mastermob.get_num_arms(FALSE) < 2 && !c_bow.onehanded || mastermob.get_inactive_held_item() && !c_bow.onehanded)
				to_chat(mastermob, span_warning("I need a free hand to draw [masteritem]!"))
				return FALSE
	return TRUE

/datum/intent/shoot/aliz/gun/get_chargetime()
	if(mastermob && chargetime && masteritem)
		var/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/gun/c_bow = masteritem
		var/newtime = chargetime
		//skill block
		newtime += basetime
		newtime -= (mastermob.get_skill_level(/datum/skill/combat/crossbows) * 4.25) // minus 4.25 per skill point
		newtime -= ((mastermob.STAPER)) // minus 1 per perception

		if(c_bow.onehanded)
			if(mastermob.get_num_arms(FALSE) < 2 || mastermob.get_inactive_held_item())
				newtime *= 1.5 // more time if firing one-handed.
		if(newtime > 1)
			return newtime
		else
			return 1
	return chargetime

/datum/intent/arc/aliz/gun
	chargetime = 1
	var/basetime = 40
	chargedrain = 0 //no drain to aim a crossbow

/datum/intent/arc/aliz/gun/can_charge()
	if(mastermob?.next_move > world.time)
		if(mastermob.client.last_cooldown_warn + 10 < world.time)
			to_chat(mastermob, span_warning("Ещё не готово!"))
			mastermob.client.last_cooldown_warn = world.time
			return FALSE
		if(mastermob && masteritem)
			var/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/gun/c_bow = masteritem
			if(mastermob.get_num_arms(FALSE) < 2 && !c_bow.onehanded || mastermob.get_inactive_held_item() && !c_bow.onehanded)
				to_chat(mastermob, span_warning("I need a free hand to draw [masteritem]!"))
				return FALSE
	return TRUE


/datum/intent/arc/aliz/gun/get_chargetime()
	if(mastermob && chargetime && masteritem)
		var/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/gun/c_bow = masteritem
		var/newtime = chargetime
		//skill block
		newtime += basetime
		newtime -= (mastermob.get_skill_level(/datum/skill/combat/crossbows) * 20)
		//per block
		newtime += 20
		newtime -= ((mastermob.STAPER)*1.5)

		if(c_bow.onehanded)
			if(mastermob.get_num_arms(FALSE) < 2 || mastermob.get_inactive_held_item())
				newtime *= 2 // more time if firing one-handed.

		if(newtime > 0)
			return newtime
		else
			return 10
	return chargetime

/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/gun/shoot_with_empty_chamber()
	if(cocked)
		playsound(src.loc, 'sound/alizeria/guns/shot_empty.ogg', 100, FALSE)
		cocked = FALSE
		update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/gun/attack_self(mob/living/user)
	if(chambered)
		..()
	else
		if(!cocked)
			to_chat(user, span_info("Я взвожу своё оружие..."))
			if(!movingreload)
				if(do_after(user, reloadtime - user.STASTR, target = user))
					playsound(user, 'sound/alizeria/guns/reload.ogg', 100, FALSE)
					cocked = TRUE
			else
				if(move_after(user, reloadtime - user.STASTR, target = user))
					playsound(user, 'sound/alizeria/guns/reload.ogg', 100, FALSE)
					cocked = TRUE
		else
			to_chat(user, span_warning("Я осторожно разряжаю оружие..."))
			cocked = FALSE
	update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/gun/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		if(cocked)
			if((loc == user) && (user.get_inactive_held_item() != src))
				return
			..()
		else
			to_chat(user, span_warning("Мне нужно сперва перезарядить это."))


/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/gun/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(user.get_num_arms(FALSE) < 2 && !onehanded)
		return FALSE
	if(user.get_inactive_held_item() && !onehanded)
		return FALSE
	if(user.client)
		if(user.client.chargedprog >= 100)
			spread = 0
		else
			spread = 150 - (150 * (user.client.chargedprog / 100))
	else
		spread = 0
	for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
		var/obj/projectile/BB = CB.BB

		BB.accuracy += accfactor * (user.STAPER - 8) * 3 // 8+ PER gives +3 per level. Exponential.
		BB.bonus_accuracy += (user.STAPER - 8) // 8+ PER gives +1 per level. Does not decrease over range.
		BB.bonus_accuracy += (user.get_skill_level(/datum/skill/combat/crossbows) * 5) // +5 per XBow level.
		BB.damage *= damfactor
	cocked = FALSE

	..()

	if(!onehanded)
		return
	var/obj/item/other_hand = user.get_inactive_held_item()
	var/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/gun/alt_cbow
	if(other_hand.type != type)
		return
	alt_cbow = other_hand
	if(!alt_cbow)
		return
	if(!alt_cbow.chambered)
		return
	if(HAS_TRAIT(user, TRAIT_DUALWIELDER) && alt_cbow.onehanded)
		alt_cbow.accfactor /= 2
		alt_cbow.process_fire(target, user, FALSE)
		alt_cbow.accfactor = initial(alt_cbow.accfactor)
		return

/obj/item/gun/ballistic/revolver/grenadelauncher/aliz/gun/update_icon()
	. = ..()
	cut_overlays()
	icon_state = "[item_state][cocked ? "1" : "0"]"

	if(chambered && !hasloadedsprite)
		var/mutable_appearance/ammo = mutable_appearance('icons/roguetown/weapons/ammo.dmi', chambered.icon_state)
		add_overlay(ammo)
	if(chambered && hasloadedsprite)
		icon_state = "[item_state][2]"

	if(!ismob(loc))
		return
	var/mob/M = loc
	M.update_inv_hands()

/obj/item/ammo_box/magazine/internal/shot/pyla
	ammo_type = /obj/item/ammo_casing/caseless/rogue/pyla
	caliber = "regpyla"
	max_ammo = 1
	start_empty = TRUE

/obj/item/ammo_casing/caseless/rogue/pyla
	name = "пистольная пуля"
	desc = "Обычная пуля, которую используют в большинстве пистолей. Способна серьёзно ранить цель."
	projectile_type = /obj/projectile/bullet/reusable/pyla
	caliber = "regpyla"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "musketball"
	dropshrink = 0.6
	max_integrity = 1
	force = 1

/obj/projectile/bullet/reusable/pyla
	name = "пуля"
	damage = 70
	damage_type = BRUTE
	armor_penetration = 70
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "musketball_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/pyla
	range = 15
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	embedchance = 100
	woundclass = BCLASS_PIERCE
	flag = "piercing"
	speed = 0.5
	npc_damage_mult = 2

/////////////////////////////////////////

/obj/item/quiver/pylipistol
	name = "сумка с пистольными пулями"
	icon_state = "pylisatchel0"
	item_state = "pylisatchel"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	max_storage = 40

/obj/item/quiver/pylipistol/Initialize()
	..()
	for(var/i in 1 to max_storage)
		var/obj/item/ammo_casing/caseless/rogue/pyla/A = new()
		arrows += A
	update_icon()

/obj/item/quiver/pylipistol/update_icon()
	if(arrows.len)
		icon_state = "pylisatchel1"
	else
		icon_state = "pylisatchel0"
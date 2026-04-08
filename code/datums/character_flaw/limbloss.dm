
/datum/charflaw/limbloss
	var/lost_zone

/datum/charflaw/limbloss/on_mob_creation(mob/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/O = H.get_bodypart(lost_zone)
	if(O)
		O.drop_limb()
		qdel(O)
	return

/datum/charflaw/limbloss/arm_r
	name = "Деревянная рука (R)"
	desc = "Когда-то давно я лишился правой руки. Теперь вместо неё - деревянная.<br><i>(Несовместимо с бронзовой правой рукой)</i>"
	lost_zone = BODY_ZONE_R_ARM

/datum/charflaw/limbloss/arm_r/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/r_arm/prosthetic/woodright/L = new()
	L.attach_limb(H)

/datum/charflaw/limbloss/arm_l
	name = "Деревянная рука (L)"
	desc = "Когда-то давно я лишился левой руки. Теперь вместо неё - деревянная.<br><i>(Несовместимо с бронзовой левой рукой)</i>"
	lost_zone = BODY_ZONE_L_ARM

/datum/charflaw/limbloss/arm_l/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/l_arm/prosthetic/woodleft/L = new()
	L.attach_limb(H)

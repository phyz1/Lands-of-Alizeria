/datum/virtue/size
	/// Amount to increase the valid range of sprite sizes
	var/scale
/datum/virtue/size/giant
	name = "Гигант"
	desc = "Я всегда был крупнее, сильнее и выносливее обычного человека. Я часто передвигаюсь неуклюже, и мой огромный рост может сломать хрупкую деревянную дверь."
	added_traits = list(TRAIT_BIGGUY, TRAIT_GIANT_WEAPON_WIELDER)
	custom_text = "<font color='red'>Увеличивает размер вашего спрайта</font>\n +1 CON"
	restricted = TRUE
	races = list(/datum/species/ogre) //this controls whenever or not it's restricted to a race
	scale = BODY_SIZE_GIANT

/datum/virtue/size/giant/apply_to_human(mob/living/carbon/human/recipient)
	recipient.change_stat("constitution", 1)
//pronoun procs, for getting pronouns without using the text macros that only work in certain positions
//datums don't have gender, but most of their subtypes do!
/datum/proc/p_they(capitalized, temp_gender)
	. = "оно"
	if(capitalized)
		. = capitalize(.)

/datum/proc/p_their(capitalized, temp_gender)
	. = "оно"
	if(capitalized)
		. = capitalize(.)

/datum/proc/p_them(capitalized, temp_gender)
	. = "оно"
	if(capitalized)
		. = capitalize(.)

/datum/proc/p_have(temp_gender)
	. = "имеет"

/datum/proc/p_are(temp_gender)
	. = ""

/datum/proc/p_were(temp_gender)
	. = "was"

/datum/proc/p_do(temp_gender)
	. = "does"

/datum/proc/p_theyve(capitalized, temp_gender)
	. = p_they(capitalized, temp_gender) + "'" + copytext(p_have(temp_gender), 3)

/datum/proc/p_theyre(capitalized, temp_gender)
	. = p_they(capitalized, temp_gender) + "'" + copytext(p_are(temp_gender), 2)

/datum/proc/p_s(temp_gender) //is this a descriptive proc name, or what?
	. = ""

/datum/proc/p_es(temp_gender)
	. = ""

//like clients, which do have gender.
/client/p_they(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "они"
	switch(temp_gender)
		if(FEMALE)
			. = "она"
		if(MALE)
			. = "он"
	if(capitalized)
		. = capitalize(.)

/client/p_their(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "их"
	switch(temp_gender)
		if(FEMALE)
			. = "её"
		if(MALE)
			. = "его"
	if(capitalized)
		. = capitalize(.)

/client/p_them(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "им"
	switch(temp_gender)
		if(FEMALE)
			. = "ей"
		if(MALE)
			. = "ему"
	if(capitalized)
		. = capitalize(.)

/client/p_have(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "имеет"
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = "имеет"

/client/p_are(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = ""
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = ""

/client/p_were(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "was"
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = "were"

/client/p_do(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "does"
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = "do"

/client/p_s(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	if(temp_gender != PLURAL && temp_gender != NEUTER)
		. = ""

/client/p_es(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	if(temp_gender != PLURAL && temp_gender != NEUTER)
		. = ""

// LETHALSTONE NOTE: hello! we always return early on PLURAL check here because it's always correct (human mob overrides set it for disguises) and respects disguises. causes some code duplication though

//mobs(and atoms but atoms don't really matter write your own proc overrides) also have gender!
/mob/p_they(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "it"
	switch(temp_gender)
		if(FEMALE)
			. = "она"
		if(MALE)
			. = "он"
		if(PLURAL)
			. = "они"
			if (capitalized)
				. = capitalize(.)
			return

	// LETHALSTONE EDIT: if our mob has pronouns, use those instead
	if (pronouns)
		switch (pronouns)
			if (HE_HIM)
				. = "он"
			if (HE_HIM_F)
				. = "он"
			if (SHE_HER)
				. = "она"
			if (SHE_HER_M)
				. = "она"
			if (THEY_THEM)
				. = "они"
			if (THEY_THEM_F)
				. = "они"
			if (IT_ITS)
				. = "это"
	// LETHALSTONE EDIT END
	if(capitalized)
		. = capitalize(.)

/mob/p_their(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "это"
	switch(temp_gender)
		if(FEMALE)
			. = "её"
		if(MALE)
			. = "его"
		if(PLURAL)
			. = "их"
			if (capitalized)
				. = capitalize(.)
			return

	// LETHALSTONE EDIT: if our mob has pronouns, use those instead
	if (pronouns)
		switch (pronouns)
			if (HE_HIM)
				. = "его"
			if (HE_HIM_F)
				. = "его"
			if (SHE_HER)
				. = "её"
			if (SHE_HER_M)
				. = "её"
			if (THEY_THEM)
				. = "их"
			if (THEY_THEM_F)
				. = "их"
			if (IT_ITS)
				. = "это"
	// LETHALSTONE EDIT END
	if(capitalized)
		. = capitalize(.)

/mob/p_them(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "это"
	switch(temp_gender)
		if(FEMALE)
			. = "её"
		if(MALE)
			. = "ему"
		if(PLURAL)
			. = "им"
			if (capitalized)
				. = capitalize(.)
			return
	// LETHALSTONE EDIT: if our mob has pronouns, use those instead
	if (pronouns)
		switch (pronouns)
			if (HE_HIM)
				. = "он"
			if (HE_HIM_F)
				. = "он"
			if (SHE_HER)
				. = "ей"
			if (SHE_HER_M)
				. = "ей"
			if (THEY_THEM)
				. = "им"
			if (THEY_THEM_F)
				. = "им"
			if (IT_ITS)
				. = "этому"
	// LETHALSTONE EDIT END
	if(capitalized)
		. = capitalize(.)

/mob/p_have(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "имеет"
	if(temp_gender == PLURAL)
		. = "имеет"
		return
	// LETHALSTONE EDIT: use pronouns where possible
	if (pronouns)
		if (pronouns == THEY_THEM || pronouns == THEY_THEM_F)
			. = "имеет"
	// LETHALSTONE EDIT END

/mob/p_are(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = ""
	if(temp_gender == PLURAL)
		. = ""
		return
	// LETHALSTONE EDIT: use pronouns where possible
	if (pronouns)
		if (pronouns == THEY_THEM || pronouns == THEY_THEM_F)
			. = ""
	// LETHALSTONE EDIT END

/mob/p_were(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "was"
	if(temp_gender == PLURAL)
		. = "were"
		return
	// LETHALSTONE EDIT: use pronouns where possible
	if (pronouns)
		if (pronouns == THEY_THEM || pronouns == THEY_THEM_F)
			. = "were"
	// LETHALSTONE EDIT END

/mob/p_do(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "does"
	if(temp_gender == PLURAL)
		. = "do"
		return
	// LETHALSTONE EDIT: use pronouns where possible
	if (pronouns)
		if (pronouns == THEY_THEM || pronouns == THEY_THEM_F)
			. = "do"
	// LETHALSTONE EDIT END

/mob/p_s(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	if(temp_gender != PLURAL)
		. = "s"
	// LETHALSTONE EDIT: use pronouns where possible
	if (pronouns)
		if (pronouns != THEY_THEM && pronouns != THEY_THEM_F)
			. = "s"
	// LETHALSTONE EDIT END

/mob/p_es(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	if(temp_gender != PLURAL)
		. = "es"
	// LETHALSTONE EDIT: use pronouns where possible
	if (pronouns)
		if (pronouns != THEY_THEM && pronouns != THEY_THEM_F)
			. = "es"
	// LETHALSTONE EDIT END

//humans need special handling, because they can have their gender hidden
/mob/living/carbon/human/p_they(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_PANTS in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_their(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_PANTS in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_them(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_PANTS in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_have(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_PANTS in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_are(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_PANTS in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_were(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_PANTS in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_do(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_PANTS in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_s(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_PANTS in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_es(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_PANTS in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

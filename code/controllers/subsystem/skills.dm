/*!
This subsystem mostly exists to populate and manage the skill singletons.
*/

SUBSYSTEM_DEF(skills)
	name = "Навыки"
	flags = SS_NO_FIRE
	init_order = INIT_ORDER_SKILLS
	///Dictionary of skill.type || skill ref
	var/list/all_skills = list()
	///Static assoc list of levels (ints) - strings
	var/static/list/level_names = alist(
		SKILL_LEVEL_NOVICE = span_info("<span class='small'>Начинающий</span>"),
		SKILL_LEVEL_APPRENTICE = span_info("Подмастерье"),
		SKILL_LEVEL_JOURNEYMAN = span_biginfo("Владеющий"),
		SKILL_LEVEL_EXPERT = span_biginfo("Эксперт"),
		SKILL_LEVEL_MASTER = "<b>Мастер</b>",
		SKILL_LEVEL_LEGENDARY = span_greentext("<b>Легенда</b>"),
	)//This list is already in the right order, due to indexing
	///Plain level names without the span
	var/static/list/level_names_plain = alist(
		SKILL_LEVEL_NOVICE = "Начинающий",
		SKILL_LEVEL_APPRENTICE = "Подмастерье",
		SKILL_LEVEL_JOURNEYMAN = "Владеющий",
		SKILL_LEVEL_EXPERT = "Эксперт",
		SKILL_LEVEL_MASTER = "Мастер",
		SKILL_LEVEL_LEGENDARY = "Легенда",
	)

/datum/controller/subsystem/skills/Initialize(timeofday)
	InitializeSkills()
	return ..()

///Ran on initialize, populates the skills dictionary
/datum/controller/subsystem/skills/proc/InitializeSkills(timeofday)
	for(var/type in typesof(/datum/skill))
		if(is_abstract(type))
			continue
		var/datum/skill/ref = new type
		all_skills[type] = ref

/proc/skill_to_string(var/skill_level)
	if(!skill_level)
		return "None"
	// Clears a runtime
	skill_level = clamp(skill_level, 0, SKILL_LEVEL_LEGENDARY)
	return SSskills.level_names_plain[skill_level]

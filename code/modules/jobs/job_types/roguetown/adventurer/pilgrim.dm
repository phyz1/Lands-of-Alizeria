/datum/job/roguetown/pilgrim
	title = "Pilgrim"
	flag = PILGRIM
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 0
	spawn_positions = 0 //disables round-start spawn of pilgrims but allows migrant waves
	allowed_races = RACES_ALL_KINDS
	tutorial = "Избегая несчастья, ты направляетесь в Ализерию. Ты не солдат и не искатель приключений, а скромный переселенец, пытающийся найти лучшую жизнь — если, конечно, выживете в этом путешествии."

	outfit = null
	outfit_female = null
	bypass_lastclass = TRUE
	bypass_jobban = FALSE
	

	advclass_cat_rolls = list(CTAG_PILGRIM = 20)
	PQ_boost_divider = 10

	announce_latejoin = FALSE
	display_order = JDO_PILGRIM
	min_pq = -20
	max_pq = null
	wanderer_examine = TRUE
	advjob_examine = TRUE
	always_show_on_latechoices = FALSE
	same_job_respawn_delay = 0

/datum/job/roguetown/adventurer/courtagent
	title = "Court Agent"
	flag = COURTAGENT
	display_order = JDO_COURTAGENT
	total_positions = 0
	spawn_positions = 0
	round_contrib_points = 2
	tutorial = "Будь то заслугами, хитрыми переговорами или выполненными заказами, ты оказался в тайном подчинении у десницы. Исполняй желания и прихоти двора, которые они предпочли бы не разглашать. Твоё положение далеко не надёжное, и любая ошибка может привести к тому, что от тебя отрекутся и обвинят, как обычного преступника. Члены гарнизона и двора знают, кто ты."
	min_pq = 5
	job_reopens_slots_on_death = FALSE
	always_show_on_latechoices = FALSE
	show_in_credits = TRUE
	advclass_cat_rolls = list(CTAG_COURTAGENT = 20)
	obsfuscated_job = TRUE
	class_setup_examine = FALSE

//Hooking in here does not mess with their equipment procs
/datum/job/roguetown/adventurer/courtagent/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	if(L)
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			GLOB.court_agents += H.real_name
			if(H.mind)
				H.mind.special_role = "Court Agent" //For obfuscating them in the Actors list: _job.dm L:216
			..()

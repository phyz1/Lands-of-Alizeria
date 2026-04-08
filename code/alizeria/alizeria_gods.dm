/*
/datum/patron/alizeria/codex
	name = null
	var/crafting_recipes = list(/datum/crafting_recipe/roguetown/structure/zizo_shrine)			//Allows construction of unique bad shrine.
	profane_words = list("cock","dick","fuck","shit","pussy","cuck","cunt","asshole", "pintle")	//Same as master but 'Zizo' is allowed now.

/datum/patron/alizeria/codex/five
	name = "Кодекс Пяти"
	desc = "Священный кодекс, чья история создания давно была забыта вместе с Империей, однако хранящий в себе великую силу подобной божественной. \n\
		Заповеди в нём являются самыми главными правилами морали во всём мире, но следовать им зачастую готовы лишь те, кто владеет властью.  \
		Ведь только так появляется возможность её сохранить..."
	worshippers = "Cultists, those spurned by the Ten."
	godhead = /datum/patron/alizeria/codexfaith/one

/datum/patron/alizeria/codexfaith/one
	name = "Честь"
	desc = "Честь и благородство являются главным ориентиром моих поступков. Всe остальное - второстепенно."
	worshippers = "Рыцари, Правители, Юнцы."
	mob_traits = list(TRAIT_APRICITY)
*/



/datum/faith/inhument/standardt
	name = "Кодекс Пяти"
	desc = "Священный кодекс, чья история создания давно была забыта вместе с Империей, однако хранящий в себе великую силу подобной божественной. \n\
		Заповеди в нём являются самыми главными правилами морали во всём мире, но следовать им зачастую готовы лишь те, кто владеет властью. \n\
		Ведь только так появляется возможность её сохранить..."
	worshippers = "Большая часть населения старого горизонта."
	godhead = /datum/patron/inhument/zizot

/datum/patron/inhument
	name = null
	associated_faith = /datum/faith/inhument/standardt

/datum/patron/inhument/zizot
	name = "Честь"
	domain = "Отсутствует."
	desc = "Честь и благородство являются главными ориентирами моих поступков. Всe остальное - второстепенно."
	worshippers = "Рыцари, Правители, Юнцы."

/datum/patron/inhument/zizott
	name = "Вера"
	domain = "Отсутствует."
	desc = "Я могу одинаково верить во все заповеди, однако самое главное для меня - продолжать в них верить и побуждать верить в них других. Только так мы убережeм себя от опасности."
	worshippers = "Жрецы, Паломники, Наставники."

/datum/patron/inhument/zizottt
	name = "Память"
	domain = "Отсутствует."
	desc = "Нельзя забывать ошибки прошлого. Заповеди возможно интерпретировать по разному, однако их суть всегда должна быть понятна на любых языках и в любых временах."
	worshippers = "Учeные, Исследователи, Волшебники."

/datum/patron/inhument/zizotttt
	name = "Благонравие"
	domain = "Отсутствует."
	desc = "Целомудрие, верность своему делу и правильные поступки - самое главное, что хранит в себе кодекс. Всe остальное - лишь порочит душу."
	worshippers = "Знать, Ремесленники, Лекари."

/datum/patron/inhument/zizottttt
	name = "Клятва"
	domain = "Отсутствует."
	desc = "Люди зря смеют забывать о возможном возмездии. Ради цели мне дозволено нарушить некоторые заповеди, ибо неважно кем я умру в мире смертных - на той стороне я буду мучеником, а противники кодекса будут вечность гореть в ярком божественном пламени."
	worshippers = "Фанатики, Отчаянные, Безумцы."
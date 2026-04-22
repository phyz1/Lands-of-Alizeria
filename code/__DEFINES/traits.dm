#define SIGNAL_ADDTRAIT(trait_ref) ("addtrait " + trait_ref)
#define SIGNAL_REMOVETRAIT(trait_ref) ("removetrait " + trait_ref)
#define	TRAIT_CALLBACK_ADD(target, trait, source) CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(___TraitAdd), ##target, ##trait, ##source)
#define	TRAIT_CALLBACK_REMOVE(target, trait, source) CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(___TraitRemove), ##target, ##trait, ##source)

// ROGUETRAITS (description when rmb skills button)
#define TRAIT_WEBWALK "Webwalker"
#define TRAIT_NOSTINK "Dead Nose"
#define TRAIT_ZJUMP "High Jumping"
#define TRAIT_JESTERPHOBIA "Jesterphobic"
#define TRAIT_XENOPHOBIC "Xenophobic"
#define TRAIT_TOLERANT "Tolerant"
#define TRAIT_LEAPER "Leaper"
#define TRAIT_NUTCRACKER "Nutcracker"
#define TRAIT_SEEPRICES "Skilled Appraiser"
#define TRAIT_SEEPRICES_SHITTY "Appraiser"
#define TRAIT_STRONGBITE "Strong Bite"
#define TRAIT_NOBLE "Noble Blooded"
#define TRAIT_DISGUISER "Disguiser"
#define TRAIT_DISGUISED "Disguised"
#define TRAIT_DISGUISED_SOCIAL "Disguised Social"
#define TRAIT_DISGRACED_NOBLE "Formerly Noble Blooded"
#define TRAIT_EMPATH "Empath"
#define TRAIT_BREADY "Battleready"
#define TRAIT_MEDIUMARMOR "Maille Training"
#define TRAIT_HEAVYARMOR "Plate Training"
#define TRAIT_DODGEEXPERT "Fast Reflexes"
#define TRAIT_MAGEARMOR "Magic Barrier"
#define TRAIT_DECEIVING_MEEKNESS "Deceiving Meekness"
#define TRAIT_CRITICAL_RESISTANCE "Critical Resistance"
#define TRAIT_CRITICAL_WEAKNESS "Critical Weakness"
#define TRAIT_DNR "Bane of Existence"
#define TRAIT_MANIAC_AWOKEN "Awoken"
#define TRAIT_INFINITE_STAMINA "Indefatigable" //for ai
#define TRAIT_SLOW_SWIMMER "Slow Swimmer"
#define TRAIT_NUDIST "Nudist" //you can't wear most clothes
#define TRAIT_CYCLOPS_LEFT "Cyclops (Left)" //poked left eye
#define TRAIT_CYCLOPS_RIGHT "Cyclops (Right)" //poked right eye
#define TRAIT_INHUMEN_ANATOMY "Inhumen Anatomy" //can't wear hats and shoes
#define TRAIT_NASTY_EATER "Inhumen Digestion" //can eat rotten food, organs, poison berries, and drink murky water
#define TRAIT_WILD_EATER "Beastly Digestion" //can eat raw and rotten food and drink murky water
#define TRAIT_NOFALLDAMAGE1 "Fall Damage Reduction"
#define TRAIT_NOFALLDAMAGE2 "Fall Damage Immunity"
#define TRAIT_MISSING_NOSE "Missing Nose" //halved stamina regeneration
#define TRAIT_DISFIGURED "Disfigured"
#define TRAIT_SPELLCOCKBLOCK "Bewitched" //prevents spellcasting
#define TRAIT_ANTIMAGIC	"Anti-Magic"
#define TRAIT_ANTISCRYING "Non-Detection"
#define TRAIT_SHOCKIMMUNE "Shock Immunity"
#define TRAIT_PACIFISM "Pacifism"
#define TRAIT_NOSLEEP "Fatal Insomnia"
#define TRAIT_FASTSLEEP "Fast Sleeper"
#define TRAIT_GOODLOVER "Fabled Lover"
#define TRAIT_LIMPDICK "Limp Dick"
#define TRAIT_SEEDKNOW "Seed Knower"
#define TRAIT_SQUIRE_REPAIR "Squire Knowledge"
#define TRAIT_TRAINED_SMITH "Trained Smith"
#define TRAIT_GUARDSMAN "Vigilant Guardsman"
#define TRAIT_GUARDSMAN_NOBLE "Noble Guardsman"
#define TRAIT_TAVERN_FIGHTER "Tavern Fighter"
#define TRAIT_FROZEN_STAMINA "Frozen Stamina"
#define TRAIT_WOODSMAN "Talented Woodsman"
#define TRAIT_TALENTED_ALCHEMIST "Talented Alchemist" // Allows alchemy XP gain past apprentice
#define TRAIT_LAMIAN_TAIL "Lamian Tail"
#define TRAIT_DUNGEONMASTER "Ruthless Jailor"
#define TRAIT_DEATHBARGAIN "Death Bargain" // Used by UNDERMAIDEN'S BARGAIN
#define TRAIT_RITUALIST "Ritualist"  // Allows use of ritual chalk
#define TRAIT_INQUISITION "Member of the Otavan Inquisition"
#define TRAIT_GOODTRAINER "Good Trainer"
#define TRAIT_BADTRAINER "Bad Trainer"
#define TRAIT_UNDERDARK "Cave Adaptation" // Night vision in caves
#define TRAIT_UNDERSIGHT "Undersight" // For the underdark trait
#define TRAIT_DVERGR "Dvergr"
#define TRAIT_OUTDOORSMAN "Outdoorsman"
#define TRAIT_SEA_DRINKER "Denizen of the Deep"
#define TRAIT_STUDENT		"Student"
#define TRAIT_INTELLECTUAL "Intellectual"
#define TRAIT_GRAVEROBBER "Experienced Grave Robber"
#define TRAIT_PURITAN "Puritan"
#define TRAIT_HEARTFELT "Heartfelt"
#define TRAIT_MIRROR_MAGIC "Mirror Magic"
#define TRAIT_WITCH "They fear me, but I am useful to them."
#define TRAIT_WINGS "Bewinged"
#define TRAIT_INFINITE_ENERGY "Boundless Energy" //infinite fatigue (blue bar) but not infinite stamina
#define TRAIT_PERMAMUTE "Permanent Mute"
#define TRAIT_HERESIARCH "Forbidden Knowledge" //allows entry to ascendant church
#define TRAIT_EXCOMMUNICATED "Excommunicated" //cannot be target of healing miracles of Ten or anastasia or cure rot
#define TRAIT_DISGRACED_KNIGHT "Disgraced Knight" //knight who has been stripped of their honor
#define TRAIT_PEASANTMILITIA "Angry Peasant" //Skill is treated as one higher with appropriate weapons
#define TRAIT_SLAYER "Slayer Oath"
#define TRAIT_NODEF "Recklessness"
#define TRAIT_WAGES_SUSPENDED "Wages Suspended" //steward has suspended your wages

//Hearthstone port (Tracking)
#define TRAIT_PERFECT_TRACKER "Perfect Tracker" //Will always find any tracks and analyzes them perfectly.
#define TRAIT_ZIZOSIGHT "Blessing of Zizo" // I can see just a bit more clearly in darkness.
#define TRAIT_DEATHSIGHT "Veiled Whispers" // Is notified when a player character dies, but not told exactly where or how.
//Hearthstone/Azure end.

// ROGUEspecialTRAITS (description when rmb skills button)
#define TRAIT_CIVILIZEDBARBARIAN "Expert Pugilist"
#define TRAIT_COMICSANS "Annoying Face"
#define TRAIT_WATERBREATHING "Water Breathing"

// PATRON GOD TRAITS
#define TRAIT_ROT_EATER "Blessing of Pestra" //can eat rotten food
#define TRAIT_ORGAN_EATER "Blessing of Graggar" //can eat organs
#define TRAIT_KNEESTINGER_IMMUNITY "Blessing of Dendor"
#define TRAIT_SOUL_EXAMINE "Blessing of Necra" //can check bodies to see if they have departed
#define TRAIT_CRACKHEAD "Blessing of Baotha" //will never overdose
#define TRAIT_CHOSEN "Astrata's Chosen"
#define TRAIT_ABYSSOR_SWIM "Blessing of Abyssor" //less base fatigue drain when swimming
#define TRAIT_XYLIX "Blessing of Xylix" //secret thieves cant language
#define TRAIT_FORGEBLESSED "Blessing of Malum" //Reduces the fatigue cost of smithing a bit.
#define TRAIT_APRICITY	"Apricity" //Decreased stamina regen time during "day"
#define TRAIT_SHARPER_BLADES "Sharper Blades" //Weapons lose less blade integrity
#define TRAIT_JUSTICARSIGHT "Blessing of Ravox" //Allows seeing bounties and crimes when examining outlaws.
#define TRAIT_EXTEROCEPTION	"Exteroception" //See others' hunger and thirst; pairs well with empath.
#define TRAIT_BLACKLEG	"Blackleg" //Rig coin, dice, cards in your favor - UNUSED FOR NOW
#define TRAIT_BETTER_SLEEP	"Better Sleep" //Recover more energy (blue bar) when sleeping
#define TRAIT_NOCINSPIRE "Lunar Inspiration" //Guaranteed inspiration in addition to your normal one when sleeping.
#define TRAIT_LEECHIMMUNE "Unleechable" //leeches wont attach in bog squares + dendor boon.
#define TRAIT_LONGSTRIDER "Longstrider"
#define TRAIT_PSYDONIAN_GRIT "Psydonian Grit" // Pain Tolerance. Through faith, ENDURE.
#define TRAIT_PSYDONITE "Psydonite's Devotion" // Anti-Miracles on a selective basis, anastasis / cure rot still apply. Slow passive wound healing while you have blood.
#define TRAIT_BLACKBAGGER "Apprehension Techniques" // Capable of using Garrotes and Blackbags. Apprehension techniques.w passive wound healing while you have blood.
#define TRAIT_HERETIC_DEVOUT "Heretic Devout" // used to make it so excom and other priest stuff doesn't work on wretches

// PATRON GOD TRAITS CURSES

#define TRAIT_CURSE "Curse" //source
#define TRAIT_CURSE_ASTRATA "Astrata's Curse" //Cannot sleep and burn up in sunlight
#define TRAIT_CURSE_NOC "Noc's Curse" //Cannot use magic and burn up in moonlight
#define TRAIT_CURSE_DENDOR "Dendor's Curse" //Increased damage from nature sources.
#define TRAIT_CURSE_RAVOX "Ravox's Curse" // effect same as ~ -2 (-30% parry -30% dodge -30% accuracy) to all weapon skills
#define TRAIT_CURSE_NECRA "Necra's Curse" //cannot be revived
#define TRAIT_CURSE_PESTRA "Pestra's Curse" //randomly causes vomiting, unconsciousness, blurred vision
#define TRAIT_CURSE_ABYSSOR "Abyssors's Curse" //fears the water
#define TRAIT_CURSE_MALUM "Malum's Curse" //cannot craft or use smith hammer
#define TRAIT_CURSE_XYLIX "Curse of Xylix" //no fortune
#define TRAIT_CURSE_EORA "Eora's Curse" //world is ugly
#define TRAIT_CURSE_RESIST "Curse Resistance" //Some folk with a tendency to get cursed are resistant
#define TRAIT_RITES_BLOCKED "Rites Expended" // used to block using rites

//ASCENDANT GOD CURSES

#define TRAIT_CURSE_ZIZO "Curse of Zizo" //int nuke and no magic
#define TRAIT_CURSE_GRAGGAR "Curse of Graggar" //str nuke, inhumen anatomy and disfigurment
#define TRAIT_CURSE_MATTHIOS "Curse of Matthios" //lck nuke and clumsy
#define TRAIT_CURSE_BAOTHA "Curse of Baotha" //nudist

// ASCENDANT CULTIST TRAITS (all of them recognize each other)
#define TRAIT_COMMIE "Blessing of Matthios" //recognized by bandits as an ally
#define TRAIT_CABAL "Of the Cabal" //Zizo cultists recognize each other too
#define TRAIT_HORDE "Anointed" //Graggarites also recognize each other
#define TRAIT_DEPRAVED "Fallen" //Baothans also recognize each other
#define TRAIT_MATTHIOS_EYES	"Eyes of Matthios" //Examine to see the most expensive item someone has (Replaces shitty-appraisal)
#define TRAIT_CULTIC_THIEF "Blessed Pickpocket" // Roll advantage when pickpocketing, taking the highest roll and disregarding the other.
#define TRAIT_AVATAR_GRAGGAR "The Darkstar's Avatar" // shows a horrible thing on examine even when helmeted (for ogres)

#define TRAIT_BASHDOORS "Door Basher"
#define TRAIT_NOMOOD "Moodless"
#define TRAIT_BAD_MOOD "Bad Mood"
#define TRAIT_NIGHT_OWL "Night Owl"
#define TRAIT_BEAUTIFUL "Beautiful"
#define TRAIT_SIMPLE_WOUNDS "simple_wounds"
#define TRAIT_BANDITCAMP "banditcamp"
#define TRAIT_VAMPMANSION "vampiremansion"
#define TRAIT_VAMP_DREAMS "vamp_dreams"
#define TRAIT_STEELHEARTED "Steelhearted" //no bad mood from dismembering or seeing this
#define TRAIT_IWASREVIVED "iwasrevived" //prevents PQ gain from reviving the same person twice
#define TRAIT_IWASUNZOMBIFIED "iwasunzombified" //prevents PQ gain from curing a zombie twice
#define TRAIT_IWASHAUNTED "iwashaunted" //prevents spawning a haunt from a decapitated body twice
#define TRAIT_SCHIZO_AMBIENCE "Schizo Ambience" //replaces all ambience with creepy shit
#define TRAIT_SCREENSHAKE "Tremors" //screen will always be shaking, you cannot stop it
#define TRAIT_NORUN "Decayed Flesh"
#define TRAIT_PUNISHMENT_CURSE "PunishmentCurse"
#define TRAIT_LEPROSY "Leprosy"
#define TRAIT_NUDE_SLEEPER "Nude Sleeper"
#define TRAIT_SILVER_BLESSED "Silver Blessed"
#define TRAIT_SILVER_BLOOD "Silver Blood"
#define TRAIT_OUTLANDER "Outlander"
#define TRAIT_OUTLAW "Outlaw"
#define TRAIT_KNOWNCRIMINAL "Known Criminal"
#define TRAIT_BIGGUY "Big Guy"
#define TRAIT_GIANT_WEAPON_WIELDER "Giant Weapon Wielder" // Allows use of giant weapons without doubling minstr
#define TRAIT_OGRE_STRENGTH "Ogre Strength"				// This is practically the same as above, but just for ogres. This is avoid a fringe case
#define TRAIT_RESIDENT "Resident"
#define TRAIT_COUNTERCOUNTERSPELL "Counter Counterspell"
#define TRAIT_UNSEEMLY "Ugly"
#define TRAIT_HERETIC_SEER "Heretic Seer"
#define TRAIT_DUALWIELDER "Dual Wielder"
#define TRAIT_SENTINELOFWITS "Sentinel of Wits"
#define TRAIT_KEENEARS "Keen Ears"
#define TRAIT_CICERONE "Cicerone"
#define TRAIT_EASYDISMEMBER	"Easy Dismember"
#define TRAIT_EASYDECAPITATION "Easy Decapitation"
#define TRAIT_NOPAIN	"Painless"
#define TRAIT_NOPAINSTUN	"Enduring"
#define TRAIT_NOBREATH	"Breathless"
#define TRAIT_HOLLOW_LIFE "Hollow Lyfe"
#define TRAIT_TOXIMMUNE	"Poison Immune"
#define TRAIT_GRABIMMUNE "Unstoppable"
#define TRAIT_ROTMAN "Rotman"
#define TRAIT_ZOMBIE_IMMUNE "Deadite Immunity" //immune to deadite infection
#define TRAIT_NOHUNGER	"Foodless"
#define TRAIT_DARKVISION "Darksight"
#define TRAIT_NOCSHADES "Nocshaded"
#define TRAIT_LIGHT_STEP	"Light Step"
#define TRAIT_REACHNATIVE "Reach Native"
#define TRAIT_SLEUTH	"Sleuth"
#define TRAIT_HARDSHELL "Hardshell"
#define TRAIT_WOODWALKER "Woodwalker"
#define TRAIT_ARCYNE_T1 "Arcyne Training (Novice)"
#define TRAIT_ARCYNE_T2 "Arcyne Training (Apprentice)"
#define TRAIT_ARCYNE_T3 "Arcyne Training (Expert)"
#define TRAIT_ARCYNE_T4 "Arcyne Training (Master)"
#define TRAIT_STRENGTH_UNCAPPED "Strength Unbound"	//ignores the STR softcap.
#define TRAIT_EORAN_CALM "Eoran Calm"
#define TRAIT_EORAN_SERENE "Eoran Serenity"
#define TRAIT_NECRAS_VOW "Necra's Vow"
#define TRAIT_DYES "Dyemaster"
#define TRAIT_GOODWRITER "Great Writer"
#define TRAIT_ADRENALINE_RUSH "Adrenaline Rush"
#define TRAIT_COMBAT_AWARE	"Combat Aware"
#define TRAIT_TEMPO	"Tempo Capable"
#define TRAIT_STRONGKICK	"Strong Kick"
#define TRAIT_SILVER_WEAK "Silver Weakness"
#define TRAIT_DEADITE "Deadite"
#define TRAIT_PUZZLEMASTER "Puzzle Master"
#define TRAIT_CLERGY "Clergy" // City clergy
#define TRAIT_CRIMSON_CURSE "Crimson Curse" //Crimson Curse Virtue
// ARMOR / CLOTHING GIVEN TRAITS (GIVEN BY WEARING CLOTHES/ARMOR PIECES)
#define TRAIT_MONK_ROBE	"Holy Vestatures"

//item and enchantment traits should go under here as new ones get added
#define TRAIT_ENGINEERING_GOGGLES "Engineering Goggles"

//role related traits
#define TRAIT_MASTER_CARPENTER "Master Carpenter"
#define TRAIT_MASTER_MASON "Master Masonry"
#define TRAIT_FOOD_STIPEND "Vomitorium-known"
#define TRAIT_ROYALSERVANT "Household Insight" // Let's you see the royals liked/hated food/drink


GLOBAL_LIST_INIT(roguetraits, list(
	TRAIT_RITES_BLOCKED = span_bloody("Сейчас я не могу совершать никаких обрядов."),
	TRAIT_HERETIC_DEVOUT = span_necrosis("Презрение Астраты не заставит меня отступить, ибо моя вера истинна."),
	TRAIT_PACIFISM = span_info("Я никогда не причиню вреда ни одному живому существу."),
	TRAIT_STEELHEARTED = span_info("У меня закаленные нервы. Проявление насилия меня никак не беспокоит."),
	TRAIT_OUTLANDER = span_info("Я являюсь чужим на этой земле."),
	TRAIT_OUTLAW = span_info("Магические устройства отвергают мои прикосновения."),
	TRAIT_LEPROSY = span_necrosis("Я отвратителен..."),
	TRAIT_TAVERN_FIGHTER = span_info("Таверна - мой дом, никто не посмеет возражать мне или уклоняться от оплаты."),
	TRAIT_GUARDSMAN = span_info("Я хорошо прижился в городе. Там я чувствую себя уверенней."),
	TRAIT_GUARDSMAN_NOBLE = span_info ("Я хорошо прижился во дворце. Там я чувствую себя уверенней."),
	TRAIT_WOODSMAN = span_info("Лес - мой дом. Там я чувствую себя уверенней."),
	TRAIT_TALENTED_ALCHEMIST = span_info("Я обладаю природным талантом к алхимии, что позволяет мне продвинуться в этом ремесле дальше уровня ученика."),
	TRAIT_DEATHBARGAIN = span_info("A horrible deal has been prepared in your name. May you never see it fulfilled..."),
	TRAIT_RITUALIST = span_info("Я хорошо разбираюсь в священных искусствах. Используя ритуальный мел, я могу более искусно направлять силы своего Бога с помощью рун."),
	TRAIT_INQUISITION = span_info("I am a member of the Otavan Inquisition. I can easily identify others of my Sect at a glance."),
	TRAIT_CHOSEN = "Боги смотрят за мной.",
	TRAIT_WEBWALK = "Я могу свободно перемещаться между паутинами.",
	TRAIT_NOSTINK = span_dead("Я не чувствую запаха разложения."),
	TRAIT_ZJUMP = "Я прыгаю лучше прочих.",
	TRAIT_JESTERPHOBIA = span_warning("Я крайне сильно боюсь шутов."),
	TRAIT_XENOPHOBIC = span_warning("Низшие расы загрязняют нашу землю."),
	TRAIT_TOLERANT = span_info("Я мечтаю об идеальном будущем, в котором будет мир между всеми расами."),
	TRAIT_NIGHT_OWL = span_info("Мне нравится не спать по ночам."),
	TRAIT_BEAUTIFUL = span_info("Я прекрасен."),
	TRAIT_BAD_MOOD = span_warning("Этот мир ужасен. Я ненавижу его."),
	TRAIT_LEAPER = "Я могу прыгать, как лягушка, приземляясь там, где захочу.",
	TRAIT_NUTCRACKER = "Я обожаю пинать идиотов по яйцам!",
	TRAIT_SEEPRICES = "Я могу назвать цены на все с точностью до зенни.",
	TRAIT_SEEPRICES_SHITTY = "Я могу определить цены на вещи... <i>Почти</i>.",
	TRAIT_STRONGBITE = span_info("У меня более сильные укусы и критические атаки."),
	TRAIT_NOBLE = span_blue("Я голубых кровей."),
	TRAIT_DISGUISER = span_info("Я владею тайным искусством искажения облика, позволяющим менять свою форму."),
	TRAIT_DISGUISED = span_info("Моя истинная сущность скрыта."),
	TRAIT_DISGUISED_SOCIAL = span_info("Магия скрывает моё истинное положение в обществе."),
	TRAIT_DISGRACED_NOBLE = span_warning("Когда-то давно я был признанным дворянином..."),
	TRAIT_EMPATH = span_info("Я могу заметить, когда людям больно, и чувствую умиротворение, когда они счастливы."),
	TRAIT_BREADY = span_info("Защитная позиция меня не утомляет."),
	TRAIT_MEDIUMARMOR = span_info("Я умею носить среднюю броню."),
	TRAIT_HEAVYARMOR = span_info("Я умею носить тяжёлую броню."),
	TRAIT_DODGEEXPERT = span_info("Я легко уворачиваюсь от ударов в лёгкой броне."),
	TRAIT_MAGEARMOR = span_info("Моя магия может время от времени защищать меня от ударов."),
	TRAIT_DECEIVING_MEEKNESS = span_info("Люди смотрят на меня и думают, что я слабак. Они ошибаются. Я научился скрывать свои пороки от других."),
	TRAIT_CRITICAL_RESISTANCE = "Я устойчив к ранам, которые могли бы представлять угрозу для жизни у других людей.",
	TRAIT_CRITICAL_WEAKNESS = span_danger("Я слаб к ранам, которые другие могли бы пережить."),
	TRAIT_DNR = span_danger("Нет шансов на то, что я воскресну после смерти. Эта жизнь - всё что у меня есть."),
	TRAIT_MANIAC_AWOKEN = span_danger("I am <b>WAKING UP</b> and the sheeple know this. They will resist."),
	TRAIT_INFINITE_STAMINA = "Я не устаю.",
	TRAIT_SLOW_SWIMMER = "Я плохо перемещаюсь в воде.",
	TRAIT_NUDIST = "Я <b>отказываюсь</b> носить одежду.",
	TRAIT_CYCLOPS_LEFT = span_warning("Я потерял свой левый глаз..."),
	TRAIT_CYCLOPS_RIGHT = span_warning("Я потерял свой правый глаз..."),
	TRAIT_LEECHIMMUNE = "Пиявкам плевать на моё тело.",
	TRAIT_BITERHELM = "Каким-то образом я могу кусать людей сквозь забрало.",
	TRAIT_INHUMEN_ANATOMY = "У меня нечеловеческая анатомия, из-за которой я не могу носить головные уборы и обувь.",
	TRAIT_NASTY_EATER = span_dead("Я могу есть ужасную пищу. Мне безразличен вкус, а также я не отравлюсь."),
	TRAIT_WILD_EATER = span_info("Я могу есть сырое мясо и пить грязную воду."),
	TRAIT_NOFALLDAMAGE1 = span_warning("Я легко справляюсь с незначительными падениями."),
	TRAIT_NOFALLDAMAGE2 = span_warning("Я могу выдержать падение с любой высоты."),
	TRAIT_GRABIMMUNE = span_warning("Моя огромная сила или скользкая ловкость не позволяют другим схватить меня!"),
	TRAIT_DISFIGURED = span_warning("Никто не может узнать меня..."),
	TRAIT_MISSING_NOSE = span_warning("Мне тяжело дышать..."),
	TRAIT_SPELLCOCKBLOCK = span_warning("Я не могу произносить никаких заклинаний."),
	TRAIT_ANTIMAGIC = "Я невосприимчив к большинству форм магии.",
	TRAIT_ANTISCRYING = "Я невосприимчив к большинству форм магического преследования.",
	TRAIT_SHOCKIMMUNE = "Я невосприимчив к ударам электрическим током.",
	TRAIT_NOSLEEP = span_warning("Я не могу спать."),
	TRAIT_ROT_EATER = span_necrosis("Я могу есть сгнившую пищу."),
	TRAIT_ORGAN_EATER = span_bloody("Я могу есть сырые органы."),
	TRAIT_KNEESTINGER_IMMUNITY = "I am immune to the shock of kneestingers.",
	TRAIT_SOUL_EXAMINE = span_deadsay("Я знаю, когда чья-то душа покидает нас."),
	TRAIT_CRACKHEAD = span_love("Я могу употреблять наркотики столько, сколько захочу!"),
	TRAIT_COMMIE = span_bloody("Я могу узнать других свободных людей, и они тоже могут узнать меня."),
	TRAIT_KNOWNCRIMINAL = span_bloody("Я заклейменный преступник. Ничто не может этого изменить."),
	TRAIT_NORUN = span_warning("Мое тело атрофировалось в состоянии полного разложения; суставам моих ног просто больше не хватает силы и долговечности для бега."),
	TRAIT_GOODLOVER = span_love("Это большая удача - делить со мной постель."),
	TRAIT_LIMPDICK = span_crit("Мой солдат отказывается вставать по стойке смирно! Проклятье!"),
	TRAIT_SEEDKNOW = span_info("Я знаю, из каких семян вырастут те или иные культуры."),
	TRAIT_PERFECT_TRACKER = span_info("Я отличный следопыт. Никакие следы не обманут моих глаз и не скроют от меня своих секретов."),//Hearthstone port.
	TRAIT_ZIZOSIGHT = span_info("Зизо благословляет мои глаза, чтобы они не были отягощены ночью."), //Hearthstone change.
	TRAIT_CIVILIZEDBARBARIAN = span_info("Мои упорные тренировки в боевых искусствах превратили меня в живое оружие. Ни одна конечность не находится вне досягаемости моих кулаков и ног, а мои удары без оружия теперь имеют больше шансов нанести критический урон."),
	TRAIT_COMICSANS = span_sans("Я проклят странным голосом."),
	TRAIT_SQUIRE_REPAIR = span_info("Я знаю толк в инструментах моего хозяина."),
	TRAIT_WATERBREATHING = span_info("Я не тону в водоемах."),
	TRAIT_NUDE_SLEEPER = span_warning("Я не могу заснуть, пока не окажусь раздетым в постели."),
	TRAIT_ABYSSOR_SWIM = span_info("Я гораздо меньше устаю во время плавания, чем мои сверстники."),
	TRAIT_LONGSTRIDER = span_info("Каждый мой шаг находит опору, какой бы коварной ни была местность."),
	TRAIT_TRAINED_SMITH = span_info("Я долго тренировался. Еще немного и я смогу создавать легендарные предметы."),
	TRAIT_DEATHSIGHT = span_info("I can feel when someone nearby draws the Undermaiden's attention."),
	TRAIT_FORGEBLESSED = span_info("Бесчисленные долгие ночи, проведенные за ковкой металла, отточили мою выносливость, позволив мне работать у наковальни гораздо дольше, чем большинство людей, не уставая."),
	TRAIT_XYLIX = span_info("Я знаю, как говорить шифром, который могут понять только мои 'коллеги'."),
	TRAIT_APRICITY = span_info("Свет Астраты благословляет и омолаживает меня, позволяя быстрее восстанавливать силы во время дня."),
	TRAIT_SHARPER_BLADES = span_info("Мои лезвия затупляются медленнее, что позволяет им дольше оставаться острыми."),
	TRAIT_CABAL = span_info("Втайне я изучал пути Ее восхождения."),
	TRAIT_HORDE = span_info("КЛЯНУСЬ КРОВЬЮ И МОГУЩЕСТВОМ, Я - ПОМАЗАННИК ГРАГГАРА!"),
	TRAIT_PSYDONITE = span_info("PSYDON LYVES. PSYDON PERSISTS. I can ENDURE and LYVE with wounds better than most. Healing miracles hold no sway over me."),
	TRAIT_PSYDONIAN_GRIT = span_info("I can shrug off my wounds and maintain composure under duress. My own mortality is proof that I LYVE, as too does HE."),
	TRAIT_BLACKBAGGER = span_info("Меня обучали как правильно похищать людей с помощью удавок и черных мешков."),
	TRAIT_FORTITUDE = span_info("Типичная усталость, которую я испытываю изо дня в день - уменьшилась, а мой атлетизм возрос."),
	TRAIT_GUIDANCE = span_info("Магия помогает мне в битве."),
	TRAIT_DEPRAVED = span_info("Мне знаком томный аромат ее распутства."),
	TRAIT_SILVER_BLESSED = span_info("Я помазан святым серебром, которое оберегает меня от терзающих меня проклятий."),
	TRAIT_SILVER_BLOOD = span_info("Моя кровь была благословлена серебром, сжигающим любого мертвеца, который попытается мной питаться. Однако это не защитит меня от их проклятия."),
	TRAIT_GOODTRAINER = span_info("Я хороший учитель и когда дело доходит до владения оружием - я могу научить других быть такими же умелыми, как я сам."),
	TRAIT_BADTRAINER = span_info("Я потратил годы, изучая искусство владения одним-единственным оружием, но, к сожалению, у меня не хватает терпения обучать кого-то еще. Все, кто учится у меня, получат навыки не выше моего на два уровня."),
	TRAIT_SEA_DRINKER = span_info("Как обитатель морских глубин, я могу спокойно пить соленую океанскую воду."),
	TRAIT_BIGGUY = span_info("Мое огромное телосложение и габариты позволяют мне с легкостью проламывать деревянные двери и расшвыривать людей."),
	TRAIT_GIANT_WEAPON_WIELDER = span_info("Мое богатое прошлое позволяет мне беспрепятственно владеть мощным оружием."),
	TRAIT_OGRE_STRENGTH = span_info("My ogre heritage grants me the strength to wield massive weapons."),
	TRAIT_OUTDOORSMAN = span_info("Мой опыт пребывания в дикой природе позволяет мне засыпать на таких поверхностях, как ветви деревьев, как будто это кровати."),
	TRAIT_STUDENT =  span_info("Я ошеломлен всеми этими знаниями!"),
	TRAIT_LEGENDARY_ALCHEMIST = span_info("Я эксперт в искусстве поиска трав в дикой природе."),
	TRAIT_INTELLECTUAL = span_info("Я весьма проницателен и могу понять лишь по виду человека, в чём именно он хорош."),
	TRAIT_COUNTERCOUNTERSPELL = span_info("Я думаю на два шага вперёд, когда дело заходит о контр-заклинаниях."),
	TRAIT_UNSEEMLY = span_info("Мое лицо уродливо и делает несчастными всех, кто смотрит на меня."),
	TRAIT_HERETIC_SEER = span_info("I can tell other Ascendant followers without sharing their faith."),
	TRAIT_DUALWIELDER = span_info("Если я владею двумя видами оружия одного типа, у меня появляется 33% шанс атаковать ими обоими одновременно. Я оказываюсь в невыгодном положении при попытке парировать удар. Я не получаю штрафоф за использование своего оружия в бою."),
	TRAIT_SENTINELOFWITS = span_info("Мой интеллект помогает мне защищаться. Каждые 2 очка, превышающие 10 баллов INT, дают дополнительные 10% шансов уклониться или парировать. Не учитываются положительные эффекты от зелий или веществ."),
	TRAIT_KEENEARS = span_info("У меня хороший слух, и я могу различить, кто говорит, даже когда они находятся вне поля зрения. Я также слышу шепот издалека."),
	TRAIT_SCREENSHAKE = span_suicide("Я больше не чувствую себя уверенно..."),
	TRAIT_GRAVEROBBER = span_info("Мой опыт в восстановлении артефактов позволил мне противостоять проклятию Некры, наложенному на тех, кто нарушает покой в могилах."),
	TRAIT_PURITAN = span_info("I lead the Sect of the Psydonic Otavan Inquisition sent here from Otava."),
	TRAIT_HEARTFELT = span_info("I serve the interests of the Lord of Heartfelt."),
	TRAIT_MIRROR_MAGIC = span_info("Свет мой, зеркальце! Скажи - я ль на свете всех милее?"),
	TRAIT_JUSTICARSIGHT = span_info("Я могу вспомнить о чьих-то преступлениях, просто взглянув на них, и о том, какова награда за их голову."),
	TRAIT_CICERONE = span_info("Я хорошо разбираюсь в различиях сортов пива и крепких спиртных напитков. Я также могу отличить их с первого взгляда"),
	TRAIT_BETTER_SLEEP = span_info("Во время сна я восстанавливаю больше энергии."),
	TRAIT_NOCINSPIRE = span_info("Луна вдохновляет меня и нашептывает знания в моих снах. Во сне я получу дополнительное вдохновение."),
	TRAIT_ROTMAN = span_info("Я частично нежить. Мое сердце не бьется."),
	TRAIT_EASYDISMEMBER = span_info("Мои конечности хрупки. Их можно с большей легкостью расчленить, включая мою шею."),
	TRAIT_NOPAIN = span_info("Я не чувствую боли."),
	TRAIT_NOPAINSTUN = span_info("Боль меня не тревожит."),
	TRAIT_NOBREATH = span_info("Я не дышу."),
	TRAIT_HOLLOW_LIFE = span_bloody("Я ближе к мертвецу, чем к живому. Я чувствую презрение Астраты ко мне даже сейчас."),
	TRAIT_CRIMSON_CURSE = span_bloody("You suffer from the Crimson Curse, a weak form of Vampirism acquired from dark rites or a particularly cruel hex. Unlike a 'true' Vampire, you are incapable of converting others or commiting Diablerie."),
	TRAIT_TOXIMMUNE = span_info("Мне плевать на яды."),
	TRAIT_ZOMBIE_IMMUNE = span_info("Укусы мертвецов не могут заразить меня."),
	TRAIT_NOHUNGER = span_info("Я не испытываю ни голода, ни жажды."),
	TRAIT_DARKVISION = span_info("Я лучше вижу в темноте."),
	TRAIT_NOCSHADES = span_info("Линза, через которую я смотрю, позволяет мне видеть в темноте как можно четче."),
	TRAIT_RESIDENT = span_info("I've been granted a Meister account, and the ownership of a house in Scarlet Reach."),
	TRAIT_LIGHT_STEP = span_info("Мои шаги легки и быстры. Я создаю меньше шума и могу красться гораздо быстрее."),
	TRAIT_NOMOOD = span_info("Я не чувствую ни печали, ни радости, ни стресса."),
	TRAIT_REACHNATIVE = span_info("Я вырос и прожил всю свою жизнь в этих краях. Я могу попасть в засаду, только если буду много бегать."),
	TRAIT_SLEUTH = span_info("Я могу обнаружить след своей жертвы, не приближаясь к ней, и могу обнаружить ее на расстоянии. Я могу отслеживать ее чаще, и движение не мешает этому процессу. Я могу сразу же изучить следы, и другие не заметят моих усилий по поиску."),
	TRAIT_HARDSHELL = span_info("Большая часть этой брони мешает мне эффективно парировать, но я все еще могу уклоняться."),
	TRAIT_MATTHIOS_EYES = span_notice("У меня есть чутье на то, что является самым ценным предметом, который есть у кого-то."),
	TRAIT_CULTIC_THIEF = span_notice("Матиос помогает мне, когда я ворую у других."),
	TRAIT_AVATAR_GRAGGAR = span_notice("I AM THE DARKSTAR'S CRUSHING HAND. THE WEAK SHALL PERISH!!"),
	TRAIT_WOODWALKER = span_notice("Я могу быстрее лазать по деревьям и в два раза быстрее набираться опыта в скалолазании. Я могу безопасно наступать на колючки и ветки в лесу. Я могу добыть в два раза больше предметов, обыскивая кусты, и я могу безопасно стоять на листьях деревьев."),
	TRAIT_ARCYNE_T1 = span_notice("Я прошел базовую подготовку по магическим искусствам, что позволило мне получить доступ к небольшому набору заклинаний, полезных вне боя."),
	TRAIT_ARCYNE_T2 = span_notice("Я прошел углубленную подготовку в искусстве магии, что позволило мне выучить основные боевые заклинания."),
	TRAIT_ARCYNE_T3 = span_notice("Я полноценный маг, и у меня есть доступ к разрушительным заклинаниям, которые воздействуют на обширную территорию."),
	TRAIT_ARCYNE_T4 = span_notice("Я мастер магических искусств, и у меня есть доступ к некоторым из самых мощных заклинаний, когда-либо созданных."),
	TRAIT_INFINITE_ENERGY = span_notice ("I don't need rest; I won't ever feel fatigue."),
	TRAIT_PERMAMUTE = span_notice("Я не могу говорить."),
	TRAIT_STRENGTH_UNCAPPED = span_warning("MY STRENGTH IS UNBOUND!"),
	TRAIT_MONK_ROBE = span_notice("В своих скромных одеждах я чувствую себя ближе к богам.. Я чувствую прилив сил, наполненный их светом!"),
	TRAIT_EORAN_CALM = span_notice("Эора прикоснулась ко мне, подарив немного спокойствия. Она защищает меня."),
	TRAIT_EORAN_SERENE = span_greentext("Eora has blessed me with all-encompassing serenity. I feel no more stress."),
	TRAIT_NECRAS_VOW = span_warning("I've pledged myself to Necra. If I fall, I am Hers."),
	TRAIT_DYES = span_notice("Я умею хорошо красить одежду."),
	TRAIT_HERESIARCH = span_warning("I know of sacred sites of worship where followers of the Ascendants convene, and the path to the nearest conclave is etched into my memory."),
	TRAIT_GOODWRITER = span_notice("Я хорошо разбираюсь в письменной речи. Любые учебники, созданные мной, позволят читателю быстрее освоить навык."),
	TRAIT_BLOODLOSS_IMMUNE = span_notice("Я не чувствую, когда истекаю кровью."),
	TRAIT_ADRENALINE_RUSH = span_notice("Я чувствую прилив сил в разгар битвы! Я не чувствую своих ран!"),
	TRAIT_COMBAT_AWARE = span_notice("Мои отточенные чувства и интуиция позволяют мне с легкостью замечать примечательные вещи в разгар битвы."),
	TRAIT_TEMPO	= span_greentext("Я могу сражаться с несколькими противниками одновременно."),
	TRAIT_STRONGKICK = span_info("Мои пинки постоянно сбивают людей с ног и заставляют отступать на шаг. Препятствия не нужны."),
	TRAIT_SILVER_WEAK = span_notice("Серебро - мое проклятие."),
	TRAIT_WINGS = span_info("Мои крылья позволяют мне прыгать дальше."),
	TRAIT_UNDERDARK = span_info("Мои глаза чувствительны к солнечному свету Астраты, но хорошо приспособлены к темноте глубоких пещер."),
	TRAIT_DVERGR = span_info("My lineage descends from the Dvergr of the Underdark."),
	TRAIT_CURSE_ASTRATA = span_warning("I am forsaken by the Sun. I will find no rest under Her unwavering gaze."),
	TRAIT_CURSE_NOC = span_warning("I am forsaken by the Moon. I will find no salvation in His grace."),
	TRAIT_CURSE_DENDOR = span_warning("I am forsaken by the Treefather. Reason and common sense abandon me."),
	TRAIT_CURSE_ABYSSOR = span_warning("I am forsaken by the Dreamer. His domain will surely become my grave."),
	TRAIT_CURSE_RAVOX = span_warning("I am forsaken by the Justicar. My opponents will show me no clemency."),
	TRAIT_CURSE_NECRA = span_warning("I am forsaken by the Undermaiden. Even the lightest strike could send me into Her embrace."),
	TRAIT_CURSE_XYLIX = span_warning("I am forsaken by the Trickster. Misfortune follows me on every step."),
	TRAIT_CURSE_PESTRA = span_warning("I am forsaken by the Plaguemother. Sickness overwhelms my body rendering even simplest of tasks into a challenge."),
	TRAIT_CURSE_MALUM = span_warning("I am forsaken by the Maker. My hands tremble and fog overwhelms my mind."),
	TRAIT_CURSE_EORA = span_warning("I am forsaken by the Lover. There is no beauty to be found for me in this world."),
	TRAIT_EXCOMMUNICATED = span_warning("Я был отлучен от церкви."),
	TRAIT_DISGRACED_KNIGHT = span_warning("Я был опозорен и лишен рыцарского звания."),
	TRAIT_CURSE_ZIZO = span_warning("I am forsaken by the Architect. Her grasp reaches for my heart."),
	TRAIT_CURSE_GRAGGAR = span_warning("I am forsaken by the Warlord. Bloodlust is only thing I know for real."),
	TRAIT_CURSE_MATTHIOS = span_warning("I am forsaken by the Dragon. Greed will be my only salvation."),
	TRAIT_CURSE_BAOTHA = span_warning("I am forsaken by the Heartbreaker. I am drowning in her promises."),
	TRAIT_DEADITE = span_danger("Гниль одолела меня."),
	TRAIT_PUZZLEMASTER = span_notice("Я разгадал неразрешимую головоломку!"),
	TRAIT_ENGINEERING_GOGGLES = span_warning("Я могу видеть структурные детали, недоступные другим."),
	TRAIT_MASTER_CARPENTER = span_warning("Меня учили по максимуму использовать дерево."),
	TRAIT_ROYALSERVANT = span_greentext("Я достаточно долго служу королевской семье, чтобы знать их экзотические вкусы."),
	TRAIT_SLAYER = span_warning("Мои обеты запрещают мне защищать свои слабые места броней."),
	TRAIT_NODEF = span_warning("Я не умею правильно защищаться."),
	TRAIT_MASTER_MASON = span_warning("Меня учили извлекать максимум пользы из простого камня"),
	TRAIT_FOOD_STIPEND = span_notice("Создатели 'вомиториума' знают мой подход и оплатят стоимость своей продукции непосредственно из казны для меня."),
	TRAIT_CLERGY = span_notice("Я служу в местном Доме десяти."),
	TRAIT_WAGES_SUSPENDED = span_warning("На мой счёт перестали поступать деньги!"),
	TRAIT_PEASANTMILITIA = span_info("Я из простых людей. Мне проще полагаться на себя и единомышленников, чем на воинов лорда."),
	TRAIT_MASTER_MASON = span_warning("Меня учили извлекать максимум пользы из простого камня."),
))

// trait accessor defines
#define ADD_TRAIT(target, trait, source) \
	do { \
		var/list/_L; \
		if (!target.status_traits) { \
			target.status_traits = list(); \
			_L = target.status_traits; \
			_L[trait] = list(source); \
			SEND_SIGNAL(target, SIGNAL_ADDTRAIT(trait), trait); \
			SEND_GLOBAL_SIGNAL(COMSIG_ATOM_ADD_TRAIT, target, trait); \
		} else { \
			_L = target.status_traits; \
			if (_L[trait]) { \
				_L[trait] |= list(source); \
			} else { \
				_L[trait] = list(source); \
				SEND_SIGNAL(target, SIGNAL_ADDTRAIT(trait), trait); \
				SEND_GLOBAL_SIGNAL(COMSIG_ATOM_ADD_TRAIT, target, trait); \
			}; \
		} \
	} while (0)
#define REMOVE_TRAIT(target, trait, sources) \
	do { \
		var/list/_L = target.status_traits; \
		var/list/_S; \
		if (sources && !islist(sources)) { \
			_S = list(sources); \
		} else { \
			_S = sources; \
		}; \
		if (_L && _L[trait]) { \
			for (var/_T in _L[trait]) { \
				if ((!_S && (_T != ROUNDSTART_TRAIT)) || (_T in _S)) { \
					_L[trait] -= _T; \
				}; \
			};\
			if (!length(_L[trait])) { \
				_L -= trait; \
				SEND_SIGNAL(target, SIGNAL_REMOVETRAIT(trait), trait); \
			}; \
			if (!length(_L)) { \
				target.status_traits = null; \
			}; \
		} \
	} while (0)
#define REMOVE_TRAITS_NOT_IN(target, sources) \
	do { \
		var/list/_L = target.status_traits; \
		var/list/_S = sources; \
		if (_L) { \
			for (var/_T in _L) { \
				_L[_T] &= _S; \
				if (!length(_L[_T])) { \
					_L -= _T; \
					SEND_SIGNAL(target, SIGNAL_REMOVETRAIT(_T), _T); \
					SEND_GLOBAL_SIGNAL(COMSIG_ATOM_REMOVE_TRAIT, target, trait); \
				}; \
			};\
			if (!length(_L)) { \
				target.status_traits = null\
			};\
		}\
	} while (0)

#define HAS_TRAIT(target, trait) (target.status_traits ? (target.status_traits[trait] ? TRUE : FALSE) : FALSE)
#define HAS_TRAIT_FROM(target, trait, source) (target.status_traits ? (target.status_traits[trait] ? (source in target.status_traits[trait]) : FALSE) : FALSE)
#define HAS_TRAIT_FROM_ONLY(target, trait, source) (HAS_TRAIT(target, trait) && (source in target._status_traits[trait]) && (length(target.status_traits[trait]) == 1))
#define HAS_TRAIT_NOT_FROM(target, trait, source) (HAS_TRAIT(target, trait) && (length(target.status_traits[trait] - source) > 0))

///Movement type traits for movables. See elements/movetype_handler.dm
#define TRAIT_MOVE_GROUND		"move_ground"
#define TRAIT_MOVE_FLYING		"move_flying"
#define TRAIT_MOVE_VENTCRAWLING	"move_ventcrawling"
#define TRAIT_MOVE_FLOATING		"move_floating"
/// Disables the floating animation. See above.
#define TRAIT_NO_FLOATING_ANIM		"no-floating-animation"

/*
Remember to update _globalvars/traits.dm if you're adding/removing/renaming traits.
*/

//mob traits
#define TRAIT_BLIND 			"blind"
#define TRAIT_MUTE				"mute"
#define TRAIT_ZOMBIE_SPEECH 	"zombie_speech"
#define TRAIT_GARGLE_SPEECH		"gargle_speech"
#define TRAIT_EMOTEMUTE			"emotemute"
#define TRAIT_DEAF				"deaf"
#define TRAIT_NEARSIGHT			"nearsighted"
#define TRAIT_FAT				"fat"
#define TRAIT_HUSK				"husk"
#define TRAIT_BADDNA			"baddna"
#define TRAIT_CLUMSY			"clumsy"
#define TRAIT_CHUNKYFINGERS		"chunkyfingers" //means that you can't use weapons with normal trigger guards.
#define TRAIT_DUMB				"dumb"
#define TRAIT_MONKEYLIKE		"monkeylike" //sets IsAdvancedToolUser to FALSE
#define TRAIT_NOTIGHTGRABMESSAGE "notightgrabmessage" // Hides grab tightening messages.
#define TRAIT_NOSSDINDICATOR 	"nossdindicator" // Hides the SSD indicator. Used with scrying.
#define TRAIT_INDEXED "indexed" // Used in Indexer-mailing to prevent false-flags.
#define TRAIT_ACCUSED "accused" // Used in Indexer-mailing to prevent false-flags.
#define TRAIT_CBLOOD "cursedblood"  // Used in Indexer-mailing to prevent false-flags.
#define TRAIT_CONFESSED "confessed" // Used in Indexer-mailing to prevent false-flags. God, this is snowflakey.
#define TRAIT_NOSTRUGGLE 		"nostruggle" // Instant grabs on someone else.
#define TRAIT_GARROTED 			"garroted" // Garrote-wired. Used for a snowflaked grab with item relevant tracking.
#define TRAIT_BAGGED 			"bagged" // Black-bagged. More snowflaking.
#define TRAIT_IGNORESLOWDOWN	"Ignore Slow"
#define TRAIT_IGNOREDAMAGESLOWDOWN "Ignore Damage Slowdown"
#define TRAIT_RIGIDMOVEMENT		"Ignore Natural Health Slowdown"
#define TRAIT_DEATHCOMA			"Death Coma" //Causes death-like unconsciousness
#define TRAIT_FAKEDEATH			"Fake Death" //Makes the owner appear as dead to most forms of medical examination
#define TRAIT_STUNIMMUNE		"stun_immunity"
#define TRAIT_STUNRESISTANCE    "stun_resistance"
#define TRAIT_SLEEPIMMUNE		"sleep_immunity"
#define TRAIT_PUSHIMMUNE		"push_immunity"
#define TRAIT_STABLEHEART		"stable_heart"
#define TRAIT_STABLELIVER		"stable_liver"
#define TRAIT_RESISTHEAT		"resist_heat"
#define TRAIT_RESISTHEATHANDS	"resist_heat_handsonly" //For when you want to be able to touch hot things, but still want fire to be an issue.
#define TRAIT_RESISTCOLD		"resist_cold"
#define TRAIT_RESISTHIGHPRESSURE	"resist_high_pressure"
#define TRAIT_RESISTLOWPRESSURE	"resist_low_pressure"
#define TRAIT_RADIMMUNE			"rad_immunity"
#define TRAIT_VIRUSIMMUNE		"virus_immunity"
#define TRAIT_PIERCEIMMUNE		"Pierce Immunity"
#define TRAIT_CALTROPIMMUNE		"Caltrop Immunity"
#define TRAIT_NODISMEMBER		"Dismember Immunity"
#define TRAIT_NOFIRE			"nonflammable"
#define TRAIT_NOGUNS			"no_guns"
#define TRAIT_NOMETABOLISM		"no_metabolism"
#define TRAIT_HARDDISMEMBER		"Hard Dismember"
#define TRAIT_LIMBATTACHMENT 	"limb_attach"
#define TRAIT_NOLIMBDISABLE		"no_limb_disable"
#define TRAIT_EASYLIMBDISABLE	"easy_limb_disable"
#define TRAIT_TOXINLOVER		"toxinlover"
#define TRAIT_HOLDBREATH		"hold_breath"
#define TRAIT_HOLY				"holy"
#define TRAIT_DEPRESSION		"depression"
#define TRAIT_JOLLY				"jolly"
#define TRAIT_NOCRITDAMAGE		"no_crit"
#define TRAIT_NOSLIPWATER		"noslip_water"
#define TRAIT_NOSLIPALL			"noslip_all"
#define TRAIT_NODEATH			"nodeath"
#define TRAIT_NOHARDCRIT		"nohardcrit"
#define TRAIT_NOSOFTCRIT		"nosoftcrit"
#define TRAIT_MINDSHIELD		"mindshield"
#define TRAIT_DISSECTED			"dissected"
#define TRAIT_SIXTHSENSE		"sixth_sense" //I can hear dead people
#define TRAIT_FEARLESS			"fearless"
#define TRAIT_PARALYSIS_L_ARM	"para-l-arm" //These are used for brain-based paralysis, where replacing the limb won't fix it
#define TRAIT_PARALYSIS_R_ARM	"para-r-arm"
#define TRAIT_PARALYSIS_L_LEG	"para-l-leg"
#define TRAIT_PARALYSIS_R_LEG	"para-r-leg"
#define TRAIT_CANNOT_OPEN_PRESENTS "cannot-open-presents"
#define TRAIT_PRESENT_VISION    "present-vision"
#define TRAIT_DISK_VERIFIER     "disk-verifier"
#define TRAIT_NOMOBSWAP         "no-mob-swap"
#define TRAIT_XRAY_VISION       "xray_vision"
#define TRAIT_THERMAL_VISION    "thermal_vision"
#define TRAIT_ABDUCTOR_TRAINING "abductor-training"
#define TRAIT_ABDUCTOR_SCIENTIST_TRAINING "abductor-scientist-training"
#define TRAIT_SURGEON           "surgeon"
#define TRAIT_STRONG_GRABBER	"strong_grabber"
#define TRAIT_MAGIC_CHOKE		"magic_choke"
#define TRAIT_SOOTHED_THROAT    "soothed-throat"
#define TRAIT_LAW_ENFORCEMENT_METABOLISM "law-enforcement-metabolism"
#define TRAIT_ALWAYS_CLEAN      "always-clean"
#define TRAIT_BOOZE_SLIDER      "booze-slider"
#define TRAIT_QUICK_CARRY		"quick-carry"
#define TRAIT_QUICKER_CARRY		"quicker-carry"
#define TRAIT_UNINTELLIGIBLE_SPEECH "unintelligible-speech"
#define TRAIT_LANGUAGE_BARRIER	"language-barrier"
#define TRAIT_UNSTABLE			"unstable"
#define TRAIT_OIL_FRIED			"oil_fried"
#define TRAIT_MEDICAL_HUD		"med_hud"
#define TRAIT_SECURITY_HUD		"sec_hud"
#define TRAIT_MEDIBOTCOMINGTHROUGH "medbot" //Is a medbot healing you
#define TRAIT_PASSTABLE			"passtable"
#define TRAIT_NOFLASH			"noflash" //Makes you immune to flashes
#define TRAIT_XENO_IMMUNE		"xeno_immune"//prevents xeno huggies implanting skeletons
#define TRAIT_DRUQK				"druqk"
#define TRAIT_BURIED_COIN_GIVEN "buried_coin_given" // prevents a human corpse from being used for a corpse multiple times
#define TRAIT_BLOODLOSS_IMMUNE "bloodloss_immune" // can bleed, but will never die from blood loss
#define TRAIT_NO_BITE "no_bite" //prevents biting
#define TRAIT_BITERHELM "Helmetbiter" // just use this to get helmets which are bitey.
#define TRAIT_LEGENDARY_ALCHEMIST		"Expert Herb Finder"
/// Used to track if a player has rejected vampire convert
#define TRAIT_REFUSED_VAMP_CONVERT "refused_vampire_conversion"
/// makes your footsteps completely silent
#define TRAIT_SILENT_FOOTSTEPS "silent_footsteps"

//bodypart traits
#define TRAIT_PARALYSIS	"paralysis" //Used for limb-based paralysis and full body paralysis
#define TRAIT_BRITTLE "brittle" //The limb is more susceptible to fractures
#define TRAIT_FINGERLESS "fingerless" //The limb has no fingies

//item traits
#define TRAIT_NODROP            "nodrop"
#define TRAIT_NOEMBED			"noembed"
#define TRAIT_T_RAY_VISIBLE     "t-ray-visible" // Visible on t-ray scanners if the atom/var/level == 1
#define TRAIT_NO_TELEPORT		"no-teleport" //you just can't
#define TRAIT_NO_SELF_UNEQUIP			"no-self-unequip" // For items you can't remove on wearing but can still hold freely

//quirk traits
#define TRAIT_ALCOHOL_TOLERANCE	"alcohol_tolerance"
#define TRAIT_AGEUSIA			"ageusia"
#define TRAIT_HEAVY_SLEEPER		"heavy_sleeper"
#define TRAIT_NIGHT_VISION		"night_vision"
#define TRAIT_SPIRITUAL			"spiritual"
#define TRAIT_FAN_CLOWN			"fan_clown"
#define TRAIT_FAN_MIME			"fan_mime"
#define TRAIT_VORACIOUS			"voracious"
#define TRAIT_SELF_AWARE		"self_aware"
#define TRAIT_FREERUNNING		"freerunning"
#define TRAIT_SKITTISH			"skittish"
#define TRAIT_POOR_AIM			"poor_aim"
#define TRAIT_PROSOPAGNOSIA		"prosopagnosia"
#define TRAIT_DRUNK_HEALING		"drunk_healing"
#define TRAIT_TAGGER			"tagger"
#define TRAIT_PHOTOGRAPHER		"photographer"
#define TRAIT_MUSICIAN			"musician"
#define TRAIT_LIGHT_DRINKER		"light_drinker"
#define TRAIT_FRIENDLY			"friendly"
#define TRAIT_GRABWEAKNESS		"grab_weakness"
#define TRAIT_SNOB				"snob"

// common trait sources
#define TRAIT_GENERIC "generic"
#define TRAIT_STATUS_EFFECT	"status_effect"
#define TRAIT_VIRTUE "virtue"
#define TRAIT_MIRACLE "miracle"
#define UNCONSCIOUS_BLIND "unconscious_blind"
#define EYE_DAMAGE "eye_damage"
#define GENETIC_MUTATION "genetic"
#define OBESITY "obesity"
#define MAGIC_TRAIT "magic"
#define TRAUMA_TRAIT "trauma"
#define DISEASE_TRAIT "disease"
#define SPECIES_TRAIT "species"
#define ORGAN_TRAIT "organ"
#define CRIT_TRAIT "crit"
#define ROUNDSTART_TRAIT "roundstart" //cannot be removed without admin intervention
#define JOB_TRAIT "job"
#define CYBORG_ITEM_TRAIT "cyborg-item"
#define ADMIN_TRAIT "admin" // (B)admins only.
#define CHANGELING_TRAIT "changeling"
#define CULT_TRAIT "cult"
#define CURSED_ITEM_TRAIT "cursed-item" // The item is magically cursed
#define ABSTRACT_ITEM_TRAIT "abstract-item"
#define STATUS_EFFECT_TRAIT "status-effect"
#define CLOTHING_TRAIT "clothing"
#define HELMET_TRAIT "helmet"
#define GLASSES_TRAIT "glasses"
#define VEHICLE_TRAIT "vehicle" // inherited from riding vehicles
#define INNATE_TRAIT "innate"
#define LIFECANDLE_TRAIT "lifecandle"
#define VENTCRAWLING_TRAIT "ventcrawling"
#define SPECIES_FLIGHT_TRAIT "species-flight"
#define FROSTMINER_ENRAGE_TRAIT "frostminer-enrage"
#define NO_GRAVITY_TRAIT "no-gravity"
#define LEAPER_BUBBLE_TRAIT "leaper-bubble"
/// Trait associated to being buckled
#define BUCKLED_TRAIT "buckled"
/// Trait from mob/living/update_transform()
#define UPDATE_TRANSFORM_TRAIT "update_transform"
/// Trait from ai attacks
#define AI_ATTACK_TRAIT "ai_attack_trait"

// unique trait sources, still defines
#define TRAIT_GUIDANCE "Guidance"
#define TRAIT_FORTITUDE "Fortitude"
#define CLONING_POD_TRAIT "cloning-pod"
#define STATUE_MUTE "statue"
#define CHANGELING_DRAIN "drain"
#define CHANGELING_HIVEMIND_MUTE "ling_mute"
#define ABYSSAL_GAZE_BLIND "abyssal_gaze"
#define HIGHLANDER "highlander"
#define TRAIT_HULK "hulk"
#define STASIS_MUTE "stasis"
#define GENETICS_SPELL "genetics_spell"
#define EYES_COVERED "eyes_covered"
#define CULT_EYES "cult_eyes"
#define TRAIT_SANTA "santa"
#define SCRYING_ORB "scrying-orb"
#define ABDUCTOR_ANTAGONIST "abductor-antagonist"
#define NUKEOP_TRAIT "nuke-op"
#define DEATHSQUAD_TRAIT "deathsquad"
#define MEGAFAUNA_TRAIT "megafauna"
#define CLOWN_NUKE_TRAIT "clown-nuke"
#define STICKY_MOUSTACHE_TRAIT "sticky-moustache"
#define CHAINSAW_FRENZY_TRAIT "chainsaw-frenzy"
#define CHRONO_GUN_TRAIT "chrono-gun"
#define REVERSE_BEAR_TRAP_TRAIT "reverse-bear-trap"
#define CURSED_MASK_TRAIT "cursed-mask"
#define HIS_GRACE_TRAIT "his-grace"
#define HAND_REPLACEMENT_TRAIT "magic-hand"
#define HOT_POTATO_TRAIT "hot-potato"
#define SABRE_SUICIDE_TRAIT "sabre-suicide"
#define ABDUCTOR_VEST_TRAIT "abductor-vest"
#define CAPTURE_THE_FLAG_TRAIT "capture-the-flag"
#define EYE_OF_GOD_TRAIT "eye-of-god"
#define SHAMEBRERO_TRAIT "shamebrero"
#define CHRONOSUIT_TRAIT "chronosuit"
#define LOCKED_HELMET_TRAIT "locked-helmet"
#define NINJA_SUIT_TRAIT "ninja-suit"
#define ANTI_DROP_IMPLANT_TRAIT "anti-drop-implant"
#define SLEEPING_CARP_TRAIT "sleeping_carp"
#define MADE_UNCLONEABLE "made-uncloneable"
#define TIMESTOP_TRAIT "timestop"
#define HUGBOX_TRAIT "hugbox"
#define ADVENTURER_TRAIT "adventurer"
#define SPYMASTER_TRAIT "spymaster"

#define TRAIT_I_AM_INVISIBLE_ON_A_BOAT "invisible_on_tram"

//for ai
#define TRAIT_SUBTREE_REQUIRED_OPERATIONAL_DATUM "element-required"

/*/mob/living/proc/on_trait_gain(trait, source)
	SEND_SIGNAL(src, COMSIG_TRAIT_GAIN, trait, source)
	switch(trait)
		if(TRAIT_COMMIE, TRAIT_CABAL, TRAIT_HORDE, TRAIT_DEPRAVED)
			if(ishuman(src))
				var/mob/living/carbon/human/H = src
				H.update_heretic_commune()

/mob/living/proc/on_trait_loss(trait, source)
	SEND_SIGNAL(src, COMSIG_TRAIT_LOSS, trait, source)
	switch(trait)
		if(TRAIT_COMMIE, TRAIT_CABAL, TRAIT_HORDE, TRAIT_DEPRAVED)
			if(ishuman(src))
				var/mob/living/carbon/human/H = src
				H.update_heretic_commune()*/

///The entity has AI 'access', so is either an AI, has an access wand, or is an admin ghost AI. Used to block off regular Silicons from things.
///This is put on the mob, it is used on the client for Admins but they are the exception as they use `isAdminGhostAI`.
#define TRAIT_AI_ACCESS "ai_access_trait"
#define TRAIT_UI_BLOCKED "uiblocked"
/// Prevents usage of manipulation appendages (picking, holding or using items, manipulating storage).
#define TRAIT_HANDS_BLOCKED "handsblocked"
/// This mob should never close UI even if it doesn't have a client
#define TRAIT_PRESERVE_UI_WITHOUT_CLIENT "preserve_ui_without_client"

//important_recursive_contents traits
/*
 * Used for movables that need to be updated, via COMSIG_ENTER_AREA and COMSIG_EXIT_AREA, when transitioning areas.
 * Use [/atom/movable/proc/become_area_sensitive(trait_source)] to properly enable it. How you remove it isn't as important.
 */
#define TRAIT_AREA_SENSITIVE "area-sensitive"
///every hearing sensitive atom has this trait
#define TRAIT_HEARING_SENSITIVE "hearing_sensitive"

#define TRAIT_CLAN_LEADER "clan_leader"
#define TRAIT_IN_FRENZY "in_frenzy"
#define TRAIT_VIOLATOR "Violator of the Coven"
#define TRAIT_TORPOR "Endless Slumber"
/// Trait given as a result of vampiric activities
#define VAMPIRE_TRAIT "vampire"
#define TABOO_TRAIT "taboo"
#define TRAIT_COVEN_BANE "coven_bane"
#define TRAIT_COVEN_RESISTANT "coven_resistance"
#define TRAIT_MOVEMENT_BLOCKED "movement_blocked"
/// Mobs that have this trait cannot be extinguished
#define TRAIT_NO_EXTINGUISH "no_extinguish"


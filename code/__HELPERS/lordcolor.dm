GLOBAL_LIST_EMPTY(lordcolor)
GLOBAL_LIST_EMPTY(towncolor)

GLOBAL_VAR(lordprimary)
GLOBAL_VAR(lordsecondary)
GLOBAL_VAR(townprimary)
GLOBAL_VAR(townsecondary)

/obj/proc/lordcolor(primary,secondary)
	color = primary

/obj/proc/towncolor(primary,secondary)
	color = primary

/obj/item/clothing/cloak/lordcolor(primary,secondary)
	..()
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_cloak()


/turf/proc/lordcolor(primary,secondary)
	color = primary

/turf/proc/towncolor(primary,secondary)
	color = primary

/mob/proc/lord_color_choice()
	if(!client)
		addtimer(CALLBACK(src, PROC_REF(lord_color_choice)), 50)
		return
	var/prim
	var/sec
	var/choice = input(src, "Choose a Primary Color", "SCARLET REACH") as anything in colorlist
	if(choice)
		prim = colorlist[choice]
		colorlist -= choice
	choice = input(src, "Choose a Secondary Color", "SCARLET REACH") as anything in colorlist
	if(choice)
		sec = colorlist[choice]
	if(!prim || !sec)
		GLOB.lordcolor = list()
		return
	GLOB.lordprimary = prim
	GLOB.lordsecondary = sec
	for(var/obj/O in GLOB.lordcolor)
		O.lordcolor(prim,sec)
		GLOB.lordcolor -= O
	for(var/turf/T in GLOB.lordcolor)
		T.lordcolor(prim,sec)
		GLOB.lordcolor -= T

/proc/lord_color_default()
	GLOB.lordprimary = "#2e67c9" //SCARLET
	GLOB.lordsecondary = "#f2f2f2" //BLACK
	for(var/obj/O in GLOB.lordcolor)
		O.lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	for(var/turf/T in GLOB.lordcolor)
		T.lordcolor(GLOB.lordprimary,GLOB.lordsecondary)

/proc/town_color_default()
	GLOB.townprimary = "#52a53b"
	GLOB.townsecondary = "#091a04"
	for(var/obj/O in GLOB.towncolor)
		O.towncolor(GLOB.townprimary,GLOB.townsecondary)
	for(var/turf/T in GLOB.lordcolor)
		T.towncolor(GLOB.townprimary,GLOB.townsecondary)

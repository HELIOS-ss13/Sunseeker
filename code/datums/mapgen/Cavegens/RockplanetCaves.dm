/datum/map_generator/cave_generator/rockplanet
	open_turf_types = list(/turf/open/floor/plating/asteroid = 50,
						/turf/open/floor/plating/rust = 10,
						/turf/open/floor/plating = 5)

	closed_turf_types =  list(/turf/closed/mineral/random/asteroid/rockplanet = 45,
							/turf/closed/wall/rust = 10,)

	mob_spawn_chance = 3

	mob_spawn_list = list(/mob/living/simple_animal/hostile/asteroid/goliath = 20,
		/mob/living/simple_animal/hostile/netherworld/asteroid = 10,
//		/mob/living/simple_animal/hostile/ooze/grapes/asteroid = 20,
		/mob/living/simple_animal/hostile/asteroid/fugu = 30,
		/mob/living/simple_animal/hostile/asteroid/basilisk = 40,
		/mob/living/simple_animal/hostile/asteroid/hivelord = 50,
		/mob/living/simple_animal/hostile/netherworld/migo/asteroid = 10,
		/mob/living/simple_animal/hostile/alien/asteroid = 20,
		/mob/living/simple_animal/hostile/asteroid/goldgrub = 10)

	flora_spawn_list = list(/obj/structure/mecha_wreckage/ripley = 10,
		/obj/structure/mecha_wreckage/ripley/firefighter = 5,
		/obj/structure/mecha_wreckage/ripley/mkii = 5,
		/obj/structure/reagent_dispensers/fueltank = 10,
		/obj/structure/girder = 20,
		/obj/machinery/portable_atmospherics/canister/toxins = 1,
		/obj/machinery/portable_atmospherics/canister/miasma = 1,
		/obj/machinery/portable_atmospherics/canister/nitryl = 1,
		/obj/machinery/portable_atmospherics/canister/bz = 1,
		/obj/machinery/portable_atmospherics/canister/carbon_dioxide = 1,
		/obj/structure/radioactive = 1,
		/obj/structure/radioactive/stack = 1,
		/obj/structure/radioactive/waste = 1)
//		/obj/structure/radioactive/supermatter = 1, //cant make these rare for some reason
//		/obj/machinery/power/supermatter_crystal/shard = 1) //we do a slight bit of tomfoolery
	feature_spawn_list = list(/obj/structure/geyser/random = 1, /obj/effect/mine/shrapnel/human_only = 1)

	initial_closed_chance = 45
	smoothing_iterations = 50
	birth_limit = 4
	death_limit = 3

/turf/closed/mineral/random/asteroid/rockplanet
	name = "iron rock"
	icon = 'icons/turf/mining.dmi'
	icon_state = "redrock"
	smooth_icon = 'icons/turf/walls/red_wall.dmi'
	base_icon_state = "red_wall"
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	turf_type = /turf/open/floor/plating/asteroid
	mineralSpawnChanceList = list(/obj/item/stack/ore/uranium = 7, /obj/item/stack/ore/diamond = 1, /obj/item/stack/ore/gold = 5,
		/obj/item/stack/ore/silver = 7, /obj/item/stack/ore/plasma = 15, /obj/item/stack/ore/iron = 55, /obj/item/stack/ore/titanium = 6,
		/turf/closed/mineral/gibtonite/rockplanet = 4, /obj/item/stack/ore/bluespace_crystal = 1)
	mineralChance = 30

/turf/closed/mineral/gibtonite/rockplanet
	name = "iron rock"
	icon = 'icons/turf/mining.dmi'
	icon_state = "redrock"
	smooth_icon = 'icons/turf/walls/red_wall.dmi'
	base_icon_state = "red_wall"

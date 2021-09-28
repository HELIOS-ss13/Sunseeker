/datum/overmap_system
	var/name = "System"
	var/list/datum/overmap_obj/all_children = list()

/datum/overmap_system/New(genmode)
	. = ..()
	populate_system(genmode)

/datum/overmap_system/Destroy()
	clear_system()
	. = ..()

// DEBUG FIX -- move this somewhere else maybe? make it better too
/datum/overmap_system/proc/populate_system(genmode)
	var/datum/sun = new /datum/overmap_obj/sun()
	var/sun_component = sun.AddComponent(/datum/component/physics_processing, 1)
	all_children.Add(sun)

	var/desired_planets = 3
	var/num_planets = 0

	var/datum/overmap_obj/planet/cur_planet
	var/datum/component/physics_processing/cur_component

	while(num_planets < desired_planets)
		cur_planet = new()
		cur_component = cur_planet.AddComponent(/datum/component/physics_processing)

		// DEBUG FIX -- update these to more interesting and varied possibilities
		var/s_m = pick(list(0.3871, 0.7233, 1, 1.5273))
//		var/s_m = pick(list(1, 1.5273, 5.2028, 9.5388, 19.1914, 30.0611))
//		var/ecc = pick(0.205630, 0.006772, 0.0167086, 0.0934, 0.0489, 0.0565, 0.046381, 0.008678)
		var/ecc = rand(0, 400) / 1000
		var/ccwise = prob(50)
		var/arg_of_p = rand(0, 359)
		var/anomaly = rand(0, 359) // note that this technically unfairly biases start locations near periapsis

		// DEBUG REMOVE: ALL THE GENMODE STUFF
		if(genmode & SYS_GENMODE_OCWISE)
			ccwise = FALSE
		else if(genmode & SYS_GENMODE_OCCWISE)
			ccwise = TRUE

		if(genmode & SYS_GENMODE_ZEROPER)
			arg_of_p = 0

		if(genmode & SYS_GENMODE_PERIAP)
			anomaly = 0

		cur_planet.orbit_s_m_axis = s_m
		cur_planet.orbit_eccentricity = ecc
		cur_planet.orbit_counterclockwise = ccwise
		cur_planet.orbit_arg_of_periapsis = arg_of_p

		cur_component.set_up_orbit(sun_component, s_m, ecc, ccwise, arg_of_p, anomaly)
		all_children.Add(cur_planet)
		num_planets++

/datum/overmap_system/proc/clear_system()
	for(var/child in all_children)
		all_children.Remove(child)
		qdel(child)

/*
console -> {
	...console_info
	systems_info: {
		REF(system): system -> {
			name: blahblahblah
			color: blahblahblah
			body_info: {
				REF(body): body -> {
					position
					velocity
					appearance
				}
			}
		}
		REF(system2): system2 -> {
			name: foofoofoo
			color: barbarbar
			etc.
		}
	}
}
merging vs. separation of static vs. dynamic data
	merging:
		+consistent with functional paradigm
		+well-encapsulated: JS doesn't "know" static data from dynamic data
		-maybe perf heavy
		-have to write
	separation:
		+maybe easier on the DM end?
		+allows us to do pseudo-diffing -- "static" data always resets, "dynamic" data always merges
		-interferes with functional paradgim
*/

/datum/overmap_system/proc/get_map_data_for_user(user, list/options)
	. = list()

	for(var/C in all_children)
		var/datum/overmap_obj/child = C
		var/child_data = child.get_map_data_for_user(user, options)
		if(!child_data) // child_data might be falsey, such as if the child isn't known to the user; if so, it is omitted entirely.
			continue	// if we don't omit, then the client might "know" about bodies the user hasn't detected. this is bad and insecure
		.[REF(child)] = child_data


/datum/overmap_obj
	/// The name of the overmap object as communicated to the player. Need not be unique; should not be treated as such.
	var/name = "overmap object"

	/// The radius of the overmap object.
	var/radius

	/// The appearance type of the overmap object, used by the overmap display.
	var/appearance_type = OVERMAP_BODY_CIRCLE
	/// The color associated with this object.
	var/display_color = "#FFFFFF"

	/// Whether orbit information should be sent to applicable displays for orbit line display.
	var/show_orbit = TRUE
	/// The semi-major axis of the object's orbit, used for orbit lines. Does not affect movement.
	var/orbit_s_m_axis
	/// The eccentricity of the object's orbit, used for orbit lines. Does not affect movement.
	var/orbit_eccentricity
	/// The semi-major axis of the object's orbit, used for orbit lines. Does not affect movement.
	var/orbit_counterclockwise
	/// The semi-major axis of the object's orbit, used for orbit lines. Does not affect movement.
	var/orbit_arg_of_periapsis

// DEBUG FIX -- maybe add functionality to this, explain why it's here
/datum/overmap_obj/proc/is_known_to_user(user)
	return TRUE

/datum/overmap_obj/proc/get_map_data_for_user(user, list/options)
	if(!is_known_to_user(user))
		return FALSE
	. = list()
	var/datum/component/physics_processing/phys_comp = GetComponent(/datum/component/physics_processing)

	.["name"] = name

	/* POSITION DATA */
	// the overmap display thinks +y is down, while the physics system thinks +y is up.
	// thus, we invert the y on the numbers we said it, so code there doesn't have to worry much.
	.["position"] = list(phys_comp.pos_x, -phys_comp.pos_y)
	// the physics system uses deciseconds as its native units; the display does not.
	// to compensate, we convert velocity and acceleration to their respective values in seconds (and invert the y as before)
	.["velocity"] = list(phys_comp.vel_x SECONDS, -phys_comp.vel_y SECONDS)
	.["acceleration"] = list(phys_comp.acc_x SECONDS SECONDS, -phys_comp.acc_y SECONDS SECONDS)

	/* APPEARANCE DATA */
	.["appearance_type"] = appearance_type
	.["radius"] = radius
	.["color"] = display_color

	.["show_orbit"] = show_orbit
	.["o_semimajor"] = orbit_s_m_axis
	.["o_eccentricity"] = orbit_eccentricity
	.["o_counterclockwise"] = orbit_counterclockwise
	.["o_arg_of_periapsis"] = orbit_arg_of_periapsis

// DEBUG REMOVE: figure out a better approach than "sun" and "planet"
/datum/overmap_obj/sun
	name = "Sun"
	radius = 0.25*ONE_AU
	display_color = "#F6DE01"
	show_orbit = FALSE

/datum/overmap_obj/planet
	name = "Planet"
	radius = 0.06*ONE_AU
	display_color = COLOR_SILVER

/* OVERMAP TURFS */
/turf/open/overmap
	icon = 'whitesands/icons/turf/overmap.dmi'
	icon_state = "overmap"
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/overmap/edge
	opacity = 1
	density = 1

//this is completely unnecessary but it looks nice
/turf/open/overmap/Initialize()
	. = ..()
	name = "[x]-[y]"
	var/list/numbers = list()

	if(x == 1 || x == SSovermap.size)
		numbers += list("[round(y/10)]","[round(y%10)]")
		if(y == 1 || y == SSovermap.size)
			numbers += "-"
	if(y == 1 || y == SSovermap.size)
		numbers += list("[round(x/10)]","[round(x%10)]")

	for(var/i = 1 to numbers.len)
		var/image/I = image('whitesands/icons/effects/numbers.dmi',numbers[i])
		I.pixel_x = 5*i - 2
		I.pixel_y = world.icon_size/2 - 3
		if(y == 1)
			I.pixel_y = 3
			I.pixel_x = 5*i + 4
		if(y == SSovermap.size)
			I.pixel_y = world.icon_size - 9
			I.pixel_x = 5*i + 4
		if(x == 1)
			I.pixel_x = 5*i - 2
		if(x == SSovermap.size)
			I.pixel_x = 5*i + 2
		overlays += I

/** # Overmap area
  * Area that all overmap objects will spawn in at roundstart.
  */
/area/overmap
	name = "Overmap"
	icon_state = "yellow"
	requires_power = FALSE
	area_flags = NOTELEPORT
	flags_1 = NONE

/**
  * # Overmap objects
  *
  * Everything visible on the overmap: stations, ships, ruins, events, and more.
  *
  * This base class should be the parent of all objects present on the overmap.
  * For the control counterparts, see [/obj/machinery/computer/helm].
  * For the shuttle counterparts (ONLY USED FOR SHIPS), see [/obj/docking_port/mobile].
  *
  */
/obj/structure/overmap
	name = "overmap object"
	desc = "An unknown celestial object."
	icon = 'whitesands/icons/effects/overmap.dmi'
	icon_state = "object"

	///~~If we need to render a map for cameras and helms for this object~~ basically can you look at and use this as a ship or station
	var/render_map = FALSE
	///The range of the view shown to helms and viewscreens (subject to be relegated to something else)
	var/sensor_range = 4
	///Integrity percentage, do NOT modify. Use [/obj/structure/overmap/proc/receive_damage] instead.
	var/integrity = 100
	///Armor value, reduces integrity damage taken
	var/overmap_armor = 1
	///List of other overmap objects in the same tile
	var/list/close_overmap_objects
	///Vessel approximate mass
	var/mass

	// Stuff needed to render the map
	var/map_name
	var/atom/movable/screen/map_view/cam_screen
	var/atom/movable/screen/plane_master/lighting/cam_plane_master
	var/atom/movable/screen/background/cam_background

/obj/structure/overmap/Initialize(mapload)
	. = ..()
	SSovermap.overmap_objects += src
	if(render_map)	// Initialize map objects
		map_name = "overmap_[REF(src)]_map"
		cam_screen = new
		cam_screen.name = "screen"
		cam_screen.assigned_map = map_name
		cam_screen.del_on_map_removal = FALSE
		cam_screen.screen_loc = "[map_name]:1,1"
		cam_plane_master = new
		cam_plane_master.name = "plane_master"
		cam_plane_master.assigned_map = map_name
		cam_plane_master.del_on_map_removal = FALSE
		cam_plane_master.screen_loc = "[map_name]:CENTER"
		cam_background = new
		cam_background.assigned_map = map_name
		cam_background.del_on_map_removal = FALSE
		update_screen()

/obj/structure/overmap/Destroy()
	. = ..()
	for(var/obj/structure/overmap/O as anything in close_overmap_objects)
		LAZYREMOVE(O.close_overmap_objects, src)
	SSovermap.overmap_objects -= src
	if(render_map)
		QDEL_NULL(cam_screen)
		QDEL_NULL(cam_plane_master)
		QDEL_NULL(cam_background)

/**
  * Done to ensure the connected helms are updated appropriately
  */
/obj/structure/overmap/Move(atom/newloc, direct)
	. = ..()
	update_screen()

/**
  * Updates the screen object, which is displayed on all connected helms
  */
/obj/structure/overmap/proc/update_screen()
	if(render_map)
		var/list/visible_turfs = list()
		for(var/turf/T in view(sensor_range, get_turf(src)))
			visible_turfs += T

		var/list/bbox = get_bbox_of_atoms(visible_turfs)
		var/size_x = bbox[3] - bbox[1] + 1
		var/size_y = bbox[4] - bbox[2] + 1

		cam_screen?.vis_contents = visible_turfs
		cam_background.icon_state = "clear"
		cam_background.fill_rect(1, 1, size_x, size_y)
		return TRUE

/**
  * When something crosses another overmap object, add it to the nearby objects list, which are used by events and docking
  */
/obj/structure/overmap/Crossed(atom/movable/AM, oldloc)
	. = ..()
	if(istype(loc, /turf/) && istype(AM, /obj/structure/overmap))
		var/obj/structure/overmap/other = AM
		if(other == src)
			return
		LAZYOR(other.close_overmap_objects, src)
		LAZYOR(close_overmap_objects, other)

/**
  * See [/obj/structure/overmap/Crossed]
  */
/obj/structure/overmap/Uncrossed(atom/movable/AM, atom/newloc)
	. = ..()
	if(istype(loc, /turf/) && istype(AM, /obj/structure/overmap))
		var/obj/structure/overmap/other = AM
		if(other == src)
			return
		LAZYREMOVE(other.close_overmap_objects, src)
		LAZYREMOVE(close_overmap_objects, other)

/**
  * Reduces overmap object integrity by X amount, divided by armor
  * * amount - amount of damage to apply to the ship
  */
/obj/structure/overmap/proc/recieve_damage(amount)
	integrity = max(integrity - (amount / overmap_armor), 0)

/**
  * The action performed by a ship on this when the helm button is pressed. Returns nothing on success, an error string if one occurs.
  * * acting - The ship acting on the event
  */
/obj/structure/overmap/proc/ship_act(mob/user, obj/structure/overmap/ship/simulated/acting)
	to_chat(user, "<span class='notice'>You don't think there's anything you can do here.</span>")

/obj/structure/overmap/star
	name = "Star"
	desc = "A star."
	icon = 'whitesands/icons/effects/overmap.dmi'
	icon_state = "star1"
	var/class //what kind of star will you be?
	var/star_classes = list(\
		STARK,
		STARM,
		STARL,
		START,
		STARY,
		STARD
	)

/obj/structure/overmap/star/Initialize(mapload)
	. = ..()
	name = "[pick(GLOB.star_names)] [pick(GLOB.greek_letters)]"
	var/c = "#ffffff"
	switch(pick(star_classes))
		if(STARO)
			c = "#75ffff"
			desc = "A blue giant."
		if(STARB)
			c = "#c0ffff"
		if(STARG)
			c = "#ffff00"
		if(STARK)
			c = "#ff7f00"
		if(STARM)
			c = "#d50000"
		if(STARL) //Take the L
			c = "#a31300"
		if(START)
			c = "#a60347"
			desc = "A brown dwarf"
		if(STARY)
			c = "#4a3059"
			desc = "A brown dwarf."
		if(STARD)
			c = pick("#75ffff", "#c0ffff", "#ffffff")
			desc = "A white dwarf."
	add_atom_colour(c, FIXED_COLOUR_PRIORITY)

/obj/structure/overmap/star/medium
	icon = 'whitesands/icons/effects/overmap_large.dmi'
	bound_height = 64
	bound_width = 64
	pixel_x = -16
	pixel_y = -16
	icon_state = "star2"
	star_classes = list(\
		STARB,
		STARA,
		STARF,
		STARG,
		STARK
	)

/obj/structure/overmap/star/big
	icon = 'whitesands/icons/effects/overmap_larger.dmi'
	icon_state = "star3"
	bound_height = 96
	bound_width = 96
	pixel_z = -32
	pixel_w = -32
	star_classes = list(\
		STARO,
		STARB,
		STARG,
		STARM
	)

/obj/structure/overmap/star/big/binary
	icon_state = "binaryswoosh"
	var/class2 //because this one has two!
	star_classes = list(\
		STARK,
		STARM,
		STARL,
		START,
		STARY,
		STARD
	)

/obj/structure/overmap/star/big/binary/Initialize(mapload)
	. = ..()
	name = "[pick(GLOB.greek_letters)] [pick(GLOB.star_names)] AB"
	class = pick(star_classes)
	color = "#ffffff"
	add_star_overlay()

/obj/structure/overmap/star/big/binary/proc/add_star_overlay()
	cut_overlays()
	var/mutable_appearance/s1 = mutable_appearance(icon_state = "binary1")
	var/mutable_appearance/s2 = mutable_appearance(icon_state = "binary2")
	switch(class)
		if(STARK)
			s1.color = "#ff7f00"
			s2.color = "#ffff00"
		if(STARM)
			s1.color = "#d50000"
			s2.color = "#a31300"
		if(STARL)
			s1.color = "#a31300"
			s2.color = "#ff7f00"
		if(START)
			s1.color = "#a60347"
			s2.color = pick("#75ffff", "#c0ffff", "#ffffff")
		if(STARY)
			s1.color = "#4a3059"
			s2.color = pick("#75ffff", "#c0ffff", "#ffffff")
		if(STARD)
			s1.color = pick("#75ffff", "#c0ffff", "#ffffff")
			s2.color = pick("#4a3059", "#a60347", "#a31300")
	add_overlay(s1)
	add_overlay(s2)

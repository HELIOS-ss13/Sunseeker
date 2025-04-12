/datum/round_event_control/ship
	requires_ship = TRUE

/datum/round_event/ship
	var/datum/overmap/ship/controlled/target_ship

/datum/round_event/ship/setup()
	if(SSovermap.controlled_ships && length(SSovermap.controlled_ships))
		target_ship = pick(SSovermap.controlled_ships)
		message_admins("[target_ship] was selected for [src]")
	else
		return FALSE
	return TRUE

/datum/round_event/ship/announce_deadchat(random, cause)
	deadchat_broadcast(" has just been[random ? " randomly" : ""] triggered[cause ? " by [cause]" : ""]!", "<b>[control.name]</b>. Located on [target_ship.name]", message_type=DEADCHAT_ANNOUNCEMENT) //STOP ASSUMING IT'S BADMINS!

/datum/round_event/ship/proc/find_event_area()
	if(length(target_ship.shuttle_port.shuttle_areas))
		return pick(target_ship.shuttle_port.shuttle_areas)

/datum/round_event/ship/proc/find_event_turf()
	var/area/ship_area = find_event_area()
	return pick(get_area_turfs(ship_area))


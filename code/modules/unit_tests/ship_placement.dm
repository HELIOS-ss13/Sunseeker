/datum/unit_test/ship_placement/Run()
	for(var/datum/map_template/shuttle/map as anything in SSmapping.ship_purchase_list)
		var/obj/docking_port/mobile/shuttle = SSshuttle.action_load(map)
		shuttle.jumpToNullSpace()


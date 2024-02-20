/obj/machinery/medical/simple
	name = "Simple Medical Unit"
	desc = "If you see this something went horrbily, horrbily wrong."
	var/status

/obj/machinery/medical/simple/clear_status()
	. = ..()
	REMOVE_TRAIT(attached,status,"mechanical")
	return

/obj/machinery/medical/simple/process()
	..()
	if(attached)
		ADD_TRAIT(attached,status,"mechanical")
	return

/obj/machinery/medical/simple/RefreshParts()
	for(var/obj/item/stock_parts/capacitor/C in component_parts)
		active_power_usage /= C.rating

/obj/machinery/medical/simple/liver
	name = "liver support system"
	desc = "Stabilizes the liver at the cost of a lot of electricity. Better parts lessen the strain on the power network."
	icon_state = "mechanical_liver"
	status = TRAIT_STABLELIVER

/obj/machinery/medical/simple/lung
	name = "ventilator"
	desc = "Stabilizes the lungs at the cost of a lot of electricity. Better parts lessen the strain on the power network."
	icon_state = "mechanical_lungs"
	status = TRAIT_STABLELUNG

/obj/machinery/medical/simple/heart
	name = "heart stabilizer"
	desc = "Stabilizes the heart at the cost of a lot of electricity. Better parts lessen the strain on the power network."
	icon_state = "mechanical_heart"
	idle_power_usage = 150
	active_power_usage = 1200
	status = TRAIT_STABLEHEART

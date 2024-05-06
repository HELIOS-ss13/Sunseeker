//Wings for various species
/datum/sprite_accessory/mutant_part/wings
	mutant_string = "wings"
	abstract_type = /datum/sprite_accessory/mutant_part/wings
	randomizable = TRUE

	icon = 'icons/mob/clothing/wings.dmi'

/datum/sprite_accessory/mutant_part/wings_open
	mutant_string = "wingsopen"
	abstract_type = /datum/sprite_accessory/mutant_part/wings_open
	// not randomizable for the same reason as wagging tails / wagging spines

	// flapping wings still use the data stored as "wings"
	feature_lookup_override_string = "wings"

	icon = 'icons/mob/clothing/wings.dmi'

// bit skeptical of this, for a few reasons. the nonexistence of the open type should be irrelevant,
// due to name = "None" preventing further rendering.
/datum/sprite_accessory/mutant_part/wings/none
	name = "None"
	icon_state = "none"

//Human/Misc wings

/datum/sprite_accessory/mutant_part/wings/angel
	name = "Angel"
	icon_state = "angel"
	color_src = 0
	dimension_x = 46
	center = TRUE
	dimension_y = 34
	locked = TRUE

/datum/sprite_accessory/mutant_part/wings_open/angel
	name = "Angel"
	icon_state = "angel"
	color_src = 0
	dimension_x = 46
	center = TRUE
	dimension_y = 34

//Sarathi wings

/datum/sprite_accessory/mutant_part/wings/dragon
	name = "Dragon"
	icon_state = "dragon"
	dimension_x = 96
	center = TRUE
	dimension_y = 32
	locked = TRUE

/datum/sprite_accessory/mutant_part/wings_open/dragon
	name = "Dragon"
	icon_state = "dragon"
	dimension_x = 96
	center = TRUE
	dimension_y = 32

/datum/sprite_accessory/mutant_part/wings/megamoth
	name = "Megamoth"
	icon_state = "megamoth"
	color_src = 0
	dimension_x = 96
	center = TRUE
	dimension_y = 32
	locked = TRUE

/datum/sprite_accessory/mutant_part/wings_open/megamoth
	name = "Megamoth"
	icon_state = "megamoth"
	color_src = 0
	dimension_x = 96
	center = TRUE
	dimension_y = 32

/datum/sprite_accessory/mutant_part/wings/mothra
	name = "Mothra"
	icon_state = "mothra"
	color_src = 0
	dimension_x = 96
	center = TRUE
	dimension_y = 32
	locked = TRUE

/datum/sprite_accessory/mutant_part/wings_open/mothra
	name = "Mothra"
	icon_state = "mothra"
	color_src = 0
	dimension_x = 96
	center = TRUE
	dimension_y = 32

//Robotic species wings

/datum/sprite_accessory/mutant_part/wings/robotic
	name = "Robotic"
	icon_state = "robotic"
	color_src = 0
	dimension_x = 96
	center = TRUE
	dimension_y = 32
	locked = TRUE

/datum/sprite_accessory/mutant_part/wings_open/robotic
	name = "Robotic"
	icon_state = "robotic"
	color_src = 0
	dimension_x = 96
	center = TRUE
	dimension_y = 32

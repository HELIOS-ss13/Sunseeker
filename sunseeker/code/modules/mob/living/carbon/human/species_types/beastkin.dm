/datum/species/beastkin
	name = "\improper Beastkin"
	id = SPECIES_BEASTKIN
	default_color = "FFFFFF"
	species_traits = list(SCLERA, MUTCOLORS, EYECOLOR, MUTCOLORS_SECONDARY, HAS_FLESH, HAS_BONE)
	mutant_bodyparts = list("body_markings", "face_markings", "legs")
	default_features = list("mcolor" = "0F0", "face_markings" = "None", "body_markings" = "None", "legs" = "Normal Legs", "body_size" = "Normal")
	meat = /obj/item/food/meat/slab/monkey
	disliked_food = GROSS | CLOTH
	liked_food = MEAT | VEGETABLES | FRUIT
	digitigrade_customization = DIGITIGRADE_OPTIONAL
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP
	loreblurb = "Nobody is quite sure where the beastkin originated from, although a prevalent theory is they are all gene-modders from Terra, due to their frequent resemblance to Terran creatures."
	attack_verb = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'

	species_chest = /obj/item/bodypart/chest/beastkin
	species_head = /obj/item/bodypart/head/beastkin
	species_l_arm = /obj/item/bodypart/l_arm/beastkin
	species_r_arm = /obj/item/bodypart/r_arm/beastkin
	species_l_leg = /obj/item/bodypart/leg/left/beastkin
	species_r_leg = /obj/item/bodypart/leg/right/beastkin

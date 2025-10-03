/datum/species/beastkin
	name = "\improper Beastkin"
	id = SPECIES_BEASTKIN
	default_color = "FFFFFF"
	species_traits = list(SCLERA, MUTCOLORS, EYECOLOR, MUTCOLORS_SECONDARY, HAS_FLESH, HAS_BONE, HAIR)
	mutant_bodyparts = list("body_markings", "face_markings", "legs", "ears", "tail_human")
	default_features = list("mcolor" = "0F0", "tail_human" = "None", "ears" = "None", "wings" = "None", "face_markings" = "None", "body_markings" = "None", "legs" = "Normal Legs", "body_size" = "Normal")
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

/datum/species/beastkin/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	switch(C.dna.features["ears"])
		if("Elf")
			mutantears = /obj/item/organ/ears/elf
		if("Cat")
			mutantears = /obj/item/organ/ears/cat
		if("Dog")
			mutantears = /obj/item/organ/ears/dog
		if("Fox")
			mutantears = /obj/item/organ/ears/fox
		if("Rabbit")
			mutantears = /obj/item/organ/ears/rabbit
		if("Bent Rabbit")
			mutantears = /obj/item/organ/ears/rabbit/bent
		if("Floppy Rabbit")
			mutantears = /obj/item/organ/ears/rabbit/floppy
		if("Horse")
			mutantears = /obj/item/organ/ears/horse
	switch(C.dna.features["tail_human"])
		if("Cat")
			mutant_organs |= /obj/item/organ/tail/cat
		if("Dog")
			mutant_organs |= /obj/item/organ/tail/dog
		if("Fox")
			mutant_organs |= /obj/item/organ/tail/fox
		if("Fox 2")
			mutant_organs |= /obj/item/organ/tail/fox/alt
		if("Rabbit")
			mutant_organs |= /obj/item/organ/tail/rabbit
		if("Horse")
			mutant_organs |= /obj/item/organ/tail/horse

	return ..()

/datum/species/beastkin/spec_death(gibbed, mob/living/carbon/human/H)
	if(H)
		stop_wagging_tail(H)

/datum/species/beastkin/spec_stun(mob/living/carbon/human/H,amount)
	if(H)
		stop_wagging_tail(H)
	. = ..()

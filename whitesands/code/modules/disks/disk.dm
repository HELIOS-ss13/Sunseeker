/obj/item/disk
	icon = 'whitesands/icons/obj/diskette.dmi'
	w_class = WEIGHT_CLASS_TINY
	item_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	icon_state = "disk_map"
	drop_sound = 'sound/items/handling/disk_drop.ogg'
	pickup_sound =  'sound/items/handling/disk_pickup.ogg'
	var/random_color = TRUE
	var/illustration = "generic"
	var/static/list/random_disk_colors = list(
		"blue" = "#0000ff",
		"red" = "#ff000d",
		"pink" = "#fb00ff",
		"brown" = "#ff7b00",
		"green" = "#00ff26",
		"cyan" = "#00ffd9",
		"yellow" = "#ffd000"
	)

obj/item/disk/Initialize()
	. = ..()
	icon_state = "disk"
	if(random_color) //random colors!
		var/our_color = pick(random_disk_colors)
		add_atom_colour(random_disk_colors[our_color], FIXED_COLOUR_PRIORITY)
	else
		add_atom_colour(color, FIXED_COLOUR_PRIORITY)
	update_icon()
	update_overlays()

/obj/item/disk/update_overlays()
	. = ..()
	if(!random_color) //icon override
		return
	var/mutable_appearance/label = mutable_appearance(icon, "label")
	var/mutable_appearance/protect = mutable_appearance(icon, "protect")
	protect.appearance_flags = RESET_COLOR
	if(illustration)
		. += illustration
	. += label
	. += protect

/obj/item/disk/design_disk
	random_color = FALSE
	icon_state = "disk_map"
	color = "#3C2798"

/obj/item/disk/tech_disk
	random_color = FALSE
	icon_state = "disk_map"
	color = "#ff0000"

/obj/item/disk/nuclear
	random_color = FALSE
	icon_state = "disk_map"
	color = "#4ED57C"
	illustration = "nuke_real"
	desc = "The authentication disk of a nuclear bomb. This is probably useless."

/obj/item/disk/tech_disk/major
	icon_state = "disk_map"
	color = "#FFBAFF"
	illustration = "bepis"

/obj/item/disk/design_disk/modkit_disc
	illustration = "accel"

/obj/item/disk/design_disk/ammo_1911
	illustration = "ammo"

/obj/item/disk/design_disk/adv/knight_gear
	illustration = "sword"

/obj/item/disk/design_disk/adv/cleric_mace
	illustration = "sword"

/obj/item/disk/design_disk/golem_shell
	illustration = "poyo"

/obj/item/disk/design_disk/amogus_plushie
	name = "suspicous design disk"
	desc = "A design disc with no markings besides a drawing of a space man."
	illustration = "sus"
	var/modkit_design = /datum/design/amogus_plushie

/datum/design/amogus_plushie
	name = "Suspicous Plush"
	desc = "Sometimes, you want to yell, but the thing that you want to yell at is also the most adorable thing in the world."
	id = "amogus_plushie"
	build_type = AUTOLATHE
	materials = list(/datum/material/plastic = 6000)
	build_path = /obj/item/toy/plush/among
	category = list("Imported")

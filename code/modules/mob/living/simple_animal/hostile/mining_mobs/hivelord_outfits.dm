/datum/outfit/generic/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	uniform = pickweight(list(
		/obj/item/clothing/under/utility = 5,
		/obj/item/clothing/under/utility/skirt = 5,
		/obj/item/clothing/under/color/black = 1,
		/obj/item/clothing/under/color/white = 1,
		/obj/item/clothing/under/color/random = 1,
		/obj/item/clothing/under/suit/white = 1,
		/obj/item/clothing/under/suit/tan = 1,
		/obj/item/clothing/under/suit/black_really = 1,
		/obj/item/clothing/under/suit/navy = 1,
		/obj/item/clothing/under/suit/burgundy = 1,
		/obj/item/clothing/under/suit/charcoal = 1,
		/obj/item/clothing/under/rank/civilian/lawyer/galaxy = 1,
		/obj/item/clothing/under/suit/black/skirt = 1,
		/obj/item/clothing/under/suit/black = 1,
		/obj/item/clothing/under/dress/sailor = 1,
		/obj/item/clothing/under/dress/striped = 1,
		/obj/item/clothing/under/dress/skirt/blue = 1,
		/obj/item/clothing/under/syndicate/tacticool = 1,
		)
	)
	suit = pickweight(list(
		/obj/item/clothing/suit/hooded/wintercoat = 1,
		/obj/item/clothing/suit/jacket = 1,
		/obj/item/clothing/suit/jacket/leather = 1,
		/obj/item/clothing/suit/jacket/leather/overcoat = 1,
		/obj/item/clothing/suit/jacket/leather/duster = 1,
		/obj/item/clothing/suit/jacket/miljacket = 1,
		/obj/item/clothing/suit/jacket/puffer = 1,
		/obj/item/clothing/suit/gothcoat = 1,
		/obj/item/clothing/suit/toggle/industrial = 1,
		/obj/item/clothing/suit/toggle/hazard = 1,
		/obj/item/clothing/suit/poncho/green = 1,
		)
	)
	back = pickweight(list(
		/obj/item/storage/backpack = 1,
		/obj/item/storage/backpack/satchel = 1,
		/obj/item/storage/backpack/duffelbag = 1,
		/obj/item/storage/backpack/messenger = 1,
		/obj/item/storage/backpack/satchel/leather = 1
		)
	)
	if (prob(25))
		belt = pickweight(list(
			/obj/item/gun/ballistic/automatic/pistol/m1911 = 2,
			/obj/item/gun/ballistic/automatic/pistol/commander = 1,
			/obj/item/gun/ballistic/automatic/pistol = 1,
			/obj/item/gun/ballistic/revolver = 1,
			/obj/item/gun/ballistic/revolver/pepperbox = 1,
			)
		)
	if(prob(50))
		gloves = pickweight(list(
			/obj/item/clothing/gloves/color/black = 1,
			/obj/item/clothing/gloves/fingerless = 1,
			/obj/item/clothing/gloves/color/white = 1,
			)
		)
	shoes = pickweight(list(
		/obj/item/clothing/shoes/laceup = 1,
		/obj/item/clothing/shoes/sandal = 1,
		/obj/item/clothing/shoes/winterboots = 1,
		/obj/item/clothing/shoes/jackboots = 1,
		/obj/item/clothing/shoes/workboots/mining = 1,
		/obj/item/clothing/shoes/workboots = 1,
		/obj/item/clothing/shoes/sneakers/black = 1,
		/obj/item/clothing/shoes/sneakers/brown = 1,
		/obj/item/clothing/shoes/sneakers/white = 1
		)
	)
	if(prob(50))
		head = pickweight(list(
			/obj/item/clothing/head/hardhat = 1,
			/obj/item/clothing/head/hardhat/orange = 1,
			/obj/item/clothing/head/hardhat/dblue = 1,
			/obj/item/clothing/head/beret = 1,
			/obj/item/clothing/head/beret/grey = 1,
			/obj/item/clothing/head/beret/ce = 1,
			/obj/item/clothing/head/flatcap = 1,
			/obj/item/clothing/head/beanie = 1,
			/obj/item/clothing/head/foilhat = 1,
			/obj/item/clothing/head/cowboy = 1,
			/obj/item/clothing/head/pirate = 1,
			/obj/item/clothing/head/trapper = 1
			)
		)
	if(prob(50))
		mask = pickweight(list(
			/obj/item/clothing/mask/balaclava = 1,
			/obj/item/clothing/mask/bandana/red = 1,
			/obj/item/clothing/mask/gas = 1,
			/obj/item/clothing/mask/breath = 1,
			)
		)
	if(prob(50))
		neck = pickweight(list(
			/obj/item/clothing/neck/scarf/red = 1,
			/obj/item/clothing/neck/scarf/green = 1,
			/obj/item/clothing/neck/scarf/darkblue = 1,
			/obj/item/clothing/neck/shemagh = 1,
			/obj/item/clothing/neck/stripedredscarf = 1,
			/obj/item/clothing/neck/stripedgreenscarf = 1,
			/obj/item/clothing/neck/stripedbluescarf = 1
			)
		)
	ears = pick(/obj/item/radio/headset, /obj/item/radio/headset/alt)
	if(prob(50))
		glasses = pickweight(list(
			/obj/item/clothing/glasses/regular = 1,
			/obj/item/clothing/glasses/regular/circle = 1,
			/obj/item/clothing/glasses/regular/jamjar = 1,
			/obj/item/clothing/glasses/eyepatch = 1,
			/obj/item/clothing/glasses/cheapsuns = 1,
			/obj/item/clothing/glasses/regular/hipster = 1,
			/obj/item/clothing/glasses/cold = 1,
			/obj/item/clothing/glasses/heat = 1,
			/obj/item/clothing/glasses/orange = 1,
			/obj/item/clothing/glasses/red = 1
			)
		)
	r_pocket = /obj/item/tank/internals/emergency_oxygen
	l_pocket = /obj/item/radio
	id = /obj/item/card/id
	backpack_contents = list()
	backpack_contents += pickweight(list(
		/obj/item/dice/d20 = 1,
		/obj/item/lipstick = 1,
		/obj/item/clothing/mask/vape = 1,
		/obj/item/clothing/mask/vape/cigar = 1,
		/obj/item/reagent_containers/food/drinks/flask = 1,
		/obj/item/lighter = 1,
		/obj/item/toy/cards/deck = 1,
		/obj/item/toy/eightball = 1,
		/obj/item/storage/wallet = 1,
		/obj/item/paicard = 1,
		/obj/item/pen/fourcolor = 1,
		/obj/item/paper_bin = 1,
		/obj/item/cane = 1,
		/obj/item/radio = 1,
		/obj/item/dyespray = 1,
		/obj/item/table_bell/brass = 1,
		/obj/item/flashlight = 1,
		/obj/item/crowbar/red = 1
		)
	)

/datum/outfit/generic
	name = "Generic (Legion)"
	box = /obj/item/storage/box/survival

/datum/outfit/generic/engineer/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(prob(75))
		uniform = pick(/obj/item/clothing/under/rank/engineering/engineer, /obj/item/clothing/under/rank/engineering/engineer/hazard, /obj/item/clothing/under/rank/security/officer/military/eng)
	if(prob(75))
		suit = pick(/obj/item/clothing/suit/toggle/hazard, /obj/item/clothing/suit/hazardvest, /obj/item/clothing/suit/hooded/wintercoat/engineering)
	if(prob(75))
		gloves = pick(/obj/item/clothing/gloves/color/yellow, /obj/item/clothing/gloves/color/fyellow, /obj/item/clothing/gloves/color/fyellow/old)
	if(prob(75))
		belt = pick(/obj/item/storage/belt/utility/full, /obj/item/storage/belt/utility)
	if(prob(50))
		head = /obj/item/clothing/head/welding
	else if(prob(50))
		glasses = /obj/item/clothing/glasses/welding
	if(prob(75))
		accessory = /obj/item/clothing/accessory/armband/engine
	if(prob(75))
		back = pick(/obj/item/storage/backpack/industrial, /obj/item/storage/backpack/satchel/eng, /obj/item/storage/backpack/duffelbag/engineering, /obj/item/storage/backpack/messenger/engi)
	if(prob(10))
		back = /obj/item/fireaxe

/datum/outfit/generic/engineer
	name = "Mechanic (Legion)"
	box = /obj/item/storage/box/survival/engineer

/datum/outfit/generic/engineer/inteq/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(prob(75))
		uniform = pick(/obj/item/clothing/under/syndicate/inteq/artificer, /obj/item/clothing/under/syndicate/inteq)
	if(prob(75))
		head = pick(/obj/item/clothing/head/hardhat/white, /obj/item/clothing/head/soft/inteq)
	if(prob(75))
		shoes = /obj/item/clothing/shoes/combat
	if(prob(75))
		back = /obj/item/storage/backpack/messenger/inteq

/datum/outfit/generic/engineer/inteq
	name = "Artificer (Legion)"

/datum/outfit/generic/doctor/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(prob(75))
		uniform = pick(/obj/item/clothing/under/rank/medical/doctor, /obj/item/clothing/under/rank/medical/doctor/blue)
	if(prob(75))
		accessory = /obj/item/clothing/accessory/armband/medblue
/datum/outfit/generic/doctor
	name = "Medical Doctor (Legion)"

/datum/outfit/generic/miner/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	uniform = /obj/item/clothing/under/rank/cargo/miner/lavaland
	if (prob(4))
		belt = pickweight(list(
			/obj/item/storage/belt/mining = 2,
			/obj/item/storage/belt/mining/alt = 2
			)
		)
	else if(prob(10))
		belt = pickweight(list(
			/obj/item/pickaxe = 8,
			/obj/item/pickaxe/mini = 4,
			/obj/item/pickaxe/silver = 2,
			/obj/item/pickaxe/diamond = 1,
			/obj/item/gun/energy/kinetic_accelerator = 1
			)
		)
	else
		belt = /obj/item/tank/internals/emergency_oxygen/engi
	gloves = /obj/item/clothing/gloves/color/black
	mask = /obj/item/clothing/mask/gas/explorer
	if(prob(45))
		glasses = /obj/item/clothing/glasses/meson
	if(prob(20))
		suit = pickweight(list(
			/obj/item/clothing/suit/hooded/explorer = 18,
			/obj/item/clothing/suit/hooded/cloak/goliath = 2
			)
		)
	if(prob(30))
		r_pocket = pickweight(list(
			/obj/item/stack/marker_beacon = 20,
			/obj/item/spacecash/bundle/mediumrand = 7,
			/obj/item/reagent_containers/hypospray/medipen/survival = 2,
			/obj/item/borg/upgrade/modkit/damage = 1
			)
		)
	if(prob(10))
		l_pocket = pickweight(list(
			/obj/item/spacecash/bundle/mediumrand = 7,
			/obj/item/reagent_containers/hypospray/medipen/survival = 2,
			/obj/item/borg/upgrade/modkit/cooldown = 1
			)
		)
	if(prob(95))
		back = /obj/item/storage/backpack/explorer
		for(var/count in 1 to 3)
			if(prob(70))
				backpack_contents += pickweight(list(
					/obj/item/borg/upgrade/modkit/damage = 1,
					/obj/item/borg/upgrade/modkit/trigger_guard = 1,
					/obj/item/soap/nanotrasen = 1,
					/obj/item/wormhole_jaunter = 1,
					/obj/item/fulton_core = 1,
					/obj/item/extraction_pack = 2,
					/obj/item/stack/sheet/animalhide/goliath_hide = 3,
					/obj/item/hivelordstabilizer = 2,
					/obj/item/stack/marker_beacon/ten = 2,
					/obj/item/mining_scanner = 2,
					/obj/item/extinguisher/mini = 2,
					/obj/item/kitchen/knife/combat/survival = 3,
					/obj/item/flashlight/seclite = 3,
					/obj/item/stack/sheet/sinew = 3,
					/obj/item/stack/sheet/bone = 3
					)
				)
		if(prob(30))
			backpack_contents += list(
				/obj/item/reagent_containers/hypospray/medipen/survival = pickweight(list(
					1 = 3,
					2 = 2,
					3 = 1
					)
				)
			)
	else
		back = /obj/item/kinetic_crusher
		backpack_contents = list()

/datum/outfit/generic/miner
	name = "Miner (Legion)"

/datum/outfit/generic/oldminer/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	suit = /obj/item/clothing/suit/hooded/explorer/old
	mask = /obj/item/clothing/mask/gas/explorer/old
	if(prob(95))
		glasses = /obj/item/clothing/glasses/meson
	else
		glasses = /obj/item/clothing/glasses/meson/night
	suit_store = /obj/item/tank/internals/oxygen
	gloves = /obj/item/clothing/gloves/explorer/old
	uniform = /obj/item/clothing/under/rank/cargo/miner/lavaland/old
	if(prob(85))
		back = /obj/item/storage/backpack/explorer
		for(var/count in 1 to 3)
			if(prob(70))
				backpack_contents += pickweight(list(
					/obj/item/borg/upgrade/modkit/damage = 1,
					/obj/item/borg/upgrade/modkit/trigger_guard = 1,
					/obj/item/soap/nanotrasen = 1,
					/obj/item/wormhole_jaunter = 1,
					/obj/item/fulton_core = 1,
					/obj/item/extraction_pack = 2,
					/obj/item/stack/sheet/animalhide/goliath_hide = 3,
					/obj/item/hivelordstabilizer = 2,
					/obj/item/stack/marker_beacon/ten = 2,
					/obj/item/mining_scanner = 2,
					/obj/item/extinguisher/mini = 2,
					/obj/item/kitchen/knife/combat/survival = 3,
					/obj/item/flashlight/seclite=3,
					/obj/item/stack/sheet/sinew = 3,
					/obj/item/stack/sheet/bone = 3
					)
				)
		if(prob(30))
			backpack_contents += list(
				/obj/item/reagent_containers/hypospray/medipen/survival = pickweight(list(
					1 = 3,
					2 = 2,
					3 = 1
					)
				)
			)
	else
		back = /obj/item/kinetic_crusher/old
	if(prob(30))
		belt = /obj/item/gun/energy/kinetic_accelerator/old
	if(prob(30))
		r_pocket = pickweight(list(
			/obj/item/stack/marker_beacon = 20,
			/obj/item/spacecash/bundle/mediumrand = 7,
			/obj/item/reagent_containers/hypospray/medipen/survival = 2,
			/obj/item/borg/upgrade/modkit/damage = 1
			)
		)
	if(prob(30))
		l_pocket = pickweight(list(
			/obj/item/spacecash/bundle/mediumrand = 5,
			/obj/item/reagent_containers/hypospray/medipen/survival = 2,
			/obj/item/borg/upgrade/modkit/cooldown = 1
			)
		)
/datum/outfit/generic/oldminer
	name = "Old Miner (Legion)"

/datum/outfit/generic/solgov/soldier/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(prob(90))
		uniform = /obj/item/clothing/under/solgov
		suit = /obj/item/clothing/suit/armor/vest/bulletproof/solgov
		shoes = /obj/item/clothing/shoes/jackboots
		gloves = /obj/item/clothing/gloves/color/black
		mask = /obj/item/clothing/mask/gas/sechailer
		head = /obj/item/clothing/head/solgov/sonnensoldner
		id = /obj/item/card/id/solgov
	else
		uniform = /obj/item/clothing/under/solgov
		suit = /obj/item/clothing/suit/space/hardsuit/solgov
		shoes = /obj/item/clothing/shoes/combat
		gloves = /obj/item/clothing/gloves/combat
		mask = /obj/item/clothing/mask/gas/sechailer/swat
		id = /obj/item/card/id/solgov
	if(prob(85))
		back = /obj/item/storage/backpack
		backpack_contents = list()
		for(var/i = 1 to 3)
			if(prob(75))
				backpack_contents += pickweight(list(
					/obj/item/reagent_containers/hypospray/medipen/stimpack/traitor = 1,
					/obj/item/storage/firstaid/advanced = 1,
					/obj/item/gun/ballistic/automatic/pistol/solgov = 1,
					/obj/item/gps = 1,
					/obj/item/stock_parts/cell/gun/upgraded = 2,
					/obj/item/ammo_box/magazine/pistol556mm = 3,
					/obj/item/desk_flag/solgov = 3,
					/obj/item/stack/marker_beacon/ten = 3,
					/obj/item/extinguisher/mini = 3,
					/obj/item/kitchen/knife/combat = 3,
					/obj/item/flashlight/seclite=3,
					/obj/item/ammo_casing/shotgun = 3,
					/obj/item/binoculars = 3,
					/obj/item/clipboard = 3
					)
				)
	else
		back = pickweight(list(
			/obj/item/energyhalberd = 5,
			/obj/item/gun/ballistic/rocketlauncher/unrestricted = 5
			)
		)
	if(prob(25))
		belt = /obj/item/storage/belt/military
	if(prob(50))
		r_pocket = pickweight(list(
			/obj/item/reagent_containers/hypospray/medipen/stimpack = 1,
			/obj/item/kitchen/knife/letter_opener = 3,
			/obj/item/radio/off = 3,
			/obj/item/grenade/syndieminibomb/concussion = 1,
			/obj/item/melee/transforming/energy/ctf/solgov = 1
			)
		)
	if(prob(70))
		glasses = pickweight(list(
			/obj/item/clothing/glasses/sunglasses = 3,
			/obj/item/clothing/glasses/hud/health = 3,
			/obj/item/clothing/glasses/hud/health/night = 1,
			/obj/item/clothing/glasses/night = 2
			)
		)

/datum/outfit/generic/solgov/soldier
	name = "Soldier"

/datum/outfit/generic/syndicate/infiltrator/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	uniform = /obj/item/clothing/under/syndicate/bloodred
	gloves = /obj/item/clothing/gloves/color/latex/nitrile/infiltrator
	suit = /obj/item/clothing/suit/armor/vest/infiltrator
	head = /obj/item/clothing/head/helmet/infiltrator
	shoes = /obj/item/clothing/shoes/combat/sneakboots
	ears = /obj/item/radio/headset/syndicate
	if(prob(70))
		glasses = pickweight(list(
			/obj/item/clothing/glasses/regular/circle = 1,
			/obj/item/clothing/glasses/night = 2,
			/obj/item/clothing/glasses/sunglasses = 3
			)
		)
	mask = /obj/item/clothing/mask/infiltrator
	id = /obj/item/card/id/syndicate
	back = /obj/item/storage/backpack
	backpack_contents = list()
	for(var/i = 1 to 3)
		if(prob(50))
			backpack_contents += pickweight(list(
				/obj/item/pen/sleepy = 3,
				/obj/item/pen/edagger = 3,
				/obj/item/reagent_containers/syringe/mulligan = 3,
				/obj/item/suppressor = 5,
				/obj/item/storage/box/syndie_kit/chameleon = 5,
				/obj/item/grenade/smokebomb = 5,
				/obj/item/grenade/flashbang = 5
				)
			)
	if(prob(70))
		backpack_contents += (list(
			/obj/item/gun/ballistic/automatic/pistol/APS,
			/obj/item/ammo_box/magazine/pistolm9mm
			)
		)
	if(prob(25))
		r_pocket = pickweight(list(
			/obj/item/chameleon = 1,
			/obj/item/dnainjector/chameleonmut = 1,
			)
		)
	if(prob(25))
		l_pocket = pickweight(list(
			/obj/item/chameleon = 1,
			/obj/item/dnainjector/chameleonmut = 1,
			)
		)

/datum/outfit/generic/syndicate/infiltrator
	name = "Infiltrator"

/datum/outfit/generic/syndicate/operative/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset/syndicate
	id = /obj/item/card/id/syndicate
	r_pocket = /obj/item/tank/internals/emergency_oxygen
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	if(prob(25))
		suit = /obj/item/clothing/suit/space/hardsuit/syndi/scarlet
		mask = /obj/item/clothing/mask/gas/syndicate
		back = /obj/item/tank/jetpack/oxygen
	else if(prob(25))
		suit = /obj/item/clothing/suit/space/hardsuit/syndi
		mask = /obj/item/clothing/mask/gas/syndicate
		back = /obj/item/tank/jetpack/oxygen
	else
		suit = /obj/item/clothing/suit/armor/vest
		mask = /obj/item/clothing/mask/gas
		head = /obj/item/clothing/head/helmet/swat
		back = /obj/item/storage/backpack

/datum/outfit/generic/syndicate/operative
	name = "Operative"

/datum/outfit/generic/srm/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	uniform = /obj/item/clothing/under/suit/roumain
	shoes = /obj/item/clothing/shoes/workboots/mining
	if(prob(75))
		back = /obj/item/storage/backpack/cultpack
	if(prob(75))
		belt = pick(list(/obj/item/kitchen/knife/hunting = 1, /obj/item/gun/ballistic/derringer = 1))

/datum/outfit/generic/srm

/datum/outfit/generic/srm/shadow/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	suit = /obj/item/clothing/suit/armor/roumain/shadow
	head = /obj/item/clothing/head/cowboy/sec/roumain/shadow

/datum/outfit/generic/srm/shadow
	name = "Shadow"

/datum/outfit/generic/srm/hunter/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	suit = /obj/item/clothing/suit/armor/roumain
	head = /obj/item/clothing/head/cowboy/sec/roumain
	if(prob(75))
		suit_store = pickweight(list(/obj/item/gun/ballistic/shotgun/winchester = 9, /obj/item/gun/ballistic/shotgun/winchester = 1))
	backpack_contents = list()
	if(prob(75))
		backpack_contents += list(/obj/item/ammo_box/c38_box = 1)
	if(prob(75))
		backpack_contents += list(pick(
			/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/ashwine,
			/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/icewine,
			/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/shockwine,
			/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/hearthwine,
			/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/forcewine,
			/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/prismwine,) = 2)

/datum/outfit/generic/srm/hunter

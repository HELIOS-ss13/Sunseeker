/obj/structure/ship_module
	name = "Broken Ship Module"
	/// The ship we are located on
	var/obj/structure/overmap/ship/simulated/parent = null
	/// The instance of the module managing us
	var/datum/ship_module/module_instance
	/// Should this structure process
	var/structure_process = FALSE

/obj/structure/ship_module/Initialize(datum/ship_module/module_instance, obj/structure/overmap/ship/simulated/parent, mob/user)
	. = ..()
	src.module_instance = module_instance
	src.parent = parent

/obj/structure/ship_module/Destroy()
	. = ..()
	structure_process = FALSE
	parent = null
	module_instance.uninstall(parent)
	module_instance = null

/**
 * Process an action for the module. Note that this is seperate from ui_act because this handles other modules interacting with us
 * If you are trying to use inter-module communication call this proc ONLY
 */
/obj/structure/ship_module/proc/module_act(mob/user, action, list/params)
	return

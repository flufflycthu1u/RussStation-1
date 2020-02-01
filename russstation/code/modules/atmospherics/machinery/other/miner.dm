/obj/machinery/atmospherics/miner
	circuit = /obj/item/circuitboard/machine/gas_miner

/obj/machinery/atmospherics/miner/attackby(obj/item/W, mob/user, params)
	if(default_deconstruction_screwdriver(user, icon_state, icon_state, W))
		cut_overlays()
		if(panel_open)
			icon = 'russstation/icons/obj/atmospherics/components/miners.dmi'
			add_overlay("open")
			icon = 'icons/obj/atmospherics/components/miners.dmi'
		else
			update_icon()
		updateUsrDialog()
		return
	if(default_deconstruction_crowbar(W))
		updateUsrDialog()
		return
	return ..()

/obj/item/circuitboard/machine/gas_miner
	name = "Gas Miner (Machine Board)"
	icon_state = "engineering"
	build_path = /obj/machinery/atmospherics/miner/nitrogen
	req_components = list(
		/obj/item/pickaxe/drill/diamonddrill = 1,
		/obj/item/stock_parts/matter_bin = 4,
		/obj/item/stack/sheet/plasmarglass = 2,
		/obj/item/stock_parts/manipulator = 1)
	var/static/list/miner_types = list(
		/obj/machinery/atmospherics/miner/nitrogen = "N2",
		/obj/machinery/atmospherics/miner/oxygen = "O2",
		/obj/machinery/atmospherics/miner/n2o = "N2O",
		/obj/machinery/atmospherics/miner/carbon_dioxide = "CO2",
		/obj/machinery/atmospherics/miner/toxins = "Plasma")

/obj/item/circuitboard/machine/gas_miner/Initialize(mapload, new_type)
	if(new_type)
		build_path = new_type
	return ..()

/obj/item/circuitboard/machine/gas_miner/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_SCREWDRIVER)
		var/position = miner_types.Find(build_path, miner_types)
		position = (position == miner_types.len) ? 1 : (position + 1)
		build_path = miner_types[position]
		to_chat(user, "<span class='notice'>You set the board to [miner_types[build_path]].</span>")
	else
		return ..()

/obj/item/circuitboard/machine/gas_miner/examine(mob/user)
	. = ..()
	. += "<span class='info'>[src] is set to [miner_types[build_path]]. You can use a screwdriver to reconfigure it.</span>"


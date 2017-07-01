package factorio.classes;

/** The primary interface for interacting with entities through the Lua API. Entity is everything on the map except tiles. **/
extern class LuaEntity extends LuaControl
{
    
    // get_output_inventory() → LuaInventory	Gets the entities output inventory if it has one.
    // get_module_inventory() → LuaInventory	
    // get_fuel_inventory() → LuaInventory	The fuel inventory for this entity or nil if this entity doesn't have a fuel inventory.
    // get_burnt_result_inventory() → LuaInventory	The burnt result inventory for this entity or nil if this entity doesn't have a burnt result inventory.
    // damage(damage, force, type) → float	Damages the entity.
    // destroy() → boolean	Destroys the entity.
    // set_command(command)	Give the entity a command.
    // has_command() → boolean	Has this unit been assigned a command?
    /** die()	Immediately kills the entity. **/
    public function die():Void;
    // has_flag(flag) → boolean	Test whether this entity's prototype has a flag set.
    // add_market_item{price=…, offer=…}	Offer a thing on the market.
    // remove_market_item(offer) → boolean	Remove an offer from a market.
    // get_market_items() → array of Offer	Get all offers in a market as an array.
    // connect_neighbour(target)	Connect two devices with wire or cable.
    // disconnect_neighbour(target)	Disconnect wires or cables.
    // order_deconstruction(force) → boolean	Sets the entity to be deconstructed by construction robots.
    // cancel_deconstruction(force)	Cancels deconstruction if it is scheduled, does nothing otherwise.
    // to_be_deconstructed(force) → boolean	Is this entity marked for deconstruction?
    // get_request_slot(slot) → SimpleItemStack	Get a logistic requester slot.
    // set_request_slot(request, slot)	Set a logistic requester slot.
    // clear_request_slot(slot)	Clear a logistic requester slot.
    // is_crafting() → boolean	
    // is_opened() → boolean	
    // is_opening() → boolean	
    // is_closed() → boolean	
    // is_closing() → boolean	
    // request_to_open(force, extra_time)	
    // request_to_close(force)	
    // get_transport_line(index) → LuaTransportLine	Get a transport line of a belt.
    // launch_rocket() → boolean	
    // revive(return_item_request_proxy) → dictionary string → uint	Revive a ghost.
    // get_connected_rail{rail_direction=…, rail_connection_direction=…} → LuaEntity	
    // get_filter(uint) → string	Get the filter for a slot in an inserter or a loader.
    // set_filter(uint, string)	Set the filter for a slot in an inserter or a loader
    // get_control_behavior() → LuaControlBehavior	Gets the control behavior of the entity (if any).
    // get_or_create_control_behavior() → LuaControlBehavior	Gets (and or creates if needed) the control behavior of the entity.
    // get_circuit_network(wire, circuit_connector) → LuaCircuitNetwork	
    // supports_backer_name() → boolean	
    // copy_settings(entity) → dictionary string → uint	Copies settings from the given entity onto this entity.
    // get_logistic_point(defines.logistic_member_index) → LuaLogisticPoint or array of LuaLogisticPoint	Gets the LuaLogisticPoint specified by the given index or if not given returns all of the points this entity owns.
    // play_note(instrument, note) → boolean	Plays a note with the given instrument and note.
    // connect_rolling_stock(direction) → boolean	Connects the rolling stock in the given direction.
    // disconnect_rolling_stock(direction) → boolean	Tries to disconnect this rolling stock in the given direction.
    // update_connections()	Reconnect loader and beacon connections to entities that might have been teleported out or in by the script.
    // passenger :: LuaEntity or LuaPlayer [RW]	Setting to nil forces the character/player out of the vehicle, setting to a new character/player forces any existing passenger out and the given character/player becomes the new passenger.
    // name :: string [R]	Name of the entity prototype.
    // ghost_name :: string [R]	Name of the entity or tile contained in this ghost
    // localised_name :: LocalisedString [R]	Localised name of the entity.
    // localised_description :: LocalisedString [R]	
    // ghost_localised_name :: LocalisedString [R]	Localised name of the entity or tile contained in this ghost.
    // ghost_localised_description :: LocalisedString [R]	
    // type :: string [R]	The entity prototype type of this entity.
    // ghost_type :: string [R]	The prototype type of the entity or tile contained in this ghost.
    // active :: boolean [RW]	Deactivating an entity will stop all its operations (car will stop moving, inserters will stop working, fish will stop moving etc).
    // destructible :: boolean [RW]	When the entity is not destructible it can't be damaged.
    // minable :: boolean [RW]	
    // rotatable :: boolean [RW]	When entity is not to be rotatable (inserter, transport belt etc), it can't be rotated by player using the R key.
    // operable :: boolean [RW]	Player can't open gui of this entity and he can't quick insert/input stuff in to the entity when it is not operable.
    // health :: float [RW]	Health of the entity.
    // direction :: defines.direction [RW]	The current direction this entity is facing.
    // supports_direction :: boolean [R]	Whether the entity has direction.
    // orientation :: float [RW]	The smooth orientation.
    // amount :: uint [RW]	Count of resource units contained.
    // initial_amount :: uint [RW]	Count of initial resource units contained.
    // effectivity_modifier :: float [RW]	Multiplies the acceleration the vehicle can create for one unit of energy.
    // consumption_modifier :: float [RW]	Multiplies the the energy consumption.
    // friction_modifier :: float [RW]	Multiplies the car friction rate.
    // speed :: float [RW]	The current speed of the car.
    // stack :: LuaItemStack [R]	
    // prototype :: LuaEntityPrototype [R]	The entity prototype of this entity.
    // ghost_prototype :: LuaEntityPrototype or LuaTilePrototype [R]	The prototype of the entity or tile contained in this ghost.
    // drop_position :: Position [RW]	Position where the entity puts its stuff.
    // pickup_position :: Position [RW]	Where the inserter will pick up items from.
    // drop_target :: LuaEntity [R]	The entity this entity is putting its stuff to or nil if there is no such entity.
    // pickup_target :: LuaEntity [R]	The entity the inserter will attempt to pick up from.
    // selected_gun_index :: uint [RW]	Index of the currently selected weapon slot of this character.
    // energy :: double [RW]	Energy stored in the entity (heat in furnace, energy stored in electrical devices etc.
    // temperature :: double [RW]	The temperature of this entities heat energy source if this entity uses a heat energy source or nil.
    // recipe :: LuaRecipe [RW]	Current recipe being assembled by this machine.
    // previous_recipe :: LuaRecipe [R]	The previous recipe this furnace was using or nil if the furnace had no previous recipe.
    // held_stack :: LuaItemStack [R]	The item stack currently held in an inserter's hand.
    // held_stack_position :: Position [R]	Current position of the inserter's "hand".
    // train :: LuaTrain [R]	The train this rolling stock belongs to.
    // neighbours :: dictionary string → array of LuaEntity or array of LuaEntity or LuaEntity [R]	
    // fluidbox :: LuaFluidBox [RW]	
    // backer_name :: string [RW]	The name of a backer (of Factorio) assigned to a lab or train station / stop.
    // time_to_live :: uint [RW]	The ticks left for a ghost before it's destroyed.
    // color :: Color [RW]	The character or rolling stock color.
    // text :: LocalisedString [RW]	The text of this flying-text entity.
    // signal_state :: defines.signal_state [R]	The state of this rail signal.
    // chain_signal_state :: uint [R]	The state of this chain signal.
    // to_be_looted :: boolean [RW]	Will this entity be picked up automatically when the player walks over it?
    // crafting_progress :: float [RW]	The current crafting progress, as a number in range [0, 1].
    // bonus_progress :: float [RW]	The current productivity bonus progress, as a number in range [0, 1].
    // belt_to_ground_type :: string [R]	"input" or "output", depending on whether this underground belt goes down or up.
    // loader_type :: string [RW]	"input" or "output", depending on whether this loader puts to or gets from a container.
    // rocket_parts :: uint [RW]	Number of rocket parts in the silo.
    // logistic_network :: LuaLogisticNetwork [R]	The logistic network this entity is a part of.
    // logistic_cell :: LuaLogisticCell [R]	The logistic cell this entity is a part of.
    // item_requests :: dictionary string → uint [RW]	Items this ghost will request when revived or items this item request proxy is reqeusting.
    // player :: LuaPlayer [R]	The player connected to this character.
    // unit_group :: LuaUnitGroup [R]	The unit group this unit is a member of, or nil if none.
    // damage_dealt :: double [RW]	The damage dealt by this turret.
    // kills :: uint [RW]	The number of units killed by this turret.
    // last_user :: LuaPlayer [RW]	The player who built the entity
    // electric_buffer_size :: double [RW]	The buffer size for the electric energy source or nil if the entity doesn't have an electric energy source.
    // electric_input_flow_limit :: double [RW]	The input flow limit for the electric energy source or nil if the entity doesn't have an electric energy source.
    // electric_output_flow_limit :: double [RW]	The output flow limit for the electric energy source or nil if the entity doesn't have an electric energy source.
    // electric_drain :: double [RW]	The electric drain for the electric energy source or nil if the entity doesn't have an electric energy source.
    // electric_emissions :: double [RW]	The emissions size for the electric energy source or nil if the entity doesn't have an electric energy source.
    // unit_number :: uint [R]	The unit number or nil if the entity doesn't have one.
    // mining_progress :: double [RW]	The mining progress for this mining drill or nil if this isn't a mining drill.
    // bonus_mining_progress :: double [RW]	The bonus mining progress for this mining drill or nil if this isn't a mining drill.
    // power_production :: double [RW]	The power production specific to the ElectricEnergyInterface entity type.
    // power_usage :: double [RW]	The power usage specific to the ElectricEnergyInterface entity type.
    // bounding_box :: BoundingBox [R]	
    // secondary_bounding_box :: BoundingBox [R]	The secondary bounding box of this entity or nil if it doesn't have one.
    // mining_target :: LuaEntity [R]	The mining target or nil if none
    // circuit_connected_entities [R]	Entities connected to this entity via the circuit network.
    // circuit_connection_definitions :: array of CircuitConnectionDefinition [R]	The connection definition for entities connected to this entity via the circuit network.
    // request_slot_count :: uint [R]	The number of request slots this entity has.
    // filter_slot_count :: uint [R]	The number of filter slots this inserter or loader has.
    // grid :: LuaEquipmentGrid [R]	The equipment grid or nil if this entity doesn't have an equipment grid.
    // graphics_variation :: uint8 [RW]	The graphics variation for this entity or nil if this entity doesn't use graphics varaitions.
    // burner :: LuaBurner [R]	The burner energy source for this entity or nil if there isn't one.
    // shooting_target :: LuaEntity [RW]	The shooting target for this turret or nil.
    // proxy_target :: LuaEntity [R]	The target entity for this item-request-proxy or nil
    // stickers :: array of LuaEntity [R]	The sticker entities attached to this entity.
    // parameters :: ProgrammableSpeakerParameters [RW]	
    // alert_parameters :: ProgrammableSpeakerAlertParameters [RW]	
    // electric_network_statistics :: LuaFlowStatistics [R]	The electric network statitiscs for this electric pole.
    // inserter_stack_size_override :: uint [RW]	Sets the stack size limit on this inserter.
    // products_finished :: float [R]	
    // spawner :: LuaEntity [R]	The spawner associated with this unit entity or nil if the unit has no associated spawner.
    // units :: array of LuaEntity [R]	The units associated with this spawner entity.
    /** valid :: boolean [R]	Is this object valid? **/
    public var valid:Bool;

    // help() → string	All methods, and properties that this object supports.
}
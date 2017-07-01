package factorio;

import factorio.Concepts;
import factorio.LuaSurface;

/**
    This is an abstract base class containing the common functionality between LuaPlayer and character entities (see LuaEntity). 
    When accessing these members through a LuaEntity, it must refer to a character entity.
**/
extern class LuaControl {
    
    // get_inventory(inventory) → LuaInventory	Get an inventory belonging to this entity.
    // get_quickbar() → LuaInventory	Get the quickbar belonging to this entity if any.
    // can_insert(items) → boolean	Can at least some items be inserted?
    
    /** insert(items) → uint	Insert items into this entity. **/
    @:overload(function (item_name:String): Int {})
    public function insert(items:SimpleItemStack): Int;

    // set_gui_arrow{type=…}	Create an arrow which points at this entity.
    // clear_gui_arrow()	Removes the arrow created by set_gui_arrow.
    // get_item_count(item) → uint	Get the number of all or some items in this entity.
    // has_items_inside() → boolean	Does this entity have any item inside it?
    // can_reach_entity(entity) → boolean	Can a given entity be opened or accessed?
    // clear_items_inside()	Remove all items from this entity.
    // remove_item(items) → uint	Remove items from this entity.
    // teleport(position, surface) → boolean	Teleport the entity to a given position, possibly on another surface.
    // update_selected_entity(position)	Select an entity, as if by hovering the mouse above it.
    // clear_selected_entity()	Unselect any selected entity.
    // disable_flashlight()	Disable the flashlight.
    // enable_flashlight()	Enable the flashlight.
    // get_craftable_count(recipe) → uint	Gets the count of the given recipe that can be crafted.
    // begin_crafting{count=…, recipe=…, silent=…} → uint	Begins crafting the given count of the given recipe
    // cancel_crafting(options)	Cancels crafting the given count of the given crafting queue index
    // mine_entity(entity, force) → boolean	Mines the given entity as if this player (or character) mined it.
    // mine_tile(tile) → boolean	Mines the given tile as if this player (or character) mined it.
    
    /** surface :: LuaSurface [R]	The surface this entity is currently on. **/
    public var surface:LuaSurface;

    /** position :: Position [R]	Current position of the entity. **/
    public var position:Position;

    // vehicle :: LuaEntity [R]	The vehicle the player is currently sitting in; nil if none.
    /** 
        force :: string or LuaForce [RW]	The force of this entity.
        Reading will always give a LuaForce, but it is possible to assign either string or LuaForce to this attribute to change the force.

    **/
    public var force:LuaForce;
    // selected :: LuaEntity [R]	The currently selected entity; nil if none.
    // opened :: LuaEntity or LuaItemStack or LuaEquipment or defines.gui_type [RW]	The GUI target the player currently has open; nil if none.
    // crafting_queue_size :: uint [R]	Size of the crafting queue.
    // walking_state [RW]	Current walking state.
    // riding_state [RW]	Current riding state of this car or the vehicle this player is riding in.
    // mining_state [RW]	Current mining state.
    // shooting_state [RW]	Current shooting state.
    // picking_state :: boolean [RW]	Current item-picking state.
    // repair_state [RW]	Current repair state.
    // cursor_stack :: LuaItemStack [R]	The player's cursor stack.
    // driving :: boolean [RW]	true if the player is in a vehicle.
    public var driving:Bool;
    // crafting_queue :: array of CraftingQueueItem [R]	Gets the current crafting queue items.
    /** cheat_mode :: boolean [RW]	When true hand crafting is free and instant **/
    public var cheat_mode:Bool;
    // character_crafting_speed_modifier :: double [RW]	
    // character_mining_speed_modifier :: double [RW]	
    // character_running_speed_modifier :: double [RW]	
    // character_build_distance_bonus :: uint [RW]	
    // character_item_drop_distance_bonus :: uint [RW]	
    // character_reach_distance_bonus :: uint [RW]	
    // character_resource_reach_distance_bonus :: uint [RW]	
    // character_item_pickup_distance_bonus :: uint [RW]	
    // character_loot_pickup_distance_bonus :: uint [RW]	
    // quickbar_count_bonus :: uint [RW]	
    // character_inventory_slots_bonus :: uint [RW]	
    // character_logistic_slot_count_bonus :: uint [RW]	
    // character_trash_slot_count_bonus :: uint [RW]	
    // character_maximum_following_robot_count_bonus :: uint [RW]	
    // character_health_bonus :: float [RW]	
    // auto_trash_filters :: dictionary string → uint [RW]	The auto-trash filters.
    // opened_gui_type [R]	Returns the defines.gui_type or nil.
    // build_distance :: uint [R]	The build distance of this character or max uint when not a character or player connected to a character.
    // drop_item_distance :: uint [R]	The item drop distance of this character or max uint when not a character or player connected to a character.
    // reach_distance :: uint [R]	The reach distance of this character or max uint when not a character or player connected to a character.
    // item_pickup_distance :: double [R]	The item pickup distance of this character or max double when not a character or player connected to a character.
    // loot_pickup_distance :: double [R]	The loot pickup distance of this character or max double when not a character or player connected to a character.
    // resource_reach_distance :: double [R]	The resource reach distance of this character or max double when not a character or player connected to a character.

}

// class Control {
//     private var luaControl:LuaControl;

//     public function new(luaControl:LuaControl)
//     {
//         this.luaControl = luaControl;
//     }
// }
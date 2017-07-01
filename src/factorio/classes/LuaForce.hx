package factorio.classes;

import lua.Table;

/**
    LuaForce encapsulates data local to each "force" or "faction" of the game. 
    Default forces are player, enemy and neutral. Players and mods can create additional forces (up to 64 total).
**/
extern class LuaForce
{

    // get_entity_count(name) → uint	Count entities of given type.
    public function get_entity_count(name:String):Int;

    // disable_research()	Disable research for this force.
    public function disable_research():Void;

    // enable_research()	Enable research for this force.
    public function enable_research():Void;

    // disable_all_prototypes()	Disable all recipes and technologies.
    public function disable_all_prototypes():Void;

    // reset_recipes()	Load the original version of all recipes from the prototypes.
    public function reset_recipes():Void;

    // enable_all_recipes()	Unlock all recipes.
    public function enable_all_recipes():Void;

    // enable_all_technologies()	Unlock all technologies.
    public function enable_all_technologies():Void;

    // research_all_technologies(include_disabled_prototypes)	Research all technologies.
    public function research_all_technologies(include_disabled_prototypes:Bool = false):Void;

    // reset_technologies()	Load the original versions of technologies from prototypes.
    public function reset_technologies():Void;

    // reset()	Reset everything.
    public function reset():Void;

    // reset_technology_effects()	Reapplies all possible research effects, including unlocked recipes.
    public function reset_technology_effects():Void;

    // chart(surface, area)	Chart a portion of the map.
    // clear_chart(surface)	Erases chart data for this force.
    // rechart()	Force a rechart of the whole chart.
    // chart_all(surface)	Chart all generated chunks.
    // is_chunk_charted(surface, position) → boolean	Has a chunk been charted?
    // is_chunk_visible(surface, position) → boolean	Is the given chunk currently charted and visible (not covered by fogg of war) on the map.
    // get_ammo_damage_modifier(ammo) → double	
    // set_ammo_damage_modifier(ammo, modifier)	
    // get_gun_speed_modifier(ammo) → double	
    // set_gun_speed_modifier(ammo, modifier)	
    // get_turret_attack_modifier(turret) → double	
    // set_turret_attack_modifier(turret, modifier)	
    // set_cease_fire(other, cease_fire)	Stop attacking members of a given force.
    // get_cease_fire(other) → boolean	Will this force attack members of another force?
    // set_friend(other, cease_fire)	Friends have unrestricted access to buildings and turrets won't fire at them.
    // get_friend(other) → boolean	Is this force a friend?
    // is_pathfinder_busy() → boolean	Is pathfinder busy?
    // kill_all_units()	Kill all units and flush the pathfinder.
    // find_logistic_network_by_position(position, surface) → LuaLogisticNetwork	
    // set_spawn_position(position, surface)	
    // get_spawn_position(surface) → Position	
    // unchart_chunk(position, surface)	
    // get_item_launched(item) → uint	Gets the count of a given item launched in rockets.
    // set_item_launched(item, count)	Sets the count of a given item launched in rockets.
    // print(message)	Print text to the chat console of all players on this force.
    // get_trains(surface) → array of LuaTrain	
    // add_chart_tag(surface, tag) → LuaCustomChartTag	Adds a custom chart tag to the given surface and returns the new tag or nil if the given position isn't valid for a chart tag.
    // find_chart_tags(surface, area) → array of LuaCustomChartTag	Finds all custom chart tags within the given bounding box on the given surface.
    // get_saved_technology_progress(technology) → double	Gets the saved progress for the given technology or nil if there is no saved progress.
    // set_saved_technology_progress(technology, double)	Sets the saved progress for the given technology.
    /** name :: string [R]	Name of the force. **/
    public var name:String;
    /** technologies :: custom dictionary string → LuaTechnology [R]	Technologies owned by this force, indexed by their name. **/
    public var technologies:Table<String,LuaTechnology>;
    // recipes :: custom dictionary string → LuaRecipe [R]	Recipes available to this force, indexed by their name.
    // manual_mining_speed_modifier :: double [RW]	Multiplier of the manual mining speed.
    // manual_crafting_speed_modifier :: double [RW]	Multiplier of the manual crafting speed.
    // laboratory_speed_modifier :: double [RW]	
    // worker_robots_speed_modifier :: double [RW]	
    // worker_robots_battery_modifier :: double [RW]	
    // worker_robots_storage_bonus :: double [RW]	
    // current_research :: LuaTechnology or string [RW]	The current research in progress.
    // research_progress :: double [RW]	Progress of current research, as a number in range [0, 1].
    // inserter_stack_size_bonus :: double [RW]	The inserter stack size bonus for non stack inserters
    // stack_inserter_capacity_bonus :: uint [RW]	Number of items that can be transferred by stack inserters
    // character_logistic_slot_count :: double [RW]	Number of character logistic slots.
    // character_trash_slot_count :: double [RW]	Number of character trash slots.
    // quickbar_count :: uint [RW]	Number of character quick bars.
    // maximum_following_robot_count :: uint [RW]	Maximum number of follower robots.
    // ghost_time_to_live :: uint [RW]	The time, in ticks, before a placed ghost disappears.
    // players :: array of LuaPlayer [R]	Players belonging to this force.
    // ai_controllable :: boolean [RW]	Enables some higher-level AI behaviour for this force.
    // logistic_networks :: dictionary string → array of LuaLogisticNetwork [R]	List of logistic networks, grouped by surface.
    // item_production_statistics :: LuaFlowStatistics [R]	The item production statistics for this force.
    // fluid_production_statistics :: LuaFlowStatistics [R]	The fluid production statistics for this force.
    // kill_count_statistics :: LuaFlowStatistics [R]	The kill counter statistics for this force.
    // entity_build_count_statistics :: LuaFlowStatistics [R]	The entity build statistics for this force (built and mined)
    // character_running_speed_modifier :: uint [RW]	
    // character_build_distance_bonus :: uint [RW]	
    // character_item_drop_distance_bonus :: uint [RW]	
    // character_reach_distance_bonus :: uint [RW]	
    // character_resource_reach_distance_bonus :: double [RW]	
    // character_item_pickup_distance_bonus :: double [RW]	
    // character_loot_pickup_distance_bonus :: double [RW]	
    // character_inventory_slots_bonus :: uint [RW]	the number of additional inventory slots the character main inventory has.
    // deconstruction_time_to_live :: uint [RW]	The time, in ticks, before a deconstruction order is removed.
    // character_health_bonus :: float [RW]	
    // auto_character_trash_slots :: boolean [RW]	true if auto character trash slots are enabled.
    // zoom_to_world_enabled :: boolean [RW]	Ability to use zoom-to-world on map.
    // zoom_to_world_ghost_building_enabled :: boolean [RW]	Ability to build ghosts through blueprint or direct ghost placement, or "mine" ghosts when using zoom-to-world.
    // zoom_to_world_blueprint_enabled :: boolean [RW]	Ability to create new blueprints using empty blueprint item when using zoom-to-world.
    // zoom_to_world_deconstruction_planner_enabled :: boolean [RW]	Ability to use deconstruction planner when using zoom-to-world.
    // zoom_to_world_selection_tool_enabled :: boolean [RW]	Ability to use custom selection tools when using zoom-to-world.
    // rockets_launched :: uint [RW]	The number of rockets launched.
    // items_launched :: dictionary string → uint [R]	All of the items that have been launched in rockets.
    // connected_players :: array of LuaPlayer [R]	The connected players belonging to this force.
    // mining_drill_productivity_bonus :: double [RW]	
    // train_braking_force_bonus :: double [RW]	
    // evolution_factor :: float [RW]	Evolution factor of this force.
    // friendly_fire :: boolean [RW]	If friendly fire is enabled for this force.
    // valid :: boolean [R]	Is this object valid?
    // help() → string	All methods, and properties that this object supports.
}
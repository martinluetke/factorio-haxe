package factorio;

import factorio.LuaSurface;
import factorio.Concepts;

extern class TickEvent {
    /**
        Identifier of the event
    **/
    var name: Int;

    /**
        Tick the event was generated.
    **/
    var tick: Int;
}

// extern class TickEvent extends Event {}

extern class PlayerEvent extends TickEvent {
    var player_index: Int;
}

extern class ChunkEvent extends TickEvent {
    /** Area of the chunk **/
    var area: BoundingBox;

    /** The surface the chunk is on **/
    var surface: LuaSurface;
}

/** Called when LuaGuiElement is clicked. **/
extern class GuiClickEvent extends TickEvent 
{
    /** The clicked element. **/
    var element: LuaGuiElement;

    /** The player who did the clicking. **/
    var player_index: Int;

    //button :: defines.mouse_button_type: The mouse button used if any.
    
    /** If alt was pressed. **/
    var alt: Bool;
    
    /** If control was pressed. **/
    var control: Bool;

    /** If shift was pressed. **/
    var shift: Bool;
}

/** 
    Called when LuaGuiElement checked state is changed (related to checkboxes and radio buttons) 
**/
typedef GuiCheckedStateChangedEvent =
{
    /** The element whose checked state changed **/
    var element: LuaGuiElement;

    /** The player who did the change. **/
    var player_index: Int;
}

/** Called when LuaGuiElement element value is changed (related to choose element buttons) **/
extern class GuiElemChangedEvent extends TickEvent 
{
    /**  LuaGuiElement: The element whose selection state changed **/
    var element: LuaGuiElement;

    /** The player who did the change. **/
    var player_index: Int;
}

typedef EventId<T> = Int

@:native("defines.events") 
extern class Events {

    /** It is fired once every tick. Since this event is fired every tick, its handler shouldn't include performance heavy code. **/
    static var on_tick: EventId<TickEvent>;

    /** Called after the player was created. **/
    static var on_player_created: EventId<PlayerEvent>;

    /** Called when a player clicks the "confirm" button in the configure Blueprint GUI. **/
    static var on_player_configured_blueprint: EventId<PlayerEvent>;

    /** Called when a chunk is generated. **/
    static var on_chunk_generated: EventId<ChunkEvent>;

    // All events	Every event contains at least the name and tick attributes.
    // on_biter_base_built	Called when a biter migration builds a base.
    // on_built_entity	Called when player builds something.
    // on_canceled_deconstruction	Called when the deconstruction of an entity is canceled.
    // on_chunk_generated	Called when a chunk is generated.
    // on_console_chat	Called when someone talks in-game either a player or through the server interface.
    // on_console_command	Called when someone enters a command-like message regardless of it being a valid command.
    // on_difficulty_settings_changed	Called when the map difficulty settings are changed.
    // on_entity_died	Called when an entity dies.
    // on_entity_renamed	Called after an entity has been renamed either by the player or through script.
    // on_entity_settings_pasted	Called after entity copy-paste is done.
    // on_force_created	Called when a new force is created using game.create_force()
    // on_forces_merging	Called when two forces are merged using game.merge_forces().
    /** on_gui_checked_state_changed	Called when LuaGuiElement checked state is changed (related to checkboxes and radio buttons) **/
    static var on_gui_checked_state_changed: EventId<GuiCheckedStateChangedEvent>;
    /** on_gui_click	Called when LuaGuiElement is clicked. **/
    static var on_gui_click: EventId<GuiClickEvent>;

    /** on_gui_elem_changed	Called when LuaGuiElement element value is changed (related to choose element buttons) **/
    static var on_gui_elem_changed: EventId<GuiElemChangedEvent>;
    // on_gui_selection_state_changed	Called when LuaGuiElement selection state is changed (related to drop-downs)
    // on_gui_text_changed	Called when LuaGuiElement text is changed by the player
    // on_marked_for_deconstruction	Called when an entity is marked for deconstruction with the Deconstruction planner or via script.
    // on_market_item_purchased	Called after a player purchases some offer from a Market entity.
    // on_picked_up_item	Called when a player picks up an item.
    // on_player_alt_selected_area	Called after a player alt-selects an area with a selection-tool item.
    // on_player_ammo_inventory_changed	Called after a players ammo inventory changed in some way.
    // on_player_armor_inventory_changed	Called after a players armor inventory changed in some way.
    // on_player_built_tile	Called after a player builds tiles.
    // on_player_changed_force	Called after a player changes forces.
    // on_player_changed_surface	Called after a player changes surfaces.
    // on_player_configured_blueprint	Called when a player clicks the "confirm" button in the configure Blueprint GUI.
    // on_player_crafted_item	Called when the player crafts an item (upon inserting into player's inventory, not clicking the button to craft).
    // on_player_created	Called after the player was created.
    // on_player_cursor_stack_changed	Called after a players cursorstack changed in some way.
    // on_player_deconstructed_area	Called when a player selects an area with a deconstruction planner.
    // on_player_died	Called after a player dies.
    // on_player_driving_changed_state	Called when the player's driving state has changed, this means a player has either entered or left a vehicle.
    // on_player_dropped_item	Called when a player drops an item on the ground.
    // on_player_gun_inventory_changed	Called after a players gun inventory changed in some way.
    // on_player_joined_game	Called after a player joins the game.
    // on_player_left_game	Called after a player leaves the game.
    // on_player_main_inventory_changed	Called after a players main inventory changed in some way.
    // on_player_mined_entity	Called after the results of an entity being mined are collected just before the entity is destroyed.
    // on_player_mined_item	Called when the player mines something.
    // on_player_mined_tile	Called after a player mines tiles.
    // on_player_placed_equipment	Called after the player puts equipment in an equipment grid
    // on_player_quickbar_inventory_changed	Called after a players quickbar inventory changed in some way.
    // on_player_removed_equipment	Called after the player removes equipment from an equipment grid
    // on_player_respawned	Called after a player respawns.
    // on_player_rotated_entity	Called when the player rotates an entity.
    // on_player_selected_area	Called after a player selects an area with a selection-tool item.
    // on_player_setup_blueprint	Called when a player selects an area with a blueprint.
    // on_player_tool_inventory_changed	Called after a players tool inventory changed in some way.
    // on_pre_entity_settings_pasted	Called before entity copy-paste is done.
    // on_pre_player_died	Called before a players dies.
    // on_pre_surface_deleted	Called just before a surface is deleted.
    // on_preplayer_mined_item	Called when the player finishes mining an entity, before the entity is removed from map.
    // on_put_item	Called when players uses item to build something.
    // on_research_finished	Called when a research finishes.
    // on_research_started	Called when a technology research starts.
    // on_resource_depleted	Called when a resource entity reaches 0 or its minimum yield for infinite resources.
    // on_robot_built_entity	Called when a construction robot builds an entity.
    // on_robot_built_tile	Called after a robot builds tiles.
    // on_robot_mined	Called when a robot mines an entity.
    // on_robot_mined_entity	Called after the results of an entity being mined are collected just before the entity is destroyed.
    // on_robot_mined_tile	Called after a robot mines tiles.
    // on_robot_pre_mined	Called before a robot mines an entity.
    // on_rocket_launched	Called when the rocket is launched.
    // on_runtime_mod_setting_changed	Called when a runtime mod setting is changed by a player.
    // on_sector_scanned	Called when the radar finishes scanning a sector.
    // on_selected_entity_changed	Called after the selected entity changes for a given player.
    // on_surface_created	Called when a surface is created.
    // on_surface_deleted	Called after a surface is deleted.
    // on_tick	It is fired once every tick.
    // on_train_changed_state	Called when a train changes state (started to stopped and vice versa)
    // on_train_created	Called when a new train is created either through disconnecting/connecting an existing one or building a new one.
    // on_trigger_created_entity	Called when an entity with a trigger prototype (such as capsules) create an entity AND that trigger prototype defined trigger_created_entity="true".


    
}

/**
    Entry point for registering event handlers. It is accessible through the global object named script.
**/
@:native("script") 
extern class Script 
{
    /**
        Register a callback to be run on mod init. This is called once when a new save game is created or 
        once when a save file is loaded that previously didn't contain the mod. 
        This is always called before other event handlers and is meant for 
        setting up initial values that a mod will use for its lifetime.
    **/
    static public function on_init(f:Void -> Void): Void;

    //* Register a handler to run on event or events.
    @:overload(function (customEvent: String, f:TickEvent -> Void): Void {})
    static public function on_event<T>(event: EventId<T>, f:T -> Void): Void;
}
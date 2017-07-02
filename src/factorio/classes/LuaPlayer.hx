package factorio.classes;

/**
    A player in the game. 
    Pay attention that a player may or may not have a character, 
    which is the LuaEntity of the little guy running around the world doing things. 
**/
@:luaDotMethod
extern class LuaPlayer extends LuaControl {

    /** character :: LuaEntity [RW]	The character attached to this player, or nil if no character. **/
    public var character: LuaEntity;

    /** index :: uint [R]	This player's index in LuaGameScript::players. **/
    public var index: Int;

    /** gui :: LuaGui [R]	 **/
    public var gui: LuaGui;

    /** opened_self :: boolean [R]	true if the player opened itself. **/    
    public var opened_self: Bool;

    /** controller_type :: defines.controllers [R]	 **/
    /** game_view_settings :: GameViewSettings [RW]	The player's game view settings. **/
    /** minimap_enabled :: boolean [RW]	true if the minimap is visible. **/    
    public var minimap_enabled: Bool;

    /** color :: Color [RW]	The colour associated with the player. **/

    /*** name :: string [RW]	The player's username. **/
    public var name: String;

    /** tag :: string [RW]	The tag that is shown after the player in chat and on the map. **/
    public var tag: String;

    /** connected :: boolean [R]	true if the player is currently connected to the game. **/
    public var connected: Bool;
    
    /** admin :: boolean [R]	true if the player is an admin. **/
    public var admin: Bool;
    /** entity_copy_source :: LuaEntity [R]	The source entity used during entity settings copy-paste if any. **/
    public var entity_copy_source: LuaEntity;
    /** afk_time :: uint [R]	How many ticks since the last action of this player **/
    public var afk_time: Int;
    /** online_time :: uint [R]	How many ticks did this player spend playing this save (all sessions combined) **/
    public var online_time: Int;
    /** permission_group :: LuaPermissionGroup [RW]	The permission group this player is part of or nil if not part of any group. **/
    /** mod_settings [R]	 **/
    /** zoom :: double [W]	The player's zoom-level. **/
    public var zoom:Float;
    /** valid :: boolean [R]	Is this object valid? **/
    /** help() → string	All methods, and properties that this object supports. **/

    /** set_ending_screen_data(message, file)	Setup the screen to be shown when the game is finished. **/
    private var xyx:Bool;
    /** print(message)	Print text to the chat console. **/
    public function print(message:String):Void;
    /** clear_console()	Clear the chat console. **/
    public function clear_console():Void;
    /** get_goal_description() → LocalisedString	Get the current goal description, as a localised string. **/
    /** set_goal_description(text, only_update)	Set the text in the goal window (top left). **/
    /** set_controller{type=…, character=…}	Set the controller type of the player. **/
    /** disable_recipe_groups()	Disable recipe groups. **/
    /** disable_recipe_subgroups()	Disable recipe subgroups. **/
    /** print_entity_statistics(entities)	Print entity statistics to the player's console. **/
    /** unlock_achievement(name)	Unlock the achievements of the given player. **/
    /** clean_cursor() → boolean	Invokes the "clean cursor" action on the player as if the user pressed it. **/
    /** create_character(character)	Creates and attaches a character entity to this player. **/
    /** add_alert(entity, type)	Adds an alert to this player for the given entity of the given alert type. **/
    /** add_custom_alert(entity, icon, message, show_on_map)	Adds a custom alert to this player. **/
    /** remove_alert{entity=…, prototype=…, position=…, type=…, surface=…, icon=…, message=…}	Removes all alerts matching the given filters or if an empty filters table is given all alerts are removed. **/
    /** get_alerts{entity=…, prototype=…, position=…, type=…, surface=…} → dictionary uint → dictionary defines.alert_type → array of alert	Gets all alerts matching the given filters or if no filters are given all alerts are returned. **/
    /** mute_alert(alert_type) → boolean	Mutes alerts for the given alert category. **/
    /** unmute_alert(alert_type) → boolean	Unmutes alerts for the given alert category. **/
    /** is_alert_muted(alert_type) → boolean	If the given alert type is currently muted. **/
    /** enable_alert(alert_type) → boolean	Enables alerts for the given alert category. **/
    /** disable_alert(alert_type) → boolean	Disables alerts for the given alert category. **/
    /** is_alert_enabled(alert_type) → boolean	If the given alert type is currently enabled. **/
}

// class Player extends Control
// {
//     private var luaPlayer:LuaPlayer;

//     public function new(luaPlayer:LuaPlayer)
//     {
//         super(luaPlayer);
//         this.luaPlayer = luaPlayer;
//     }
    
//     public var name(get,never): String;
//     private function get_name(): String
//     {
//         return this.luaPlayer.name;
//     }

//     public var gui(get,never): Gui;
//     private function get_gui(): Gui
//     {
//         return this.luaPlayer.gui;
//     }
// }
package factorio.classes;

import lua.Table;

/**
    The root of the GUI. This type houses the root elements, top, left, center and goal, 
    to which other elements can be added to be displayed on screen.

    Note: Every player can have a different GUI state.
**/
extern class LuaGui 
{
    // is_valid_sprite_path(sprite_path) → boolean	Returns true if sprite_path is valid and contains loaded sprite, otherwise false.

    /** player :: LuaPlayer [R]	The player who owns this gui. **/
    public var player:LuaPlayer;

    /** children :: dictionary string → LuaGuiElement [R]	The children GUI elements mapped by name <> element.**/
    public var children: Table<String, LuaGuiElement>;

    /** top :: LuaGuiElement [R]	The top part of the GUI. **/
    public var top:LuaGuiElement;

    /** left :: LuaGuiElement [R]	The left part of the GUI. **/
    public var left:LuaGuiElement;

    /** center :: LuaGuiElement [R]	The center part of the GUI. **/
    public var center:LuaGuiElement;

    /** goal :: LuaGuiElement [R]	The flow used in the objectives window. **/
    public var goal:LuaGuiElement;
}


// extern class Gui
// {
//     public var luaGui:LuaGui;   

//     public function new(luaGui:LuaGui)
//     {
//         this.luaGui = luaGui;
//     }

// }
package factorio;

import factorio.classes.LuaPlayer;
import lua.Table;

@:native("game")
extern class Game {

    /** 
        Print text to the chat console all players.
    **/
    static function print(message:String): Void;

    /** 
        The active mods versions. The keys are mod names, the values are the versions. 
    **/
    static var active_mods: Table<String,String>;

    /**
        The player typing at the console - nil in all other instances.
    **/
    static var player: LuaPlayer;

    /**
    **/
    static var players: ArrayAccess<LuaPlayer>;
}
package factorio;

import factorio.Concepts;
import factorio.classes.LuaPlayer;

@:native("settings")
extern class Settings 
{
    public static function get_player_settings(player:LuaPlayer): Dynamic;
}
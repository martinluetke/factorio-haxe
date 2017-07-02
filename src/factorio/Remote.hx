package factorio;

import lua.Table;
import haxe.macro.Expr;

/**
    Registry of interfaces between scripts. 
    An interface is simply a dictionary mapping names to functions. 
    A script or mod can then register an interface with LuaRemote, 
    after that any script can call the registered functions, 
    provided it knows the interface name and the desired function name. 
    An instance of LuaRemote is available through the global object named remote.
**/
@:native("remote")
extern class Remote 
{
    /**
        Add a remote interface.

        Parameters
        name :: string: Name of the interface.
        functions :: dictionary string → function: List of functions that are members of the new interface.
        Note: It is an error if the given interface name is already registered.

        Example
            Will register a remote interface containing two functions. Later, it will call these functions through remote.
                remote.add_interface("human interactor",
                                    {hello = function() game.player.print("Hi!") end,
                                    bye = function(name) game.player.print("Bye " .. name) end})
                -- Some time later, possibly in a different mod...
                remote.call("human interactor", "hello")
                remote.call("human interactor", "bye", "dear reader")
    **/
    // public static function add_interface(name:String, functions:Table<String, Dynamic>):Void;
    public static function add_interface(name:String, functions:Dynamic):Void;

    /**
        Removes an interface with the given name.

        Parameters
        name :: string: Name of the interface.
        Return value
        If the interface was removed. False if the interface didn't exist.
    **/
    public static function remove_interface(name:String):Bool;

    /** 
        Call a function of an interface.

        Parameters
            interface :: string: Interface to look up function in.
            function :: string: Function name that belongs to interface.
            ...: Arguments to pass to the called function.
    **/
    public static function call(intrface:String, func:String, ?param1:Dynamic, ?param2:Dynamic, ?param3:Dynamic, ?param4:Dynamic, ?param5:Dynamic):Dynamic;

    /**
        list of all registered interfaces. For each interface name, remote.interfaces[name] is a dictionary mapping the interface's registered functions to the value true.

        Example
            Assuming the "human interactor" interface is registered as above
                game.player.print(tostring(remote.interfaces["human interactor"]["hello"]))        -- prints true
                game.player.print(tostring(remote.interfaces["human interactor"]["nonexistent"]))  -- prints nil
    **/
    public static var interfaces: Table<String, Table<String,Bool>>;
}
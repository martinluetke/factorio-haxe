package factorio;


extern class ConsoleCommand
{
    /** Command's name **/
    public var name: String;

    /** Player who typed the command on her console. **/
    public var player_index: Int;

    /** tick **/
    public var tick: Int;

    /** Parameter(s) written after command. (Happy parsing... ;) ) **/
    public var parameter: String;
}

/**
    Custom game console commands.
**/
@:native("commands")
extern class Commands 
{
    /**
        Add a command.

        Parameters
            name :: string: Name of the command (case sensitive).
            help :: LocalisedString: The localised help message.
            function :: function: The function that will be called when this command is invoked.
        Note: It is an error if the given command name is already registered or already exists as a game command.
    **/
    public static function add_command(name:String, help:String, func:ConsoleCommand -> Void): Void;

    /**
        Removes a registered command
        Return value
            If the command was removed. False if the command didn't exist.
    **/
    public static function remove_command(name:String):Bool;

    // commands :: dictionary string → LocalisedString [R]	The script registered commands
    // game_commands :: dictionary string → LocalisedString [R]	The script registered commands

}
package factorio;


/**
    Custom game console commands.
**/
@:native("commands")
extern class Commands 
{
    
    // add_command(name, help, function)	Add a command.
    /**
        Add a command.

        Parameters
            name :: string: Name of the command (case sensitive).
            help :: LocalisedString: The localised help message.
            function :: function: The function that will be called when this command is invoked.
        Note: It is an error if the given command name is already registered or already exists as a game command.
    **/
    public static function add_command(name:String, help:String, func:Dynamic): Void;
    // remove_command(string) → boolean	Removes a registered command
    // commands :: dictionary string → LocalisedString [R]	The script registered commands
    // game_commands :: dictionary string → LocalisedString [R]	The script registered commands

}
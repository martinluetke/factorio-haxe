package examples.factorio;

import factorio.Game;
import factorio.Script;
import factorio.Commands;

class CommandsExample
{
    var myName = "CommandsExample";

    public function new()
    {
        Script.on_init(register_command);
        Script.on_load(register_command);
    }

    /** 
        Test the command by typing on Factorio's console (`~` key on keyboard, by default).
        - `/help` should list our new command at the beginning.
        - `/help hello` should print its help string.
        - `/hello yourname` should call *hello* with "yourname" in *event.parameter*.
    **/
    function register_command(): Void
    {
        Commands.add_command("hello", "<name> - Prints a greeting.", hello);
    }

    function hello(event:CommandEvent):Void
    {
        Game.print('$event');
        Game.print('Hello ${event.parameter}! ${this.myName} greets you.');
        Game.print("If you'ld excuse me... I will now remove myself from the premises.");

        var removed = Commands.remove_command("helo");

        if (!removed)
        {
            Game.print("Sorry, wrong door. Bye..!");

            Commands.remove_command(event.name);
        }
    }
}
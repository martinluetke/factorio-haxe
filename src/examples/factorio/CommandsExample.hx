package examples.factorio;

import factorio.Game;
import factorio.Script;
import factorio.Commands;

/** 
    Test the command by typing on Factorio's console (`~` key on keyboard, by default).
    - `/help` should list our new commands at the beginning.
    - `/help hello` should print its help string.
    - `/hello yourname` should call *hello* with "yourname" in *cmd.parameter*.
**/
class CommandsExample
{
    var myName = "CommandsExample";
    
    public function new()
    {
        Commands.add_command("hello", "<name> - Prints a greeting.", hello);

        Commands.add_command("lambda", "<name> - Prints a greeting", function(cmd) {
            Game.print('Hello ${cmd.parameter}! I am but a humble lambda function in ${this.myName}.');
        });
    }

    function hello(cmd:ConsoleCommand):Void
    {
        Game.print('$cmd');
        Game.print('Hello ${cmd.parameter}! ${this.myName} greets you.');
        Game.print("If you'll excuse me... I will now remove myself from the premises.");

        var removed = Commands.remove_command("helo");

        if (!removed)
        {
            Game.print("Sorry, wrong door. Bye..!");

            Commands.remove_command(cmd.name);
        }
    }
}
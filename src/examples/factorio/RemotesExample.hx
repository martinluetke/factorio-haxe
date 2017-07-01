package examples.factorio;

import factorio.Game;
import factorio.Script;
import factorio.Remote;

// import lua.Table;

class RemotesExample
{
    public function new()
    {
        Script.on_event(Events.on_player_created, player_created);
    }

    function player_created(event:PlayerCreatedEvent)
    {
        // var player = Game.players[event.player_index];
        Game.print("Registering remote interface...");

        var intrface:Dynamic = {
            hello:hello
        };

        Remote.add_interface("remotes_example", intrface);
    }

    function hello(name:String):String
    {
        Game.print('Hello $name!');

        return "Bye...";
    }
}
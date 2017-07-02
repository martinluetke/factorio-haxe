package examples.factorio;

import factorio.Game;
import factorio.Script;
import factorio.Remote;

class RemotesExample
{
    var myName = "RemotesExample";

    public function new()
    {
        Script.on_event(Events.on_player_created, player_created);
    }

    function player_created(event:PlayerCreatedEvent)
    {
        // var player = Game.players[event.player_index];
        Game.print("Registering remote interface...");

        var interface1:Dynamic = {}
        interface1.hello = hello;

        Remote.add_interface("remotes_example", interface1);

        Game.print("Making a test call...");

        var result:String = Remote.call("remotes_example","hello","Test Call");

        Game.print("Received: " + result);
    }

    function hello(name:String):String
    {
        Game.print('Hello $name! $myName greets you.');

        return "Bye...";
    }
}
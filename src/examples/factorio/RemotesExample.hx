package examples.factorio;

import factorio.Game;
import factorio.Script;
import factorio.Remote;

typedef MyInterface = {
    var hello:String -> String;
}

class RemotesExample
{
    var myName = "RemotesExample";

    public function new()
    {
        Script.on_init(this.register_interface);
        Script.on_load(this.register_interface);
        Script.on_event(Events.on_tick, this.test_interface);
    }

    function register_interface()
    {
        // Dont list the functions of your interface in the curly brackets. 
        // Haxe-lua will wrongly assume you are setting up a class method and add a hidden self parameter.
        var interface1:Dynamic = {} 
        // Always assign your functions like this. Then haxe-lua wont create a self parameter. Sadly this is a neccessary hack atm ...
        interface1.hello = this.hello;

        var res = interface1.hello("Hi");

        
        Remote.add_interface("RemotesExample", interface1);
    }

    function test_interface(event:TickEvent)
    {
        Game.print("Making a test call...");

        var result:String = Remote.call("RemotesExample","hello","Test Call");

        Game.print("Received: " + result);

        // only test once
        Script.on_event(Events.on_tick, null);
    }

    function hello(name:String):String
    {
        Game.print('Hello $name! ${this.myName} greets you.');

        return "Bye...";
    }
}
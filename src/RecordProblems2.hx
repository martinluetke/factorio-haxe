
import factorio.Game;
import factorio.Script;

typedef Config =
{
    var callback:String -> Void;
}

class Mod
{
    static public function main()
    {
        new Mod();
    }

    public function new()
    {
        Script.on_event(Events.on_player_created, player_created);
    }

    public function player_created(event:PlayerEvent)
    {        
        var config:Config = {
            callback: listen
        };

        // all fine
        trigger(config);

        config.callback = listen;

        // crash,  bad argument #-1 to 'print' (string expected, got table)
        trigger(config);
    }

    public function sometrace(param:String)
    {
        Game.print(param);
    }

    public function listen(param:String)
    {
        this.sometrace(param);
    }

    public function trigger(config: Config)
    {
        config.callback("Hello");
    }
}
import lua.*;

import factorio.Game;
import factorio.Script;
import factorio.classes.LuaPlayer;
import factorio.classes.LuaEntity;
import factorio.classes.LuaGuiElement;
import macros.Plain;

import Gui;


class Dispatcher<T>
{
    var listeners : Array<T -> Void> = [];
    var once_listeners : Array<T -> Void> = [];

    public function new() { }

    public function on(delegate:T -> Void)
    {
        listeners.push(delegate);
    }

    public function off(delegate:T -> Void)
    {
        listeners.remove(delegate);
    }

    public function once(delegate:T -> Void)
    {
        once_listeners.push(delegate);
    }

    public function dispatch(event: T)
    {
        for (listener in once_listeners)
        {
            listener(event);
        }
        once_listeners = [];

        for (listener in listeners)
        {
            listener(event);
        }
    }
}

class Dispatchers
{
    static var gui_click_dispatcher:Dispatcher<GuiClickEvent>;
    public static var gui_click(get,never):Dispatcher<GuiClickEvent>;
    public static function get_gui_click():Dispatcher<GuiClickEvent>
    {
        if (gui_click_dispatcher == null) 
        {
            gui_click_dispatcher = new Dispatcher<GuiClickEvent>();
            Script.on_event(Events.on_gui_click, gui_click_dispatcher.dispatch);
        }

        return gui_click_dispatcher;
    }
    
    static var gui_check_dispatcher:Dispatcher<GuiCheckedStateChangedEvent>;
    public static var gui_check(get,never):Dispatcher<GuiCheckedStateChangedEvent>;
    public static function get_gui_check():Dispatcher<GuiCheckedStateChangedEvent>
    {
        if (gui_check_dispatcher == null) 
        {
            gui_check_dispatcher = new Dispatcher<GuiCheckedStateChangedEvent>();
            Script.on_event(Events.on_gui_checked_state_changed, gui_check_dispatcher.dispatch);
        }

        return gui_check_dispatcher;
    }
}



// class Mod
// {
//     var name = "My Mod name";

//     public function new()
//     {
//         Script.on_event(Events.on_player_created, this.player_created);
//         Script.on_event(Events.on_tick, this.tick);
//         Script.on_event(Events.on_chunk_generated, this.chunk_created);
//     }

//     // macro static function mymacro(exp:Expr)
//     // {
//     //     return macro "";
//     // }

//     public function player_created(event)
//     {
//         Game.print(name);

//         var player:LuaPlayer = Game.players[event.player_index];
//         // var p = player.print;
//         // p("Welcome...");

//         // this.call(player.print,"Welcome...")

        

//         // var str = return macro "";

//         // var str = MyMacro.mymacro("test");

//         untyped __lua__("player.print(str)");

//         Game.print('[${this.name}] Player ${player.name} created...');

//         PairTools.pairsEach(Game.active_mods, function(mod, version) {
//             Game.print('$mod ($version)');
//         });
//     }

//     public function tick(event: TickEvent)
//     {
//         // if (event.tick % 120 == 0)
//         // {
//         //     Game.print('Tick ${event.tick}');
//         // }
//     }

//     public function call<T,U>(f: T -> U, x:T): U
//     {
//         return f(x);
//     }

//     public function chunk_created(event: ChunkEvent)
//     {
//         var surface = new Surface(event.surface);

//         Game.print('Chunk created on Tick ${event.tick} with area ${event.area} on surface ${surface.name}');

//         var top = event.area.left_top.y;
//         var left = event.area.left_top.x;

        
//         var pollution = surface.get_pollution(event.area.left_top);

//         surface.set_tiles([
//             {name:"grass", position: event.area.left_top}]
//         );

//         // var table = Table.create();
//         // Table.insert(table, {name:"grass", position: event.area.left_top});
//         // this.call(event.surface.set_tiles, table);

//         // var comp:Component = {
//         //     name: "Hello", 
//         //     onSomething: function(){ Game.print(this.name);}
//         // };

//         // this.useComponent(comp);

//         Game.print('Pollution on chunk $pollution');

//         // var surface = event.surface;

//         // Game.print('${event.area}');
//         //Game.print('$surface');

//         // for (y in event.area.left_top.x...event.area.right_bottom.x+1)
//         // {
//         //     Game.print('$y');
//         // }
//     }
    
//     static public function main()
//     {
//         var str = MyMacro.mymacro("foo");
//         new Mod();
//     }
// }


// class MyMacro 
// {
//     macro public static function mymacro(exp:Expr)
//     {
//         return macro "bar";
//     }
// }

class GodModeCheat
{
    var oldCharacter: LuaEntity = null;
    public function new(){}

    public function isEnabled(player:LuaPlayer):Bool
    {
        return player.character == null;
    }

    public function switchMode(player:LuaPlayer): Bool
    {
        if (player.character != null)
        {
            var oldCharacter = player.character;
            player.character = null;
            this.oldCharacter = oldCharacter;
            // Plain.lua(oldCharacter.die());
        }
        else
        {
            if (oldCharacter != null && oldCharacter.valid)
            {
                player.character = oldCharacter;
            }
            
            oldCharacter = null;
        }

        return player.character == null;
    }
}

interface SubMod
{
    public function gui_component(): GuiComponent;
}

class CheatModeButtonMod implements SubMod
{
    var godModeCheat:GodModeCheat = new GodModeCheat();

    public function new ()
    {
        
    }

    public function gui_component(): GuiComponent
    {
        return {
            anchor: GuiAnchor.Left,
            on_attach: attach
        };
    }

    function attach(root:Gui)
    {
        var frame = root.add_frame("CheatMode Gui");

        frame.add_checkbox("Cheat mode", root.player.cheat_mode, check);
        frame.add_checkbox("God mode", root.player.character == null, switchGodMode);

        // PairTools.pairsEach(Game.active_mods, function(mod, version) {
        //     Game.print('$mod ($version)');
        // });
    }

    function switchGodMode(event)
    {
        var player = Game.players[event.player_index];

        event.element.state = godModeCheat.switchMode(player);
    }

    function check(event:GuiCheckedStateChangedEvent)
    {
        var player = Game.players[event.player_index];

        player.cheat_mode = event.element.state;
    }
}


class ResearchAllButtonMod implements SubMod
{
    var research_on = false;
    var research: Map<String,Bool> = new Map();

    public function new (){}    

    public function gui_component(): GuiComponent
    {
        return {
            anchor: GuiAnchor.Left,
            on_attach: attach
        };
    }

    function attach(root:Gui)
    {
        var frame = root.add_frame("ResearchAll Gui");

        frame.add_checkbox("Research all", false, check);
    }

    function check(event:GuiCheckedStateChangedEvent)
    {
        var player = Game.players[event.player_index];

        if (research_on)
        {
            PairTools.pairsEach(player.force.technologies, function(name,tech) {                
                tech.researched = research.get(name);
            });
        }
        else
        {
            research = new Map();

            PairTools.pairsEach(player.force.technologies, function(name,tech) {
                research.set(name,tech.researched);
                tech.researched = true;
            });
        }

        research_on = !research_on;
    }
}

class Mod 
{
    private var tickOnce = true;

    public function new()
    {
        Script.on_event(Events.on_player_created, player_created);
        Script.on_event(Events.on_tick, tick);
        Script.on_event(Events.on_chunk_generated, chunk_created);
        // Script.on_event(Events.on_gui_click, Gui.gui_click);
        // Script.on_event(Events.on_gui_checked_state_changed, Gui.gui_check);
        // Script.on_event("my-custom-input", mouseclick);

        Dispatchers.gui_click.on(Gui.gui_click);
        Dispatchers.gui_check.on(Gui.gui_check);
    }

    public function add_mod(subMod:SubMod)
    {
        var player = Game.players[1];
        var subGui = subMod.gui_component();
        var rootElement:LuaGuiElement = 
            switch(subGui.anchor)
            {
                case Left: player.gui.left;
                case Top: player.gui.top;
                case Center: player.gui.center;
                case Goal: player.gui.goal;
            }
        
        var rootGui = new Gui(rootElement);

        subGui.on_attach(rootGui);
    }

    public function tick(event:TickEvent)
    {
        if (tickOnce)
        {
            add_mod(new CheatModeButtonMod());
            add_mod(new ResearchAllButtonMod());
            

            
            // var frameDesc:FrameDesc = 

            // Plain.lua(rootElement.add(frameDesc));

            tickOnce = false;
        }
    }

    public function mouseclick(event:TickEvent)
    {

    }

    public function player_created(event:PlayerCreatedEvent)
    {
        // var player = Game.players[event.player_index];
        

        // Plain.lua(player.print("Welcome"));
        // Plain.lua(player.insert("click-pack"));
        // // Plain.lua(player.clear_console());

        // var guiRoot = player.gui.left;

        // var buttonDesc:ButtonDesc = {
        //     type: "button",
        //     name: "test-button",
        //     caption: "Test Button"
        // };

        // Plain.lua(guiRoot.add(buttonDesc));

        // var checkboxDesc:CheckboxDesc = {
        //     type: "checkbox",
        //     name: "test-checkbox",
        //     caption: "Test Checkbox",
        //     state: true
        // };

        // Plain.lua(guiRoot.add(checkboxDesc));
    }

    public function chunk_created(event: ChunkEvent)
    {
        var surface = event.surface;

        var tiles = Table.create();
        Table.insert(tiles, {name:"grass", position: event.area.left_top});
        surface.set_tiles(tiles);
    }

    static public function main()
    {
        // new Mod2();
        // new Mod();

        // new examples.factorio.CommandsExample();
        new examples.factorio.RemotesExample();
    }
}

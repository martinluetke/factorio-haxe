import factorio.classes.LuaGuiElement;
import factorio.classes.LuaPlayer;
import factorio.Script;
import factorio.Game;

import macros.Plain;

enum GuiAnchor 
{    
    Top;
    Left;
    Center;
    Goal;
}


typedef GuiComponent = {
    var anchor:GuiAnchor;
    function on_attach(gui:Gui): Void;
}

class Gui
{   
    private var rootElement:LuaGuiElement;
    public var player: LuaPlayer;

    private static var max_id: Int = 1;
    private static var click_listeners: Map<String, GuiClickEvent -> Void> = new Map();
    private static var check_listeners: Map<String, GuiCheckedStateChangedEvent -> Void> = new Map();


    public function new(rootElement:LuaGuiElement)
    {
        this.rootElement = rootElement;
        this.player = rootElement.gui.player;
    }

    public static function uniqueName(prefix:String)
    {
        var newName = prefix + "-" + max_id;
        max_id++;
        return newName;
    }

    public static function gui_click(event:GuiClickEvent)
    {
        Game.print('gui_click: ${event.element.name}');

        var listener = click_listeners.get(event.element.name);

        if (listener != null)
        {
            listener(event);
        }
    }

    public static function gui_check(event:GuiCheckedStateChangedEvent)
    {
        var listener = check_listeners.get(event.element.name);

        if (listener != null)
        {
            listener(event);
        }
    }

    public function add_frame(caption:String, direction: GuiDirection = Horizontal):Gui
    {
        // var name = if (name) name else Gui.uniqueName("frame");

        var desc:FrameDesc = {
            type: "frame",
            name: Gui.uniqueName("frame"),
            caption: caption,
            direction: direction
        };

        var parent = this.rootElement; // workaround

        return new Gui(Plain.lua(parent.add(desc)));
    }

    public function add_button(caption:String, delegate:GuiClickEvent->Void):LuaGuiElement
    {
        var elementName = Gui.uniqueName("button");

        var buttonDesc:ButtonDesc = {
            type: "button",
            name: elementName,
            caption: caption
        };

        var parent = this.rootElement; // workaround

        Gui.click_listeners.set(elementName, function(event:GuiClickEvent) {
            Game.print("Clicked " + event.element.name);
            delegate(event);
        });

        return Plain.lua(parent.add(buttonDesc));
    }

    public function add_checkbox(caption:String, state: Bool, delegate:GuiCheckedStateChangedEvent->Void):LuaGuiElement
    {
        var elementName = Gui.uniqueName("checkbox");

        var desc:CheckboxDesc = {
            type: "checkbox",
            name: elementName,
            caption: caption,
            state: state
        };

        var parent = this.rootElement; // workaround

        Gui.check_listeners.set(elementName, function(event) {
            Game.print("Checked " + event.element.name);
            delegate(event);
        });

        return Plain.lua(parent.add(desc));
    }
}

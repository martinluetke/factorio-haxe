package factorio;
// import lua.Table;
// import factorio.LuaPlayer;
import factorio.LuaGui;

typedef ButtonDesc = 
{
    var type: String;
    var name: String;
    var caption: String;
    @:optional var style:String;
}


typedef CheckboxDesc = 
{
    var type: String;
    var name: String;
    var caption: String;
    var state:Bool;
    @:optional var style:String;
}

@:enum
abstract GuiDirection(String)
{
    var Horizontal = "horizontal";
    var Vertical = "vertical";
}

/** 
    "frame": Grey semi-transparent boxes that contain other elements. 
    They have a caption, and, just like flows, they lay out children either horizontally or vertically. 
**/
typedef FrameDesc = 
{
    var type: String;
    var name: String;
    var caption: String;
    var direction:GuiDirection;
    @:optional var style:String;
}

extern class LuaGuiElement 
{
    
    // add{type=…, name=…, style=…} → LuaGuiElement	Add a child element.
    @:overload(function (checkbox:FrameDesc):LuaGuiElement {})
    @:overload(function (checkbox:CheckboxDesc):LuaGuiElement {})
    public function add(button:ButtonDesc):LuaGuiElement;
    // clear()	Remove children of this element.
    public function clear():Void;
    // destroy()	Remove this element, along with its children.
    public function destroy():Void;
    // clear_items()	Clears the items in this dropdown.
    public function clear_items():Void;
    // get_item(index) → LocalisedString	Gets an item at the given index from this dropdown.
    // set_item(index, LocalisedString)	Sets an item at the given index in this dropdown.
    // add_item(LocalisedString, index)	Adds an item at the end or at the given index in this dropdown.
    // remove_item(index)	Removes an item at the given index in this dropdown.

    // gui :: LuaGui [R]	The GUI this element is a part of.
    public var gui:LuaGui;
    // parent :: LuaGuiElement [R]	The direct parent of this element; nil if this is a top-level element.
    public var parent:LuaGuiElement;
    // name :: string [R]	The name of this element.
    public var name: String;
    // caption :: LocalisedString [RW]	The text displayed on the element.
    // value :: double [RW]	How much this progress bar is filled.
    // direction :: string [RW]	Direction of the layout.
    // style :: LuaStyle or string [RW]	The style of this element.
    // text :: string [RW]	The text contained in a textfield or text-box.
    // children_names :: array of string [R]	Names of all the children of this element.
    public var children_names:ArrayAccess<String>;
    /** state :: boolean [RW]	Is this checkbox checked? **/
    public var state:Bool;
    // player_index :: uint [R]	Index into LuaGameScript::players specifying the player who owns this element.
    // sprite :: SpritePath [RW]	Path the the image to display on this sprite-button.
    // tooltip :: LocalisedString [RW]	
    // vertical_scroll_policy :: string [RW]	Allowed values are: "always", "never", or "auto"
    // horizontal_scroll_policy :: string [RW]	Allowed values are: "always", "never", or "auto"
    // type :: string [R]	The type of this GUI element.
    public var type:String;
    // children :: array of LuaGuiElement [R]	The children elements
    public var children:ArrayAccess<LuaGuiElement>;
    // items :: array of LocalisedString [RW]	The items in this dropdown.
    // selected_index :: uint [RW]	The selected index for this dropdown.
    // single_line :: boolean [RW]	If this label should render its contents on single line or multiple based off the max width of the label.
    // want_ellipsis :: boolean [RW]	If this label text should render text outside the label area as ".
    // position :: Position [RW]	The position this camera is focused on.
    // surface_index :: uint [RW]	The surface index this camera is using.
    // zoom :: double [RW]	The zoom this camera is using.
    // elem_type :: string [R]	The elem type of this choose-elem-button.
    // elem_value :: string or SignalID [RW]	The elem value of this choose-elem-button or nil if there is no value.
    // selectable :: boolean [RW]	If the contents of this text-box are selectable.
    // word_wrap :: boolean [RW]	If this text-box will word-wrap automatically.
    // read_only :: boolean [RW]	If this text-box is read-only.
    // enabled :: boolean [RW]	If this GUI element is enabled.
    public var enabled:Bool;
}
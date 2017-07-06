package factorio;

/** Coordinates of a tile in a map. **/
typedef Position = 
{
    x: Int,
    y: Int
}

/** Two positions, specifying the top-left and bottom-right corner of the box, respectively. **/
typedef BoundingBox = 
{
    left_top: Position,
    right_bottom: Position
}

/**
    An item stack may be specified either as a string (in which case it represents a full stack containing the specified item), 
    or as the following table:

    name :: string: Prototype name of the item the stack holds.
    count :: uint (optional): Number of items the stack holds. If not specified, defaults to 1.
    health :: float (optional): Health of the items in the stack. Defaults to 1.0.
    durability :: double (optional): Durability of the tool items in the stack.
    ammo :: double (optional): Amount of ammo in the ammo items in the stack.

    Example
        Both of these lines specify an item stack of one iron plate:
        {name="iron-plate"}
        {name="iron-plate", count=1}
    Example
        This is a stack of 47 copper plates:
        {name="copper-plate", count=47}
    Example
        These are both full stacks of iron plates (for iron-plate, a full stack is 100 plates):
        "iron-plate"
        {name="iron-plate", count=100}
**/
typedef SimpleItemStack = {
    var name:String;
    @:optional var count: Int;
    @:optional var health: Float;
    @:optional var durability: Float;
    @:optional var ammo: Float;
}

/** 
    Table with the following fields:
        value :: uint or double or boolean or string: The value of the mod setting. The type depends on the setting.
**/
typedef ModSetting = {
    var value:Dynamic;
}

/**
    An ingredient is a table

    type :: string: "item" or "fluid".
    name :: string: Prototype name of the required item or fluid.
    amount :: uint: Amount of the item.
    minimum_temperature :: uint (optional): The minimum fluid temperature required. Has no effect if type is '"item"'.
    maximum_temperature :: uint (optional): The maximum fluid temperature allowed. Has no effect if type is '"item"'.
**/
typedef Ingredient = {
    var type:String;
    var name:String;
    var amount:Int;
    @:optional var minimum_temperature: Int;
    @:optional var maximum_temperature: Int;
}

/**
    Red, green, blue and alpha values, all in range [0, 1]. 
    All values here are optional; colour channels default to 0, the alpha channel defaults to 1. 
    Unlike Position, Color does not allow the short-hand notation of passing an array.

    Members:
        r :: float (optional)
        g :: float (optional)
        b :: float (optional)
        a :: float (optional)
**/
typedef Color = 
{
    @:optional var r: Float;
    @:optional var g: Float;
    @:optional var b: Float;
    @:optional var a: Float;
}

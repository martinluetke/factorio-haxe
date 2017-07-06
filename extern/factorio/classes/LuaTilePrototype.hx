package factorio.classes;

@:luaDotMethod
extern class LuaTilePrototype
{
    // name :: string [R]	Name of this prototype.
    // order :: string [R]	Order string of this prototype.
    // localised_name :: LocalisedString [R]	
    // localised_description :: LocalisedString [R]	
    // collision_mask :: dictionary string → boolean [R]	The collison mask this tile uses The boolean values for each item are meaningless and will always be true.
    // layer :: uint [R]	
    // walking_speed_modifier :: float [R]	
    // vehicle_friction_modifier :: float [R]	
    // map_color :: Color [R]	
    // decorative_removal_probability :: float [R]	The probability that decorative entities will be removed from on top of this tile when this tile is generated.
    // allowed_neighbors :: dictionary string → LuaTilePrototype [R]	
    // mineable_properties [R]	
    // items_to_place_this :: dictionary string → LuaItemPrototype [R]	Items that when placed will produce this tile.
    // can_be_part_of_blueprint :: boolean [R]	False if this tile is not allowed in blueprints regardless of the ability to build it.
    // emissions_per_tick :: double [R]	Amount of pollution emissions per tick this tile will absorb.
    // autoplace_specification :: AutoplaceSpecification [R]	Autoplace specification for this prototype.
    // valid :: boolean [R]	Is this object valid?
    // help() → string	All methods, and properties that this object supports.
}
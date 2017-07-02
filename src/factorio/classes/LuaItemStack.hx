package factorio.classes;

@:luaDotMethod
extern class LuaItemStack
{    
    // is_blueprint_setup() → boolean	Is this blueprint item setup?
    // get_blueprint_entities() → array of blueprint entity	Entities in this blueprint.
    // set_blueprint_entities(entities)	Set new entities to be a part of this blueprint.
    // add_ammo(amount)	Add ammo to this ammo item.
    // drain_ammo(amount)	Remove ammo from this ammo item.
    // add_durability(amount)	Add durability to this tool item.
    // drain_durability(amount)	Remove durability from this tool item.
    // can_set_stack(stack) → boolean	Would a call to LuaItemStack::set_stack succeed?
    // set_stack(stack) → boolean	Set this item stack to another item stack.
    // clear()	Clear this item stack.
    // get_blueprint_tiles() → array of blueprint tile	Tiles in this blueprint
    // set_blueprint_tiles(tiles)	Set tiles in this blueprint
    // get_inventory(inventory) → LuaInventory	Access the inner inventory of an item.
    // build_blueprint{surface=…, force=…, position=…, force_build=…, direction=…} → array of LuaEntity	Build this blueprint
    // create_blueprint{surface=…, force=…, area=…, always_include_tiles=…}	Sets up this blueprint using the found blueprintable entities/tiles on the surface.
    // get_tag(tag_name) → Any	Gets the tag with the given name or returns nil if it doesn't exist.
    // set_tag(tag_name, tag) → Any	Sets the tag with the given name and value.
    // remove_tag() → boolean	Removes a tag with the given name.
    // clear_blueprint()	Clears this blueprint item.
    // get_entity_filter(index) → string	Gets the entity filter at the given index for this deconstruction item.
    // set_entity_filter(index, filter, DeconstructionItem) → boolean	Sets the entity filter ata the given index for this deconstruction item.
    // get_tile_filter(index) → string	Gets the tile filter at the given index for this deconstruction item.
    // set_tile_filter(index, filter, DeconstructionItem) → boolean	Sets the tile filter ata the given index for this deconstruction item.
    // clear_deconstruction_item()	Clears all settings/filters on this deconstruction item resetting it to default values.
    // valid_for_read :: boolean [R]	Is this valid for reading?
    // prototype :: LuaItemPrototype [R]	Prototype of the item held in this stack.
    /** name :: string [R]	Prototype name of the item held in this stack. **/
    public var name:String;
    /** type :: string [R]	Type of the item prototype. **/
    public var type:String;
    /** count :: uint [RW]	Number of items in this stack. **/
    public var count:Int;
    // grid :: LuaEquipmentGrid [R]	The equipment grid of this item or nil if this item doesn't have a grid.
    /** health :: float [RW]	How much health the item has, as a number in range [0, 1]. **/
    public var health:Float;
    /** durability :: double [RW]	Durability of the contained item. **/
    public var durability:Float;
    /** ammo :: uint [RW]	Number of bullets left in the magazine. **/
    public var ammo:Int;
    // blueprint_icons :: array of Icon [RW]	Icons of a blueprint item.
    // label :: string [RW]	The current label for this item.
    // label_color :: Color [RW]	The current label color for this item.
    // allow_manual_label_change :: boolean [RW]	If the label for this item can be manually changed.
    // cost_to_build :: dictionary string → uint [R]	Raw materials required to build this blueprint.
    // extends_inventory :: boolean [RW]	If this item extends the inventory it resides in (provides its contents for counts, crafting, insertion).
    // prioritize_insertion_mode :: string [RW]	The insertion mode priority this ItemWithInventory uses when items are inserted into an inventory it resides in.
    // default_icons :: array of Icon [R]	The default icons for a blueprint item.
    // tags :: dictionary string → Any [RW]	
    // custom_description :: LocalisedString [RW]	The custom description this item-with-tags.
    // entity_filters :: array of string [RW]	The entity filters for this deconstruction item.
    // tile_filters :: array of string [RW]	The tile filters for this deconstruction item.
    // entity_filter_mode :: defines.deconstruction_item.entity_filter_mode [RW]	The blacklist/whitelist entity filter mode for this deconstruction item.
    // tile_filter_mode :: defines.deconstruction_item.tile_filter_mode [RW]	The blacklist/whitelist tile filter mode for this deconstruction item.
    // tile_selection_mode :: defines.deconstruction_item.tile_filter_mode [RW]	The tile selection mode for this deconstruction item.
    // trees_and_rocks_only :: boolean [RW]	If this deconstruction item is set to allow trees and rocks only.
    // entity_filter_count :: uint [R]	The number of entity filters this deconstruction item supports.
    // tile_filter_count :: uint [R]	The number of tile filters this deconstruction item supports.
    // active_index :: uint [RW]	The active blueprint index for this blueprint book.
    /** valid :: boolean [R]	Is this object valid? **/
    public var valid:Bool;
    // help() → string	All methods, and properties that this object supports.
}
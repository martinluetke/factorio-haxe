package factorio;

import factorio.LuaEntity;
import factorio.LuaPlayer;
// import factorio.LuaItemStack;

extern class LuaInventory
{
    // clear()	Make this inventory empty.
    public function clear():Void;
    // can_insert(items) → boolean	Can at least some items be inserted?
    // insert(items) → uint	Insert items into this inventory.
    // remove(items) → uint	Remove items from this inventory.
    // get_item_count(item) → uint	Get the number of all or some items in this inventory.
    // is_empty() → boolean	Does this inventory contain nothing?
    public function is_empty():Bool;
    // get_contents() → dictionary string → uint	Get counts of all items in this inventory.
    // hasbar() → boolean	Does this inventory have a bar?
    // getbar() → uint	Get the current bar.
    // setbar(bar)	Set the current bar.
    // supports_filters() → boolean	If this inventory supports filters.
    // is_filtered() → boolean	If this inventory supports filters and has at least 1 filter set.
    // can_set_filter(index, filter) → boolean	If the given inventory slot filter can be set to the given filter.
    // get_filter(index) → string	Gets the filter for the given item stack index.
    // set_filter(index, filter) → boolean	Sets the filter for the given item stack index.
    // find_item_stack(item) → LuaItemStack	Gets the first LuaItemStack in the inventory that matches the given item name.
    // operator # :: uint [R]	Get the number of slots in this inventory.
    // index :: uint [R]	The inventory index this inventory uses.
    /** entity_owner :: LuaEntity [R]	The entity that owns this inventory or nil if this isn't owned by an entity. **/
    public var entity_owner: LuaEntity;
    // player_owner :: LuaPlayer [R]	The player that owns this inventory or nil if this isn't owned by a player.
    // equipment_owner :: LuaEntity [R]	The equipment that owns this inventory or nil if this isn't owned by an equipment.
    // operator [] :: LuaItemStack [R]	The indexing operator.
    // valid :: boolean [R]	Is this object valid?
    public var valid: Bool;
    // help() → string	All methods, and properties that this object supports.
}
package factorio.classes;

import lua.Table;
import factorio.Concepts;



extern class LuaSurface
{
    /** Get the pollution for a given position. **/
    function get_pollution(position: Position): Float;

    public function set_tiles(tiles: Table<Int, {name:String,position:Position}>, correct_tiles:Bool = true): Void;

    public var name: String;
    public var index: Int;
}

// class Surface
// {
//     var luaSurface: LuaSurface;

//     public function new(luaSurface:LuaSurface)
//     {
//         this.luaSurface = luaSurface;
//     }

//     public var name(get,never): String;
//     private function get_name(): String
//     {
//         return this.luaSurface.name;//untyped __lua__("self.luaSurface.name");
//     }

//     /** Get the pollution for a given position. **/
//     public function get_pollution(position: Position): Float
//     {
//         return untyped __lua__("self.luaSurface.get_pollution(position)");
//     }

//     public function set_tiles(tiles: Array<{name:String,position:Position}>, correct_tiles:Bool = true)
//     {
//         var table = Table.create();

//         for (tile in tiles)
//         {
//             Table.insert(table, tile);
//         }

//         untyped __lua__("self.luaSurface.set_tiles(table, correct_tiles)");
//     }

//     /** Get the tile at a given position. **/
//     public function get_tile(position: Position): LuaTile
//     {
//         var luaTile: LuaTile = untyped __lua__("self.luaSurface.get_tile(position)");

//         return new Tile(luaTile);
//     }
// }


// typedef Surface =
// {
//     /** Get the pollution for a given position. **/
//     get_pollution: Position -> Float,

//     set_tiles: Table<Int,{name: String, position: Position}> -> Void,

//     name: String,
//     index: Int
// }


// class Methods {
//     public static function get_pollution(value:Surface, position: Position) {
//         return untyped __lua__("value.get_pollution(position)");
//     }
// }
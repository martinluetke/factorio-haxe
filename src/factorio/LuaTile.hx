package factorio;

import factorio.Concepts;

extern class LuaTilePrototype
{

}

extern class LuaTile 
{
    /**
        What type of things can collide with this tile?

        Parameters
            layer :: string: Possible values:
                "ground-tile"
                "water-tile"
                "resource-layer"
                "floor-layer"
                "object-layer"
                "player-layer"
                "train-layer"
                "layer-11"
                "layer-12"
                "layer-13"
                "layer-14"
                "layer-15"
    **/
    public function collides_with(layer: String):Bool;

    /** hidden_tile :: string (optional) [R] **/
    public var hidden_tile: String;

    /** name :: string [R]	Prototype name of this tile. **/
    public var name: String;

    /** prototype :: LuaTilePrototype [R]**/
    public var prototype: LuaTilePrototype;

    /** position :: Position [R]	The position this tile references. **/
    public var position: Position;
}

//** A single "square" on the map. **/
// class Tile
// {
//     var luaTile: LuaTile;

//     public function new(luaTile:LuaTile)
//     {
//         this.luaTile = luaTile;
//     }

//     /** Prototype name of this tile. E.g. "sand-dark" or "grass-dry". **/
//     public var name(get,never): String;

//     /** The position this tile references. **/
//     public var position(get,never): Position;

//     /** ? **/
//     public var hidden_tile(get,never): String;
    
//     /** ? **/
//     public var prototype(get,never): LuaTilePrototype;

//     private function get_name(): String
//     {
//         return this.luaTile.name;
//     }

//     private function get_position(): Position
//     {
//         return this.luaTile.position;
//     }
    
//     private function get_hidden_tile(): String
//     {
//         return this.luaTile.hidden_tile;
//     }
    
//     private function get_prototype(): LuaTilePrototype
//     {
//         return this.luaTile.prototype;
//     }
// }
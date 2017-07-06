package factorio.classes;

import lua.Table;
import factorio.Concepts;

/** One research item. **/
@:luaDotMethod
extern class LuaTechnology
{
    
    // reload()	Reload this technology from its prototype.
    public function reload():Void;

    // force :: LuaForce [R]	The force this technology belongs to.
    public var force:LuaForce;

    // name :: string [R]	Name of this technology.
    public var name:String;

    // localised_name :: LocalisedString [R]	Localised name of this technology.
    // localised_description :: LocalisedString [R]	
    // prototype :: LuaTechnologyPrototype [R]	The prototype of this technology.
    // enabled :: boolean [RW]	Can this technology be researched?
    public var enabled:Bool;
    // upgrade :: boolean [R]	Is this an upgrade-type research?
    public var upgrade:Bool;
    // researched :: boolean [RW]	Has this technology been researched?
    public var researched:Bool;
    // prerequisites :: dictionary string → LuaTechnology [R]	Prerequisites of this technology.
    public var prerequisites:Table<String,LuaTechnology>;
    // research_unit_ingredients :: array of Ingredient [R]	Ingredients labs will require to research this technology.
    public var research_unit_ingredients:ArrayAccess<Ingredient>;
    // effects :: array of Modifier [R]	Effects applied when this technology is researched.
    // research_unit_count :: uint [R]	Number of research units required for this technology.
    public var research_unit_count:Int;
    // research_unit_energy :: double [R]	Amount of energy required to finish a unit of research.
    public var research_unit_energy:Float;
    // order :: string [R]	Order string for this prototype.
    public var order:String;
    // level :: uint [RW]	The current level of this technology.
    public var level:Int;
    // research_unit_count_formula :: string [R]	The count forumula used for this infinite research or nil if this isn't an infinite research.
    public var research_unit_count_formula:String;
    // valid :: boolean [R]	Is this object valid?
}
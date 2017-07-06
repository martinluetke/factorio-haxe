package examples.factorio;

import factorio.Game;
import factorio.Script;
import factorio.Commands;


/**
    Source: https://haxe.org/blog/hello-lua/
**/

/**
    Method Nr.1 - using `@:luaRequire`

    This will import any lua file and bind what it returns to a static class.
    This only makes sense if that lua file returns a table with named data and/or function fields.

    Path is relative to the generated file, f.i. `control.lua`.
    Don't add the '.lua' extension! It is implicitly added by lua's require(xyz) call.
**/
@:luaRequire("src/examples/factorio/IncludeLuaExample1")
extern class IncludeLuaExampleLua {
    public static var someData;
    public static function someFunction(name : String) : String;
}

/** 
    IncludeLuaExample - How to use existing lua code
**/
class IncludeLuaExample
{
    public static function main()
    {
        new IncludeLuaExample();
    }

    public function new()
    {
        Script.on_event(Events.on_tick, this.test);
    }

    public static function __init__()
    {
        // Method Nr.2 - Using macro
        // Import any lua file at compile time. It will be inlined at the beginning of `control.lua`.
        // This is useful if your lua file is not organized like a module and creates global variables.
        // Please note that its code is added and therefore executed at the very beginning of control.lua, 
        // not at the position of the `Compiler.includeFile` macro!

        haxe.macro.Compiler.includeFile("src/examples/factorio/IncludeLuaExample2.lua");
    }

    function test(event:TickEvent)
    {

        // Method Nr.1
        Game.print("[IncludeLuaExample] Method Nr.1 - Making a test call...");

        var ret = IncludeLuaExampleLua.someFunction("IncludeLuaExample");

        Game.print("[IncludeLuaExample] Method Nr.1 - It returned " + ret);


        // Method Nr.2
        var value: Int = untyped globalVariable;

        Game.print("[IncludeLuaExample] Method Nr.2 - Making a test call...");

        var ret:String = untyped globalFunction();

        Game.print('[IncludeLuaExample] Method Nr.2 - globalVariable\'s value is $value and globalFunction() returned $ret');


        // Method Nr.3 - Call arbitrary lua code via __lua__("...")
        // This useful if you need to hack around haxe bugs and limitations, 
        // or to simply copy and paste some lua code.

        var ret:String = untyped __lua__("
            (function(param) 
                return \"foo\" .. param 
            end)(\"bar\")
        ");

        Game.print("[IncludeLuaExample] Method Nr.3 - It returned " + ret);

        
        // only tick once
        Script.on_event(Events.on_tick, null);
    }
}
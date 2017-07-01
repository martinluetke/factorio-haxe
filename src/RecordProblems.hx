import factorio.Game;
import factorio.Script;


typedef RecordOrNot = {
    var value: String;
    var fun: String -> Void;
    function fun2(param:String): Void;
}


typedef RecordOrNot2 = {
    var value: String;
    var fun: String -> Void;
}

class NotARecord
{
    public function new(){}
    public var value = "Some Value";
    public var fun = function(param:String):Void
    {
        Game.print("NotARecord method: " + param);
    }

    public function fun2(param:String):Void
    {
        Game.print("NotARecord method: " + param);
    }
}

class Mod2
{
    private var name = "Mod2";
    public function new()
    {
        Script.on_event(Events.on_player_created, create);
    }

    public function create(event)
    {
        create2();
    }

    // public function create1()
    // {
    //     function localf(param)
    //     {
    //         Game.print("localf: " + param + "(" + this.name + ")");
    //     }

    //     var myFunc: String -> Void;

    //     myFunc = localf;
    //     myFunc("Foo");

    //     myFunc = staticf;
    //     myFunc("Foo");

    //     myFunc = methodf;
    //     myFunc("Foo");
    // }

    public function create2()
    {
        function localf(param)
        {
            Game.print("localf: " + param + "(" + this.name + ")");
        }

        var anonRec = {
            value: "some value",
            fun: function(param:String)
            {
                // here, this belongs to class Mod2
                Game.print(this.name);
            },
            fun2: function(param:String)
            {
                // here, this belongs to class Mod2
                Game.print(this.name);
            }
        }

        record_test_call1(anonRec);

        anonRec.fun = localf;
        anonRec.fun("rec1");

        anonRec.fun = staticf;
        anonRec.fun("rec1");

        anonRec.fun = methodf;
        anonRec.fun("rec1");
    }

    public function create3()
    {
        function localf(param)
        {
            Game.print("localf: " + param + "(" + this.name + ")");
        }

        var rec1:RecordOrNot = {
            value: "foo1",
            fun: localf,
            fun2: localf
        }
        var rec2:RecordOrNot = {
            value: "foo2",
            fun: methodf,
            fun2: methodf
        }
        var rec3:RecordOrNot = {
            value: "foo3",
            fun: staticf,
            fun2: staticf
        }
        
        // var rec2:RecordOrNot2 = {
        //     value: "String",
        //     fun: function(param){
        //         Game.print("Record Test: " + param);
        //     }
        // }

        record_test_call1(rec1);
        record_test_call1(rec2);
        record_test_call1(rec3);

        var rec4 = new NotARecord();
        
        record_test_call1(rec4);

        // var local_higher_order = function(f:String -> Void)
        // {
        //     f("local_higher_order");
        // }

        // local_higher_order(localf);
        // method_higher_order(localf);
        // static_higher_order(localf);

        // local_higher_order(methodf);
        // method_higher_order(methodf);
        // static_higher_order(methodf);

        // local_higher_order(staticf);
        // method_higher_order(staticf);
        // static_higher_order(staticf);
    }

    function methodf(param:String)
    {
        Game.print("methodf: " + param + "(" + this.name + ")");
    }

    static function staticf(param:String)
    {
        Game.print("staticf: " + param);
    }

    public function record_test_call1(rec:RecordOrNot)
    {
        rec.fun("Foo");
        rec.fun2("Bar");
    }

    function method_higher_order(f:String -> Void)
    {
        f("method_higher_order");
    }

    static function static_higher_order(f:String -> Void)
    {
        f("static_higher_order");
    }
}
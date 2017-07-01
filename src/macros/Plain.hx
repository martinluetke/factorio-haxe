package macros;

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.ExprTools;

/** Workaround macro for problem: player.print("foo") => player:print("foo") **/
class Plain
{
    macro public static function lua(exp:Expr)
    {
        var exp_str = ExprTools.toString(exp);
        var exp_str_escaped = StringTools.replace(exp_str,"\"","\\\"") ;
        var sourcecode = "if (false) " + exp_str + " else untyped __lua__(\"" + exp_str_escaped + "\")";
        return Context.parse(sourcecode, Context.currentPos());
    }
}
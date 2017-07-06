return {
    someData = "Some data in a lua file",
    someFunction = function (name)
        game.print("Hello " .. name .. " someFunction from a lua file greets you!") 
        return "Bye ..."
    end
}
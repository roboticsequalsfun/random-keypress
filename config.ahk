Config := {}

Config.specials := ["^c", "^v", "!tab", "#e", "#s", "{Enter}", "{Space}"]

Config.letters := ["a","b","c","d","e","f","g","h","i","j","k","l","m",
            "n","o","p","q","r","s","t","u","v","w","x","y","z"]

Config.symbols := [".", ",", "!", "?", ":", ";", "'", '`"', "-", "_",
            "(", ")", "[", "]", "{", "}", "+", "-", "*", "/",
            "=", "<", ">", "%", "^", "@", "#", "$", "&", "|",
            "~", "``", "…", "©", "®", "™"]

Config.specialWeight := 0.3 ; Probability of pressing a combo instead of a single key
Config.pressDelay := 500 ; Time in milliseconds between key presses
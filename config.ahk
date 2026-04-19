KeyConfig := {}
MouseConfig := {}

KeyConfig.specials := ["^c", "^v", "!tab", "#e", "#s", "{Enter}", "{Space}"]

KeyConfig.letters := ["a","b","c","d","e","f","g","h","i","j","k","l","m",
            "n","o","p","q","r","s","t","u","v","w","x","y","z"]

KeyConfig.symbols := [".", ",", "!", "?", ":", ";", "'", '`"', "-", "_",
            "(", ")", "[", "]", "{", "}", "+", "-", "*", "/",
            "=", "<", ">", "%", "^", "@", "#", "$", "&", "|",
            "~", "``", "…", "©", "®", "™"]

KeyConfig.specialWeight := 0.3 ; Probability of pressing a combo instead of a single key
KeyConfig.pressDelay := 500 ; Time in milliseconds between key presses

MouseConfig.mouse := true
MouseConfig.maxClick := 3
MouseConfig.speed := 0
MouseConfig.buttons := [
    "left", "right", "middle"
]
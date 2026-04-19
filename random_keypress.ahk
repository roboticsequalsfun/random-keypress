#Requires AutoHotkey v2.0
#Include config.ahk

global running := true
global TotalWidth := SysGet(78)
global TotalHeight := SysGet(79)

delay := Config.pressDelay
mouseWeight := Config.mouseWeight

if delay == 0 {
    MsgBox("Delay must be greater than 0!")
    ExitApp
}

keyWeight := KeyConfig.keyWeight
specials := KeyConfig.specials
letters := KeyConfig.letters
symbols := KeyConfig.symbols
keys := []

for i, v in letters
    keys.Push(v)

for i, v in symbols
    keys.Push(v)

mouse := MouseConfig.mouse
speed := MouseConfig.speed
buttons := MouseConfig.buttons
maxClick := MouseConfig.maxClick

MsgBox "Random key press has started. Press ESC to stop. Press Ctrl + P to pause/resume."

while True
{
    if running {
        ; Randomly decide to press a key or mouse based on the weight
        if (Random(0, 1) < mouseWeight){
            ; Randomly decide whether to press a single or special key
            if (Random(0, 1) > keyWeight)
            {
                ; Press a random special key
                special := specials[Random(1, specials.Length)]
                Send(special)
            }
            else
            {
                ; Press a random single key
                key := keys[Random(1, keys.Length)]
                Send(key)
            }
        }
        else {
            if mouse {
                ; Randomly choose which button to press
                button := buttons[Random(1, buttons.Length)]
                ; Get a random posistion
                x := Random(0, TotalWidth)
                y := Random(0, TotalHeight)
                clickTimes := Random(1, maxClick)
                
                MouseClick(button, x, y, clickTimes, speed)
            }
        }
    }
    Sleep(delay)
}

Esc::{
    MsgBox "Exiting Program..."
    ExitApp
}
^p::
{
    global running
    running := !running
    MsgBox (running ? "Resuming" : "Pausing") " program"
}
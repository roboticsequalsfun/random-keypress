#Requires AutoHotkey v2.0
#Include config.ahk

MsgBox "Random key press has started. Press ESC to stop. Press Ctrl + P to pause/resume."

global running := true
specials := KeyConfig.specials

letters := KeyConfig.letters
symbols := KeyConfig.symbols
weight := KeyConfig.specialWeight
delay := KeyConfig.pressDelay

keys := []
for i, v in letters
    keys.Push(v)

for i, v in symbols
    keys.Push(v)


mouse := MouseConfig.mouse
speed := MouseConfig.speed
buttons := MouseConfig.buttons
maxClick := MouseConfig.maxClick

while True
{
    global running
    Esc::{
        MsgBox "Exiting Program..."
        ExitApp
    }
    ^p::
    {
        global running
        running := !running
        if running
            MsgBox "Resuming random key presses."
        else
            MsgBox "Pausing random key presses."
    }
    if running {
        ; Randomly decide whether to press a combo or a single key
        if (Random(0, 1) < weight)
        {
            ; Press a random combo
            special := specials[Random(1, specials.Length)]
            Send(special)
        }
        else
        {
            ; Press a random single key
            key := keys[Random(1, keys.Length)]
            Send(key)
        }

        Sleep(delay)
    }
    if mouse {
        button := buttons[Random(1, buttons.Length)]
        clickTimes := Random(1, maxClick)
        MouseClick(button, speed)
    }
}
#Requires AutoHotkey v2.0
#Include config.ahk


MsgBox "Random key press has started. Press ESC to stop. Press Ctrl + P to pause/resume."

RandomKeyPress := true
specials := Config.specials

letters := Config.letters
symbols := Config.symbols

keys := []
for i, v in letters
    keys.Push(v)

for i, v in symbols
    keys.Push(v)


weight := Config.specialWeight
delay := Config.pressDelay

while True
{
    Esc::{
        MsgBox "Exiting Program..."
        ExitApp
    }
    ^p::
    {
        RandomKeyPress := !RandomKeyPress
        if RandomKeyPress
            MsgBox "Resuming random key presses."
        else
            MsgBox "Pausing random key presses."
    }
    if RandomKeyPress {
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
}
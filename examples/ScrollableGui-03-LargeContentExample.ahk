#Requires AutoHotkey v1.1
#NoEnv
#SingleInstance Force
#Include %A_ScriptDir%
#Include ..\ScrollableGui.ahk
ScrollableGui.init()

gui New, +HwndhGui +MaxSize +Resize -MaximizeBox, ScrollableGui Example 3
gui Font, Bold s16
gui Add, Text, w480 Center, Content taller than the monitor
gui Font, Norm s10
gui Add, Link, w480, The GUI is initially measured while hidden. Its scroll boundary is then explicitly expanded to include every visible control. Special thanks to <a href="https://github.com/aiiu-atdiscord">@aiiu-atdiscord</a> for reporting <a href="https://github.com/SevenKeyboard/scrollable-gui/issues/1#issue-5251616034">the scrolling issue</a> addressed by this example.
loop 100    {
    gui Font, Bold s11
    gui Add, Text, xm w480, % "Section " A_Index
    gui Font, Norm s10
    gui Add, Text, xm w480, This section represents content that extends beyond the initial client area. Resize the window or use the mouse wheel to move through the complete layout.
}
gui Font, Bold s11
gui Add, Text, xm w480 Center, End of scrollable content

;  Initialize the GUI while hidden and register its current client area.
gui Show, AutoSize Hide
ScrollableGui.register(hGui)
;  Opt in to treating controls outside the current client area as scrollable content.
ScrollableGui.expandBoundaryToControls("",2,true,20,12)

;  The window will likely be clipped by the monitor's work area, but all content remains scrollable.
gui Show

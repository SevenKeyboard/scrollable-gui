#Requires AutoHotkey v2.0
#SingleInstance Force
#Include "%A_ScriptDir%"
#Include "..\ScrollableGui.ahk"
ScrollableGui.init()

myGui := Gui("+MaxSize +Resize -MaximizeBox", "ScrollableGui Example 3")
myGui.setFont("Bold s16")
myGui.addText("w480 Center", "Content taller than the monitor")
myGui.setFont("Norm s10")
myGui.addLink("w480", 'The GUI is initially measured while hidden. Its scroll boundary is then explicitly expanded to include every visible control. Special thanks to <a href="https://github.com/aiiu-atdiscord">@aiiu-atdiscord</a> for reporting <a href="https://github.com/SevenKeyboard/scrollable-gui/issues/1#issue-5251616034">the scrolling issue</a> addressed by this example.')
loop 100    {
    myGui.setFont("Bold s11")
    myGui.addText("xm w480", "Section " A_Index)
    myGui.setFont("Norm s10")
    myGui.addText("xm w480", "This section represents content that extends beyond the initial client area. Resize the window or use the mouse wheel to move through the complete layout.")
}
myGui.setFont("Bold s11")
myGui.addText("xm w480 Center", "End of scrollable content")

;  Initialize the GUI while hidden and register its current client area.
myGui.show("AutoSize Hide")
ScrollableGui.register(myGui)
;  Opt in to treating controls outside the current client area as scrollable content.
ScrollableGui.expandBoundaryToControls(myGui)

;  The window will likely be clipped by the monitor's work area, but all content remains scrollable.
myGui.show()

#Requires AutoHotkey v2.0
#SingleInstance Force
#Include "%A_ScriptDir%"
#Include "..\ScrollableGui.ahk"
ScrollableGui.init()

mainGui := Gui("+MaxSize +Resize", "ScrollableGui Example 2")
mainGui.addText(, "Main GUI")
mainGui.addEdit("w240 r5 +Multi"
    ,"Line 1`r`nLine 2`r`nLine 3`r`nLine 4`r`nLine 5`r`nLine 6`r`nLine 7`r`nLine 8`r`nLine 9`r`nLine 10")
mainGui.addComboBox("w240 Choose1", ["Main A", "Main B", "Main C", "Main D", "Main E"])
mainGui.addButton("w120", "Main Button")
childGui := Gui("+MaxSize +Parent" . mainGui.Hwnd . " +Resize", "Child GUI")
childGui.BackColor := "F8F8F8"
childGui.addEdit("w200 r5 +Multi"
    ,"Alpha`r`nBeta`r`nGamma`r`nDelta`r`nEpsilon`r`nZeta`r`nEta`r`nTheta`r`nIota`r`nKappa")
childGui.addDropDownList("w200 Choose1", ["One", "Two", "Three", "Four", "Five"])
childGui.addButton("w100", "Child Button")

;  Show both GUIs at a larger size first.
mainGui.show("w600 h300 Hide")
childGui.show("x350 y10 w240 h220")
ScrollableGui.register(mainGui)
ScrollableGui.register(childGui)
;  Resize after registration, then sync the scroll state.
childGui.show("w150 h100")
ScrollableGui.syncSize(childGui)
mainGui.show("w570 h290")
ScrollableGui.syncSize(mainGui)

;  Finally show the main GUI.
mainGui.Show()
#Requires AutoHotkey v1.1
#NoEnv
#SingleInstance Force
#Include %A_ScriptDir%
#Include ..\ScrollableGui.ahk
ScrollableGui.init()
SWP_NOMOVE := 0x0002
SWP_NOZORDER := 0x0004

gui MainGui:New, +HwndhMainGui +MaxSize +Resize, ScrollableGui Example 2
gui Add, Text,, % Main GUI
gui Add, Edit, w240 r5 +Multi
    ,Line 1`r`nLine 2`r`nLine 3`r`nLine 4`r`nLine 5`r`nLine 6`r`nLine 7`r`nLine 8`r`nLine 9`r`nLine 10
gui Add, ComboBox, w240 Choose1, Main A|Main B|Main C|Main D|Main E
gui Add, Button, w120, Main Button
gui ChildGui:New, +HwndhSubGui +MaxSize +ParentMainGui +Resize, Child GUI
gui Color, F8F8F8
gui Add, Edit, w200 r5 +Multi
    ,Alpha`r`nBeta`r`nGamma`r`nDelta`r`nEpsilon`r`nZeta`r`nEta`r`nTheta`r`nIota`r`nKappa
gui Add, DropDownList, w200 Choose1, One|Two|Three|Four|Five
gui Add, Button, w100, Child Button

;  Show both GUIs at a larger size first.
gui MainGui:Show, w600 h300 Hide
gui ChildGui:Show, x350 y10 w240 h220
ScrollableGui.register(hMainGui)
ScrollableGui.register(hSubGui)
;  Resize after registration, then sync the scroll state.
if (dllCall("User32.dll\SetWindowPos"
    ,"Ptr",hSubGui
    ,"Ptr",0
    ,"Int",0
    ,"Int",0
    ,"Int",round(165 * A_ScreenDPI / 96)
    ,"Int",round(138 * A_ScreenDPI / 96)
    ,"UInt",SWP_NOMOVE | SWP_NOZORDER
    ,"Int"))    {
    ScrollableGui.syncSize(hSubGui)
}
if (dllCall("User32.dll\SetWindowPos"
    ,"Ptr",hMainGui
    ,"Ptr",0
    ,"Int",0
    ,"Int",0
    ,"Int",round(585 * A_ScreenDPI / 96)
    ,"Int",round(328 * A_ScreenDPI / 96)
    ,"UInt",SWP_NOMOVE | SWP_NOZORDER
    ,"Int"))    {
    ScrollableGui.syncSize(hMainGui)
}

;  Finally show the main GUI.
gui MainGui:Show

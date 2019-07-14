#SingleInstance Force
#Include %A_ScriptDir%\SaeLib.ahk
#NoEnv
SetKeyDelay, -1, 100
CoordMode, ToolTip, Screen
DetectHiddenWindows, On

getFH4Status()
auctionHouseMenuWarning()
Loop, {
  searchBugattiVeryon()
}

Insert::ExitApp
ExitApp

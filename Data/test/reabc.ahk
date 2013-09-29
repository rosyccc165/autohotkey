#i::
If(WinExist("フォント設定ツール") <> 0){
WinActivate,フォント設定ツール
Return
}
Gui,Add,Edit,VFontSize GSizeCheck
Gui,Add,DropDownList,VAnti AltSubmit x+10 yp+0,|なし|シャープ|鮮明|強く|滑らかに
Loop,Read,C:\Users\b1012231\Desktop\text.txt
{
If(A_Index = 1){
Gui,Add,Tab,xm,%A_LoopReadLine%
Continue
}
TabCount := A_Index - 1
Gui,Tab,%TabCount%
Loop,Parse,A_LoopReadLine,|
{
Gui,Font,,%A_LoopField%
If(A_Index = 1){
Gui,Add,Text,Border GFontChange Center W150 H20,%A_LoopField%
}Else{
Gui,Add,Text,Border GFontChange Center W150 H20 xp+0 y+0,%A_LoopField%
}
}
}
Gui,Show,,フォント設定ツール
Return

SizeCheck:
ControlGetText,FontSize,Edit1,A
If FontSize is Number
{
If((FontSize < 0) Or (1296 < FontSize))
ControlSetText,Edit1,,A
}Else{
ControlSetText,Edit1,,A
}
Return

FontChange:
Gui,Submit
ControlClick,Edit3,ahk_class OWL.ControlBarContainer
PasteString(A_GuiControl)
Gui,Destroy
If(FontSize <> ""){
ControlClick,Edit1,ahk_class OWL.ControlBarContainer
Send,+{Home}{Delete}
PasteString(FontSize)
}
If(Anti <> ""){
ControlClick,ComboBox1,ahk_class OWL.ControlBarContainer
Anti -= 2
Send,{Home}{Down %Anti%}{Return}
}
Return

PasteString(str){
Backup := ClipboardAll
Clipboard := str
Send,^v
Sleep,50
Clipboard := Backup
}

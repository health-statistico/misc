; AutoHotkey Script to Open Qalculate

; Define a hotkey, for example, Win + Q
!q::
; Run the Qalculate application
Run, "C:\Program Files\Qalculate\qalculate-qt.exe"
; Exit the script after running the command
return


; AutoHotkey Script to Google Highlighted Text

; Define a hotkey, Alt + G
!g::
; Copy the highlighted text to the clipboard
Send, ^c
; Wait a moment for the clipboard to update
Sleep, 50
; Get the text from the clipboard
ClipText := Clipboard
; Trim any leading or trailing whitespace
ClipText := Trim(ClipText)
; If there's text, perform the Google search
if (ClipText != "")
{
    ; URL-encode the clipboard text for the search query
    ClipText := StrReplace(ClipText, " ", "+")
    ; Open the default web browser with the Google search query
    Run, https://www.google.com/search?q=%ClipText%
}
return
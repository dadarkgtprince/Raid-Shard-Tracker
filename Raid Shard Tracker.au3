#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Logo.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <Array.au3>
#include <File.au3>

#Region ### Variables
Global $FileDir = @AppDataDir & "\Raid Shard Tracker"
Global $FileAncient = "Tracker_Ancient.txt"
Global $FileVoid = "Tracker_Void.txt"
Global $FileSacred = "Tracker_Sacred.txt"
Global $Ancient_Tracker[221]
Global $Ancient_Rare_Tracker = 0
Global $Ancient_Epic_Tracker = 0
Global $Ancient_Total_Tracker = 0
Global $Void_Tracker[221]
Global $Void_Rare_Tracker = 0
Global $Void_Epic_Tracker = 0
Global $Void_Total_Tracker = 0
Global $Sacred_Tracker[60]
Global $Sacred_Epic_Tracker = 0
Global $counter = 0
Global $Ancient_Percent = 0.5
Global $Ancient_Multiplier = 1
Global $Ancient_Mercy = 0
Global $Void_Percent = 0.5
Global $Void_Multiplier = 1
Global $Void_Mercy = 0
Global $Sacred_Percent = 6
Global $Sacred_Multiplier = 1
Global $Sacred_Mercy = 0
#EndRegion ### END Variables

#Region ### START Koda GUI section ### Form=
$Raid_Shard_Tracker = GUICreate("Raid Shard Tracker", 396, 562, -1, -1)
GUISetBkColor(0xFFFFFF)
$GUI_Pic1 = GUICtrlCreatePic("D:\TheJasonFullStop\Downloads\AutoIT\Raid Shard Tracker\ancient.jpg", 20, 24, 105, 113)
$GUI_Pic2 = GUICtrlCreatePic("D:\TheJasonFullStop\Downloads\AutoIT\Raid Shard Tracker\void.jpg", 20, 222, 105, 113)
$GUI_Pic3 = GUICtrlCreatePic("D:\TheJasonFullStop\Downloads\AutoIT\Raid Shard Tracker\sacred.jpg", 20, 405, 105, 113)
$GUI_Ancient_Rare_Button = GUICtrlCreateButton("Rare", 152, 24, 65, 33)
$GUI_Ancient_Epic_Button = GUICtrlCreateButton("Epic", 152, 64, 65, 33)
$GUI_Ancient_Leggo_Button = GUICtrlCreateButton("Legendary", 152, 104, 65, 33)
$GUI_Void_Rare_Button = GUICtrlCreateButton("Rare", 152, 222, 65, 33)
$GUI_Void_Epic_Button = GUICtrlCreateButton("Epic", 152, 262, 65, 33)
$GUI_Void_Leggo_Button = GUICtrlCreateButton("Legendary", 152, 302, 65, 33)
$GUI_Sacred_Epic_Button = GUICtrlCreateButton("Epic", 152, 445, 65, 33)
$GUI_Sacred_Leggo_Button = GUICtrlCreateButton("Legendary", 152, 485, 65, 33)
$GUI_Ancient_Total_Label = GUICtrlCreateLabel("Total:", 24, 144, 31, 17)
$GUI_Void_Total_Label = GUICtrlCreateLabel("Total:", 24, 342, 31, 17)
$GUI_Sacred_Total_Label = GUICtrlCreateLabel("Total:", 24, 525, 31, 17)
$GUI_Ancient_Total_Counter = GUICtrlCreateLabel("", 56, 144, 33, 17)
$GUI_Void_Total_Counter = GUICtrlCreateLabel("", 56, 342, 33, 17)
$GUI_Sacred_Total_Counter = GUICtrlCreateLabel("", 56, 525, 33, 17)
$GUI_Ancient_Rare_Counter = GUICtrlCreateLabel("", 224, 24, 45, 33, BitOR($SS_CENTER,$SS_CENTERIMAGE,$WS_BORDER))
$GUI_Ancient_Epic_Counter = GUICtrlCreateLabel("", 224, 64, 45, 33, BitOR($SS_CENTER,$SS_CENTERIMAGE,$WS_BORDER))
$GUI_Void_Rare_Counter = GUICtrlCreateLabel("", 224, 222, 45, 33, BitOR($SS_CENTER,$SS_CENTERIMAGE,$WS_BORDER))
$GUI_Void_Epic_Counter = GUICtrlCreateLabel("", 224, 262, 45, 33, BitOR($SS_CENTER,$SS_CENTERIMAGE,$WS_BORDER))
$GUI_Sacred_Epic_Counter = GUICtrlCreateLabel("", 224, 445, 45, 33, BitOR($SS_CENTER,$SS_CENTERIMAGE,$WS_BORDER))
$GUI_Ancient_Reset = GUICtrlCreateButton("Reset", 304, 24, 57, 113)
$GUI_Void_Reset = GUICtrlCreateButton("Reset", 304, 222, 57, 113)
$GUI_Sacred_Reset = GUICtrlCreateButton("Reset", 304, 405, 57, 113)
$GUI_Ancient_Percent = GUICtrlCreateLabel("", 224, 104, 45, 33, BitOR($SS_CENTER,$SS_CENTERIMAGE), $WS_EX_STATICEDGE)
$GUI_Void_Percent = GUICtrlCreateLabel("", 224, 302, 45, 33, BitOR($SS_CENTER,$SS_CENTERIMAGE), $WS_EX_STATICEDGE)
$GUI_Sacred_Percent = GUICtrlCreateLabel("", 224, 485, 45, 33, BitOR($SS_CENTER,$SS_CENTERIMAGE), $WS_EX_STATICEDGE)
$GUI_Ancient_2x = GUICtrlCreateCheckbox("2x", 24, 8, 33, 17)
$GUI_Void_2x = GUICtrlCreateCheckbox("2x", 24, 206, 41, 17)
$GUI_Sacred_2x = GUICtrlCreateCheckbox("2x", 24, 389, 41, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

If FileExists($FileDir) Then
Else
	DirCreate($FileDir)
EndIf

FileChangeDir($FileDir)

If FileExists($FileAncient) Then
	$Ancient_Tracker = FileReadToArray($FileAncient)
	$counter = 0
	For $counter = 1 to $Ancient_Tracker[0]
		If $Ancient_Tracker[$counter] = "Rare" Then
			$Ancient_Rare_Tracker += 1
		EndIf
		If $Ancient_Tracker[$counter] = "Epic" Then
			$Ancient_Epic_Tracker += 1
		EndIf
	Next
	$Ancient_Total_Tracker = $Ancient_Rare_Tracker + $Ancient_Epic_Tracker
	GUICtrlSetData($GUI_Ancient_Rare_Counter, $Ancient_Rare_Tracker)
	GUICtrlSetData($GUI_Ancient_Epic_Counter, $Ancient_Epic_Tracker)
	GUICtrlSetData($GUI_Ancient_Total_Counter, $Ancient_Total_Tracker)
	$counter = 0
Else
	FileOpen($FileAncient, 1)
	$Ancient_Total_Tracker = 0
	$Ancient_Rare_Tracker = 0
	$Ancient_Epic_Tracker = 0
	GUICtrlSetData($GUI_Ancient_Rare_Counter, $Ancient_Rare_Tracker)
	GUICtrlSetData($GUI_Ancient_Epic_Counter, $Ancient_Epic_Tracker)
	GUICtrlSetData($GUI_Ancient_Total_Counter, $Ancient_Total_Tracker)
	$Ancient_Tracker[0] = 1
EndIf

If FileExists($FileVoid) Then
	$Void_Tracker = FileReadToArray($FileVoid)
	$counter = 0
	For $counter = 1 to $Void_Tracker[0]
		If $Void_Tracker[$counter] = "Rare" Then
			$Void_Rare_Tracker += 1
		EndIf
		If $Void_Tracker[$counter] = "Epic" Then
			$Void_Epic_Tracker += 1
		EndIf
	Next
	$Void_Total_Tracker = $Void_Rare_Tracker + $Void_Epic_Tracker
	GUICtrlSetData($GUI_Void_Rare_Counter, $Void_Rare_Tracker)
	GUICtrlSetData($GUI_Void_Epic_Counter, $Void_Epic_Tracker)
	GUICtrlSetData($GUI_Void_Total_Counter, $Void_Total_Tracker)
	$counter = 0
Else
	FileOpen($FileVoid, 1)
	$Void_Total_Tracker = 0
	$Void_Rare_Tracker = 0
	$Void_Epic_Tracker = 0
	GUICtrlSetData($GUI_Void_Rare_Counter, $Void_Rare_Tracker)
	GUICtrlSetData($GUI_Void_Epic_Counter, $Void_Epic_Tracker)
	GUICtrlSetData($GUI_Void_Total_Counter, $Void_Total_Tracker)
	$Void_Tracker[0] = 1
EndIf

If FileExists($FileSacred) Then
	$Sacred_Tracker = FileReadToArray($FileSacred)
	$counter = 0
	For $counter = 1 to $Sacred_Tracker[0]
		If $Sacred_Tracker[$counter] = "Epic" Then
			$Sacred_Epic_Tracker += 1
		EndIf
	Next
	$Sacred_Total_Tracker = $Sacred_Epic_Tracker
	GUICtrlSetData($GUI_Sacred_Epic_Counter, $Sacred_Epic_Tracker)
	GUICtrlSetData($GUI_Sacred_Total_Counter, $Sacred_Total_Tracker)
	$counter = 0
Else
	FileOpen($FileSacred, 1)
	$Sacred_Total_Tracker = 0
	$Sacred_Epic_Tracker = 0
	GUICtrlSetData($GUI_Sacred_Epic_Counter, $Sacred_Epic_Tracker)
	GUICtrlSetData($GUI_Sacred_Total_Counter, $Sacred_Total_Tracker)
	$Sacred_Tracker[0] = 1
EndIf

Func Ancient_Percent_Calculate()
	If GUICtrlRead($GUI_Ancient_2x) = 1 Then
		$Ancient_Multiplier = 2
	Else
		$Ancient_Multiplier = 1
	EndIf
	If $Ancient_Tracker[0] > 200 Then
		$Ancient_Mercy = $Ancient_Tracker[0] - 200
	EndIf
	GUICtrlSetData($GUI_Ancient_Percent, $Ancient_Percent*$Ancient_Multiplier + ($Ancient_Mercy*5) & "%")
EndFunc

Func Void_Percent_Calculate()
	If GUICtrlRead($GUI_Void_2x) = 1 Then
		$Void_Multiplier = 2
	Else
		$Void_Multiplier = 1
	EndIf
	If $Void_Tracker[0] > 200 Then
		$Void_Mercy = $Void_Tracker[0] - 200
	EndIf
	GUICtrlSetData($GUI_Void_Percent, $Void_Percent*$Void_Multiplier + ($Void_Mercy*5) & "%")
EndFunc

Func Sacred_Percent_Calculate()
	If GUICtrlRead($GUI_Sacred_2x) = 1 Then
		$Sacred_Multiplier = 2
	Else
		$Sacred_Multiplier = 1
	EndIf
	If $Sacred_Tracker[0] > 12 Then
		$Sacred_Mercy = $Sacred_Tracker[0] - 12
	EndIf
	GUICtrlSetData($GUI_Sacred_Percent, $Sacred_Percent*$Sacred_Multiplier + ($Sacred_Mercy*2) & "%")
EndFunc

Ancient_Percent_Calculate()
Void_Percent_Calculate()
Sacred_Percent_Calculate()
GUISetState(@SW_SHOW, $Raid_Shard_Tracker)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_Ancient_Rare_Button
			$Ancient_Rare_Tracker += 1
			$Ancient_Total_Tracker += 1
			GUICtrlSetData($GUI_Ancient_Rare_Counter, $Ancient_Rare_Tracker)
			GUICtrlSetData($GUI_Ancient_Total_Counter, $Ancient_Total_Tracker)
			$Ancient_Tracker[$Ancient_Tracker[0]] = "Rare"
			$Ancient_Tracker[0] = $Ancient_Total_Tracker + 1
			Ancient_Percent_Calculate()
		Case $GUI_Ancient_Epic_Button
			$Ancient_Epic_Tracker += 1
			$Ancient_Total_Tracker += 1
			GUICtrlSetData($GUI_Ancient_Epic_Counter, $Ancient_Epic_Tracker)
			GUICtrlSetData($GUI_Ancient_Total_Counter, $Ancient_Total_Tracker)
			$Ancient_Tracker[$Ancient_Tracker[0]] = "Epic"
			$Ancient_Tracker[0] = $Ancient_Total_Tracker + 1
			Ancient_Percent_Calculate()
		Case $GUI_Ancient_Leggo_Button, $GUI_Ancient_Reset
			$Ancient_Rare_Tracker = 0
			$Ancient_Epic_Tracker = 0
			$Ancient_Total_Tracker = 0
			GUICtrlSetData($GUI_Ancient_Rare_Counter, $Ancient_Rare_Tracker)
			GUICtrlSetData($GUI_Ancient_Epic_Counter, $Ancient_Epic_Tracker)
			GUICtrlSetData($GUI_Ancient_Total_Counter, $Ancient_Total_Tracker)
			ReDim $Ancient_Tracker[1]
			ReDim $Ancient_Tracker[221]
			$Ancient_Tracker[0] = $Ancient_Total_Tracker + 1
			$Ancient_Mercy = 0
			Ancient_Percent_Calculate()
		Case $GUI_Ancient_2x
			Ancient_Percent_Calculate()
		Case $GUI_Void_Rare_Button
			$Void_Rare_Tracker += 1
			$Void_Total_Tracker += 1
			GUICtrlSetData($GUI_Void_Rare_Counter, $Void_Rare_Tracker)
			GUICtrlSetData($GUI_Void_Total_Counter, $Void_Total_Tracker)
			$Void_Tracker[$Void_Tracker[0]] = "Rare"
			$Void_Tracker[0] = $Void_Total_Tracker + 1
			Void_Percent_Calculate()
		Case $GUI_Void_Epic_Button
			$Void_Epic_Tracker += 1
			$Void_Total_Tracker += 1
			GUICtrlSetData($GUI_Void_Epic_Counter, $Void_Epic_Tracker)
			GUICtrlSetData($GUI_Void_Total_Counter, $Void_Total_Tracker)
			$Void_Tracker[$Void_Tracker[0]] = "Epic"
			$Void_Tracker[0] = $Void_Total_Tracker + 1
			Void_Percent_Calculate()
		Case $GUI_Void_Leggo_Button, $GUI_Void_Reset
			$Void_Rare_Tracker = 0
			$Void_Epic_Tracker = 0
			$Void_Total_Tracker = 0
			GUICtrlSetData($GUI_Void_Rare_Counter, $Void_Rare_Tracker)
			GUICtrlSetData($GUI_Void_Epic_Counter, $Void_Epic_Tracker)
			GUICtrlSetData($GUI_Void_Total_Counter, $Void_Total_Tracker)
			ReDim $Void_Tracker[1]
			ReDim $Void_Tracker[221]
			$Void_Tracker[0] = $Void_Total_Tracker + 1
			$Void_Mercy = 0
			Void_Percent_Calculate()
		Case $GUI_Void_2x
			Void_Percent_Calculate()
		Case $GUI_Sacred_Epic_Button
			$Sacred_Epic_Tracker += 1
			GUICtrlSetData($GUI_Sacred_Epic_Counter, $Sacred_Epic_Tracker)
			GUICtrlSetData($GUI_Sacred_Total_Counter, $Sacred_Epic_Tracker)
			$Sacred_Tracker[$Sacred_Tracker[0]] = "Epic"
			$Sacred_Tracker[0] = $Sacred_Epic_Tracker + 1
			Sacred_Percent_Calculate()
		Case $GUI_Sacred_Leggo_Button, $GUI_Sacred_Reset
			$Sacred_Epic_Tracker = 0
			GUICtrlSetData($GUI_Sacred_Epic_Counter, $Sacred_Epic_Tracker)
			GUICtrlSetData($GUI_Sacred_Total_Counter, $Sacred_Epic_Tracker)
			ReDim $Sacred_Tracker[1]
			ReDim $Sacred_Tracker[221]
			$Sacred_Tracker[0] = $Sacred_Epic_Tracker + 1
			$Sacred_Mercy = 0
			Sacred_Percent_Calculate()
		Case $GUI_Sacred_2x
			Sacred_Percent_Calculate()
		Case $GUI_EVENT_CLOSE
			_FileWriteFromArray($FileAncient, $Ancient_Tracker)
			_FileWriteFromArray($FileVoid, $Void_Tracker)
			_FileWriteFromArray($FileSacred, $Sacred_Tracker)
			Exit

	EndSwitch
WEnd

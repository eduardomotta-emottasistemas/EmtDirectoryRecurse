// Development by: Eduardo Motta - EMotta Sistemas - emotta@gmail.com
// 04/01/2021 - 16:00h

// sample test
Function Test()
Local aFiles_Ori, aFiles
Local nTmp := Seconds()
Local cNew := ""
Local cOri := ""
Local cPath := "c:\temp\*.*"

cls
nTmp := Seconds()
aFiles_Ori := DirectoryRecurse(cPath)  // original DirectoryRecuse for compare
? "Original DirectoryRecurse"
? "Time: "+Str(Seconds()-nTmp,8,2)+" / Files: "+Str(Len(aFiles_Ori),6)

nTmp := Seconds()
aFiles := EmtDirectoryRecurse(cPath)  // new DirectoryRecurse
? "New 1 EmtDirectoryRecurse"
? "Time: "+Str(Seconds()-nTmp,8,2)+" / Files: "+Str(Len(aFiles),6)
If Len(aFiles_Ori) # Len(aFiles)
    ?? " [ERROR]"
EndIf

Return

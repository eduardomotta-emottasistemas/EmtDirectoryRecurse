// Development by: Eduardo Motta - EMotta Sistemas - emotta@gmail.com
// 04/01/2021 - 16:00h

Function EmtDirectoryRecurse(cMascara,cAtributo)
  Local cPath  := "", cMask  := "", cExt   := ""
  Local aFiles := {}

  hb_FNameSplit( cMascara, @cPath, @cMask, @cExt )

  //first folders
  aEval(Directory(cMascara,cAtributo),{|x|If(!x[1]=="OS",;
              (x[1] := cPath+x[1],aadd(aFiles,x)),;
          NIL) })

  //find all files and folders
  aEval(Directory(cPath+hb_ps()+"*.*","D"),{|x|If(("D" $ x[5] .and. !x[1] == "." .and. !x[1] == ".."),;
                    (aEval(EmtDirectoryRecurse(cPath+x[1]+hb_ps()+cMask+cExt,cAtributo),{|x|aadd(aFiles,x) })  ),;
              nil) })

  Return aFiles

  #ifdef __XHARBOUR__
  // This function does not exist in xHarbour.
  Static Function hb_ps()
  Return "\"
  #endif
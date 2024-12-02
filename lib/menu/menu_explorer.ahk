#Requires AutoHotkey v2.0-a
#SingleInstance Force

CreateFullMenu(menuName, mainPath, submenuDepth := 3, openThisFolder := False) {
    menuName := Menu()
    if (openThisFolder == True) {
        menuName.Add("Open This Folder", MenuExplorerHandler.Bind(mainPath))
        menuName.Default := "Open This Folder"
    }

    if (submenuDepth <= 0)
        return menuName

    Loop Files, mainPath . "\*", "FD"
    {
        if A_LoopFileAttrib ~= "[H]"
            continue
        if SubStr(A_LoopFileName, 1, 1) = "."
            continue

        subMenu := Menu()
        if (InStr(FileExist(A_LoopFilePath), "D")) {
            subMenu := CreateFullMenu(A_LoopFileName, A_LoopFilePath, submenuDepth - 1, True)
            CreateMenu(A_LoopFilePath, A_LoopFileName, menuName, subMenu)
        } else if (InStr(FileExist(A_LoopFilePath), "A")) {
            CreateFile(A_LoopFilePath, A_LoopFileName, menuName)
        }
    }
    return menuName
}

CreateMenu(path, name, mainMenu, childMenu) {
    filePath := path
    iconIndex := 0
    hIcon := DllCall("Shell32\ExtractAssociatedIcon", "Ptr", 0, "Str", filePath, "ShortP", iconIndex, "Ptr")
    mainMenu.Add(name, childMenu)
    mainMenu.setIcon(name, "HICON:" hIcon, , 30)
    try {
        childMenu.add("Open This Folder", MenuExplorerHandler.Bind(path))
        childMenu.Default := "Open This Folder"
    }
    catch Error as e {

    }
}

CreateFile(path, name, mainMenu) {
    filePath := path
    iconIndex := 0
    hIcon := DllCall("Shell32\ExtractAssociatedIcon", "Ptr", 0, "Str", filePath, "ShortP", iconIndex, "Ptr")
    fn := MenuExplorerHandler.Bind(A_LoopFilePath)
    mainMenu.Add(name, fn)
    mainMenu.setIcon(name, "HICON:" hIcon, , 30)
}

MenuExplorerHandler(FilePath, Item, ItemPos, MyMenu)
{
    if (IsCtrlDown := GetKeyState("ctrl")) {
        Run("c:\Users\augus\Utils\Apps\VSCode\Code.exe " . FilePath)
    }
    else if (IsCtrlDown := GetKeyState("shift")) {
        Sleep(150)
        Run("wt -d " . FilePath)
    }
    else if (IsCtrlDown := GetKeyState("del")) {
        Sleep(150)
        if (InStr(FileExist(FilePath), "D")) {
            MsgBox("Are you sure you want to delete this folder?")
            DirDelete(FilePath, 1)
            MyMenu.Delete(Item)
            MsgBox("Folder deleted")
        }
        if (InStr(FileExist(FilePath), "A")) {
            MsgBox("Are you sure you want to delete this file?")
            FileDelete(FilePath)
            MyMenu.Delete(Item)
            MsgBox("File deleted")
        }
    }
    ; copy if path if c is down
    else if (IsCtrlDown := GetKeyState("c")) {
        A_Clipboard := FilePath
    }
    else {
        Run(FilePath)
    }
}

principalExplorer := CreateFullMenu("principalExplorer", "C:\Users\augus")


#m::
{    ; V1toV2: Added bracket
    principalExplorer.Show()
}    ; V1toV2: Added bracket in the end

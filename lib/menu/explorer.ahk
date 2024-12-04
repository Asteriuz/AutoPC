#Requires AutoHotkey v2.0-a
#SingleInstance Force

principalExplorer := CreateFullMenu("principalExplorer", UserPath)

#m::
{
    principalExplorer.Show()
}

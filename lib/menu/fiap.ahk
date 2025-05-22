#Requires AutoHotkey v2.0-a
#SingleInstance Force

fiapMenu := CreateFullMenu("fiapMenu", userpath . "\FIAP", 4)

#f::
{
    fiapMenu.Show()
}
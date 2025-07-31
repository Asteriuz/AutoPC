#Requires AutoHotkey v2.0-a
#SingleInstance Force

gsMenu := CreateFullMenu("gsMenu", userpath . "\GS", 4, true)

!g::
{
    gsMenu.Show()
}

#+g::
{
    gsMenu.Show()
}
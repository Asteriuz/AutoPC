adobeMenu := Menu()

adobeMenu.Add("Photoshop", AdobeHandler)
adobeMenu.Add("Illustrator", AdobeHandler)
adobeMenu.Add("After Effects", AdobeHandler)
adobeMenu.Add("Premiere", AdobeHandler)

; adobeMenu.SetIcon("Photoshop", A_ScriptDir . "\lib\img\icons\photoshop.ico")
; adobeMenu.SetIcon("Illustrator", A_ScriptDir . "\lib\img\icons\illustrator.ico")
; adobeMenu.SetIcon("After Effects", A_ScriptDir . "\lib\img\icons\aftereffects.ico")
; adobeMenu.SetIcon("Premiere", A_ScriptDir . "\lib\img\icons\premiere.ico")

AdobeHandler(Item, ItemPos, MyMenu)
{
    If (Item = "Photoshop") {
        Run("C:\Program Files\Adobe\Adobe Photoshop (Beta)\Photoshop.exe")
    } else If (Item = "Illustrator") {
        Run("C:\Program Files\Adobe\Adobe Illustrator (Beta)\Support Files\Contents\Windows")
    } else If (Item = "Premiere") {
        Run("C:\Program Files\Adobe\Adobe Premiere Pro (Beta)\Adobe Premiere Pro (Beta).exe")
    }
}

#a:: {
    adobeMenu.Show()
}
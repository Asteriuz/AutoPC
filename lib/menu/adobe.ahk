adobeMenu := Menu()

adobeMenu.Add("Photoshop", AdobeHandler)
adobeMenu.Add("Illustrator", AdobeHandler)
adobeMenu.Add("Premiere", AdobeHandler)

num := 80

adobeMenu.SetIcon("Photoshop", IconPath . "\adobe\photoshop.ico", , num)
adobeMenu.SetIcon("Illustrator", IconPath . "\adobe\illustrator.ico", , num)
adobeMenu.SetIcon("Premiere", IconPath . "\adobe\premiere.ico", , num)

AdobeHandler(Item, ItemPos, MyMenu) {
    if (Item = "Photoshop") {
        RunAsUser(ShortcutsPath . "adobe\Photoshop.lnk")
    } else if (Item = "Illustrator") {
        RunAsUser(ShortcutsPath . "adobe\Illustrator.lnk")
    } else if (Item = "Premiere") {
        RunAsUser(ShortcutsPath . "adobe\Premiere.lnk")
    }
}

#a:: {
    adobeMenu.Show()
}
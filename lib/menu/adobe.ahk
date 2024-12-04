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
        Run(ShortcutsPath . "adobe\Photoshop.lnk")
    } else if (Item = "Illustrator") {
        Run(ShortcutsPath . "adobe\Illustrator.lnk")
    } else if (Item = "Premiere") {
        Run(ShortcutsPath . "adobe\Premiere.lnk")
    }
}

#a:: {
    adobeMenu.Show()
}

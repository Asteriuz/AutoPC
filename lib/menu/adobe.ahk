adobeMenu := Menu()

adobeApps := Map(
    "Photoshop", { icon: "\adobe\photoshop.ico", shortcut: "adobe\Photoshop.lnk" },
    "Illustrator", { icon: "\adobe\illustrator.ico", shortcut: "adobe\Illustrator.lnk" },
    "Premiere", { icon: "\adobe\premiere.ico", shortcut: "adobe\Premiere.lnk" }
)


AdobeHandler(Item, ItemPos, MyMenu) {
    global adobeApps, ShortcutsPath
    if adobeApps.Has(Item) {
        RunAsUser(ShortcutsPath . adobeApps[Item].shortcut)
    }
}

for name, data in adobeApps {
    adobeMenu.Add(name, AdobeHandler)
    adobeMenu.SetIcon(name, IconPath . data.icon, , 80)
}


#a:: {
    adobeMenu.Show()
}

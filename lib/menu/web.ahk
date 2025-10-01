webMenu := Menu()

webLinks := [
    { name: "YouTube", url: "https://www.youtube.com" },
    { name: "GitHub", url: "https://www.github.com" },
    { name: "Fiap", url: "https://on.fiap.com.br" },
]

WebHandler(Item, ItemPos, MyMenu) {
    global webLinks
    for _, data in webLinks {
        if data.name = Item {
            Run(data.url)
            break
        }
    }
}
GetWebFavicon(url) {
    iconsDir := A_ScriptDir "\lib\assets\icons\web\"
    if !DirExist(iconsDir)
        DirCreate(iconsDir)

    RegExMatch(url, "i)^(?:https?://)?([^/]+)", &m)
    domain := m[1]
    iconPath := iconsDir domain ".ico"
    if !FileExist(iconPath) {
        faviconUrl := "https://www.google.com/s2/favicons?sz=64&domain=" domain
        try {
            Download(faviconUrl, iconPath)
        } catch {
            iconPath := ""
        }
    }
    return iconPath
}

for _, data in webLinks {
    webMenu.Add(data.name, WebHandler)
    iconPath := GetWebFavicon(data.url)
    if iconPath
        webMenu.SetIcon(data.name, iconPath, , 24)
}

#+w:: {
    webMenu.Show()
}

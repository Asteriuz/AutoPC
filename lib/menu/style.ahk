#Requires AutoHotkey v2.0

SetMenuTheme(appMode:=0)    { ;  ahk2.0
    static preferredAppMode:={Default:0, AllowDark:1, ForceDark:2, ForceLight:3, Max:4}
        ,uxtheme                := dllCall("Kernel32.dll\GetModuleHandle", "Str","uxtheme", "Ptr")
        ,fnSetPreferredAppMode  := (uxtheme?dllCall("Kernel32.dll\GetProcAddress", "Ptr",uxtheme, "Ptr",135, "Ptr"):0)
        ,fnFlushMenuThemes      := (uxtheme?dllCall("Kernel32.dll\GetProcAddress", "Ptr",uxtheme, "Ptr",136, "Ptr"):0)
    if (preferredAppMode.hasProp(appMode))
        appMode:=preferredAppMode.%appMode%
    return (fnSetPreferredAppMode && fnFlushMenuThemes)
        ?(prev:=dllCall(fnSetPreferredAppMode, "Int",appMode), dllCall(fnFlushMenuThemes), prev)
        :-1
}

SetMenuTheme("ForceDark")
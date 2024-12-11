RunTerminal(params := "") {
   if A_IsAdmin {
       Run("wt " . params)
   } else {
       RunAsUser("wt", params, "", "runas")
   }
}

RunAsUser(filePath, arguments := "", directory := "", verb := "", show := 1)
{
   static VT_UI4 := 0x13, SWC_DESKTOP := 0x8
   ShellWindows := ComObject("Shell.Application").Windows
   Shell := ShellWindows.Item( ComValue(VT_UI4, SWC_DESKTOP) ).Document.Application
   Shell.ShellExecute(filePath, arguments, directory, verb, show)
}
RunTerminal(params := "") {
    if A_IsAdmin {
        Run("wt " . params)
    } else {
        RunAsUser("wt", params, "", "runas")
    }
}

RunAsUser(filePath, arguments := "", directory := "", verb := "", show := 1) {
    static VT_UI4 := 0x13, SWC_DESKTOP := 0x8
    ShellWindows := ComObject("Shell.Application").Windows
    Shell := ShellWindows.Item(ComValue(VT_UI4, SWC_DESKTOP)).Document.Application
    Shell.ShellExecute(filePath, arguments, directory, verb, show)
}

RunPowerShell(command, modules := []) {
    shell := ComObject("WScript.Shell")
    tempFile := A_Temp . "\ps_output.tmp"

    fullCommand := ""
    if IsObject(modules) && modules.Length > 0 {
        for moduleName in modules {
            fullCommand .= "Import-Module " . moduleName . "; "
        }
    }
    fullCommand .= command
    runCommand := 'pwsh -NoProfile -Command "' . fullCommand . ' | Out-File -FilePath ' . tempFile . ' -Encoding utf8"'

    shell.Run(runCommand, 0, true)

    output := ""
    if FileExist(tempFile) {
        output := FileRead(tempFile)
        FileDelete(tempFile)
    }

    return output
}

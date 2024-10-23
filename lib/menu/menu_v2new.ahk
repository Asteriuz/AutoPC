principal := Menu()

fiap := CreateFullMenu("fiap", "C:\Users\augus\FIAP", 4, True)

alura := CreateFullMenu("alura", "C:\Users\augus\Alura", 3, True)

projetos := CreateFullMenu("projetos", "C:\Users\augus\Code\Projetos", 3, True)

principal.Add("Alura", alura)
principal.Add("Fiap", fiap)
principal.Add("Projetos", projetos)
principal.Add("HomePage", MenuHandler)
principal.Add("Rainha", MenuHandler)
principal.Add("Python", MenuHandler)
; principal.Add("Javascript", MenuHandler)
principal.Add("AHK", MenuHandler)

; Create another menu destined to become a submenu of the above menu.

; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.

num := 60

principal.SetIcon("Projetos", A_ScriptDir . "\lib\img\icons\project.ico", , num)
principal.SetIcon("Fiap", A_ScriptDir . "\lib\img\icons\fiap.ico", , num)
principal.SetIcon("Alura", A_ScriptDir . "\lib\img\icons\alura.ico", , num)
principal.setIcon("HomePage", A_ScriptDir . "\lib\img\icons\homepage.ico", , num)
principal.setIcon("Rainha", A_ScriptDir . "\lib\img\icons\rainha.ico", , num)
principal.setIcon("Python", A_ScriptDir . "\lib\img\icons\python.ico", , num)
; principal.setIcon("Javascript", A_ScriptDir . "\lib\img\icons\jsofficial.ico", , num)
principal.setIcon("AHK", A_ScriptDir . "\lib\img\icons\ahk.ico", , num)

VsCodeHandler(FilePath, Item, ItemPos, MyMenu)
{
    Run("`"C:\Program Files\Microsoft VS Code\Code.exe`"" . FilePath)
}

FiapHandler(Item, ItemPos, MyMenu)
{
    Run("`"C:\Program Files\Microsoft VS Code\Code.exe`" C:\Users\augus\FIAP\" . Item)
}

MenuHandler(Item, ItemPos, MyMenu)
{
    If (Item = "Fiap") {
        Run("`"C:\Program Files\Microsoft VS Code\Code.exe`" C:\Users\augus\FIAP")
    } else If (Item = "Rainha") {
        Run("`"C:\Program Files\Microsoft VS Code\Code.exe`" C:\Users\augus\Code\Projetos\Rainha")
    } else If (Item = "Python") {
        Run("`"C:\Program Files\Microsoft VS Code\Code.exe`" C:\Users\augus\Udemy\Python")
    } else If (Item = "HomePage") {
        Run("`"C:\Program Files\Microsoft VS Code\Code.exe`" C:\Users\augus\Utilities\Tools\Chevron_v2.1.0\index.html")
    } else If (Item = "Javascript") {
        Run("`"C:\Program Files\Microsoft VS Code\Code.exe`" C:\Users\augus\Udemy\JavaTypeScript")
    } else If (Item = "AHK") {
        Run("`"C:\Program Files\Microsoft VS Code\Code.exe`" C:\Users\augus\Utilities\Scripts\Testes")
    }
}

#u::
{
    principal.Show()
}
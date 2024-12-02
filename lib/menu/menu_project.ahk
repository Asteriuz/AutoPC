principal := Menu()

ecocharge := CreateFullMenu("fiap", "C:\Users\augus\EcoCharge", 4, True)

principal.Add("EcoCharge", ecocharge)

num := 60

principal.SetIcon("EcoCharge", "C:\Users\augus\Pictures\Assets\icons\folder11\gamejolt.ico", , num)

#u::
{
    principal.Show()
}
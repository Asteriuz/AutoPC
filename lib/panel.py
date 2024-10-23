import sys

path = "C:\\Users\\augus\\AppData\\Roaming\\Code\\User\\keybindings.json"


def inputChange(sta):
    with open(path, "r") as file:
        filedata = file.read()

    if sta == 0:
        filedata = filedata.replace(
            '"command": "workbench.action.positionPanelBottom"',
            '"command": "workbench.action.positionPanelRight"',
        )
    if sta == 1:
        filedata = filedata.replace(
            '"command": "workbench.action.positionPanelRight"',
            '"command": "workbench.action.positionPanelBottom"',
        )

    with open(path, "w") as file:
        file.write(filedata)


sta = int(sys.argv[1])
inputChange(sta)

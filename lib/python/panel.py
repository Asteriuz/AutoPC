path = "C:\\Users\\augus\\Utils\\Apps\\VSCode\\data\\user-data\\User\\keybindings.json"

def togglePanelPosition():
    with open(path, "r") as file:
        filedata = file.read()

    if '"command": "workbench.action.positionPanelBottom"' in filedata:
        filedata = filedata.replace(
            '"command": "workbench.action.positionPanelBottom"',
            '"command": "workbench.action.positionPanelRight"'
        )
    else:
        filedata = filedata.replace(
            '"command": "workbench.action.positionPanelRight"',
            '"command": "workbench.action.positionPanelBottom"'
        )

    with open(path, "w") as file:
        file.write(filedata)

togglePanelPosition()

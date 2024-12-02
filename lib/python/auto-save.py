path = "C:\\Users\\augus\\Utils\\Apps\\VSCode\\data\\user-data\\User\\settings.json"

def toggleAutoSave():
    with open(path, "r") as file:
        filedata = file.read()

    # Toggle between "afterDelay" and "off" for "files.autoSave"
    if '"files.autoSave": "afterDelay"' in filedata:
        filedata = filedata.replace(
            '"files.autoSave": "afterDelay"',
            '"files.autoSave": "off"'
        )
    else:
        filedata = filedata.replace(
            '"files.autoSave": "off"',
            '"files.autoSave": "afterDelay"'
        )

    # Write the modified data back to the file
    with open(path, "w") as file:
        file.write(filedata)

toggleAutoSave()
import sys

path = "C:\\Users\\augus\\AppData\\Roaming\\Code\\User\\settings.json"


with open(path, 'r') as file:
    filedata = file.read()
    sta = 0 if 'clear && set PYTHONIOENCODING=utf8 && $pythonPath -u $fullFileName' in filedata else 1

if sta == 0:
    filedata = filedata.replace('clear && set PYTHONIOENCODING=utf8 && $pythonPath -u $fullFileName',
                                'set PYTHONIOENCODING=utf8 && $pythonPath -u $fullFileName')
    filedata = filedata.replace(
        '"code-runner.runInTerminal": true', '"code-runner.runInTerminal": false')
if sta == 1:
    filedata = filedata.replace('set PYTHONIOENCODING=utf8 && $pythonPath -u $fullFileName',
                                'clear && set PYTHONIOENCODING=utf8 && $pythonPath -u $fullFileName')
    filedata = filedata.replace(
        '"code-runner.runInTerminal": false', '"code-runner.runInTerminal": true')

with open(path, 'w') as file:
    file.write(filedata)
